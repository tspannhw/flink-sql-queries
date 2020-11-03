 select * from kudu.default_database.`impala::default.envirosensors`;

kudu
uuid, adjtempf, systemtime, temperaturef


SELECT `time`, r.sensor_id, `value`, plant, machine, sensor_type
FROM registry.default_database.recording as r
JOIN kudu.default_database.sensors_data 
FOR SYSTEM_TIME AS OF r.proc_ts AS s 
ON r.sensor_id = s.sensor_id


registry

scada
uuid, systemtime, temperaturef

--- need a timestamp type

SELECT *
FROM registry.default_database.scada as s
JOIN kudu.default_database.`impala::default.envirosensors`
FOR SYSTEM_TIME AS OF s.systemtime AS e
ON s.uuid = e.uuid


=== junk
SELECT s.uuid, s.systemtime, s.temperaturef, e.uuid, e.adjtempf
FROM registry.default_database.scada s
NATURAL JOIN kudu.default_database.`impala::default.envirosensors` e
====
SELECT s.uuid, s.systemtime, s.temperaturef, e.uuid, e.adjtempf
FROM registry.default_database.scada s
NATURAL JOIN kudu.default_database.`impala::default.envirosensors` e
where s.uuid = e.uuid
