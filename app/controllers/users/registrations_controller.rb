class Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(sign_up_params)
    unless @user.valid? #バリデーションチェック
      flash.now[:alert] = @user.errors.full_messages
      render :new and return #条件分岐を明示的に終了
    end
   
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
   end

   protected
   
  def address_params
    params.require(:ship_address).permit(:last_name, :first_name, :ruby_last_name, :ruby_first_name, :postal_code, :prefectures, :city, :address_detail, :apartment_name, :room_number, :phone_number)
  end
end