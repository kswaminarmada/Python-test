# Ver01 12-03-2017 working good for fatch all recored from scheduler table
# Ver02 12-03-2017 working on
# Ver03 12-03-2017 all is working but bot in loop
# Ver08 13-03-2017 working good and following the scheduled of one time and daily also
# Ver09 13-03-2017
# Ver10 21-03-2017 trying for the working in loop for ever working good

from  datetime import datetime, timedelta
import math, time
import pymysql
from pymysql import Error
import paho.mqtt.client as mqtt

sleeptime = 4  # sleep for 4 Second
mysqlsrv = "localhost"
mqttsrv = "192.168.128.51"
islogged = False
constrg = {'host':mysqlsrv, 'database':'boarddb20', 'user':'MySQLClient', 'password':'123', 'port': 108}

#=====================  MQTT ===========================
# Define event callbacks

def on_connect(mosq, obj, rc):
    print("rc: " + str(rc))


def on_message(mosq, obj, msg):
    print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))
    message = str(msg.payload)
    print(message[2:9])
    print(message[9:10])
    update_record(message[2:9], message[9:10])


def on_publish(mosq, obj, mid):
    print("mid: " + str(mid))
    
    if islogged is False:
        logmsg = []
        for msg in mqttc._out_messages:
            logmsg.append("Published to MQTT Server with Topic : {0}, Message: {1}, MQTT mid : {2}".format(msg.topic, msg.payload, msg.mid))
        inserLogToDB(logmsg)
        
def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed: " + str(mid) + " " + str(granted_qos))


def on_log(mosq, obj, level, string):
    print(string)


def read_recordNexecute():
    try:
        nows = datetime.now()
        nowInSec = int(timedelta(hours=nows.hour, minutes=nows.minute, seconds=nows.second).total_seconds())

        sql = "SELECT * FROM switchstatus" # \
                #where ( {0:d} between time_to_sec(ondatetime) and time_to_sec(offdatetime)) \
                #or ({0:d} between time_to_sec(ontime) and time_to_sec(offtime))".format(nowInSec-sleeptime) # where switchid= 'SB00101'"
        cursor.execute(sql)
        results = cursor.fetchall()

        print("Current Date-Time : {0:%d-%m-%Y %H:%M:%S} , Todays Total Seconds : {1}".format(datetime.now(),nowInSec))
        
        for row in results:
            #print(row)
            switchid = row[0]
            location = row[1]
            status = row[2]
            discription = row[3]
            ondatetime = row[4]
            offdatetime = row[5]
            schedule = row[6]
            ontime = row[7]
            offtime = row[8]

            ptopic = ""
            pmessage = ""
            isstatuschanged = False
            statusflag = ""

            if ondatetime != None and offdatetime != None:
                if ondatetime <= datetime.now() and offdatetime > datetime.now():
                    if status == "F":
                        statusflag = "T"
                        discription += " Is ON"
                        isstatuschanged = True
                else:
                    if status == "T":
                        statusflag = "F"
                        discription += " Is OFF"
                        isstatuschanged = True
                        

                if isstatuschanged is True:
                    ptopic = "%s/%s/%s" % (location, switchid[:5], switchid[5:])
                    pmessage = switchid + statusflag
                    mqttc.publish(ptopic, pmessage, 2)
                    print("Override Schedule Time is : {:%d-%m-%Y %H:%M:%S}".format(datetime.now()))
                    print("Topic : %s, Message : %s"% (ptopic, pmessage))
                    print(discription , '\n', '-'* len(discription)*2)
                    islogged = False
                    #update_record(switchid, statusflag)
                    update_switchstatus(switchid, statusflag)
                    if statusflag == "F":
                        update_onetimescheluler(switchid, None, None)
                        #query = """UPDATE scheduler SET ondatetime = '{1:s}', offdatetime = '{1:s}' WHERE switchid = '{0:s}'""".format(switchid,'0000-00-00 00:00:00')
                        #query = """UPDATE scheduler SET ondatetime = '0000-00-00 00:00:00', offdatetime = '0000-00-00 00:00:00' WHERE switchid = '%s'""" % switchid
                        #print(query)
                        #run_query(query)
                    isstatuschanged = False
            else:
                if schedule == 'T' and ontime != None and offtime != None:
                    onTime = ontime.seconds  #int(timedelta(hours=ontime.hour, minutes=ontime.minute, seconds=ontime.second).total_seconds())
                    offTime = offtime.seconds #int(timedelta(hours=offtime.hour, minutes=offtime.minute, seconds=offtime.second).total_seconds())
                    if onTime<= offTime:
                        if onTime <= nowInSec and offTime > nowInSec:
                            if status == "F":  # if every time in loop publish message with MQTT then remove if condition             
                                statusflag = "T"
                                discription += " Is ON"
                                isstatuschanged = True  # if every time in loop publish message with MQTT then remove is isstatuschanged variable
                        else:
                            if status == "T":   # if every time in loop publish message with MQTT then remove if condition
                                statusflag = "F"
                                discription += " Is OFF"
                                isstatuschanged = True # if every time in loop publish message with MQTT then remove is isstatuschanged variable
                    elif(onTime>offTime):
                        if (nowInSec>=onTime and nowInSec<=86400) or (nowInSec>=0 and nowInSec<offTime):
                            if status == "F":  # if every time in loop publish message with MQTT then remove if condition             
                                statusflag = "T"
                                discription += " Is ON"
                                isstatuschanged = True  # if every time in loop publish message with MQTT then remove is isstatuschanged variable
                        else:
                            if status == "T":   # if every time in loop publish message with MQTT then remove if condition
                                statusflag = "F"
                                discription += " Is OFF"
                                isstatuschanged = True # if every time in loop publish message with MQTT then remove is isstatuschanged variable
                                           
                    if isstatuschanged is True: # if every time in loop publish message with MQTT then remove is isstatuschanged if condition
                        ptopic = "%s/%s/%s" % (location, switchid[:5], switchid[5:])
                        pmessage = switchid + statusflag
                        mqttc.publish(ptopic, pmessage, 2)
                        print("Daily Schedule Time is : {:%H:%M:%S}".format(datetime.now()))
                        print("Topic : %s, Message : %s"% (ptopic, pmessage))
                        print(discription , '\n','-'* len(discription)*2)
                        islogged = False
                        update_switchstatus(switchid, statusflag)
                        isstatuschanged = False
                else:
                    pass
    except:
        print("Error: unable to fetch data")


