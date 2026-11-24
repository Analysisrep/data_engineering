# Zadanie 1 – uruchomienie PostgreSQL
docker run -d \
  --name my-postgres \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  -e POSTGRES_DB=ny_taxi \
  postgres:18

# Zadanie 2 – diagnostyka

# Sprawdź, czy kontener działa.

docker ps

# Wyświetl jego logi.

docker logs my-postgres

# Sprawdź jego status za pomocą docker inspect.

docker inspect -f '{{.State.Status}}' my-postgres

# Wyświetl, jakiego obrazu używa kontener.

docker inspect -f '{{.Config.Image}}' my-postgres

# Zadanie 3 – praca wewnątrz kontenera

# 	Wejdź do kontenera my-postgres.
docker exec -it my-postgres bash

# Uruchom klienta PostgreSQL: Połącz się z bazą ny_taxi jako użytkownik root.
psql -U root -d ny_taxi

# Wykonaj zapytanie:
SELECT current_database();

# Wyjdź z PostgreSQL i kontenera.
exit

# Sprawdź, czy kontener nadal działa.
docker ps

# Zadanie 4 – zatrzymywanie i usuwanie

# Zatrzymaj kontener.
docker stop my-postgres

# Sprawdź jego status.

docker inspect -f '{{.State.Status}}' my-postgres

#Uruchom go ponownie.

docker start my-postgres

#Usuń go.
docker rm -f my-postgres

#Sprawdź, czy obraz PostgreSQL nadal istnieje.
docker images
docker image inspect postgres:18