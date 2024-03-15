# Class 6
Courtney Cameron PID:A69028599

\#Example function 3 parts to a function:

- a name
- input (none,one,or more)
- a body

function to add two numbers

``` r
sillyadd <- function(x,y=1) {
  x+y
}
```

``` r
sillyadd(100,4)
```

    [1] 104

## Q1

# Functions for Lab

Example input vectors to start with

``` r
student1<-c(100,100,100,100,100,100,100,90) 
student2<-c(100,NA,90,90,90,90,97,80) 
student3<-c(90,NA,NA,NA,NA,NA,NA,NA)


mean(student2)
```

    [1] NA

``` r
grade <- function(x) {
  x[is.na(x)] <- 0
  y <- which.min(x)
  mean(x[-y])

}
```

testing aspects of the function

``` r
#find lowest value
which.min(student1)
```

    [1] 8

``` r
#mean of list excluding lowest value
mean(student1[-8])
```

    [1] 100

``` r
#changing NA to 0
student3[is.na(student3)]<-0
student3
```

    [1] 90  0  0  0  0  0  0  0

running function

``` r
grade(student1)
```

    [1] 100

``` r
grade(student2)
```

    [1] 91

``` r
grade(student3)
```

    [1] 12.85714

loading in data from csv file

``` r
url <- 'https://tinyurl.com/gradeinput'

grade_book <- read.csv(url,row.names=1)
```

apply function to the to the gradebook apply(data, row or column \#,
function)

``` r
finalgrade <- apply(grade_book, 1 ,grade)
finalgrade
```

     student-1  student-2  student-3  student-4  student-5  student-6  student-7 
         91.75      82.50      84.25      84.25      88.25      89.00      94.00 
     student-8  student-9 student-10 student-11 student-12 student-13 student-14 
         93.75      87.75      79.00      86.00      91.75      92.25      87.75 
    student-15 student-16 student-17 student-18 student-19 student-20 
         78.75      89.50      88.00      94.50      82.75      82.75 

## Q2

find highest scoring student

``` r
which.max(finalgrade)
```

    student-18 
            18 

## Q3

finding lowest score using mean use na.rm=TRUE to ignore NA in the data

``` r
low <- apply(grade_book, 2,mean, na.rm=TRUE)

low
```

         hw1      hw2      hw3      hw4      hw5 
    89.00000 80.88889 80.80000 89.63158 83.42105 

``` r
which.min(low)
```

    hw3 
      3 

## Q4

Correlation of homework score to overall score

``` r
mask <- grade_book
mask[is.na(mask)] <-0

cor(mask$hw5, finalgrade)
```

    [1] 0.6325982

``` r
cor(mask$hw3, finalgrade)
```

    [1] 0.3042561

``` r
apply(mask, 2, cor, y=finalgrade)
```

          hw1       hw2       hw3       hw4       hw5 
    0.4250204 0.1767780 0.3042561 0.3810884 0.6325982 
