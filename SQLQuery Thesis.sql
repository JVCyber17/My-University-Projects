create database dbFlex;

create table tblAdmin(AdminId int primary key,AdminName varchar(50),ContactNo varchar(10),Email varchar(50),ProfilePic varchar(50),UserName varchar(50),Password varchar(50));

create table tblFaculty(FacultyId int primary key,FacultyName varchar(50),Email varchar(50),MobNo varchar(10),Experience varchar(50),Dob varchar(50),Gender varchar(50),ProfilePic varchar(50),Address varchar(100),City varchar(50),State varchar(50),Pincode int,Qualification varchar(50),Designation varchar(50),Doj varchar(50),Stafftype varchar(50),UserName varchar(50),Password varchar(50));

create table tblCategories(CategoryId int primary key,CategoryName varchar(100));

create table tblCourse(CourseId int primary key,CourseName varchar(50),Status varchar(50),Description varchar(50),CategoryId int,
foreign key (CategoryId) references tblCategories (CategoryId));

create table tblModule(ModuleId int primary key,ModuleName varchar(100),Status varchar(50),Description varchar(100),Duration Varchar(50),Fees int,CourseId int,CategoryId int,
foreign key(CourseId) references tblCourse(CourseId),
foreign key(CategoryId) references tblCategories(CategoryId));


create table tblBatch(BatchId int primary key,BatchTime varchar(50),Status varchar(50),Description varchar(50),FacultyId int,CourseId int,
foreign key(FacultyId) references tblFaculty(FacultyId),
foreign key(CourseId) references tblCourse(CourseId));

create table tblStudent(EnrolId int primary key,Name varchar(50),Email varchar(50),Address varchar(100),MobNo varchar(10),Dob varchar(50),Gender varchar(50),ProfilePic varchar(50),City varchar(50),Status varchar(50),Pincode int,Doj varchar(50),CourseStatus varchar(50),Password varchar(50),AadharNo varchar(50),BatchId int,CourseId int
foreign key(CourseId) references tblCourse(CourseId),
foreign key(BatchId) references tblBatch(BatchId));


create table tblUploadAssignment(StudentAssignmentId int,UploadAssignment varchar(50),Date varchar(50),EnrolId int,
foreign key(EnrolId) references tblStudent(EnrolId));


create table tblQuestion(QuestionId int primary key,Question varchar(100),Option1 varchar(50),Option2 varchar(50),Option3 varchar(50),Option4 varchar(50),Answer varchar(50),Status varchar(50),FacultyId int,CourseId int,
foreign key(FacultyId) references tblFaculty(FacultyId),
foreign key(CourseId) references tblCourse(CourseId));


create table tblAssignment(AssignmentId int primary key,UploadAssignment varchar(50),Status varchar(50),FacultyId int,CourseId int,
foreign key(FacultyId) references tblFaculty(FacultyId),
foreign key(CourseId) references tblCourse(CourseId));


create table tblFeedBack(FeedBackId int primary key,Description varchar(50),Rating int,EnrolId int,
foreign key(EnrolId) references tblStudent(EnrolId));

create table tblEvent(EventId int primary key,EventName varchar(50),Description varchar(50),EventImg varchar(50),Status varchar(50),FacultyId int,
foreign key(FacultyId) references tblFaculty(FacultyId));


create table tblAttendance(AttendanceId int primary key,Attendance varchar(50),Date varchar(50),FacultyId int,EnrolId int,
foreign key(EnrolId) references tblStudent(EnrolId),
foreign key(FacultyId) references tblFaculty(FacultyId));


create table tblInstituteGallery(GalleryId int primary key,Photos varchar(50),Caption varchar(50),FacultyId int,
foreign key(FacultyId) references tblFaculty(FacultyId));

create table tblMeeting(MeetingId int primary key,Date varchar(50),Time varchar(50),Purpose varchar(50),Description varchar(50),Status varchar(50),FacultyId int,
foreign key(FacultyId) references tblFaculty(FacultyId));

create table tblComplaint(ComplaintId int primary key,Description varchar(50),EnrolId int,
foreign key(EnrolId) references tblStudent(EnrolId));

create table tblFaq(FaqId int primary key,Questions varchar(100),Answer varchar(100),Status varchar(50));

create table tblFees(FeesId int primary key,Amount int,PaymentType varchar(50),FacultyId int,EnrolId int,
foreign key(EnrolId) references tblStudent(EnrolId),
foreign key(FacultyId) references tblFaculty(FacultyId));

create table tblQuestionPaper(QuestionPaperId int primary key,QuestionId int,Status varchar(50),FacultyId int,
foreign key(QuestionId) references tblQuestion(QuestionId),
foreign key(FacultyId) references tblFaculty(FacultyId));

