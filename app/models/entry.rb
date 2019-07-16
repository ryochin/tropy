class Entry < ApplicationRecord
  after_initialize :set_default_value, if: :new_record?

  validates :content,
    presence: {
      message: '内容が ないよう。'
    }

  scope :random, lambda {
    offset(rand(self.count)).first
  }

  def self.random_id
    id = SecureRandom.hex

    if Entry.where(id: id).exists?
      Entry.random_id
    end

    id
  end

  def content=(value)
    self[:content] = value.to_s.strip
  end

  def set_default_value
    self.id ||= Entry.random_id
  end

  def bgcolor
    r = 255 - id[0, 2].hex % 32
    g = 255 - id[2, 2].hex % 32
    b = 255 - id[4, 2].hex % 32

    ('#%02X%02X%02X' % [r, g, b]).downcase
  end

  def title
    content.split(/\r?\n/, 2)[0]
  end

  def body
    _title, c = content.split(/\r?\n/, 2)

    c&.strip
  end
end
