require 'rails_helper'
require 'faker'

RSpec.describe Article, type: :model do
  
  context 'validation tests' do
    it 'ensures the title is present' do
      article = Article.new(content: Faker::Lorem.paragraphs)
      expect(article.valid?).to eq(false)
    end

    it 'ensures the content is present' do
      article = Article.new(title: 'Title')
      expect(article.valid?).to eq(false)
    end

    it 'ensures the title is at least 5 characters long' do
      article = Article.new(title: 'Titl', content: Faker::Lorem.paragraphs)
      expect(article.valid?).to eq(false)
    end

    it 'ensures the content is at least 50 characters long' do
      article = Article.new(title: 'Title', content: 'Less than 50 characters')
      expect(article.valid?).to eq(false)
    end

    it 'should save successfully' do
      article = Article.new(title: 'Title', content: Faker::Lorem.paragraphs)
      expect(article.valid?).to eq(true)
    end
  end
end
