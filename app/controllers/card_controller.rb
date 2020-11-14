class CardController < ApplicationController

  require "payjp"
  before_action :set_card

  def index
  end

  def new
    @card = CreditCard.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path(current_user.id)
      else
        render :new
      end
    end
  end

  def show 
    @card = CreditCard.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      @default_card_information = customer.cards.retrieve(@card.card_id) 
    end
 end

  private

  def set_card
    @card = CreditCard.where(user_id: current_user).first
  end
end
