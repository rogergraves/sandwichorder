class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
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

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    
    a = 'AC1660f10e3c574db28a14a2b65f27ed88'
    t = 'f0ddd92db1ba63e4df656aae38aff69c'
    
    @client = Twilio::REST::Client.new a, t
    
    @client.account.sms.messages.create(
      :from => '(415) 599-2671',
      :to => '(317) 519-2400',
      :body => "Yo Fred, #{@order.user.email} wants a #{@order.sandwich_name}. (witty quote here)"
    )
    
    
    if @order.save
      redirect_to(orders_path, :notice => "Sandwich ordered, now be patient!") 
    else
      redirect_to(orders_path, :notice => "Sorry bro, something went wrong...") 
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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
