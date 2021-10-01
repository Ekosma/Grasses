require './config/environment'

use Rack::MethodOverride
use UsersController
use PeriodsController
use StudentController
run ApplicationController
