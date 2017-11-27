import time
from datetime import datetime, timedelta
from enum import Enum
import paho.mqtt.client as mqtt
import pymysql
from pymysql import Error


class swStatus(Enum):
    OFF = 0
    ON = 1

sleeptime = 4  # sleep for 4 Second
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
    print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))
    message = str(msg.payload)
    print("Message : " & msg.payload)
    update_switchstatus(message[2:9], message[9:10])


def on_publish(mosq, obj, mid):
    print("mid: " + str(mid))

    if islogged is False:
        logmsg = []
        for msg in mqttc._out_messages:
            logmsg.append("Published to MQTT Server with Topic : {0}, Message: {1}, MQTT mid : {2}".format(
                msg.topic, msg.payload, msg.mid))
        inserLogToDB(logmsg)


def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed: " + str(mid) + " " + str(granted_qos))


def on_log(mosq, obj, level, string):
    print(string)


def read_record_execute():
    """Fetch data from Database and check for Scheduling"""
    try:
        if ismqttsrvconnected:

            sql = "SELECT * FROM Scheduler where IsScheduled = 1 and (ScheduleGrpID = 1 or ScheduleGrpID = (select GetActiveScheduleGroup()))"
            cursor.execute(sql)
            results = cursor.fetchall()

            print("Current Date-Time : {0:%d-%m-%Y %H:%M:%S} , Todays Total Seconds : {1}".format(
                datetime.now(), current_seconds(datetime.now())))

            for row in results:
                check_switch_schedule(row)
                #print(row)
        else:
            print("Please wait, MQTT server is Connecting....")    
    except:
        print("Error: unable to fetch data")

def current_seconds(vardatetime):
    """return total second of given time of the day """
    nows = vardatetime.now()
    nowInSec = int(timedelta(hours=nows.hour, minutes=nows.minute, seconds=nows.second).total_seconds())
    return nowInSec


def check_switch_schedule(switchscheduler_row):
    """Check each row passed as argument for scheduling"""
    def prepare_message(switchstatus):
        '''Prepare a Message and update database'''
       
        if switchscheduler_row['IsMainLoadIndependent'] == 0 and mainloadstatus == 0:
            switchstatus = 0
            print('Switch : {0} is set to OFF due to Main Load failed.'.format(switchscheduler_row['SwitchName']))

        SwID = switchscheduler_row['SwitchID']
        ptopic = switchscheduler_row['MsgTopic']
        pmessage = switchscheduler_row['MsgTopicPayload'] 
        pmessage += '-T-' if switchstatus == 1 else '-F-'
        
        pmessage += str(SwID)
        stat = "ON" if switchstatus == 1 else "OFF"
        print("Daily Schedule Time for {1} is Triggered : {0:%H:%M:%S}".format(datetime.now(),switchscheduler_row['SwitchName']))
        #print("Topic : %s, Message : %s" % (ptopic, pmessage))
        mqttc.publish(ptopic, pmessage, 2)
        islogged = False
        discription =  "{0} switch is {1} in {2} Board at {3}".format(switchscheduler_row['SwitchName'], stat , switchscheduler_row['BoardName'], switchscheduler_row['Location'])
        print(discription, '\n', '-' * len(discription) * 2)
        update_switchstatus(scheluder_id, switchstatus)
        return
    try:
        nowInSec = current_seconds(datetime.now())

        scheluder_id = switchscheduler_row['SchID']
        status = switchscheduler_row['SwStatus']
        ondatetime = switchscheduler_row['StartDateTime']
        offdatetime = switchscheduler_row['StopDateTime']
        schedule = switchscheduler_row['IsScheduled']
        ontime = switchscheduler_row['StartTime']
        offtime = switchscheduler_row['StopTime']
        mainloadstatus = switchscheduler_row['MainLoadStatus']
      
        isstatuschanged = False
        statusflag = 0
        if ondatetime != None and offdatetime != None:
            if ondatetime <= datetime.now() and offdatetime > datetime.now():
                if status == 0:
                    statusflag = 1
                    isstatuschanged = True
            else:
                if status == 1:
                    statusflag = 0
                    isstatuschanged = True
            if isstatuschanged:
                prepare_message(statusflag)
                if statusflag == 0:
                    update_onetimescheluler(scheluder_id, None, None)
                isstatuschanged = False
        else:
            if schedule == 1 and ontime != None and offtime != None:
                onTime = ontime.seconds
                offTime = offtime.seconds
                if onTime <= offTime:
                    if onTime <= nowInSec and offTime > nowInSec:
                        if status == 0:  # if every time in loop publish message with MQTT then remove if condition
                            statusflag = 1
                            # if every time in loop publish message with
                            # MQTT then remove is isstatuschanged variable
                            isstatuschanged = True
                    else:
                        if status == 1:   # if every time in loop publish message with MQTT then remove if condition
                            statusflag = 0
                            # if every time in loop publish message with
                            # MQTT then remove is isstatuschanged variable
                            isstatuschanged = True
                elif(onTime > offTime):
                    if (nowInSec >= onTime and nowInSec <= 86400) or (nowInSec >= 0 and nowInSec < offTime):
                        if status == 0:  # if every time in loop publish message with MQTT then remove if condition
                            statusflag = 1
                            # if every time in loop publish message with
                            # MQTT then remove is isstatuschanged variable
                            isstatuschanged = True
                    else:
                        if status == 1:   # if every time in loop publish message with MQTT then remove if condition
                            statusflag = 0
                            # if every time in loop publish message with
                            # MQTT then remove is isstatuschanged variable
                            isstatuschanged = True
                if isstatuschanged is True:  # if every time in loop publish message with MQTT then remove is isstatuschanged if condition
                    prepare_message(statusflag)
                    isstatuschanged = False
       
    except:
        print("Error: unable to fetch data")
    return

def inserLogToDB(logmsgs):
    try:
        dbs = pymysql.connect(**constrg)
        curs = dbs.cursor()
        insqry = "Insert Into `logs` (logdescription) values (%s)"
        curs.executemany(insqry, logmsgs)
        print(*logmsgs, sep='\n')
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


def update_onetimescheluler(scheduler_id, ondatetime, offdatetime):
    try:
        # Execute the SQL command

        cursor.callproc("SetOneDateTimeSchedule",
                        (scheduler_id, ondatetime, offdatetime))
        # Commit your changes in the database
        db.commit()
    except Error as e:
        print(e)
        # Rollback in case there is any error
        db.rollback()


def update_switchstatus(scheduler_id, statusflg):
    try:
        # Execute the SQL command
        cursor.callproc("SetSwitchStatus", (scheduler_id, statusflg))
        # Commit your changes in the database
        db.commit()
    except Error as e:
        print(e)
        # Rollback in case there is any error
        db.rollback()


mqttc = mqtt.Client()

# Assign event callbacks
mqttc.on_message = on_message
mqttc.on_connect = on_connect
mqttc.on_publish = on_publish
mqttc.on_subscribe = on_subscribe

mqttc.connect(mqttsrv, 1883)

while True:
    # Open database connection
    db = pymysql.connect(**constrg)
    db.cursorclass = pymysql.cursors.DictCursor
    cursor = db.cursor()
    read_record_execute()
    # disconnect from server
    db.close()
    time.sleep(sleeptime)
    mqttc.loop()
