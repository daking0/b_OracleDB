--[세션 2]

4) 세션1이 COMMIT을 완료하지 않았으므로 Undo Segment(즉, 갱신 이전 값)을 보여준다.
SELECT sno, sname, avr
FROM student
WHERE sname = '마초';

6) 세션 1이 COMMIT을 완료하였고 세션 2에서 마초의 평점을 확인한다
SELECT sno, sname, avr
FROM student
WHERE sname = '마초';

*트래잭션에 의한 대기 현상 확인

3) 마초의 학과를 검색한다
   세션 1은 학과를 '사회'로 변경하였지만 COMMIT 을 하지 않았기 때문에
   세션 2는 이전의 정보인 '화학'으로 나타나게 된다
SELECT sno, sname, major
FROM student
WHERE sname = '마초';

4) 세션 1이 독점 잠금을 걸어놓은 상태에서
   세션 2가 학과를 '경제'로 변경을 시도한다.
   그러나 세션 1이 독점잠금을 걸어놓았기 때문에
   명령이 완료되지 못하고 대기 상태에 진입한다
UPDATE student
SET major = '경제'
WHERE sname = '마초';

7) 세션 1이 COMMIT 하였으므로 대기가 풀려
   경제로 갱신이 가능하였다.
   하지만 아직 COMMIT 은 완료되지 않은 상태이므로 Undo Segment에서 데이터를 가져오게 된다.
   그리고 세션 2는 마초의 행에 독점 잠금을 걸어놓은 상태이다.
   
SELECT sno, sname, major
FROM student
WHERE sname = '마초';