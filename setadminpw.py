#!/usr/bin/env python

import django, os, sys
sys.path.append('.')
os.environ['DJANGO_SETTINGS_MODULE']='appname.settings'
django.setup()

script, username, password = sys.argv

from django.contrib.auth.models import User

user = User.objects.get(username=username)
user.set_password(password)
user.save()