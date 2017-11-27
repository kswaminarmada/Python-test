# Ver01 12-03-2017 working good for fatch all recored from scheduler table
# Ver02 12-03-2017 working on
# Ver03 12-03-2017 all is working but bot in loop
# Ver08 13-03-2017 working good and following the scheduled of one time and daily also
# Ver09 13-03-2017
# Ver10 21-03-2017 trying for the working in loop for ever working good

import pymysql
import paho.mqtt.client as mqtt
from datetime import datetime, time
import time
import math

sleeptime = 4  # sleep for 4 Second
poichaIP = "localhost"

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


def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed: " + str(mid) + " " + str(granted_qos))


def on_log(mosq, obj, level, string):
    print(string)
#============================================================


# ===================  Prepare SQL query to READ all record one by one FRO
def read_recordNexecute():

    sql = "SELECT * FROM scheduler"

    # now() time in seconds ===================
    nowInSec = str((datetime.now()).time())
    fst = nowInSec.find(':')
    snd = nowInSec.find(':', fst + 1)
    end = nowInSec.find('.', snd + 1)
    # print(nowInSec)
    # print(fst)
    # print(snd)
    # print(end)
    nowInSec = int(nowInSec[:fst]) * 3600 + \
        int(nowInSec[fst + 1:snd]) * 60 + int(nowInSec[snd + 1:end])
    print("Now time in Seconded : %d" % nowInSec)

    try:
                # Execute the SQL command
        cursor.execute(sql)
        # Fetch all the rows in a list of lists.
        results = cursor.fetchall()
        # while results is not None:
        for row in results:
            switchid = row[0]
            ondatetime = row[1]
            offdatetime = row[2]
            schedule = row[3]
            ontime = row[4]
            offtime = row[5]
            # Now print fetched result
            # print ("switchid = %s, ondatetime = %s, offdatetime = %s, schedule = %s, ontime = %s,offtime = %s" % \
            #       (switchid, ondatetime, offdatetime, schedule, ontime, offtime))
            print("Working in Loop")

            # on and off switch as per one time operation
            if ondatetime != None and ondatetime < datetime.now():
                print(ondatetime - datetime.now())
                ptopic = "ND/" + switchid[:5] + '/' + switchid[5:]
                pmassage = switchid + 'T'
                print(ptopic)
                print(pmassage)
                mqttc.publish(ptopic, pmassage, 2)
                print("Swith ON")
                update_record(switchid, 'T')
                query = "UPDATE scheduler SET ondatetime = '0000-00-00 00:00:00' WHERE switchid = '%s'" % (
                        switchid)
                print(query)
                run_query(query)

            if offdatetime != None and offdatetime < datetime.now():
                print(offdatetime - datetime.now())
                ptopic = "ND/" + switchid[:5] + '/' + switchid[5:]
                pmassage = switchid + 'F'
                print(ptopic)
                print(pmassage)
                mqttc.publish(ptopic, pmassage, 2)
                print("Swith OFF")
                update_record(switchid, 'F')
                query = "UPDATE scheduler SET offdatetime = '0000-00-00 00:00:00' WHERE switchid = '%s'" % (
                        switchid)
                print(query)
                run_query(query)

            # Now it will on and off as per the daily schedule
            # i have converted the time into secondes for comparision
            ontimeInSec = str(ontime)
            fst = ontimeInSec.find(':')
            snd = ontimeInSec.find(':', fst + 1)
            print(fst)
            print(snd)
            ontimeInSec = int(ontimeInSec[:fst]) * 3600 + int(
                ontimeInSec[fst + 1:snd]) * 60 + int(ontimeInSec[snd + 1:])
            print("ON time in Seconded : %d" % ontimeInSec)
            print(math.fabs(ontimeInSec - nowInSec))

            if schedule == 'T' and ontime != None and math.fabs(ontimeInSec - nowInSec) <= sleeptime + 1:
                ptopic = "ND/" + switchid[:5] + '/' + switchid[5:]
                pmassage = switchid + 'T'
                print(ptopic)
                print(pmassage)
                mqttc.publish(ptopic, pmassage, 2)
                print("Swith ON as Daily Schecule")
                update_record(switchid, 'T')

            offtimeInSec = str(offtime)
            fst = offtimeInSec.find(':')
            snd = offtimeInSec.find(':', fst + 1)
            print(fst)
            print(snd)
            offtimeInSec = int(offtimeInSec[:fst]) * 3600 + int(
                offtimeInSec[fst + 1:snd]) * 60 + int(offtimeInSec[snd + 1:])
            print("OFF time in Seconded : %d" % offtimeInSec)

            if schedule == 'T' and offtime != None and math.fabs(offtimeInSec - nowInSec) <= sleeptime + 1:
                ptopic = "ND/" + switchid[:5] + '/' + switchid[5:]
                pmassage = switchid + 'F'
                print(ptopic)
                print(pmassage)
                mqttc.publish(ptopic, pmassage, 2)
                print("Swith OFF as Daily Schedule")
                update_record(switchid, 'F')

            #results = cursor.fetchone()

    except:
        print("Error: unable to fetch data")

#=========================================================================


# ===================  Prepare SQL query to READ a record FROM the databas
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
    except:
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
#=========================================================================


# print(read_switch('SB00101'))
# update_record('SB00101','F')
# print(read_switch('SB00101'))


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
mqttc.connect(poichaIP, 1883)

# Start subscribe, with QoS level 2
# mqttc.subscribe("ND/#", 2)

# Publish a message
#mqttc.publish("brainstorm_mqtt", "my Sent message",2)

while True:
    # Open database connection
    db = pymysql.connect(poichaIP, "MySQLClient", "123", "boarddb",108)
    cursor = db.cursor()
    read_recordNexecute()
    # disconnect from server
    db.close()
    time.sleep(sleeptime)
    mqttc.loop()

# Continue the network loop, exit when an error occurs
#rc = 0
# while rc == 0:
#    rc = mqttc.loop()
#print("rc: " + str(rc))
