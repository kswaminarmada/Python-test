# ver02 dtd 10-03-2017 script working good and able to fatch the recorde and update the recorde
# ver03 dtd 10-03-2017 combinning mysql database handling and MQTT working Good
# ver04 dtd 10-03-2017 making DATABASE functions working good
# ver05 dtd 10-03-2017 now on every change of switch data getting stored and updated in the database
# ver06 dtd 11-03-2017 Updateing DATABASE of AC with Mains Availability
# ver07 dtd 11-03-2017 publishing for AC as per Mains power supply Availability
# ver08 dtd 11-03-2017 is copy
# ver08_PoichaNW is odified for poicha N/W Setting
import time
from datetime import datetime, timedelta
import pymysql
import paho.mqtt.client as mqtt

mysqlsrv = "localhost" #192.168.1.99"
mqttsrv = "localhost"
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
    print(msg.topic + " | " + str(msg.qos) + " | " + str(msg.payload.decode()))
    topic = str(msg.topic)
    message = str(msg.payload.decode())
    splitted_topic = topic.split("/")
    splitted_msg = message.split("-")
    if splitted_topic[1] == "ACK":
        if splitted_msg[1] == 'INIT':
            read_switch(splitted_msg[0])
        elif splitted_msg[0] == 'MainLoad' :
            # Update MainLoad Status
            mainsstatus = 1 if splitted_msg[2] == 'T' else 0
            update_mainload(splitted_msg[1],mainsstatus)
            update_manual_switch_by_mainload(int(splitted_msg[1]),mainsstatus)
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

# ===================  Prepare SQL query to READ a record FROM the database. ==========

def publishing_msg(msg_row, switchstate):
    ''' To Prepare Message for Sending to MqTT Server'''
    ptopic = msg_row['MsgTopic']
    pmessage = msg_row['MsgTopicPayload'] 
    pmessage += '-T-' if switchstate == 1 else '-F-'

    pmessage += str(msg_row['SchID'])
    stat = "ON" if switchstate == 1 else "OFF"
    print("Daily Schedule Time for {1} is Triggered on Board Power ON : {0:%H:%M:%S}".format(datetime.now(),msg_row['SwitchName']))
    print("Topic : %s, Message : %s" % (ptopic, pmessage))
    mqttc.publish(ptopic, pmessage, 2)
    islogged = False
    discription =  "{0} switch is {1} in {2} Board at {3}".format(rmsg_rowow['SwitchName'], stat , msg_row['BoardName'],msg_row['Location'])
    print(discription, '\n', '-' * len(discription) * 2)


def read_switch(switchid):

    sql = "SELECT * FROM scheduler where BoardName = '%s'" %(switchid)
    try:
        # Execute the SQL command
        cursor.execute(sql)
        # Fetch all the rows in a list of lists.
        results = cursor.fetchall()
        for row in results:
            # SwID = row['SwitchID']
            # scheluder_id = row['SchID']
            switchstatus = row['SwStatus']
            schedule = row['IsScheduled']
            mainloadstatus = row['MainLoadStatus']

            if row['IsMainLoadIndependent'] == 0 and mainloadstatus == 0:
                switchstatus = 0
                print('Switch : {0} is set to OFF due to Main Load failed.'.format(row['SwitchName']))
            if schedule == 0:
                publishing_msg(row,switchstatus)               
                ''' ptopic = row['MsgTopic']
                pmessage = row['MsgTopicPayload'] 
                pmessage += '-T-' if switchstatus == 1 else '-F-'
            
                pmessage += str(scheluder_id)
                stat = "ON" if switchstatus == 1 else "OFF"
                print("Daily Schedule Time for {1} is Triggered on Board Power ON : {0:%H:%M:%S}".format(datetime.now(),row['SwitchName']))
                print("Topic : %s, Message : %s" % (ptopic, pmessage))
                mqttc.publish(ptopic, pmessage, 2)
                islogged = False
                discription =  "{0} switch is {1} in {2} Board at {3}".format(row['SwitchName'], stat , row['BoardName'],row['Location'])
                print(discription, '\n', '-' * len(discription) * 2)'''
            else:
                update_board_switch(switchid)
    except:
        print ("Error: unable to fetch data")
      
#=====================================================================================

def update_board_switch(boardname):
    try:
        dbs = pymysql.connect(**constrg)
        curs = dbs.cursor()
        insqry = "update switchscheduler set SwStatus = 0 where IsScheduled=1 and MsgTopicPayload like '"+ boardname +"%'"
        curs.execute(insqry)
        # Commit your changes in the database
        dbs.commit()
    except:
        # Rollback in case there is any error
        dbs.rollback()

    finally:
        curs.close()
        dbs.close()

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
def first_run():
    ''' This function is called at power on off server'''
    try:
        dbs = pymysql.connect(**constrg)
        curs = dbs.cursor()
        insqry = "update switchscheduler set SwStatus = 0 where IsScheduled=1"
        curs.execute(insqry)
        # Commit your changes in the database
        dbs.commit()
    except:
        # Rollback in case there is any error
        dbs.rollback()

    finally:
        curs.close()
        dbs.close()
        
def update_mainload(main_loadID, main_Status):
    ''' This function is called to update MainLoad Status'''
    try:
        dbs = pymysql.connect(**constrg)
        curs = dbs.cursor()
        insqry = "update mainload set MainStatus = {0} where MainLoadID={1}".format(main_Status,main_loadID)
        curs.execute(insqry)
        # Commit your changes in the database
        dbs.commit()
    except:
        # Rollback in case there is any error
        dbs.rollback()

    finally:
        curs.close()
        dbs.close()

def update_manual_switch_by_mainload(mainload_ID, mainload_state):
    # update switch status as per main load status for MainLoad Dependent Switches only
    sql = "SELECT * FROM scheduler where IsScheduled = 0 and IsMainLoadIndependent = 0 and MainLdID = {0}".format(mainload_ID)
    try:
        # Execute the SQL command
        cursor.execute(sql)
        # Fetch all the rows in a list of lists.
        results = cursor.fetchall()
        for row in results:
            publishing_msg(row, mainload_state)               
    except:
        print ("Error: unable to fetch data")

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
#mqttc.loop_start()        #start the loop
#while ismqttsrvconnected != True:    #Wait for connection
   # time.sleep(0.1)
# Start subscribe, with QoS level 2
mqttc.subscribe("ND/ACK", 2)

# Publish a message
#mqttc.publish("brainstorm_mqtt", "my Sent message",2)

# Continue the network loop, exit when an error occurs
first_run()
try:
    #while True:
        #time.sleep(1)
    rc = 0
    while rc == 0:
        rc = mqttc.loop()
        if rc != 0 : 
            print("rc: " + str(rc))
 
except KeyboardInterrupt:
    print("exiting")
    #mqttc.loop_stop()
finally:
    mqttc.disconnect()
    db.close()

'''rc = 0
while rc == 0:
    rc = mqttc.loop()
print("rc: " + str(rc))'''
#=============================================================

# disconnect from server
