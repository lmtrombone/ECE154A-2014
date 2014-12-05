modx:  #modding x (base)
    slt $t7, $a0, $a2       # is x<p?
    bne $t7, $0, donex      # done if t7 = 1
    sub $a0, $a0, $a2       # x = x-p
    j modx                  # goto modx
donex:

mody:   #modding y (exponent)
    slt $t7, $a1, $a2       # is y<p?
    bne $t7,$0,doney        #done if t7=1
    sub $a1,$a1,$a2         # y=y-p
    j mody                  #goto mody
doney:
  addi  $v0,$0,0            #initialize "Hi"
  addi $v1,$0,0             # initialize z (result)
  addi $t7, $0, 16          #initialize repitition counter

mloop:
  addi $t4, $0, 0
  addi $t6, $a1, 0
  srl $a1, $a1, 1
  sub $t6, $t6, $a1
  beqz $t6, noadd
  add $v0, $v0, $v0
  slt $t4, $v0, $a0
noadd:
  addi $t6, $v0, 0
  srl $v0, $v0, 1
  sub $t6,$t6,$v0
  sub $t6,$t6,$v0
  sll $t4, $t4,15
  add $v0,$v0,$t4
  srl $v1,$v1,1
  sll $t6,$t6,15
  add $v1,$v1,$t6
  addi $t7,$t7, -1
  bne $t7, $0, mloop
modz: #modding z (result)
  slt $t7,$v1,$a2       #is z < p?
  bne $t7, $0, donez    #done if t7 = 1
  sub $v1,$v1,$a2       #z = z-p
  j modz
donez
  jr $ra
  
