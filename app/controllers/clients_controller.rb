class ClientsController < ApplicationController
  def new
  @client = Client.new
end
def index
    if params[:status] == "activated"
      @clients = Client.activated
    else
      @clients = Client.inactivated
    end
  end
def create
   @client = Client.new(params[:client])
   if @client.save
     redirect_to @client
   else
     render "new"
   end
 end
end
