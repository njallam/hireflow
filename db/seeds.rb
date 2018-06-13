business1 = Business.create email: 'business1@example.com', password: '123456', password_confirmation: '123456', name: 'Example Corp', description: 'Here at Example Corp, we pride ourselves on hiring the best new interns! Our medium-sized company was established in 2014 and we believe we bring the best generic products to the market. If you are interested in making things for a living – do not hesitate to join us! We are currently based in London but have planned to expand to other cities across the UK soon.', city: 'London'
business2 = Business.create email: 'business2@example.com', password: '123456', password_confirmation: '123456', name: 'Dummy Co.', description: 'Here in Tring, we love startups! We hope that you apply for a position with us. Turning \'Applicants\' into \'Applicans\'! We believe that we bring the best unique products to the free market, and if you are interested in fixing things for a livng then do not hesitate to come out and join us in Tring! We don\'t plan on expanding any time soon!', city: 'Tring'

applicant = Applicant.create email: 'applicant@example.com', password: '123456', password_confirmation: '123456', first_name: 'Bob', last_name: 'Smith'
Achievement.create title: 'Duke of Edinburgh', date: '2012-05-15', applicant: applicant
Experience.create place: 'BidFX', title: 'Code monkey', start_date: '2017-07-20', end_date: '2017-07-21', applicant: applicant
education = Education.create place: 'Imperial College London', start_date: '2016-10-01', end_date: '2020-06-01', applicant: applicant
Subject.create education: education, title: 'Maths', result: 'A*'
Subject.create education: education, title: 'Biology', result: 'A'

job1 = Job.create position: 'Frontend developer', description: 'Do the frontend stuff', business: business1, start_date: '2018-06-15', end_date: '2018-09-01', salary: '36500'
Job.create position: 'Backend developer', description: 'Do the backend stuff', business: business1, start_date: '2018-06-15', end_date: '2018-09-01', salary: '30000'

job2 = Job.create position: 'Data Scientist', description: 'Look at all the numbers and do some machine learning', business: business2, start_date: '2018-06-15', end_date: '2018-09-01', salary: '28500'
Job.create position: 'Sys Admin', description: 'Make the computers work', business: business2, start_date: '2018-06-15', end_date: '2018-09-01', salary: '36500'

Application.create job: job1, applicant: applicant
Application.create job: job2, applicant: applicant
