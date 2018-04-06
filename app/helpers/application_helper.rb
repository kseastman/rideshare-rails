module ApplicationHelper
  def cents_to_dollars(cents)
    if cents
      dollars = cents / 100.0
      return "$ #{'%.2f' % dollars}"
    end
    return "---"
  end
end
