-- 01.모든 레코드 조회하기, 02.역순 정렬하기, 05.동물의 아이디와 이름
-- 배우들을 ID 역순으로 찾기
  SELECT ACTOR_ID AS ID, 
		 CONCAT(FIRST_NAME, '_', LAST_NAME) AS FULL_NAME, 
         DATE_FORMAT(LAST_UPDATE, '%D %M %Y') AS DATE
    FROM ACTOR
ORDER BY ID DESC;
-- ORDER BY에는 별칭 사용 가능.
-- ORDER BY의 기본은 ASC(오름차순)으로 생략하면 ASC가 적용된다.

-- 03.아픈 동물 찾기
-- 성이 JULIA인 배우 찾기
SELECT CONCAT(FIRST_NAME, '_', LAST_NAME) AS FULL_NAME
  FROM ACTOR
 WHERE FIRST_NAME = 'JULIA';

-- 04.어린 동물 찾기
-- 성이 JULIA가 아니고 이름이 ZELLWEGER인 배우 찾기.
   SELECT CONCAT(FIRST_NAME, '_', LAST_NAME) AS FULL_NAME
     FROM ACTOR
WHERE NOT FIRST_NAME = 'JULIA'
      AND LAST_NAME = 'ZELLWEGER';

-- 06.여러 기준으로 정렬하기
-- 배우를 이름 순서로 정렬하되 ID는 높은 순서로 정렬하기.
  SELECT ACTOR_ID, CONCAT(FIRST_NAME, '_', LAST_NAME) AS FULL_NAME
    FROM ACTOR
ORDER BY LAST_NAME, ACTOR_ID DESC;

-- 07.상위 N개 레코드
  SELECT ACTOR_ID AS ID, CONCAT(FIRST_NAME, '_', LAST_NAME) AS FULL_NAME
    FROM ACTOR
   WHERE ACTOR_ID <= 50
ORDER BY ID DESC
   LIMIT 5; -- LIMIT 뒤에 숫자를 붙여주면 그 갯수만큼 불러온다.