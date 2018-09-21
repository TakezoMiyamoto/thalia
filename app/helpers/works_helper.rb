module WorksHelper
  def embed(youtube_url)
    if @work.youtube_url.present?
        youtube_id = youtube_url.split("=").last
        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    end
  end

def imaged(youtube_url)
  youtube_id = youtube_url.split("=").last
  image_tag("//img.youtube.com/vi/#{youtube_id}/mqdefault.jpg")
end



end
