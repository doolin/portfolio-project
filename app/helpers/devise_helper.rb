module DeviseHelper
  def devise_error_messages!
    #'KABOOM!'
    #return "" if resource.errors.empty?
    resource.errors
  end
end
