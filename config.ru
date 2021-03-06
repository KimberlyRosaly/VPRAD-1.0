require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end



run ApplicationController
use SessionsController
use Rack::MethodOverride #<--allow for patch requests
use UsersController
use PermitsController
use ApartmentsController
