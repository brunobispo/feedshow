module FontawesomeHelper
  def fa(classes)
    content_tag :i, '', class: "fa #{classes}"
  end
end
