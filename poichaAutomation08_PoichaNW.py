# ver02 dtd 10-03-2017 script working good and able to fatch the recorde and update the recorde
# ver03 dtd 10-03-2017 combinning mysql database handling and MQTT working Good
# ver04 dtd 10-03-2017 making DATABASE functions working good
# ver05 dtd 10-03-2017 now on every change of switch data getting stored and updated in the database
# ver06 dtd 11-03-2017 Updateing DATABASE of AC with Mains Availability
# ver07 dtd 11-03-2017 publishing for AC as per Mains power supply Availability
# ver08 dtd 11-03-2017 is copy
# ver08_PoichaNW is odified for poicha N/W Setting
import pymysql
import paho.mqtt.client as mqtt

bokerIP = "192.168.128.51"

#=====================  MQTT ===========================
# Define event callbacks
def on_connect(mosq, obj, rc):
    print("rc: " + str(rc))

def on_message(mosq, obj, msg):
    print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))
    message = str(msg.payload)
    update_record(message[2:9],message[9:10])
    
    #if Mains Fails Switch off All AC
    if (message[2:9] == 'MS00101' and message[9:10] == 'F'):
       update_record('AC%','F')
       mqttc.publish("ND/AC001/01", 'AC00101F',2)
       mqttc.publish("ND/AC002/01", 'AC00201F',2)
       mqttc.publish("ND/AC003/01", 'AC00301F',2)
      
    elif (message[2:9] == 'MS00101' and message[9:10] == 'T'):
       update_record('AC%','T')
       mqttc.publish("ND/AC001/01", 'AC00101T',2)
       mqttc.publish("ND/AC002/01", 'AC00201T',2)
       mqttc.publish("ND/AC003/01", 'AC00301T',2)


def on_publish(mosq, obj, mid):
    print("mid: " + str(mid))

def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed: " + str(mid) + " " + str(granted_qos))
    
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
def update_record(switchid, status):
      sql = "UPDATE swboard SET status = '%s' WHERE switchid LIKE '%s'" %(status, switchid)
      try:
         # Execute the SQL command
         cursor.execute(sql)
         # Commit your changes in the database
         db.commit()
      except:
         # Rollback in case there is any error
         db.rollback()
#====================================================================================
   


# Open database connection
db = pymysql.connect("localhost","root","root","autoswitch", 108 )

# prepare a cursor object using cursor() method
cursor = db.cursor()

#print(read_switch('SB00101'))
#update_record('SB00101','F')
#print(read_switch('SB00101'))



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
mqttc.connect(bokerIP, 1883)

# Start subscribe, with QoS level 2
mqttc.subscribe("ND/#", 2)

# Publish a message
#mqttc.publish("brainstorm_mqtt", "my Sent message",2)

# Continue the network loop, exit when an error occurs
rc = 0
while rc == 0:
    rc = mqttc.loop()
print("rc: " + str(rc))
#=============================================================

# disconnect from server
db.close()
