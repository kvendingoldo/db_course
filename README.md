# db_course

#### How run DB in docker?

* `docker volume create <volume_name>`
* `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=<password> -e POSTGRES_USER=<user> -e POSTGRES_DB=<db_name> -v <volume_name>:/var/lib/postgresql/data postgres:latest`