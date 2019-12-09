Feature: Student can register for courses
  Background:
    And the following faculties have been added to Faculty Database:
      | first_name  | last_name   | email             | password    |
      | Alice       | May         | alicen@uiowa.edu  | 12345689    |
      | Lily        | Edison      | lilys@uiowa.edu   | 23456789    |
      | Hazel       | Robert      | hazel@uiowa.edu   | 34567890    |

    Given the following students have been added to Student Database:
      | first_name  | last_name  | email          | password  |
      | Robin       | Hood       | robin@gmail.com  | 12345678   |
      | Thomas      | Edison     | thomas@gmail.com  | 23456789  |
      | Frank       | Robert     | frank@gmail.com | 34567890    |

    Given the following levels have been added to Level Database:
      |course_level|
      |Beginner   |
      |Intermediate|
      |Advanced    |

    Given the following courses have been added to Course Database:
      | course_name  | level_id | faculty_id | applicable_fee |description|time|
      |Database Systems|1|1|500|This course is designed to introduce students to relational database systems, focusing on topics such as relational algebra, entity-relationship diagrams, data normalization, design, SQL, use of important database features like transactions, stored procedures, and views. Students will gain exposure to basics of NoSQL, Big Data concepts and Object Relational Mapper (ORM)  principles using tools like Hibernate.|5:30P - 8:15P M|
      |Information Visualization|3|2|500|This course exposes students from all disciplines to the problems and challenges of effectively interpreting and communicating ever-increasing amounts of data. Information visualization is a research area that focuses on the use of visualization techniques to help people understand and analyze data so that observers and analysts can identify trends, make new discoveries, and quantify relationships and changes.|11:00A - 12:15P TTh|
      |Operating Systems        |2|3|400|This course provides an introduction to the design and implementation of modern operating systems. Students will learn how the operating system manages devices including I/O systems, secondary storage, and peripherals.                                                                                                                                                                                                   |3:30P - 4:45P TTh  |
