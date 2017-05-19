class SiteController < ApplicationController

   def index
     #@num = Professor.try.count('id')
     offset = rand(Professor.count)
     @rand = Professor.offset(offset).first
     @footer = Professor.limit(4).order("RANDOM()")

     @professors = Professor.paginate(:page => params[:page], per_page: 20)
   end

   def about
   end

end
