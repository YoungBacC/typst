#let conf(class, name, date, num, doc) = [
	#set text(font: "New Computer Modern")
	#set par(leading: 0.9em)
	#set page(
		paper: "us-letter",
		margin: (left: 2cm, right: 2cm),
		header: [
			#grid(
				columns: (1fr, 1fr, 1fr),
				align: (left, center, right),
				[#class],
				[#name],
				[#date]
			)
			#v(-8pt)
			#line(length: 100%)
		]
	)
	= Homework #num
	#v(1em)
	#doc
]

#let proof(append:"",body) = block(
    width: 100%,
		above : 1cm,
		below: 1cm,
    [_Proof#append._ #body #h(1fr) $square$]
)

#let problem(num, body) = block(
	width: 100%,
	[*Problem #num.* #emph(body)]
)