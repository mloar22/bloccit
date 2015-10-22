module ApplicationHelper

  def my_name
    content_tag "H1", "Rick Ross"
  end
  def test_method

    " hey world whats up"

  end


  def any_helper_method
    "Any Helper Method is a method that executes ruby code, but generally returns HTML.  
    It can also be used for conditional logic in the view... and other stuff..."
  end
end
