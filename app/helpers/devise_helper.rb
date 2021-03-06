module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:div, msg, class: "alert alert-box") }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = messages
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end