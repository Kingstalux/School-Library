require_relative '../book'

describe Book do
  context 'testing a book class' do
    it 'should create new book instance correctly' do
      book = Book.new(title: 'the lost symbol', author: 'dan brown')
      expect(book.title).to eq 'the lost symbol'
      expect(book.author).to eq 'dan brown'
    end
  end
end