1) 주제 : 오라클에서 가장 많이 쓰이는 데이터타입.
          일단 이것만 알면 된다.(98%)
          
2) 데이터 타입
 a) VARCHAR2(n) : 가변길이 문자 타입 (1 < n < 4000byte)
 b) VARCHAR(n)  : VARCHAR2와 동일, 안써도 됨
                  Oracle 10g부터 앞으로 VARCHAR는 다른 용도로
                  사용할 예정이니 VARCHAR2 쓰라고 권고함.
 c) CHAR(n)     : 고정길이 문자 타입(1 < n < 2000byte)
 
 *VARCHAR2(1000)과 CHAR(1000)과의 차이점
 ===> 이전에는 CHAR가 VARCHAR2 보다 검색속도가 빨랐으나
      알고리즘의 개선으로 거의 차이가 없다고 판명됨.
      그냥 VARCHAR2만 써도 전혀 관계가 없다.
      하지만 이전부터 설계하던 사람들은 종종 사용하기도 한다.
     
 VARCHAR2(1000) 영문자 10글자 입력되면 10byte의 공간을 차지
                최대 1000byte
               
 CHAR(1000)     무조건 1000byte의 공간을 생성하고
                앞의 10byte만 채운다.

 d) NUMBER(n,p) : 숫자 타입. n은 전체 자리수
                            p는 소수점 이하 자리수
                  전체 자리수를 초과할 경우 입력 거부되지만
                  소수점 이하자리가 초과될 경우는 반올림.
                  소수점 이하의 값이 없는 경우는 
                  길이를 지정하지 않는 것이 좋다. no NUMBER
                  
 e) DATE : 날짜 타입.
           출력이나 입력형식과 무관하게 YYYY/MM/DD:HH25:MI:SS
           형태로 저장된다.
           (기원전 4712년 1월 1일 ~ 서기 9999년 12월 31일)
           * 우리나라에서는 그냥 날짜를 문자열로 저장하는 경우가 많다.