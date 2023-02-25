require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    deplo = FactoryBot.create(:deplo)
    @comment = FactoryBot.build(:comment, user_id: user.id, deplo_id: deplo.id)
    sleep 0.2
  end

  describe 'コメント投稿' do
    context 'コメントを投稿できる場合' do
      it 'user_idとdeplo_idとcomment_contentがあれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを投稿できない場合' do
      it 'comment_contentが空では投稿できない' do
        @comment.comment_content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment contentは1文字以上で入力してください")
      end
      it 'comment_contentが140字を超えている場合は投稿できない' do
        @comment.comment_content = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment contentは140文字以内で入力してください")
      end
      it 'user_idが空のときは投稿できない' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
      it 'deplo_idが空のときは投稿できない' do
        @comment.deplo_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Deploを入力してください")
      end
    end
  end
end
