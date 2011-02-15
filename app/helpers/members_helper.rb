

module MembersHelper

  def gravatar_for(member, options = { :size => 50 })
    gravatar_image_tag(member.email.downcase, :alt => member.firstname + ' ' + member.lastname,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end