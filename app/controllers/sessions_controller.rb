class SessionsController < ApplicationController

    def new
        @fan = Fan.new
      end
    
      def create
        @fan = Fan.find_by(username: params[:fan][:username])
        if @fan && @fan.authenticate(params[:fan][:password])
          session[:fan_id] = @fan.id 
          redirect_to fan_path(@fan)
        else
          redirect_to signin_path
        end
      end
    
      def destroy
        session.delete :fan_id
        redirect_to root_path
      end
end
