-- 08. 최대값 구하기
SELECT MAX(ACTOR_ID) AS MAX_ID
  FROM ACTOR;

-- 14. 최소값 구하기
SELECT MIN(ACTOR_ID) AS MIN_ID
  FROM ACTOR;

-- 09. 이름이 없는 동물의 아이디
-- IS NULL
SELECT COUNT(ACTOR_ID) AS COUNT_ID
  FROM ACTOR
 WHERE LAST_NAME IS NULL;

-- 10. 이름이 있는 동물의 아이디
-- IS NOT NULL
SELECT COUNT(ACTOR_ID) AS COUNT_ID
  FROM ACTOR
 WHERE LAST_NAME IS NOT NULL;

-- 11. 중복 제거하기
-- 중복 제거, NULL 제외 조회
SELECT COUNT(DISTINCT(FIRST_NAME)) AS COUNT_FIRST_NAME
  FROM ACTOR;

-- 12. 동물 수 구하기
SELECT COUNT(ACTOR_ID) AS COUNT_ID
  FROM ACTOR;
  
-- 13. NULL 처리하기
-- 빈 문자열 ''과 NULL은 다르다. NULL은 알 수 없는 값을 의미.
-- IFNULL(값1, 값2): 값1이 NULL일 경우 값2로 대체하여 출력.
SELECT IFNULL(LAST_NAME, 'No Name') AS LAST_NAME
  FROM ACTOR;