module AuthersHelper
  def getAuther
    Auther.pluck(:name, :id)
  end
end
