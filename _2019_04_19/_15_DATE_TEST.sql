-- 테이블 확인
SELECT *
FROM tab;

--테이블 구조 확인
DESC datetest;

--데이터 확인
SELECT *
FROM datetest;

--정렬
SELECT *
FROM datetest
ORDER BY hdate DESC;

--범위 검색
SELECT *
FROM datetest
WHERE hdate BETWEEN '2000/01/01' AND '2010/12/31'
ORDER BY hdate;