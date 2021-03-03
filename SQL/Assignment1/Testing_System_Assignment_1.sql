DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- Question  1:
CREATE TABLE Department (
				DepartmentID    			TINYINT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
				DepartmentName  			NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- Question  2:
CREATE TABLE Position (
				PositionID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
				PositionName 				ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- Question  3:
CREATE TABLE `Account` (
				AccountID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
				Email 						VARCHAR(20) NOT NULL UNIQUE KEY,
				Username 					NVARCHAR(30) UNIQUE KEY,
				FullName 					NVARCHAR(30),
				DepartmentID 				TINYINT NOT NULL,
				PositionID 					TINYINT NOT NULL,
				CreateDate 					DATETIME
);

-- Question  4:
CREATE TABLE `Group` (
				GroupID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
				GroupName 					NVARCHAR(30) NOT NULL ,
				CreatorID 					TINYINT,
				CreateDate 					DATETIME
);
-- Question  5:
CREATE TABLE `Group Account`(
				GroupID 					TINYINT  NOT NULL ,
				AccountID 					TINYINT NOT NULL,
				JoinDate 					DATETIME,
                PRIMARY KEY (GroupID,AccountID),
				FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID)
);
-- Question  6:
CREATE TABLE `TypeQuestion`(
				TypeID						TINYINT AUTO_INCREMENT PRIMARY KEY,
				TypeName  					ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
-- Question  7:
CREATE TABLE CategoryQuestion(
				CategoryID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
				CategoryName 				NVARCHAR(50) NOT NULL UNIQUE KEY 
);
-- Question  8:
CREATE TABLE `Question`(
				QuestionID 				TINYINT AUTO_INCREMENT PRIMARY KEY,
				Content 				NVARCHAR(100) NOT NULL,
				CategoryID				TINYINT NOT NULL,
				TypeID 					TINYINT NOT NULL,
				CreatorID 				TINYINT NOT NULL,
				CreateDate 				DATETIME DEFAULT NOW(),
				FOREIGN KEY(CategoryID)	REFERENCES CategoryQuestion(CategoryID),
				FOREIGN KEY(TypeID) 	REFERENCES `TypeQuestion`(TypeID),
				FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountID) 
);
-- Question  9:
CREATE TABLE `Answer`(
				AnswerID 				TINYINT AUTO_INCREMENT PRIMARY KEY,
				Content 				NVARCHAR(100) NOT NULL,
				QuestionID 				TINYINT NOT NULL,
				isCorrect				BIT DEFAULT 1,
				FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
-- Question  10:
CREATE TABLE `Exam`(
				ExamID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
				`Code` 					CHAR(10) NOT NULL,
				Tilte 					NVARCHAR(50),
				CategoryID 				TINYINT NOT NULL,
				Duration				TINYINT NOT NULL,
				CreatorID				TINYINT NOT NULL,
				CreaDate 				DATETIME DEFAULT NOW(),
				FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
				FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountID)
);
CREATE TABLE ExamQuestion(
    ExamID								TINYINT UNSIGNED NOT NULL,
	QuestionID							TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID)				REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) 				REFERENCES Exam(ExamID) ,
    PRIMARY KEY (ExamID,QuestionID)
);


INSERT INTO Department				(DepartmentName) 
VALUES                              (N'Marketing'	),
									(N'Sale'		),
									(N'Bảo vệ'		),
									(N'Nhân sự'		),
									(N'Kỹ thuật'	),
									(N'Tài chính'	),
									(N'Phó giám đốc'),
									(N'Giám đốc'	),
									(N'Thư kí'		),
									(N'Bán hàng'	);
									
INSERT INTO Position				(PositionName	) 
VALUES 								('Dev'			),
									('Test'			),
									('Scrum Master'	),
									('PM'			); 
                        
                        
