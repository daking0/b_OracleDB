--1) 시퀀스(Sequence)
--  ; 유일한 숫자를 제공하는 객체
--  
--  테이블에 입력되는 데이터 중에는 절대 중복되면 안되는 부분이 있다.
--  이때 입력된 값중에 최대값에서 +1을 더한 값을 새로운 입력값으로 사용한다.
--  그런데 이런 방법은 여러 개의 트랜잭션이 동시에 수행되는 환경에서 번번히 입력 실패가 발생한다.
--  이를 해소하기 위해 자동으로 증가하는 고유값을 생성할 때 시퀀스를 사용한다.
--  
--  용도 : 복합키 식별관계 -> 단일 PK키 비식별관계 전환할 때
--        일련번호를 PK로 사용하는데 이것을 시퀀스로 사용한다.
--        (ex. 주문번호, 고객번호, 입고번호 ..)
--        
--2) 용법
--CREATE SEQUENCE 시퀀스
--[START WITH 시작값 - 기본값은 1
--INCREMENT BY 증가값 - 기본값은 1
--MAXVALUE [상한값 | NOMAXVALUE]
--MINVALUE [하한값 | NOMINVALUE]
--CYCLE | NOCYCLE
--CACHE [cache개수 | NOCACHE]];
--
--  (1) 자동으로 유일한 값을 생성하는 시퀀스를 생성한다
--  (2) START WITH : 할당을 시작하는 값을 정의한다.
--                   지정하지 않으면 MINVALUE 가 정의딘다
--                   MINVALUE 보다 작은 값을 지정할 수 없다
--  (3) INCREMENT BY : 생성되는 값의 증가치를 결정한다
--                     지정하지 않으면 1에서 시작한다
--  (4) MAXVALUE : 생성될 상한값을 정의한다
--                 기본 설정은 NOMAXVALUE 이다.
--  (5) MINVALUE : 하한값을 정의한다
--                 기본 설정은 NOMINVALUE 이다. 
--                 NOMINVALUE 로 지정되는 START WITH 는 1이다.
--  (6) CYCLE : 상한값까지 생성한 이후 다시 하한값부터 재생성할 것인지 여부이다.
--              지정하지 않으면 NOCYCLE 이 기본 설정이다
--              NOCYCLE 에서 상한값이 정의되어 있으면 
--              값은 상한값까지 생성되고 이후에는 생성되지 않는다.
--  (7) CACHE : 메모리에 미리 생성될 값의 개수를 정의한다
--              지정하지 않으면 20개를 미리 생성해 둔다
--              
--ALTER SEQUENCE 시퀀스
--INCREMENT BY 증가값
--MAXVALUE [상한값 | NOMAXVALUE]
--MINVALUE [하한값 | NOMINVALUE]
--CYCLE | NOCYCLE
--CACHE cache개수 | NOCACHE;
--  (1) 시퀀스의 설정을 변경한다
--  (2) START WITH 값은 변경할 수 없다
--  (3) 이외 모든 설정은 CREATE SEQUENCE 와 동일하다
--
--DROP SEQUENCE 시퀀스;
--  (1) 시퀀스를 삭제한다.
--
--SELECT sequence_name, max_value, min_value,
--       increment_by, cache_size, last_number,
--       cycle_flag
--FROM user_sequences;
--    (1) 시퀀스 설정을 검색한다
--    (2) last_number : 메모리에 CACHE 된 값중 가장 큰 값
--
--시퀀스.nextval
--시퀀스.currval
--    (1) nextval : 시퀀스로부터 유일한 값을 할당받는다
--                  여러 사용자나 세션에서 공유 가능하지만
--                  어떤 경우도 중복되지 않는 유일한 값을 할당받는다.
--    (2) currval : 시퀀스로부터 마지막으로 할당받은 값을 다시 할당받는다.
--                  -이전에 할당된 값과 동일한 값이 필요할 경우 사용한다.
--    (3) INSERT 문의 VALUES 절이나 UPDATE 문의 SET 절에서 많이 사용한다.
--        주문번호/주문일련번호 같은 곳에서 많이 사용한다.
--
--시퀀스를 생성하고 설정을 검색한다
CREATE SEQUENCE emp_seq_eno
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  CACHE 20;
  
SELECT sequence_name, max_value, min_value,
       increment_by, cache_size, last_number,
       cycle_flag
FROM user_sequences;

--시퀀스의 99%이상 이렇게 만든다
CREATE SEQUENCE order_seq_no;

--시퀀스로부터 값을 할당받아 사용한다.
INSERT INTO emp (eno)
VALUES (emp_seq_eno.nextval);

SELECT *
FROM emp;
ROLLBACK;
--ROLLBACK이 이루어져도 시퀀스는 계속 증가한다 (혹시 모르니까 유니크함을 유지하기 위해서)
--시퀀스 번호에 GAP이 생긴다.
