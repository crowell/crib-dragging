c1 = File.read(ARGV[0])
c2 = File.read(ARGV[1])

c3 = ""


idx = 0
c1.each_byte{|i|
	m = c2[idx].ord ^ c1[idx].ord
	idx = idx + 1
	c3 << m.chr
}

File.open("xord.txt", 'w'){|file|
	file.write(c3)
}


