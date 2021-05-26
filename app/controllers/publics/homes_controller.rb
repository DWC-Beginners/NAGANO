class Publics::HomesController < ApplicationController
    def home
    end

    def top
        @products = Product.all

    end

    def about
    end


end
