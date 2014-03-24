st = File.read(ARGV[0])
key = ARGV[1]

st2 = ""
count = 0
st.each_byte{|i|
	m = i.ord ^ key[count].ord
	st2 << m.chr
}

print st2
