business1 = Business.create email: 'business1@example.com', password: '123456', password_confirmation: '123456', name: 'Example Corp'
business2 = Business.create email: 'business2@example.com', password: '123456', password_confirmation: '123456', name: 'Dummy Co.'

Applicant.create email: 'applicant@example.com', password: '123456', password_confirmation: '123456'

Job.create position: 'Frontend developer', description: 'Do the frontend stuff', business: business1
Job.create position: 'Backend developer', description: 'Do the backend stuff', business: business1

Job.create position: 'Data Scientist', description: 'Look at all the numbers and do some machine learning', business: business2
Job.create position: 'Sys Admin', description: 'Make the computers work', business: business2
