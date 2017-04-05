class Comment < ApplicationRecord

	belongs_to :product

	before_save :set_sentiment

	validates_presence_of :feedback


def set_sentiment
	self.score = $analyzer.score(feedback)
	self.sentiment = $analyzer.sentiment(feedback)
	
end
end
