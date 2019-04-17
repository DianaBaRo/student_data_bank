require './config/environment'

use Rack::MethodOverride
use RoomsController
use StudentsController
run ApplicationController