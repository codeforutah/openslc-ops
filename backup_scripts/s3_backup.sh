#!/bin/bash

#using s3cmd, via http://pinehead.tv/linux/how-to-backup-linux-to-amazon-s3-using-s3cmd/

s3cmd -c /home/postgres/.s3cfg put -r /home/postgres/backups s3://openslc-backup
