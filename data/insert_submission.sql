CREATE DEFINER=`hf_founder`@`%` PROCEDURE `insert_submission`(
IN 
business_id varchar(36), 
price_category varchar(36), 
price_rating varchar(36), 
price_suggestion varchar(280), 
quality_category varchar(36), 
quality_rating varchar(36), 
quality_suggestion varchar(280), 
environment_category varchar(36), 
environment_rating varchar(36), 
environment_suggestion varchar(280), 
service_category varchar(36), 
service_rating varchar(36), 
service_suggestion varchar(280)
)
BEGIN
	SET @current_time := CURRENT_TIMESTAMP;
    SET @user_id := UUID();
	INSERT INTO User VALUES (@user_id, NULL, @current_time);
	IF (price_rating IS NOT NULL) THEN
		INSERT INTO Submission VALUES (UUID(), price_suggestion, @current_time, business_id, price_category, price_rating, @user_id);
	END IF;
	IF (quality_rating IS NOT NULL) THEN
		INSERT INTO Submission VALUES (UUID(), quality_suggestion, @current_time, business_id, quality_category, quality_rating, @user_id);
	END IF;
	IF (environment_rating IS NOT NULL) THEN
		INSERT INTO Submission VALUES (UUID(), environment_suggestion, @current_time, business_id, environment_category, environment_rating, @user_id);
	END IF;
	IF (service_rating IS NOT NULL) THEN
		INSERT INTO Submission VALUES (UUID(), service_suggestion, @current_time, business_id, service_category, service_rating, @user_id);
	END IF;
END