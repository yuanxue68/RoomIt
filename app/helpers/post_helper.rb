module PostHelper
  def cross_or_check?(value)
    if value
      html = <<-HTML
      <i class='fa fa-check-circle'></i>
      HTML
    else
      html = <<-HTML
      <i class='fa fa-close'></i>
      HTML
    end
    html.html_safe
  end
end
