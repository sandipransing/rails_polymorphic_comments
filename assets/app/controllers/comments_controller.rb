class CommentsController < ApplicationController
  # Uncomment following line only unlogged in user can able to write comment
  # before_filter :login_required
  # before_filter :admin_access_required, :only => [ :index ]
  
  before_filter :validate_resource
  
  # VALIDATION CHECK
  # Below filter will verify correctness of resource passed
  # Otherwise validation will get halted
  
  def validate_resource
     begin 
       # Below line will skip extra processing of fiter 
       # in subsequent action execution in request chain.
       @resource ||= params[:resource_type].constantize.find(params[:resource_id])  
     rescue
       flash[ :notice ] => "Invalid #{params[:resource_type] }"
     end
  end
  
  
  # SAVE COMMENT
  # Create comment for resource
  def create
    
    # resource model must have association as
    # class Print < ActiveRecord::Base
    #    has_many :comments, :as => :resource    
    # end
    
    @comment = @resource.comments.new( params[:comment] )
    # Uncomment following line only unlogged in user can able to write comment
    # comment.user = current_user

     # NOTICE USER
     # provide neccessary notification to user
     flash[ :notice ] = @comment.save ?  "Comment posted successfully" : "please ensure to enter comment"
    
    # In Any case request should be redirected to previous page
    redirect_to request.referer     
  end

  
  # MANAGE COMMENTS
  # Below action will list comments in descending order
  # URL => /:resource_id/:resource_type/comments OR whatever defined in routes
  def index
    @comments = @resource.comments.paginate( :page => params[:page], :per_page => 10, :order => 'id DESC' )
  end

end
