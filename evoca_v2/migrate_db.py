# install mysql for python
# sudo apt-get install python-mysqldb
# copy the old DB to attachments/old_data/*
# run python manage.py shell
# import migrate_db
# enjoy!

#!/usr/bin/python
import MySQLdb
import uuid
from django.contrib.gis.geos import Point
# Import models
from core.models import Record, Attachment, Channel
from django.contrib.auth.models import User

def ran_str(string_length=10):
    """Returns a random string of length string_length."""
    random = str(uuid.uuid4()) # Convert UUID format to a Python string.
    random = random.upper() # Make all characters uppercase.
    random = random.replace("-","") # Remove the UUID '-'.
    return random[0:string_length] # Return the random string.

def get_location(attachments):
    location = {}
    for attachment in attachments:
        if len(attachment[7]) >= 1:
            location['lat'] = attachment[7]
        if len(attachment[8]) >= 1:
            location['lon'] = attachment[8]
    if not location:
        return None
    else:
        pnt = Point(float(location.get('lon', None)), float(location.get('lat', None)))
        return pnt

def create_record(author, location):
    # to do --> Check that location != None
    record = Record(location=location)
    record.author = author
    record.channel = Channel.objects.get(pk=1)
    record.save()

def create_attachments(attachments, author, record):
    for attachment in attachments:
        content_type = 0 if attachment[3] == 1 else 1
        # 01 stands for the channel in the old system
        new_url = attachment[2].replace("01", "attachments/old_data")
        new_attachment = Attachment(url=attachment[2], attachment_type=content_type)
        new_attachment.author = author
        new_attachment.related_record = record
        new_attachment.save()

def run(verbose=True):
    db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                         user="root",         # your username
                         passwd="root",  # your password
                         db="old_ojovoz")        # name of the data base

    cur = db.cursor()
    cur.execute("SELECT * FROM `message`")

    for message in cur.fetchall():
        try:
            author = User.objects.create(username=message[4], password=ran_str(6))
            attachments = db.cursor()
            attachments.execute("SELECT * FROM `attachment` WHERE `message_id` = %(message_id)s", {'message_id': message[0]})
            create_record(author, get_location(attachments))
            create_attachments(attachments, author, record)
            print("check :)")
        except Exception as e:
            raise

    db.close()

run()
