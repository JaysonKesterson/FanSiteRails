class SessionsController < ApplicationController

    def new
        @fan = Fan.new
      end
    
      def create
        if params[:fan]
            @fan = Fan.find_by(username: params[:fan][:username])
            if @fan && @fan.authenticate(params[:fan][:password])
                session[:fan_id] = @fan.id 
                redirect_to fan_path(@fan)
            else
                redirect_to signin_path
            end
        else
            if @fan = Fan.find_by(email: auth[:info]['email'])
                session[:fan_id] = @fan.id
                redirect_to fan_path(@fan)
            else
                @fan = Fan.new(email: auth[:info]['email'], username: auth[:info]['name'], password: SecureRandom.hex, uid: auth['uid'])
                  if @fan.save
                    session[:fan_id] = @fan.id
                    redirect_to fan_path(@fan)
                  else
                    render :new
                  end
            end
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
