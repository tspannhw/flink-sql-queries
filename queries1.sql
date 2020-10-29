   select * from weather where station_id not in (select station_id from weathernj);
   
   
