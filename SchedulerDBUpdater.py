# ver02 dtd 10-03-2017 script working good and able to fatch the recorde and update the recorde
# ver03 dtd 10-03-2017 combinning mysql database handling and MQTT working Good
# ver04 dtd 10-03-2017 making DATABASE functions working good
# ver05 dtd 10-03-2017 now on every change of switch data getting stored and updated in the database
# ver06 dtd 11-03-2017 Updateing DATABASE of AC with Mains Availability
# ver07 dtd 11-03-2017 publishing for AC as per Mains power supply Availability
# ver08 dtd 11-03-2017 is copy
# ver08_PoichaNW is odified for poicha N/W Setting
import time
import pymysql
import paho.mqtt.client as mqtt

mysqlsrv = "localhost" #192.168.1.99"
mqttsrv = "192.168.128.51"
ismqttsrvconnected = False
islogged = False

# Uncomment any one connection String following here under as your Operatin System.

# For Linux, Rasbian based OS
#constrg = {'host': mysqlsrv, 'database': 'autoswitch','user': 'MySQLClient', 'password': '123'}

# For Windows based OS , configure port if different than assigned here
constrg = {'host': mysqlsrv, 'database': 'autoswitch','user': 'MySQLClient', 'password': '123','port':108}


#=====================  MQTT ===========================
# Define event callbacks


def on_connect(mosq, obj, rc):
    #print("rc: " + str(rc))
    global ismqttsrvconnected           # To Change Global Varible in Local Function variable followed by variable name then assignment
    ismqttsrvconnected = True
    print("MQTT server is Connected..")

def on_message(mosq, obj, msg):
    print(msg.topic + " | " + str(msg.qos) + " | " + str(msg.payload))
    topic = str(msg.topic)
    message = str(msg.payload)
    splitted_topic = topic.split("/")
    splitted_msg = message.split("-")
    if splitted_topic[1] == "ACK":
        if splitted_msg[1] == 'INIT':
            pass
        else:
            if len(splitted_msg) == 5:
                if splitted_msg[3] == 0:
                    pass
                else:
                    update_switchstatus(splitted_msg[3], splitted_msg[2])
    else:
        pass        
        
def on_publish(mosq, obj, mid):
    print("mid: " + str(mid))

def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed to topic Successfully with QoS :" + str(granted_qos))


def on_log(mosq, obj, level, string):
    print(string)

#============================================================

# ===================  Prepare SQL query to READ a record FROM the database. ==========
def read_switch(switchid):

      sql = "SELECT * FROM swboard \
             WHERE switchid = '%s'" %(switchid)
      try:
         # Execute the SQL command
         cursor.execute(sql)
         # Fetch all the rows in a list of lists.
         results = cursor.fetchall()
         for row in results:
            location = row[0]
            switchid = row[1]
            status = row[2]
            # Now print fetched result
            print ("location = %s, switchid = %s, statue = %s" % \
                   (location, switchid, status))
            return status
      except:
         print ("Error: unable to fetch data")
      
#=====================================================================================


# ================  Prepare SQL query to UPDATE required records =====================
def update_switchstatus(switchID, statusflg):
    try:
        # Execute the SQL command
        swchID = int(switchID)
        Switchstat = 1 if statusflg == 'T' else 0
        cursor.callproc("SetSwitchStatus", (swchID, Switchstat))
        # Commit your changes in the database
        db.commit()
    except pymysql.Error as e:
        print(e)
        # Rollback in case there is any error
        db.rollback()
#====================================================================================
   


# Open database connection
db = pymysql.connect(**constrg)
db.cursorclass = pymysql.cursors.DictCursor
cursor = db.cursor()

# ===========================  MQTT =========================

mqttc = mqtt.Client()

# Assign event callbacks
mqttc.on_message = on_message
mqttc.on_connect = on_connect
mqttc.on_publish = on_publish
mqttc.on_subscribe = on_subscribe

# Uncomment to enable debug messages
#mqttc.on_log = on_log

# Parse CLOUDMQTT_URL (or fallback to localhost)

# Connect
#mqttc.username_pw_set(url.username, url.password)
mqttc.connect(mqttsrv, 1883)
mqttc.loop_start()        #start the loop
 
while ismqttsrvconnected != True:    #Wait for connection
    time.sleep(0.1)
# Start subscribe, with QoS level 2
mqttc.subscribe("ND/ACK", 2)

# Publish a message
#mqttc.publish("brainstorm_mqtt", "my Sent message",2)

# Continue the network loop, exit when an error occurs

try:
    while True:
        time.sleep(1)
 
except KeyboardInterrupt:
    print("exiting")
    mqttc.disconnect()
    mqttc.loop_stop()


'''rc = 0
while rc == 0:
    rc = mqttc.loop()
print("rc: " + str(rc))'''
#=============================================================

# disconnect from server
db.close()
