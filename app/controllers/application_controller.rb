class ApplicationController < ActionController::Base
    helper_method :current_fan
    

    def current_fan
        @fan = Fan.find_by(id: session[:fan_id])
    end
end
