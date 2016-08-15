class RelationshipsController < ApplicationController
    
    def create
        user = User.find(params[:trusted_by_id])
        current_user.trust(user)
        redirect_to(:back)
    end
    
    def destroy
        user = Relationship.find(params[:id]).trusted_by
        current_user.untrust(user)
        redirect_to(:back)
    end
    
end