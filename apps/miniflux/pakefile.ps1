$default = 'run'

function Run () {
  docker-compose up -d
}

function Run-Database {
  docker run --name miniflux postgres -e POSTGRES_PASSWORD=postgres -d postgres
}

function Backup {
  docker exec miniflux_db_1 pg_dump -U postgres miniflux2 > ..\backup.sql && tar caf ..\backup.tar.gz ..\backup.sql
}