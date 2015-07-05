class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  #=begin
  def after_sign_in_path_for(_resource)
    #stored_location_for(resource) || member_path
    #member_path
  end
#=end

=begin
def after_sign_in_path_for(resource_or_scope)
  if resource_or_scope.is_a?(Member)
    member_path
  else
    super
  end
end

# Need this for later
=begin
 private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
=end
end
