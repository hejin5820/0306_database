/*
db_school
department
id.title.tel
1,  cs,   010-12345678  18612345678     -- 这样就不符合 数据库设计的1NF
id.title.     tel ，     mobile
1,  cs,   010-12345678  18612345678     --这样就符合
*/

/*
student
sno   name    gender    age
null   Tom      male       18
002   Jerry     female    18
null  Tom       male      18        -- 这样就不符合2NF，可以在前面加一列id，就可以避免
*/

/*
student
sno   name    gender    age     teachertel      teachertel
null   Tom      male     18       010……       teachertel
002   Jerry     female   18       010……       teachertel
null  Tom       male     18        010……      teachertel -- 这样就不符合3NF，列的内容一样，就不符合，改为最后一列那样就可以
*/

