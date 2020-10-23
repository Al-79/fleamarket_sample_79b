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
    params.require(:ship_address).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefectures, :city, :address_detail, :apartment_name, :phone_number)
  end
end