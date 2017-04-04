class Account::MymoivesController < ApplicationController
    before_action :authenticate_user!

    def index
      @mymoives = current_user.reviewed_mymoives
    end

end
