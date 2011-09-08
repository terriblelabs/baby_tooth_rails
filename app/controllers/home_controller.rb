class HomeController < ApplicationController
  def index
    redirect_to BabyTooth.authorize_url
  end

  def callback
    code = params[:code]

    token = BabyTooth.get_token(code)
    session[:token] = token
    user = BabyTooth::User.new(token)

    render :text => user.inspect
  end
end
