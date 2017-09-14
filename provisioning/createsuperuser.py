#!/usr/bin/env python
# -*- coding: utf-8 -*-

import django
import os
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

# -------- Create root user --------

try:
    password = 'password' 
    User = get_user_model()
    User.objects.create_superuser('root', 'myemail@test.com', password)
except Exception as e:
    print(e)
    pass

# -------- Create Auth token --------

try:
    root_user = User.objects.get(username='root')
    token = Token.objects.create(user=root_user)
    print token.key
except Exception as e:
    print(e)
    pass


