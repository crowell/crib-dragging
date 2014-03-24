# Crib Dragging tools - by crowell
# useful for breaking "two-time-pad" crapto ;-)
# change dictionary based on your needs. 
# the dictionary is right below this line

@dictionary = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.?,-:;'() ".split("")

def valid(st)
	v = true
	arr = @dictionary 
	st.each{|i|
		if(arr.include?(i.chr) == false)
			v = false
		end
	}
	v
end

def xorme st1, st2
	s3 = Array.new
	(st1.length).times{|i|
		sa = st1[i].ord ^ st2[i].ord
		s3.push(sa)
	}
	s3
end

def getStr(ar)
	st = ""
	ar.each{|i|
		st << i.chr
	}
	st
end




xor1 = File.binread(ARGV[0])
xor = xor1.unpack("C*")
crib = ARGV[1]

len = xor.length - crib.length

len.times{|s|
	st = Array.new
	count = 0
	crib.length.times{|i| 
		st.push(xor[s + count])
		count = count + 1
	}

	check = xorme(st, crib)
	if(valid(check))
		puts "#{s}: #{getStr(check)}"
	end

}
