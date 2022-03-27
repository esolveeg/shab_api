migrate:
	mysql -u root -h 172.17.0.1 --password=asd@asd@ < db/db.sql && \
	mysql -u root -h 172.17.0.1 --password=asd@asd@ < db/seed.sql && \
	mysql -u root -h 172.17.0.1 --password=asd@asd@ < db/proc.sql 