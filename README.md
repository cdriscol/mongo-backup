# mongo-backup.sh
This script will create a backup of ALL your mongo databases and retain a configured number of backups for you in a directory.

## options
The following options are available to pass as environment variables

* `MONGO_HOST` - Passed to `--host` in `mongodump`, default `127.0.0.1`
* `MONGO_PORT` - Passed to `--port` in `mongodump`, default `27017`
* `BACKUPS_DIR` - Directory to put backup in, default `backups`
* `MONGODUMP_PATH` - Path to `mongodump` binary, default `mongodump`

## usage
### deafult
```bash
$ ./mongo-backup.sh
```

### advanced
```bash
$ BACKUPS_DIR=/my/backups/dir MONGO_HOST=<some ip> MONGO_PORT=<some port> ./mongo-backup.sh
```

## cron
To schedule a cron job
```bash
sudo su
crontab -e
```

Enter this in a new line:
```bash
0 0 * * * /bin/bash <path to mongo-backup.sh>
```
