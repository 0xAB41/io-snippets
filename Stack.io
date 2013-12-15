/*
 * Stack: Wrapper around List
 */

Stack := Object clone do(
	
	init := method(
		contents ::= list()
	);

	size := method(
		self contents size
	);

	push := method(
	i,
	self contents prepend(i);
	self
	);

	pop := method(
		val := self contents first;
		self setContents(self contents rest);
		val
	)

	top := method(self contents first)
)