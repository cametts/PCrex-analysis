num = 100
while num < 186:
  if num == 105:
      num = 106
  in_string = 'slug'+ str(num) + '.txt'
  out_string = 'slug'+ str(num) + '_new.txt'
  with open(in_string, 'r') as infile, \
      open(out_string, 'w') as outfile:
      data = infile.read()
      data = data.replace("************************************************************************************", " ")
      data = data.replace("*", "\t")
      outfile.write(data)
      infile.close()
      outfile.close()
  num = num+1
