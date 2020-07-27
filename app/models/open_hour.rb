# frozen_string_literal: true

# == Schema Information
#
# Table name: open_hours
#
#  id         :bigint           not null, primary key
#  close      :time
#  close_day  :integer
#  open       :time
#  open_day   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  seller_id  :bigint           not null
#
# Indexes
#
#  index_open_hours_on_seller_id  (seller_id)
#
# Foreign Keys
#
#  fk_rails_...  (seller_id => sellers.id)
#
class OpenHour < ApplicationRecord
  belongs_to :seller
  validates_presence_of :open_day, :close_day, :close, :open
  enum days: { MON: 0, TUE: 1, WED: 2, THU: 3, FRI: 4, SAT: 5, SUN: 6 }
  enum open_day: { MON: 0, TUE: 1, WED: 2, THU: 3, FRI: 4, SAT: 5, SUN: 6 }, _suffix: true
  enum close_day: { MON: 0, TUE: 1, WED: 2, THU: 3, FRI: 4, SAT: 5, SUN: 6 }, _suffix: true
  validates_inclusion_of :open_day, in: days.keys
  validates_inclusion_of :close_day, in: days.keys
  validate :opens_before_closes

  protected

  def opens_before_closes
    if (open && close && open_day && close_day) && (((open_day == close_day) && (open >= close)) || (open_day > close_day))
      errors.add(:close, I18n.t('errors.opens_before_closes'))
    end
  end
end