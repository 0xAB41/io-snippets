/*
 * Queue: Wrapper around List
 */

Queue := Object clone do(
	
	init := method(
		contents ::= list()
	);

	size := method(
		self contents size
	);

	enqueue := method(
	i,
	self contents append(i);
	self
	);

	dequeue := method(
		val := self contents first;
		self setContents(self contents rest);
		val
	)

	top := method(self contents first)
)