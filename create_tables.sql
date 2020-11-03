create table Membership(
    membershipType varchar(20) not null,
    description varchar(100),
    PRIMARY KEY (membershipType)
);

create table Customers(
    customerID int(10) not null AUTO_INCREMENT,
    firstName varchar(30),
    lastName varchar(30),
    gender varchar(6) not null check(gender in ('Male', 'Female', 'Other')),
    dateOfBirth date,
    email varchar(30),
    membershipType varchar(20),
    PRIMARY key (customerID),
    FOREIGN key (membershipType) REFERENCES Membership (membershipType)
);

create table Discounts(
    discountType varchar(20) not null,
    description varchar(100),
    PRIMARY KEY (discountType)
);

create table PurchaseDetails(
    recieptNo int(10) not null AUTO_INCREMENT,
    customerID int(10) not null,
    totalPrice decimal(10,2) not null,
    paymentMethod varchar(20),
    discountType varchar(20),
    PRIMARY KEY (recieptNo),
    FOREIGN KEY (discountType) REFERENCES Discounts (discountType),
    FOREIGN KEY (customerID) REFERENCES Customers (customerID)
)

-- catalogue number refers to the album id. Similar to barcode 
create table OrderLine(
    orderID int(10) not null AUTO_INCREMENT,
    recieptNo int(10) not null,
    catalogueNo int(10) not null,
    dateOfPurchase datetime,
    PRIMARY KEY (orderID),
    FOREIGN KEY (recieptNo) REFERENCES PurchaseDetails (recieptNo)
)

create table Album (
    catalogueNo int(10) not null AUTO_INCREMENT,
    albumName varchar(40),
    albumPrice  decimal(10,2),
    stockAmount int(10),
    dateOfRelease date,
    genre varchar(10),
    PRIMARY KEY (catalogueNo)
);

ALTER TABLE OrderLine ADD FOREIGN KEY (catalogueNo) REFERENCES Album(catalogueNo);

create table Genre (
    genre varchar(10) not null,
    description varchar(100),
    PRIMARY KEY (genre)
);

ALTER TABLE Album ADD FOREIGN KEY (genre) REFERENCES Genre(genre);

create table AlbumType(
    catalogueNo int(10) not null,
    formatName varchar(20),
    recordMethod varchar(20),
    PRIMARY KEY (catalogueNo),
    FOREIGN KEY (catalogueNo) REFERENCES Album(catalogueNo)
);

create table AlbumFormat (
    formatName varchar(20) not null,
    description varchar(100),
    PRIMARY KEY (formatName)
);

ALTER TABLE AlbumType ADD FOREIGN KEY (formatName) REFERENCES AlbumFormat(formatName);

create table Track (
    trackID int(10) not null AUTO_INCREMENT,
    catalogueNo int(10),
    trackName VARCHAR(20),
    trackLength decimal,
    PRIMARY KEY (trackID),
    FOREIGN KEY (catalogueNo) REFERENCES Album(catalogueNo)
);


create table ArtistCredits (
    creditID int(10) not null AUTO_INCREMENT,
    trackID int(10) not null, 
    artistID int(10) not null,
    PRIMARY KEY (creditID),
    FOREIGN KEY (trackID) REFERENCES Track (trackID)
);

create table Artist(
    artistID int(10) not null AUTO_INCREMENT,
    firstName varchar(50),
    lastName varchar(50),
    gender varchar(6) not null check(gender in ('Male', 'Female', 'Other')),
    dateOfBirth date,
    recordLabel varchar(30),
    PRIMARY KEY (artistID)
);

ALTER TABLE ArtistCredits ADD FOREIGN KEY (artistID) REFERENCES Artist(artistID);

create table RecordCompany (
    recordLabel varchar(30) not null,
    description varchar(100),
    PRIMARY KEY (recordLabel)
);

ALTER TABLE Artist ADD FOREIGN KEY (recordLabel) REFERENCES RecordCompany(recordLabel);
