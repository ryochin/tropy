# frozen_string_literal: true

module ApplicationHelper
  def br(str)
    return str if str.nil?

    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, '<br>').html_safe
  end
end
