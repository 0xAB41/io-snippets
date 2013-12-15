slower := Object clone
faster := Object clone

slower start := method(
	wait(2);
	writeln("slowly")
)

faster start := method(
	wait(1);
	writeln("faster")
)

slower @@start; faster @@start; wait(3)

futureRes := URL with("http://google.co.in") @fetch
writeln("fetching in background !!")
writeln("now blocking stuff")
writeln("fetched: ", futureRes size)