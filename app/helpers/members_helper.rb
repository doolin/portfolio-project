# TODO: Find a way to add first and last name for :alt tag
module MembersHelper
  def gravatar_for(member, options = { size: 50 })
    gravatar_image_tag(member.email.downcase, class: 'gravatar',
                                            gravatar: options)
  end
end
