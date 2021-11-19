Create table t1 ( a integer, b integer );
Create table t2 ( b integer, c integer );
Create table t3 ( c integer, d integer ); 

insert into t1 values(1, 2);
insert into t2 values(1, 2);
insert into t3 values(1, 2);

explain select a from t1 
where mod(a,5) = 0 and b in 
( select b from t2 
     where c in ( SELECT c FROM t3 where mod(d,5) = 0 ));
     
explain select t1.a from t1, t2, t3 where 
t1.b = t2.b and t2.c = t3.c and mod(t1.a,5) = 0 and mod(t3.d,5) = 0;

explain select t1.a from (t1 join t2 on t1.b = t2.b ) join t3 on t2.c = t3.c
where mod(t1.a,5) = 0 and mod(t3.d,5) = 0;