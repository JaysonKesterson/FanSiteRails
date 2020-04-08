class SessionsController < ApplicationController

    def new
        @fan = Fan.new
      end
    
      def create
        if params[:fan][:username].present?
            @fan = Fan.find_by(username: params[:fan][:username])
            if @fan && @fan.authenticate(params[:fan][:password])
                session[:fan_id] = @fan.id 
                redirect_to fan_path(@fan)
            else
                redirect_to signin_path
            end
        else
            @fan = Fan.find_or_create_by(uid: auth['uid']) do |f|
                f.username = auth['info']['name']
                f.email = auth['info']['email']
            end
                session[:fan_id] = @fan.id
                render root_path
        end
      end
    
      def destroy
        session.delete :fan_id
        redirect_to root_path
      end

      private

      def auth
        request.env['omniauth.auth']
      end
end
