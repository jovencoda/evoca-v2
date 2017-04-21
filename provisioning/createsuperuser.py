#!/usr/bin/env python
# -*- coding: utf-8 -*-

import django
import os
from django.contrib.auth import get_user_model

User = get_user_model()
User.objects.create_superuser("root@admin.com", "root", "root")
