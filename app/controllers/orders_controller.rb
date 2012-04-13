class OrdersController < ApplicationController

  def index
    @orders = Order.find_all_by_user_id(current_user.id)

    redirect_to(new_order_path) unless @orders.length > 0 
  end


  def new
    @order = Order.new
    @order.user_id = current_user.id
    @sandwiches = Sandwich.all
  end

  def create
    @order = Order.new(params[:order])
    
    quotes = File.read("quotes.txt")
    quote = quotes.split("\n").sample
    
    a = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    t = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    
    @client = Twilio::REST::Client.new a, t
    
    @client.account.sms.messages.create(
      :from => '(415) 599-2671',
      :to => '(317) 519-2400',
      :body => "Yo Fred, #{@order.user.email} wants a #{@order.sandwich_name}. By the way, #{quote}"
    )
    
    
    if @order.save
      redirect_to(orders_path, :notice => "Sandwich ordered, now be patient!") 
    else
      redirect_to(orders_path, :notice => "Sorry bro, something went wrong...") 
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    
    redirect_to(orders_url, notice: 'Another satisfied customer.')
  end
end
