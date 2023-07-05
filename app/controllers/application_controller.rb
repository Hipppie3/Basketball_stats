class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    before_action :cors_set_access_control_headers

def cors_preflight_check
  if request.method == 'OPTIONS'
    cors_set_access_control_headers
    render plain: '', content_type: 'text/plain'
  end
end

protected

def cors_set_access_control_headers
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
  response.headers['Access-Control-Max-Age'] = '1728000'
end


  
    private

     def authorize
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
  
    def render_not_found_response(exception)
    render json: { error: "#{exception.model} not found"}, status: :not_found
    end
  
    def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
    
  end