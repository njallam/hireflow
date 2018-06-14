business1 = Business.create email: 'business1@example.com', password: '123456', password_confirmation: '123456', name: 'Skeem Ltd.', description: 'Here at Skeem Ltd., we pride ourselves on hiring the best new interns! Our medium-sized company was established in 2014 and we believe we bring the best generic products to the market. If you are interested in making things for a living – do not hesitate to join us! We are currently based in London but have planned to expand to other cities across the UK soon.', city: 'London'
business2 = Business.create email: 'business2@example.com', password: '123456', password_confirmation: '123456', name: 'Virt-U.', description: 'Here in Tring, we love startups! We hope that you apply for a position with us. Turning \'Applicants\' into \'Applicans\'! We believe that we bring the best unique products to the free market, and if you are interested in fixing things for a livng then do not hesitate to come out and join us in Tring! We don\'t plan on expanding any time soon!', city: 'Tring'

applicant = Applicant.create email: 'applicant@example.com', password: '123456', password_confirmation: '123456', first_name: 'Bob', last_name: 'Smith'
Achievement.create title: 'Duke of Edinburgh', date: '2012-05-15', applicant: applicant
Experience.create place: 'BidFX', title: 'Designer', description: 'I worked as a designer on numerous projects, and was responsible for gathering user feedback on a number of different features I designed.', start_date: '2017-07-20', end_date: '2017-07-21', applicant: applicant
education = Education.create place: 'Imperial College London', field: 'Computer Science', start_date: '2016-10-01', end_date: '2020-06-01', applicant: applicant
Subject.create education: education, title: 'Maths', result: 'A*'
Subject.create education: education, title: 'Biology', result: 'A'

job1 = Job.create position: 'Frontend Developer', description: 'We\'ve got an exciting project for a keen developer to work on. Not much information can be given here other than the fact that you\'ll be developing in Rails. We\'ve got a fun team lined up and would love for you to join us!', business: business1, start_date: '2018-06-15', end_date: '2018-09-01', salary: '36500'
Job.create position: 'Backend Developer', description: 'We\'ve got an exciting project for a keen developer to work on. Not much information can be given here other than the fact that you\'ll be developing using PostgreSQL as the database management system. We\'ve got a fun team lined up and would love for you to join us!', business: business1, start_date: '2018-06-15', end_date: '2018-09-01', salary: '30000'

job2 = Job.create position: 'Data Scientist', description: 'We\'ve got an exciting project for a keen developer to work on. Not much information can be given here other than the fact that you\'ll be developing in Python. We\'ve got a fun team lined up and would love for you to join us!', business: business2, start_date: '2018-06-15', end_date: '2018-09-01', salary: '28500'
Job.create position: 'Systems Administrator', description: 'We need someone to come in and help our systems administration team with day to day work. Our systems are currently quite old and will need a lot of updating to make them up to date with the technology used nowadays - so if you\'re you for a challenge then apply!', business: business2, start_date: '2018-06-15', end_date: '2018-09-01', salary: '36500'

Application.create job: job1, applicant: applicant
Application.create job: job2, applicant: applicant
