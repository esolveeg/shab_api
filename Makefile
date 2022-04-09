migrate:
	mysql -u root  --password=asd@asd@ < db/db.sql && \
	mysql -u root  --password=asd@asd@ < db/seed.sql && \
	mysql -u root  --password=asd@asd@ < db/proc.sql 
