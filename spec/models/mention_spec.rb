# coding: utf-8
require 'spec_helper'

describe Mention do

  describe 'に値を設定する場合' do 

    it '"content"には、発言内容が保持される' do
      expected = 'dummy content'
      mention = Mention.new(:content => expected)
      
      expect(mention.content).to eq(expected)
    end

    it '"mentioned_at"には、発言日時が保持される' do
      expected = Time.local(1985, 9, 8, 13, 30, 30) # my birthday! :-)
      mention = Mention.new(:mentioned_at => expected)

      expect(mention.mentioned_at).to eq(expected)
    end
  end

end