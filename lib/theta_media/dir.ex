defmodule ThetaMedia.Dir do
	alias ThetaMedia.Base
	def ls() do
		store = Application.get_env(:theta_media, :storage)
		base = Base.new()
		base = put_in(base.base, store)
		list = File.ls!(store)
		dirs = Enum.filter(list, fn (x) -> File.stat!(Path.join(store, x)).type == :directory end)
		base = put_in(base.dirs, dirs)
		files = Enum.filter(list, fn (x) -> File.stat!(Path.join(store, x)).type != :directory end)
		url = List.last(Path.split(base))
		base = put_in(base.files, files)
		base = put_in(base.url, url)
		base
	end

	def ls(%Base{} = base) do
		store = base.base
		list = File.ls!(store)
		dirs = Enum.filter(list, fn (x) -> File.stat!(Path.join(store, x)).type == :directory end)
		base = put_in(base.dirs, dirs)
		files = Enum.filter(list, fn (x) -> File.stat!(Path.join(store, x)).type != :directory end)
		base = put_in(base.files, files)
		list = Path.split(base)
		list_url = Enum.drop(list, base.root-1)
		url = Path.join(list_url)
		base = put_in(base.url, url)
		base
	end

	def mkdir(%Base{} = base, string) do
		File.mkdir(Path.join(base.base, string))
	end
end
