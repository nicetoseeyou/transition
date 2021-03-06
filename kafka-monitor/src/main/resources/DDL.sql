/*
Version 0.0.1
Following OOAD principle.
*/

/*
Create database
*/
DROP DATABASE IF EXISTS MONITOR;
CREATE DATABASE IF NOT EXISTS MONITOR;
/*
CDC module.
There are 3 entities, access server, source agent, target agent.
All these 3 entities would be mapped to DATA_STORE table, and classified by type.
*/
USE MONITOR;

CREATE TABLE IF NOT EXISTS DATA_STORE
(
  DATA_STORE_ID bigint NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(50) NOT NULL,
  HOST VARCHAR(50) NOT NULL,
  PORT INT NOT NULL,
  TYPE VARCHAR(20) NOT NULL,
  IS_ACTIVE VARCHAR(1) NOT NULL DEFAULT 'Y',
  DESCRIPTION VARCHAR(50),
  CONSTRAINT DATA_STORE_PK PRIMARY KEY (DATA_STORE_ID)
);


/*
Kafka Module.
There are 4 entities, cluster, broker,
*/

CREATE TABLE IF NOT EXISTS KAFKA_MONITOR_BROKER
(
  KAFKA_BROKER_ID BIGINT NOT NULL AUTO_INCREMENT,
  HOST VARCHAR(100) NOT NULL,
  PORT INT NOT NULL,
  KAFKA_VERSION VARCHAR(50) NOT NULL,
  IS_ACTIVE VARCHAR(1) NOT NULL DEFAULT 'Y',
  CONSTRAINT KAFKA_BROKER_PK PRIMARY KEY (KAFKA_BROKER_ID)
);

CREATE TABLE IF NOT EXISTS KAFKA_MONITOR_BROKER_INDICATOR
(
  KAFKA_BROKER_INDICATOR_ID BIGINT NOT NULL AUTO_INCREMENT,
  KAFKA_BROKER_ID BIGINT NOT NULL,
  KAFKA_VERSION VARCHAR(50) NOT NULL,
  IS_ACTIVE VARCHAR(1) NOT NULL DEFAULT 'Y',
  INDICATOR_NAME VARCHAR(100) NOT NULL,
  INDICATOR_VALUE VARCHAR(200) NOT NULL,
  CONSTRAINT KAFKA_BROKER_INDICATOR_PK PRIMARY KEY (KAFKA_BROKER_INDICATOR_ID)
);

CREATE TABLE IF NOT EXISTS KAFKA_MONITOR_BROKER_METRICS
(
  KAFKA_BROKER_METRICS_ID BIGINT NOT NULL AUTO_INCREMENT,
  KAFKA_BROKER_ID BIGINT NOT NULL,
  CAPTURE_TIME TIMESTAMP,
  UnderReplicatedPartitions DOUBLE,
  -- TODO add more metrics
  CONSTRAINT KAFKA_BROKER_METRICS_PK PRIMARY KEY (KAFKA_BROKER_METRICS_ID)
);