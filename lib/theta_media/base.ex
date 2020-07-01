defmodule ThetaMedia.Base do
	@moduledoc """
	  base: "uploads"
		root: 0
	  dirs: [dirA,dirB]
	  files: [file1, file2]
	"""
	defstruct base: "",
	          root: 1,
	          dirs: [],
	          files: []

	@doc """
	Returns the object of Base.

	## Examples

	    iex> new()
	    %ThetaMedia.Base{
	      base: "uploads"
				root: 1
	      dirs: []
	      files: []
	    }
	"""
	def new() do
		store = Application.get_env(:theta_media, :storage)
		IO.inspect store
		IO.inspect Path.split(store)
		root = Enum.count(Path.split(store))
		IO.inspect root
		this = put_in(%__MODULE__{}.root, root)
		put_in(this.base, store)
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
	    }
	"""
	def into(%__MODULE__{} = base, string) do
		IO.inspect string, label: "String:\n"
		IO.inspect base.base, label: "Base:\n"
		path = base.base
		base = put_in(base.base, Path.join(base.base, string))
	end

	@doc """
	Returns the object of Base with change base.

	## Examples
			base = %ThetaMedia.Base{
	      base: "uploads/string"
				root: 1
	      dirs: []
	      files: []
	    }

	    iex> outgo(base)
	    %ThetaMedia.Base{
	      base: "uploads"
				root: 1
	      dirs: []
	      files: []
	    }
	"""
	def outgo(%__MODULE__{} = base) do
		list = Path.split(base.base)
		{_,list_new} =
			if Enum.count(list) > base.root do
				List.pop_at(list, -1)
			else
				{ nil,list}
			end

		#		IO.inspect base.base, label: "Base:\n"
		#		path = base.base
		put_in(base.base, Path.join(list_new))
	end

end
