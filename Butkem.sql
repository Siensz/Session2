CREATE DATABASE butkem1

use butkem1

CREATE TABLE Users(
	UserID Char(5),
	FirstName varchar(255),
	LastName varchar(255),
	school varchar(255),
	alamat varchar(255),
	email varchar(255),
	telepon varchar(255),
	lokasi varchar(255),
	DOB date,
	gender varchar(255)
		check(Gender like 'male' or Gender like 'female'),
	CONSTRAINT userPK PRIMARY KEY(UserID),
)
CREATE TABLE Pages(
	PageID char(5),
	Pagename varchar(255),
	PageContent varchar(255),
	CONSTRAINT PagesPK PRIMARY KEY(PageID)
)
CREATE TABLE Posts(
	UserID char(5),
	PostID char(5),
	PostContent varchar(255),
	CONSTRAINT PostPK PRIMARY KEY(PostID),
	CONSTRAINT postsFK FOREIGN KEY(UserID) references Users(UserID)
)
CREATE TABLE Friends(
	FriendID char(5),
	UserID char(5),
	CONSTRAINT FriendPK PRIMARY KEY(FriendID),
	CONSTRAINT FriendFK FOREIGN KEY(UserID) references Users(UserID)
)
CREATE TABLE PageLike(
	PageID char(5),
	UserID char(5),
	CONSTRAINT PagelikePK PRIMARY KEY(PageID),
	CONSTRAINT PageLikeFK FOREIGN KEY(PageID) references Pages(PageID),
	CONSTRAINT PageLikeIDFK FOREIGN KEY(UserID) references Users(UserID)
)
CREATE TABLE PostLike(
	PostID char(5),
	UserID char(5),
	CONSTRAINT PostLikePK PRIMARY KEY(PostID),
	CONSTRAINT PostLikeFK FOREIGN KEY(PostID) references Posts(PostID),
	CONSTRAINT PostLikeIDFK FOREIGN KEY(UserID) references Users(UserID)
)

CREATE TABLE Photos(
	PhotoID char(5),
	PostID char(5),
	ImageContent varchar(255),
	CONSTRAINT PhotoPK PRIMARY KEY(PhotoID),
	CONSTRAINT PhotoFK FOREIGN KEY(PostID) references Posts(PostID)
)
CREATE TABLE Shares(
	PostID char(5),
	UserID char(5),
	CONSTRAINT sharePK PRIMARY KEY(PostID),
	CONSTRAINT shareFK FOREIGN KEY(PostID) references Posts(PostID),
	CONSTRAINT shareIDFK FOREIGN KEY(UserID) references Users(UserID)
)
create table Comments(
	CommentID char(5),
	PostID char(5),
	UserID char(5),
	CommentDate date,
	CommentContent varchar(255),
	constraint CommentPK primary key(CommentID),
	constraint CommentPIDFK foreign key(PostID) references Posts(PostID),
	constraint CommentUIDFK foreign key(UserID) references Users(UserID)
)
create table CommentLikes(
	CommentID char(5),
	UserID char(5),
	constraint CommentLikesPK primary key(CommentID),
	constraint CommentLikesCIDFK foreign key(CommentID) references Comments(CommentID),
	constraint CommentLikesUIDFK foreign key(UserID) references Users(UserID)
)

DROP TABLE Users
DROP TABLE Pages
DROP TABLE Posts
DROP TABLE Friends
DROP TABLE PageLike
DROP TABLE Photos
DROP TABLE Shares
DROP TABLE Comments
DROP TABLE CommentLikes
DROP TABLE PostLike