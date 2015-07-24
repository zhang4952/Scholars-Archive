# app/presenters/file_presenter.rb
class FilePresenter < Sufia::GenericFilePresenter
  self.terms += ScholarsArchiveSchema.properties.map(&:name)
  def [](key)
    result = Array.wrap(super)
    result.flat_map{|x| clean_item(x) }
  end

  private

  def clean_item(item)
    if item.kind_of?(Hash) && item["preflabel"]
      item["preflabel"]
    else
      item
    end
  end
end
