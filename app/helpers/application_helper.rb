module ApplicationHelper
  def self.category_name(category, language)
    return category if language.blank? || language == 'en'


    # case category
    # when "Politics"
    #   "Politik"
    # when "Coronavirus"
    #   "Coronavirus"
    # when "Business"
    #   "Unternehmen"
    # when "International"
    #   "International"
    # when "Sports"
    #   "Sport"
    # when "Science"
    #   "Wissenschaft"
    # when "Entertainment"
    #   "Unterhaltung"
    # when "Travel"
    #   "Beschwerden"
    # end

    category
  end
end
