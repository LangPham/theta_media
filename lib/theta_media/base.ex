defmodule ThetaMedia.Base do
	@moduledoc """
	  base: "/Users/uploads"
		url: "uploads"
		root: 3
	  dirs: [dirA,dirB]
	  files: [file1, file2]
	"""
	defstruct base: "",
	          url: "",
	          root: 1,
	          dirs: [],
	          files: []

	@doc """
	Returns the object of Base.

	## Examples

	    iex> new()
	    %ThetaMedia.Base{
	      base: "/User/uploads"
				url: "uploads"
				root: 3
	      dirs: []
	      files: []
	    }
	"""
	def new() do
		store = Application.get_env(:theta_media, :storage)
		list = Path.split(store)
		root = Enum.count(Path.split(store))
		this = put_in(%__MODULE__{}.root, root)
		this = put_in(this.base, store)
		put_in(this.url, List.last(list))
	end

	@doc """
	Returns the object of Base with change base.

	## Examples

	    iex> into(string)
	    %ThetaMedia.Base{
	      base: "uploads/string"
				root: 1
	      dirs: []
	      files: []
				url: ""
	    }
	"""
	def into(%__MODULE__{} = base, string) do
		put_in(base.base, Path.join(base.base, string))
	end

	@doc """
	Returns the object of Base with change base.

	## Examples
			base = %ThetaMedia.Base{
	      base: "/User/uploads/string"
				url: "uploads/string"
				root: 3
	      dirs: []
	      files: []
	    }

	    iex> outgo(base)
	    %ThetaMedia.Base{
	      base: "/User/uploads"
				url: "uploads"
				root: 1
	      dirs: []
	      files: []
	    }
	"""
	def outgo(%__MODULE__{} = base) do
		list = Path.split(base.base)
		{_, list_new} =
			if Enum.count(list) > base.root do
				List.pop_at(list, -1)
			else
				{nil, list}
			end
		put_in(base.base, Path.join(list_new))
	end
end
