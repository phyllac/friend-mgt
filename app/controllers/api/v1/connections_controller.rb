module Api

    module V1

        class ConnectionsController < ApplicationController

            #1. As a user, I need an API to create a friend connection between two email addresses.
            def add_connection
        
                if !params[:friends].nil?
                    
                    requestor = params[:friends][0]
                    target = params[:friends][1]
            
                    requestor_adds_target = Connection.new(:requestor => requestor, :target => target)
                    target_adds_requestor = Connection.new(:requestor => target, :target => requestor)
                    
                    if requestor_adds_target.save and target_adds_requestor.save
                        render json: {
                            success: true
                        }, status: :ok
                    else
                        render json: {
                            success: false,
                            requestor_adds_target_error: requestor_adds_target.errors,
                            target_adds_requestor_error: target_adds_requestor.errors
                        }, status: :unprocessable_entity
                    end
        
                else
        
                    render json: {
                        success: false,
                        error: "Incorrect/Insufficient JSON input"
                    }, status: :ok
        
                end
        
            end
        
            #2. As a user, I need an API to retrieve the friends list for an email address.
            def get_friends_list
        
                requestor = params[:email]
        
                if !requestor.nil? 
                    friends = Connection.where(:requestor => requestor).pluck("target")
                    render json: {
                        success: friends.count > 0,
                        friends: friends, 
                        count: friends.count
                    }, status: :ok
            
                else
        
                    render json: {
                        success: false,
                        error: "Incorrect/Insufficient JSON input"
                    }, status: :ok
        
                end
        
        
            end
        
            #3. As a user, I need an API to retrieve the common friends list between two email addresses.
            def get_common_friends_list
        
                if !params[:friends].nil?
                    friend1 = params[:friends][0]
                    friend2 = params[:friends][1]
            
                    friend1_list = Connection.where(:requestor => friend1).pluck("target");
                    friend2_list = Connection.where(:requestor => friend2).pluck("target");
                    common_friends = friend1_list & friend2_list
                    
                    render json: {
                        success: common_friends.count > 0,
                        friends: common_friends,
                        count: common_friends.count
                    }, status: :ok    
                else
                    render json: {
                        success: false,
                        error: "Incorrect/Insufficient JSON input"
                    }, status: :ok 
                end
        
            end
        
            #4. As a user, I need an API to subscribe to updates from an email address.
            def add_subscription
                requestor = params[:requestor]
                target = params[:target]
        
                if !requestor.nil? and !target.nil? 
                    new_subscription = Subscription.new(:requestor => requestor, :target => target)
                
                    if new_subscription.save
                        render json: {
                            success: true
                        }, status: :ok
                    else
                        render json: {
                            success: false,
                            errors: new_subscription.errors
                        }, status: :ok
                    end
            
                else
                    render json: {
                        success: false,
                        error: "Incorrect/Insufficient JSON input"
                    }, status: :ok
        
                end
        
            end
        
            #5. As a user, I need an API to block updates from an email address.
            def block_user
                requestor = params[:requestor]
                target = params[:target]
        
                if !requestor.nil? and !target.nil? 
                    new_blocked_user = Block.new(:requestor => requestor, :target => target)
                
                    if new_blocked_user.save
                        render json: {
                            success: true
                        }, status: :ok
                    else
                        render json: {
                            success: false,
                            errors: new_blocked_user.errors
                        }, status: :ok
                    end
            
                else
                    render json: {
                        success: false,
                        error: "Incorrect/Insufficient JSON input"
                    }, status: :ok
        
                end
        
            end
        
            #6. As a user, I need an API to retrieve all email addresses that can receive updates from an email address.
            def get_recipients
                sender = params[:sender]
                text = params[:text]
        
                if !sender.nil? and !text.nil?
        
                    # friends
                    friends = Connection.where(:requestor => sender).select("target").pluck("target");
        
                    # subscriptions
                    subscriptions = Subscription.where(:target => sender).select("requestor").pluck("requestor");
        
                    # blocked
                    blocked = Block.where(:requestor => sender).pluck("target") | Block.where(:target => sender).pluck("requestor")
        
                    # emails from text
                    others = text.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i)
        
                    recipients = (friends | subscriptions | others) - blocked
        
                    render json: {
                        success: recipients.count > 0,
                        recipients: recipients
                    }, status: :ok
        
                else
                    render json: {
                        success: false,
                        error: "Incorrect/Insufficient JSON input"
                    }, status: :ok
                end
        
            end
        
        end
    
    end
        
end
