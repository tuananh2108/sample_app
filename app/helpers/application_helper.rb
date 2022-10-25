module ApplicationHelper
  include Pagy::Frontend

  def full_title page_title
    base_title = t("sub_title")
    page_title.empty? ? base_title : [page_title, base_title].join(" | ")
  end

  def path_link
    request.original_fullpath.split("?").first
  end
end
