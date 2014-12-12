class PuzzleDecorator < Draper::Decorator
  delegate_all

  def icon
    icon = puzzle.icon.present? ? puzzle.icon : ('a'..'z').to_a.sample
    h.content_tag(:div, icon, class: 'puzzle-icon')
  end
end
