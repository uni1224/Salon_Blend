class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user_reservations = current_user.reservation.where('start_time >= ?', DateTime.current).order(day: :desc)
    @visit_historys = current_user.reservation.where('start_time < ?', DateTime.current).where('start_time > ?',
                                                                                               DateTime.current << 12).order(day: :desc)
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = '会員情報を更新しました'
      redirect_to mypage_path
    else
      flash[:danger] = '会員情報の更新に失敗しました'
      render :edit
    end
  end

  def quit; end

  def out
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def destroy_confirm
    @user = current_user
  end

  def destroy_user
    @user = current_user
    if @user.email == 'guestda@example.com'
      reset_session
      redirect_to :root
    else
      @user.update(is_valid: false)
      reset_session
      redirect_to :root
    end
  end

  private

  def set_current_user
    @user = current_user
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to mypage_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  

  def user_params
    params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nick_name, :birthday,
                                 :profile_image, :email, :postal_code, :address, :phone_number)
  end
end
