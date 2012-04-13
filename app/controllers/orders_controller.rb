class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    redirect_to(new_order_path) unless @orders.length > 0 
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @order.user_id = current_user.id
    @sandwiches = Sandwich.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    
    quotes = File.read("quotes.txt")
    quote = quotes.split("\n").sample
    
    a = 'AC1660f10e3c574db28a14a2b65f27ed88'
    t = 'f0ddd92db1ba63e4df656aae38aff69c'
    
    @client = Twilio::REST::Client.new a, t
    
    @client.account.sms.messages.create(
      :from => '(415) 599-2671',
      # :to => '(317) 519-2400',
      :to => '(925) 286-4589',
      :body => "Yo Fred, #{@order.user.email} wants a #{@order.sandwich_name}. By the way, #{quote}"
    )
    
    
    if @order.save
      redirect_to(orders_path, :notice => "Sandwich ordered, now be patient!") 
    else
      redirect_to(orders_path, :notice => "Sorry bro, something went wrong...") 
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    
    redirect_to(orders_url, notice: 'Another satisfied customer.')
    
  end
end
