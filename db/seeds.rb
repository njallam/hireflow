business1 = Business.create email: 'business1@example.com', password: '123456', password_confirmation: '123456', name: 'Example Corp', city: 'London'
business2 = Business.create email: 'business2@example.com', password: '123456', password_confirmation: '123456', name: 'Dummy Co.', city: 'Tring'

applicant = Applicant.create email: 'applicant@example.com', password: '123456', password_confirmation: '123456', first_name: 'Bob', last_name: 'Smith'
Achievement.create title: 'Duke of Edinburgh', date: '2012-05-15', applicant: applicant
Experience.create place: 'BidFX', title: 'Code monkey', start_date: '2017-07-20', end_date: '2017-07-21', applicant: applicant

job1 = Job.create position: 'Frontend developer', description: 'Do the frontend stuff', business: business1
Job.create position: 'Backend developer', description: 'Do the backend stuff', business: business1

job2 = Job.create position: 'Data Scientist', description: 'Look at all the numbers and do some machine learning', business: business2
Job.create position: 'Sys Admin', description: 'Make the computers work', business: business2

Application.create job: job1, applicant: applicant
Application.create job: job2, applicant: applicant
