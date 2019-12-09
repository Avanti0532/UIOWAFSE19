# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

levels = [
    {:course_level => 'Beginner'},
    {:course_level => 'Intermediate'},
    {:course_level => 'Advanced'}
]


levels.each do |level|
  Level.create!(level)
end

faculties = [
    {:first_name => 'David',:last_name => 'Geller',:email=> 'davidgeller@gmail.com', :password => '12345678'},
    {:first_name => 'Chris',:last_name => 'Evans',:email=> 'chrisevans@gmail.com', :password => '12345678'},
    {:first_name => 'Christina',:last_name => 'Jonhson',:email=> 'christinajonh@gmail.com', :password => '12345678'},
    {:first_name => 'Shalini',:last_name => 'Singh',:email=> 'shalinisingh@gmail.com', :password => '12345678'},
    {:first_name => 'Ben',:last_name => 'Anderson',:email=> 'benanderson@gmail.com', :password => '12345678'}
]

faculties.each do |faculty|
  Faculty.create!(faculty)
end

courses = [

    {:course_name => 'Database Systems',:level_id => 2,:faculty_id => 1,:applicable_fee => 300, :description => 'This course is designed to introduce students to relational database systems, focusing on topics such as relational algebra, entity-relationship diagrams, data normalization, design, SQL, use of important database features like transactions, stored procedures, and views. Students will gain exposure to basics of NoSQL, Big Data concepts and Object Relational Mapper (ORM)  principles using tools like Hibernate. Students are expected to develop databases and associated applications as course projects.',:time=> '5:30P - 8:15P M',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/1/Syllabus.pdf')) },
    {:course_name => 'Information Visualization',:level_id => 3,:faculty_id => 2,:applicable_fee => 500, :description => 'This course exposes students from all disciplines to the problems and challenges of effectively interpreting and communicating ever-increasing amounts of data. Information visualization is a research area that focuses on the use of visualization techniques to help people understand and analyze data so that observers and analysts can identify trends, make new discoveries, and quantify relationships and changes. Towards demystifying data analysis and making it accessible to a broader interdisciplinary audience, this course focuses on the practical application of modern tools and techniques, leading participants from traditional data and information visualization to innovative thinking in terms of visual analytics and digital storytelling. Towards this end, it encourages the development of and experimenting with new approaches and techniques tailored to varying analytic tasks and audiences, informed partly by participants own experience, data and application interests. To enable course participants to potentially enter the research field of information visualization, graduate students (enrolled under CS:4980) will receive additional programming tasks and reading assignments from the information visualization research literature. The course will include assigned readings, as well as viewing of visualization examples and hands-on experience with a commercial information visualization tool as well as an OpenSource information visualization toolkit.',:time=> '11:00A - 12:15P TTh',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/2/Syllabus.pdf')) },
    {:course_name => 'Operating Systems',:level_id => 1,:faculty_id => 3,:applicable_fee => 200, :description => 'This course provides an introduction to the design and implementation of modern operating systems. Students will learn how the operating system manages devices including I/O systems, secondary storage, and peripherals. Memory management is introduced including file systems, virtual memory, segmentation, paging, and addressing. Process scheduling and interprocess communication is covered including related issues of interrupts, deadlock, synchronization, and locks. Additional topics include security, library loading/linking, and privacy.',:time=> '3:30P - 4:45P TTh',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/3/Syllabus.pdf')) },
    {:course_name => 'Programming Language Concepts',:level_id => 1,:faculty_id => 4,:applicable_fee => 250, :description => 'This course studies issues in programming language design and implementation. Language features like statically scoped variables, higher-order functions, static type-checking, recursion and pattern-matching are considered, from the points of view of both language users and language creators. The class usually introduces a new advanced programming language, typically in the paradigm known as functional programming; examples include OCaml, Rust, Haskell, Agda, Racket, and others. Other topics considered may include, on the implementation side, garbage collection, tail recursion, parsing and grammars; and advanced declarative programming including logic programming or computer theorem-proving. The class emphasizes programming in a new language, in regular assignments and possibly a final project. This is a required course for majors in computer science. The course is taught by a faculty member.',:time=> '2:00P - 3:15P TTh',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/4/Syllabus.pdf')) },
    {:course_name => 'Computer Security',:level_id => 3,:faculty_id => 5,:applicable_fee => 400, :description => 'This class will introduce the students with the principals of computer security and will also briefly talk about topics from the state-of-art of computer security research. Prior programming experience with the C programming language is preferred but not required. The lecture is taught times a week by the faculty. The main objective of this course is to teach the students foundational concepts of computer security as well as providing them with hands-on knowledge about different tools and techniques for evaluating security of systems and protocols. The programming assignments will aid in the students’ digestion of in-depth technical materials. Example programming assignments may include implementing historical cryptographic constructs (e.g., RC4), developing secure software, and applying existing tools for uncovering software vulnerabilities. Homework assignments will be used to reinforce students’ problem solving skills and expose them to also reading research papers. The final project will be used to introduce students to methodologies of conducting research on computer security.',:time=> '1:00P - 2:15P MWF',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/5/Syllabus.pdf')) },
    {:course_name => 'Principles of Computing',:level_id => 1,:faculty_id => 1,:applicable_fee => 200, :description => 'Introduction to computing for students seeking a broad overview of the discipline. Students acquire necessary concepts and skills to apply computing principles and resources effectively in their chosen profession. Topics include networking and communications, privacy, ethics and security, the limits of computing, and algorithmic problem solving. Lab assignments explore a variety of software tools to support decision making with an emphasis on HTML and CSS for building web pages, a gentle introduction to JavaScript programming language to program web pages, spreadsheet advanced features and database management systems for data processing and querying. This course is not part of the computer science or informatics majors or minors. The course is taught by a faculty member; lab sections are led by TAs.',:time=> '12:30P - 1:20P T',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/6/Syllabus.pdf')) },
    {:course_name => 'Data Structures',:level_id => 2,:faculty_id => 4,:applicable_fee => 250, :description => 'In Computer Science I, you learned to think algorithmically, solving problems using computers by putting to work the tools of a programming language. How do you know whether a program you wrote is a good one? It seems to produce right answers, but is it efficient? is it robust to errors? is the program well-organized and able to be built upon? In Computer Science II, you will learn how to design well-engineered programs, while further expanding your problem solving tool box and improving your problem solving skills. Your new problem solving toolbox will involve new programming constructs, an understanding of data structures, and the ability to mathematically analyze the complexity of an algorithm. Data structures, such as lists, queues, and trees, are methods of storing data. The way that your program needs to access its data determines which data structures are appropriate and efficient for your task. You’ll learn how to implement data structures, as well as how to pick the right data structures for your situation. Further, you’ll learn techniques for building good software, such as testing, interfaces, and design patterns. The programming language is Java or C++. The course involves a 2 midterms and final exam and multiple programming and homework assignments.',:time=> '8:30A - 9:20A M',:attachment => File.open(File.join(Rails.root,'/public/uploads/course/attachment/7/Syllabus.pdf')) }

]

courses.each do |course|
  Course.create!(course)
end

prerequisites = [
    {:course_id => 2, :prereq_id => 1},
    {:course_id => 5, :prereq_id => 3}
]

prerequisites.each do |prerequisite|
  Prerequisite.create!(prerequisite)
end



