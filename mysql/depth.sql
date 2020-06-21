-- ----------------------------------------------------------MySQL优化------------------------------------------------------------------

-- 目前通过 优化索引  以及   改写sql   来提高性能。

-- 慢查询日志 
-- 执行计划
-- 事务与并发控制

/*
并发带来的问题（打开多个新建查询窗口进行操作），提高并发性时为了提高数据库的处理效率。
事务隔离性是为了解决并发带来的问题。

1.脏读（针对未提交的数据）：一个事务读取了另外一个事务没有commit的数据。（因为另外一个事务可能产生rollback，导致第一个事务读取错误）
2.不可重复读（读取数据本身的对比，值不一样了）：一个事务两次读取的同一数据不一致。（另外一个事务commit后，第一个事务又读取了同样的数据，但是不一样）
3.幻读（读取结果集条数的对比，条数不一样了）：结果集不一致（不可重复读的特殊情况）


innodb隔离级别： 
顺序读：SERIALIZABLE(serializ able)              （NNN,隔离性最高，并发性最差）（只有这个事务执行完毕，下一个事务才会执行）
可重复读：REPEATABLE READ(repeatable read)       （默认隔离级别，NNN）
读已提交：READ COMMITTED(read committed)         （NYY）
读未提交：READ UNCOMMITTED)(read uncommitted)     (YYY,隔离性最好，并发性最差)



设置隔离级别：
SET  SESSION  TRANSACTION ISOLATION LEVEL    SERIALIZEABLE;          ## PERSIST/GLOBAL/SESSION (开发人员就用SESSION ,只在当前连接有效)

*/

SHOW  VARIABLES LIKE '%iso%'; #查看隔离级别
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;  #修改事务的隔离级别






--示例
-- 事务的执行(SERIALIZEABLE)---
BEGIN;
SELECT course_id,title,score
FROM imc_course
WHERE score>9.6

-- 事务的执行(REPEATABLE-READ) 
BEGIN;
UPDATE imc_course 
SET score=9.8
WHERE course_id=34

/*
阻塞：

*/



