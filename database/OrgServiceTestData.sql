  
INSERT INTO `miricyl`.`orgservice`
(`OrgServiceID`,
`ServiceName`,
`Description`,
`Address1`,
`Address2`,
`OuterCode`,
`InnerCode`,
`PhoneNo`,
`OpeningTime`,
`Organisation_OrgID`,
`Gender_GenderID`,
`ServiceURL`,
`ServiceEmail`,
`Country_CountryID`)
VALUES
(2001,
'Video-based peer support group',
'Video-based peer support group',
'West of Scotland Cricket Club' , 
'40-44 Peel Street Partick Glasgow',
'G11',
'5LU',
'0808 801 0811',
'Monday-Friday 09:00-11:00',
1001,
103,
'https://www.beateatingdisorders.org.uk/support-services/my-area/solace-scotland',
'solace@beateatingdisorders.org.uk' ,
105);

  
INSERT INTO `miricyl`.`orgservice`
(`OrgServiceID`,
`ServiceName`,
`Description`,
`Address1`,
`Address2`,
`OuterCode`,
`InnerCode`,
`PhoneNo`,
`OpeningTime`,
`Organisation_OrgID`,
`Gender_GenderID`,
`ServiceURL`,
`ServiceEmail`,
`Country_CountryID`)
VALUES
(2002,
'One-to-One Web Chat',
'One-to-One Web Chat',
null, 
null,
null,
null,
null,
null,
1001,
103,
'https://www.beateatingdisorders.org.uk/support-services/helplines/one-to-one',
null,
105);

INSERT INTO `miricyl`.`orgservice`
(`OrgServiceID`,
`ServiceName`,
`Description`,
`Address1`,
`Address2`,
`OuterCode`,
`InnerCode`,
`PhoneNo`,
`OpeningTime`,
`Organisation_OrgID`,
`Gender_GenderID`,
`ServiceURL`,
`ServiceEmail`,
`Country_CountryID`)
VALUES
(2003,
'Video Counselling',
'Video Counselling',
null, 	
null,
null,
null,
null,
null,
1002,
103,
null,
null,
105);


insert into miricyl.serviceneeds values (2001,102,103,104);
insert into miricyl.serviceneeds values (2002,126,102,105);
insert into miricyl.serviceneeds values (2003,103,111,102);