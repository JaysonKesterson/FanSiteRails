class FansController < ApplicationController

    def new
        @fan = Fan.new
    end

    def index
      @fans = Fan.all
    end

    def create
    @fan = Fan.new(fan_params)
    if @fan.save
      session[:fan_id] = @fan.id
      redirect_to fan_path(@fan)
    else
      redirect_to fans_path
    end
    end

    def show
    end

    private

    def fan_params
        params.require(:fan).permit(:username, :password, :email)
    end
end
