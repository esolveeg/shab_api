migrate:
	mysql -u root -h 127.0.0.1 --password=secret < db/db.sql && \
	mysql -u root -h 127.0.0.1 --password=secret < db/seed.sql && \
	mysql -u root -h 127.0.0.1 --password=secret < db/users.sql && \
	mysql -u root -h 127.0.0.1 --password=secret < db/proc.sql 