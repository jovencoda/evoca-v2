# install mysql for python
# sudo apt-get install python-mysqldb

#!/usr/bin/python
import MySQLdb
from core.models import OjovozRecord

def run(verbose=True):
    db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                         user="root",         # your username
                         passwd="root",  # your password
                         db="old_ojovoz")        # name of the data base

    cur = db.cursor()

    cur.execute("SELECT * FROM `message`")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        print row[4]

    db.close()

run()
