class User::HomesController < ApplicationController
  def top
    @posts = Post.order('id DESC').limit(2)
  end

  def about
    @salon = Salon.find_by(params[:id])
  end
end
