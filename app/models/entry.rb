class Entry < ApplicationRecord
  after_initialize :set_default_value, if: :new_record?

  validates :content,
    presence: {
      message: '内容が ないよう。'
    },
    length: {
      maximum: 1000,
      message: '内容が ながすぎるよ。'
    }

  validate :check_lines

  scope :latest, lambda {
    order(:created_at).last
  }

  scope :random, lambda {
    offset(rand(self.count)).first
  }

  def self.random_id
    # TODO: lock table

    id = SecureRandom.hex(8)

    if where(id: id).exists?
      random_id
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

  def check_lines
    return if content.blank?

    if content.to_s.lines.count > 20
      errors.add :content, '行数が 多すぎるよ。'
    end
  end
end
