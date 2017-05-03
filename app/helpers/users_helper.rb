module UsersHelper
  def job_title_icon
    if @user.profile.job_title == "Musicien"
      "<i class= 'fa fa-music'></i>".html_safe
    elsif @user.profile.job_title == "Ingénieur du son"
      "<i class= 'fa fa-headphones'></i>".html_safe
    elsif @user.profile.job_title == "Chanteur"   
      "<i class= 'fa fa-microphone'></i>".html_safe
    end
  end
end