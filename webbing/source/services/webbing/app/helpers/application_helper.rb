# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Display helper Functions
  # http://www.textism.com/tools/textile/
  def textilize_links(str)
    
    # "!thumb:42!"
    elems = str.scan(/(\!thumb:(\d+)\!)/) do |elm, part|
       str = str.gsub(/#{elm}/, render(:partial => "shared/image/thumb", :object => part, :locals => {:desc => ""}))      
    end
    
    # "!image:42!"        
    elems = str.scan(/(\!image:(\d+)\!)/) do |elm, part|
       str = str.gsub(/#{elm}/, render(:partial => "shared/image/show", :object => part, :locals => {:desc => ""}))      
    end 
    
    
    textilize_without_paragraph(str)
  end
  
  def render_admin_menu(name, items)
    #render_sdmenu(name, items)
    render_accordion_menu(name, items)
  end

  def render_sdmenu(name, items)
    result ="<div><span>#{name}</span>\n"
    items.each do |item|
      result += item + "\n"
    end
    result += "</div>\n"
    return result
  end
  
  def render_accordion_menu(name, items)
    result = %Q{<div class="admin_menu_header">#{name}</div>\n}
    result += %Q{<ul class="admin_menu_content">\n}
    items.each do |item|
      result += "<li>#{item}</li>\n"
    end
    result += "</ul>\n"
    return result
  end

end

