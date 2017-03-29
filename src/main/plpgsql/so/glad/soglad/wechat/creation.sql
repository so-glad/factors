
CREATE SCHEMA wechat AUTHORIZATION soglad;

-- FUNCTION: wechat.generate_id(character varying)

-- DROP FUNCTION wechat.generate_id(character varying);

CREATE OR REPLACE FUNCTION wechat.generate_id(tab_name character varying)
    RETURNS bigint
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE NOT LEAKPROOF 
AS $function$

DECLARE
  our_epoch bigint := 1482046573767;
  seq_id bigint;
  now_millis bigint;
  shard_id int := 1;
  result bigint;
BEGIN
  SELECT nextval('wechat.table_' || tab_name || '_id_seq') % 1024 INTO seq_id;
  SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000) INTO now_millis;
  result := (now_millis - our_epoch) << 23;
  result := result | (shard_id << 10);
  result := result | (seq_id);
  RETURN result;
END;

$function$;

ALTER FUNCTION wechat.generate_id(character varying) OWNER TO soglad;