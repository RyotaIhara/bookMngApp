require 'rails_helper'

INVALID_TAG_NAME = "ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞた"

INVALID_REMARK = "ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっ"

RSpec.describe Tag, type: :model do
  describe 'Tagモデルのバリデーションテスト' do
    before do
      tag1 = Tag.create(
        tag_name: "重複タグ１",
        remark: "備考１"
      )

      tag2 = Tag.create(
        tag_name: "重複タグ２",
        remark: "備考１",
        deleted_at: "2020-08-15 15:00:00"
      )
    end

    it '通常' do
      tag = Tag.new(
        tag_name: "タグテスト１",
        remark: "備考１"
      )
      expect(tag).to be_valid
    end

    it 'tag_nameに値があれば有効' do
      tag = Tag.new(
        tag_name: "タグテスト１",
      )
      expect(tag).to be_valid
    end

    it 'tag_nameに値がなければ無効' do
      tag = Tag.new(
        remark: "備考１"
      )
      tag.valid?
      expect(tag.errors.messages[:tag_name]).to include('を入力してください')
    end

    it 'tag_nameに30文字以上の値が入っていれば無効' do
      tag = Tag.new(
        tag_name: INVALID_TAG_NAME,
        remark: "備考１"
      )
      tag.valid?
      expect(tag.errors.messages[:tag_name]).to include('は30文字以内で入力してください')
    end

    it 'tag_nameに30文字以上の値が入っていれば無効' do
      tag = Tag.new(
        tag_name: "タグテスト１",
        remark: INVALID_REMARK
      )
      tag.valid?
      expect(tag.errors.messages[:remark]).to include('は200文字以内で入力してください')
    end

    it 'tag_nameが重複していれば無効' do
      tag = Tag.new(
        tag_name: "重複タグ１",
        remark: "備考１"
      )
      tag.valid?
      expect(tag.errors.messages[:tag_name]).to include('は既に登録されています。')
    end

    it 'tag_nameが重複していてもdeleted_atが入っていれば有効' do
      tag = Tag.new(
        tag_name: "重複タグ２",
        remark: "備考１"
      )
      tag.valid?
      expect(tag).to be_valid
    end
      
  end
end
