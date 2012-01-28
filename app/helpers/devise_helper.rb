module DeviseHelper
  def devise_error_messages!
    #'KABOOM!'
    #return "" if resource.errors.empty?
    return resource.errors
  end
end