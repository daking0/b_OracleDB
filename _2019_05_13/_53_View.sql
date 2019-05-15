1) 뷰의 이해와 활용
  ; 뷰(View)는 논리적으로 하나의 테이블 또는 여러 테이블의 논리적인 부분 집합을 의미한다.
  사용자는 뷰를 통해서 기반이 되는 테이블의 정보에 접근할 수 있다.

2) 뷰의 종류
  (1) 단순 뷰(Simple View)
     - 단일 table 로부터 만들어진 View
     - 함수나 수식 등을 포함하지 않고 단순 컬럼으로 구성
     - DML 문장 수행이 가능하다 --insert, delete , update
      (View 에 DML을 수행하면 원래 table에 적용된다)
    
  (2) 복합 뷰(Complex View)
     - 다중 table 로부터 만들어진 view
     - 함수나 수식 등을 포함한다
     - DML 문장 수행이 불가능하다
     - 보안상의 이유로 사용하는 경우가 종종 있다.
     
3) 뷰 생성과 확인(용법)
CREATE [OR REPLACE|FORCE|NOFORCE] VIEW 뷰면 (컬럼...)
AS (SELECT 문장 : sub query 문);
[WITH CHECK_OPTION [ CONSTRAINT constraint_name]]
[WITH READ ONLY [CONSTRAINT constraint_name]];
  (1) 뷰를 생성한다
  (2) 서브 쿼리를 이용한 테이블 생성 문장과 유사하다
  (3) OR REPLACE : 뷰를 수정한다
        - 동일한 이름의 뷰를 삭제하고 새로 생성한다
        - ALTER VIEW 명령을 대체한다
  (4) FORCE : 기반 테이블이 없어도 뷰가 생성된다
        - 기본값은 NOFORCE 이다.
  (5) WITH CHECK OPTION : 뷰에 의해서 검색 가능한 행만
          DML 작업이 가능하도록 제약한다
  (6) WITH READ ONLY : 뷰를 통해서는 SELECT 만 가능하도록 제한한다.
          보안상의 이유로 이 옵션을 많이 사용한다