module ApplicationHelper
  def item_editable?(item, user)
    user_signed_in? && user.id == item.user.id
  end

  def item_purchasable?(item)
    user_signed_in? && item.order.nil?
  end
end
