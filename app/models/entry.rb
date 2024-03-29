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

  default_scope do
    order(:created_at)
  end

  scope :random, lambda {
    offset(rand(count)).first
  }

  def self.initial_id
    '0' * 16
  end

  def self.random_id
    id = SecureRandom.hex(8)

    ActiveRecord::Base.transaction do
      if ActiveRecord::Base.connection_db_config.adapter == 'postgresql'
        ActiveRecord::Base.connection.execute('LOCK entries IN ACCESS EXCLUSIVE MODE')
      end

      where(id: id).exists? ? random_id : id
    end
  end

  def content=(value)
    self[:content] = value.to_s.strip
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

  private

  def set_default_value
    self.id ||= self.class.random_id
  end

  def check_lines
    return if content.blank?

    if content.to_s.lines.count > 20
      errors.add :content, '行数が 多すぎるよ。'
    end
  end
end
