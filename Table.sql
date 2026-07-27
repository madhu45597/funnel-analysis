CREATE DATABASE funnel_analysis;
USE funnel_analysis;

CREATE TABLE funnel_events (
    user_id VARCHAR(10),
    step VARCHAR(50),
    event_time DATETIME
);