def inserLogToDB(logmsgs):
    try:
        dbs = pymysql.connect(**constrg)
        curs = dbs.cursor()
        insqry = "Insert Into `logs` (logdescription) values (%s)"
        curs.executemany(insqry, logmsgs)
        print (*logmsgs,sep='\n')
        islogged = True
        # Commit your changes in the database
        dbs.commit()
    except Error as e:
        print(e)
        # Rollback in case there is any error
        dbs.rollback()
    
    finally:
        curs.close()
        dbs.close()

def update_onetimescheluler(switchid, ondatetime, offdatetime):
    try:
        # Execute the SQL command
        
        cursor.callproc("SetOneDateTimeSchedule",(switchid, ondatetime, offdatetime))
        # Commit your changes in the database
        db.commit()
    except Error as e:
        print(e)
        # Rollback in case there is any error
        db.rollback()

def update_switchstatus(switchid, statusflag):
    try:
        # Execute the SQL command
        
        cursor.callproc("SetSwitchStatus",(switchid, statusflag))
        # Commit your changes in the database
        db.commit()
    except Error as e:
        print(e)
        # Rollback in case there is any error
        db.rollback()



def read_switch(switchid):

    sql = "SELECT * FROM swboard \
             WHERE switchid = '%s'" % (switchid)
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
            print("location = %s, switchid = %s, statue = %s" %
                  (location, switchid, status))
            return status
    except:
        print("Error: unable to fetch data")

#=========================================================================

# ================  Prepare SQL query to UPDATE required records =========

def run_query(sql):
    try:
        # Execute the SQL command
        
        cursor.execute(sql)
        # Commit your changes in the database
        db.commit()
    except Error as e:
        print(e)
        # Rollback in case there is any error
        db.rollback()
        
#=========================================================================

# ================  Prepare SQL query to UPDATE required records =========


def update_record(switchid, status):
    sql = "UPDATE swboard SET status = '%s' WHERE switchid LIKE '%s'" % (
        status, switchid)
    try:
        # Execute the SQL command
        cursor.execute(sql)
        # Commit your changes in the database
        db.commit()
    except:
         # Rollback in case there is any error
         db.rollback()
#====================================================================================
   
  



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
mqttc.connect(mqttsrv, 1883)

# Start subscribe, with QoS level 2
#mqttc.subscribe("ND/#", 2)

# Publish a message
#mqttc.publish("brainstorm_mqtt", "my Sent message",2)

while True :
    # Open database connection
    db = pymysql.connect(**constrg)
    cursor = db.cursor()
    read_recordNexecute()
    # disconnect from server
    db.close()
    time.sleep(sleeptime)
    mqttc.loop()

# Continue the network loop, exit when an error occurs
#rc = 0
#while rc == 0:
#    rc = mqttc.loop()
#print("rc: " + str(rc))