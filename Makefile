migrate:
	mysql -u root -h 127.0.0.1  --password=asd@asd@ < db/db.sql && \
	mysql -u root -h 127.0.0.1  --password=asd@asd@ < db/seed.sql && \
	mysql -u root -h 127.0.0.1  --password=asd@asd@ < db/proc.sql 
