# frozen_string_literal: true

class ContributorsSearch < ApplicationRecord
  GITHUB_ADDRESS_REGEXP = %r{\Ahttps://github.com/[\w\W]*\z}.freeze

  after_create_commit :create_contributors

  has_many :contributors, dependent: :destroy

  validates :url, presence: true
  validates :url, format: { with: GITHUB_ADDRESS_REGEXP, message: 'is not correct url to github repository.' }

  def create_contributors
    Services::GithubTopContributors.new(url).call.each do |contributor|
      Contributor.create!(name: contributor.login, contributors_search: self)
    end
  end

  def generate_zip
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      contributors.each do |contributor|
        zos.put_next_entry "#{contributor.name}_diploma.pdf"
        zos.print WickedPdf.new.pdf_from_string(
          "<h1>Thank you for your contribution!</h1><p>#{contributor.name}, thank you for staying with us!</p>"
        )
      end
    end
    compressed_filestream.rewind
    compressed_filestream
  end
end
