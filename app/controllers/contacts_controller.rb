class ContactsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @contacts = Contact.all.order("created_at DESC")
    end
    
end
