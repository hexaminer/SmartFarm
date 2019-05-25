#this is a piece of code that could be used on the drones in order to make
#the communication of the images taken during a scan on the agriculture fields

import ftplib
import os
import sys
from datetime import date



try:
    #drone ID
    droneId = sys.argv[1]
    # establish a ftp connection with login/pw authentication
    session = ftplib.FTP('192.168.1.10','pi','raspberry')
    # device folder we are connected
    print("Connected to the device at" + session.pwd())

except IndexError:
    print("Drone Id required")
except ftplib.all_errors as e:
    print( "FTP error:" + str(e))



try:
    session.cwd('drone')
except:
    print("Creating new drone directory")
    session.mkd('drone')
    session.cwd('drone')


try:
    #loop and sent all images inside the folder
    for c, filename in  enumerate(os.listdir("imgs/"), 1):
        file = open('imgs/' + filename,'rb')
        session.storbinary('STOR drone' + droneId + '_' + str(date.today())
            + '_#'+ str(c) ,file)
        file.close()
    session.quit()

except ftplib.all_errors as i:
    print( "FTP error:" + str(i))
except os.error as u:
    print( "OS error:" + str(u))
except IOError:
    print("Could not read file:" + filename)
