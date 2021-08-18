class Alert
  include Capybara::DSL

  def messenger_alert
    return find(".alert-dark").text
  end
end
