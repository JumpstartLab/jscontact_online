module PhoneNumbersHelper
  def print_numbers(phone_numbers)
    content_tag :ul do
      phone_numbers.collect{|pn| content_tag :li, pn.number}.join.html_safe
    end
  end
end
