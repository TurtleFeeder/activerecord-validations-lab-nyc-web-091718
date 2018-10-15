class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait_worthy

  def is_clickbait_worthy
    worthyTitles = ["Won't Believe", "Secret", "Top [number]",  "Guess"]
    if title == nil
      errors.add(:title, "title missing")
    else
      if worthyTitles.any? {|string| title.include?(string)} == false
        errors.add(:title, "not clickbait-y enough")
      end
    end
  end #end is_clickbait_worthy method

end