create table tblExamSchedule(ExamScheduleId int primary key,ExamName varchar(100),Duration varchar(50),ExamTime varchar(50),Date varchar(50),TotalMarks int,Description varchar(50),FacultyId int,CourseId int,QuestionPaperId int,
foreign key(FacultyId) references tblFaculty(FacultyId),
foreign key(CourseId) references tblCourse(CourseId),
foreign key(QuestionPaperId) references tblQuestionPaper(QuestionPaperId));

create table tblExam(ExamId int primary key,TotalThMarks int,ObtainThMarks int,TotalPracMarks int,ObtainPracMarks int,Grade varchar(10),Remarks varchar(100),ExamScheduleId int,EnrolId int,BatchId int,
foreign key(EnrolId) references tblStudent(EnrolId),
foreign key(ExamScheduleId) references tblExamSchedule(ExamScheduleId),
foreign key(BatchId) references tblBatch(BatchId));

create table tblInquiry(InquiryId int primary key,CustomerName varchar(100),ContactNo varchar(10),Email varchar(50),Description varchar(100));











insert into tblAdmin(AdminName,ContactNo,Email,ProfilePic,UserName,Password)values('Smit Parekh','9664784515','smitparekh8639@gmail.com','~/img/smitparekh.jpg','Smit','1712');

insert into tblAssignment(UploadAssignment,Status,FacultyId,CourseId) values('~/img/p1.jpg','Active',1,2);

insert into tblAttendance(Attendance,Date,FacultyId,EnrolId) values('Present','2002/12/11',1,1);

insert into tblBatch(BatchTime,Status,Description,FacultyId,CourseId) values('java','Activate','programminglanguage',1,2);

insert into tblCategories(CategoryName)values('IT Course');

insert into tblComplaint(Description,EnrolId) values('bkbhbhbhbhjbh',1);

insert into tblCourse(CourseName,Status,Description,CategoryId) values('webdesign','active','design point of view',1);
insert into tblCourse(CourseName,Status,Description,CategoryId) values('CCC','Deactivated','Giving computer litracy',2);

insert into tblEvent(EventName,Description,EventImg,Status,FacultyId) values('inferno','dfvsb','~/img/p1.jpg','Activate',1);

insert into tblExam(TotalThMarks,ObtainThMarks,TotalPracMarks,ObtainPracMarks,Grade,Remarks,ExamScheduleId,EnrolId,BatchId) values(100,70,20,50,'A','fddf',3,1,1);

insert into tblExamschedule(ExamName,Duration,ExamTime,Date,TotalMarks,Description,FacultyId,CourseId,QuestionPaperId) values('java','1 hour','3:00 to 4:00','2007/12/01',100,'java',1,2,1);

insert into tblFaculty(FacultyName,Email,MobNo,Experience,Dob,Gender,ProfilePic,Address,City,State,Pincode,Qualification,Designation,Doj,Stafftype,UserName,Password)values('devprajapati','dev123@gmail.com','3434424322','beginer','2005/11/03','Male','~/img/p1.jpg','athletica','surat','gujarat',395009,'12 pass','proffesser','2019/11/22','teaching','dev','123');

insert into tblFaq(Questions,Answer,Status) values('dsfsdf','sfdfsf','Activate');

insert into tblFeedback(Description,Rating,EnrolId) values('efdfs',1,1);

insert into tblFees(Amount,PaymentType,FacultyId,EnrolId) values(7500,'cash',1,1);

insert into tblInquiry(CustomerName,ContactNo,Email,Description) values('vinitpatel','485739085','vinit12@gmail.com','dfsfss');

insert into tblInstituteGallery(Photos,Caption,FacultyId) values('~/img/p1.jpg','dfdg',1);

insert into tblMeeting(Date,Time,Purpose,Description,Status,FacultyId) values('2007/12/04','1:00 to 2:00','course purpose','dfkgj','Activate',1);

insert into tblModule(ModuleName,Status,Description,Duration,Fees,CourseId,CategoryId) values('HTML','Active','designing purpose','3 month',7500,1,1);

insert into tblQuestion(Question,Option1,Option2,Option3,Option4,Answer,Status,FacultyId,CourseId) values('Who is founder of c language?','Rasmus lerdof','Dennis Ritchie','John Doe','Albert Roy','Dennis Ritchie','activate',1,2);

insert into tblQuestionpaper(Status,FacultyId) values('activate',1);

insert into tblStudent(Name,Email,Address,MobNo,Dob,Gender,ProfilePic,City,Status,Pincode,Doj,CourseStatus,Password,AadharNo,BatchId,CourseId) values('nikhilprasad','nikhil123@gmail.com','vasupujya','9834758355','2009/11/08','Male','~/img/p1.jpg','borivali','Active',395005,'2014/12/23','Active','2334','123464326754',1,2);

insert into tblUploadAssignment(UploadAssignment,Date,EnrolId) values('java','2007/12/12',1);





drop database dbFlex;