INSERT INTO `Account`				(Email     		    		, Username		, FullName				, DepartmentID, PositionID	, CreateDate	)
VALUES				 				('hiep123@gmail.com'		,'h123456'		,'Nguyễn Mạnh Hiệp'		,'5'			,'3'		,'2019-12-01'	),
									('haahaha1@gmail.com'		,'hahahaa1'		,'Nguyễn Thành Long'	,'6'			,'2'		,'2019-11-03'	),
									('nmh2222@gmail.com'		,'nhungnguyen'	,'Lê Bảo Long'			,'3'			,'1'		,'2019-05-04'	),
									('bhd111@gmail.com'			,'tungba'		,'Nguyễn Bá Anh Tùng'	,'7'			,'5'		,'2019-06-05'	),
									('hbn3@gmail.com'			,'hungnguyen'	,'Nguyễn Hà Phương'		,'9'			,'3'		,'2019-07-06'	),
									('hvcx3@gmail.com'			,'longtu'		,'Nguyễn Quang Ninh'	,'1'			,'4'		,'2019-08-07'	),
									('hnd277@gmail.com'			,'dainguyen'	,'Nguyễn Văn Hoàng'		,'2'			,'6'		, NULL			),
									('sieunhan@gmail.com'	,'sieunhangao'	,'Hoàng Ngọc Đại'		,'4'			,'2'		,'2019-02-23'	),
									('tranvan123@gmail.com'		,'tranvan'		,'Trần Vân'				,'8'			,'3'		,'2019-08-19'	),
									('ngocsy123@gmail.com'		,'ngochuyen'	,'Nguyễn Quang Ninh'	,'10'			,'1'		,'2019-06-15'	);
                     
   
INSERT INTO `Group`					(GroupName, 			CreatorID		, CreateDate 	)
VALUES			   					(N'Testing System'		,   5			,'2017-03-05'	),
									(N'Development'			,   1			,'2020-12-07'	),
									(N'VTI Sale 01'			,   2			,'2019-11-02'	),
									(N'VTI Sale 02'			,   3			,'2016-03-10'	),
									(N'VTI Sale 03'			,   4			,'2020-04-28'	),
									(N'VTI Creator'			,   6			,'2019-05-06'	),
									(N'VTI Marketing 01'	,   7			,'2020-10-07'	),
									(N'Management'			,   8			,'2019-01-08'	),
									(N'Chat with love'		,   9			,'2021-01-02'	),
									(N'Vi Ti Ai'			,   10			,'2021-02-01'	);
                    
INSERT INTO `Group Account`			(  GroupID	, AccountID	, JoinDate	 )
VALUES 								(	1		,    1		,'2019-03-05'),
									(	1		,    2		,'2020-12-07'),
									(	3		,    3		,'2019-11-02'),
									(	3		,    4		,'2016-03-10'),
									(	5		,    5		,'2029-05-06'),
									(	1		,    3		,'2020-10-07'),
									(	1		,    7		,'2020-04-07'),
									(	8		,    3		,'2020-04-08'),
									(	1		,    9		,'2020-04-09'),
									(	10		,    10		,'2020-04-10');
                            
INSERT INTO TypeQuestion			(TypeName			) 
VALUES 								('Essay'			), 
									('Multiple-Choice'	);
                            
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
                                    
INSERT INTO `Question` 				(Content				,	 CategoryID		, 	TypeID			,	 CreatorID	,	 	CreateDate)
VALUES               				('Câu hỏi về Java'		,		1			,		'1'		,	 	'2'		,		'2020-11-04'),
									('Câu hỏi về PHP'		,		1			,		'1'			,		'2'		,		'2020-08-02'),
									('Câu hỏi về C#'		,		1			,		'1'			,		'3'		,		'2020-06-10'),
									('Câu hỏi về Ruby'		,		1			,		'1'			,		'4'		,		'2020-03-11'),
									('Câu hỏi về Postman'	,		1			,		'1'			,		'5'		,		'2020-02-13'),
									('Câu hỏi về ADO.NET'	,		1			,		'1'			,		'6'		,		'2020-01-12'),
									('Câu hỏi về ASP.NET'	,		1			,		'1'			,		'7'		,		'2020-11-14'),
									('Câu hỏi về C++'		,		1			,		'1'			,		'8'		,		'2020-12-12'),
									('Câu hỏi về SQL'		,		1			,		'1'			,		'9'		,		'2020-10-01'),
									('Câu hỏi về Python'	,		1			,		'1'			,		'10'	,	'2020-09-04');
                     
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
                    
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
INSERT INTO ExamQuestion			(ExamID	,	 QuestionID		) 
VALUES 								(	1	,		5			),
									(	2	,		10			), 
									(	3	,		4			), 
									(	4	,		3			), 
									(	5	,		7			), 
									(	6	,		10			), 
									(	7	,		2			), 
									(	8	,		10			), 
									(	9	,		9			), 
									(	10	,		8			);                      
                                    
