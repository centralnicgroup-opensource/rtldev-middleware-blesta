# Docker Images for Middleware

## Blesta

Use this to get a freshly installed Blesta System up and running in short.

`docker compose up -d` or `docker compose up -d --build` if you need to build from scratch.

### Usage

1. Please add the below entries to your /etc/hosts file to avoid the ip address lookup:

    ```text
    127.0.0.1       blestadev1.hexonet.net
    127.0.0.1       statistics.hexonet.net
    ```

2. Run your respective container

    * ./start.sh blesta
    * ./start.sh documention
    * ./start.sh statistics

3. Open the respective URL in browser

    * Blesta -> [http://blestadev1.hexonet.net](http://blestadev1.hexonet.net)
    * Documentation -> [http://localhost:4000](http://localhost:4000)
    * Statistics -> [http://statistics.hexonet.net:8080](http://statistics.hexonet.net)

NOTE: the use of an reverse proxy to map ports, so to let http://statistics.hexonet.net resolve to http://statistics.hexonet.net:8080 might be an idea on top.

## MySQL Backup

Use the below command to create a backup file:

`docker exec <CONTAINER> /usr/bin/mysqldump -u <USER> --password=<PASSWORD> <DATABASE> > backup.sql`

... and put it into blesta/mysql-dump folder.

HINT: container must be the mysql container of course.

Ensure to cover also an backup of the www files, see next section.

## Blesta WWW Backup

Use the below commands to create a new blesta.zip version:

1) build a tar archive: `docker exec <CONTAINER> tar -czf /tmp/blesta.tgz -C "/var/www/html" blesta uploads`
2) download the tar archive: `docker cp <CONTAINER>:/tmp/blesta.tgz /tmp`
3) convert to zip: `cd /tmp; tar xzf blesta.tgz && zip -q blesta.zip $(tar tf blesta.tgz)`
4) replace the blesta.zip in blesta/dockerconfig/blesta

## Author

Kai Schwarz
