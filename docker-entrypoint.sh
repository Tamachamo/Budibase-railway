#!/bin/bash

# Redisの起動
service redis-server start

# CouchDBの起動
service couchdb start

# Budibaseの起動
budibase start
