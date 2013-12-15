/*
 * Simple Matrix Object
 */
Matrix := Object clone do(
	
	init := method(
		contents ::= list()
	)

	dim := method(x,y,
		for(i,1,x, self contents append(list() setSize(y)))
	)

	set := method(x,y,value,
		self contents at(x) atPut(y, value)
		self
	)

	get := method(x,y,
		self contents at(x) at(y)
	)

	transpose := method(
		trans := Matrix clone
		trans dim(self contents at(0) size,self contents size)
		self contents foreach(x,i,
			i foreach(y,element,
			trans set(y,x,element)
			)
		)

		trans
	)
)