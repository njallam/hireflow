namespace 'test' do
  desc 'Run all static code analysis tools'
  task code: :environment do
    Rake::Task['factory_bot:lint']
  end
end
