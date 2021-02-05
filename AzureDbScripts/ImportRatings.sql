 use `__dbname__`;
 LOAD DATA   infile '..\\Ratings.csv' into table `__dbname__`.RatingImport
  FIELDS TERMINATED BY ','
  Enclosed by '"'
 IGNORE 1 LINES
;