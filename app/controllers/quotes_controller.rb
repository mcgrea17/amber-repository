class QuotesController < ApplicationController
  

  def create
    
    @quote = Quote.create(quote_params)

    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end

    redirect_to quotes_path
  end

 def index
    @quote = Quote.order("RANDOM()").first
 end


  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
