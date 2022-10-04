class PaginationService
  attr_reader :page
  attr_reader :size


  def initialize(page:, size:)
    @page = page || 1
    @size = size || 10
  end

  def paginate(data)
    Kaminari
        .paginate_array(data)
        .page(@page)
        .per(@size)
  end
end