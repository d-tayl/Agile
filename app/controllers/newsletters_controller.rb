class NewslettersController < ApplicationController
    before_action :set_event, only: [:show]
    def index
      #Return all newsletters to page
      @newsletters = Newsletter.all
      @title  ="Newsletters"
  end
  
    private
    # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
    end
end
