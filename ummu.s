

ummu:   add   $v0,$zero,$zero         # initialize Hi to 0
        add   $v0,$zero,$zero         # initialize Lo to 0
        addi  $t2,$zero,32            # initialize repetition counter to 32
mloop:  add   $t0,$zero,$zero         # set carry-out to 0 in case of no add
        add   $t0,$a1,$zero           # copy ($a1) into $t1
        srl   $a1,1                   # half the unsigned value in $a1
        sub   $t1,$t1,$a1             # subtract ($a1) from ($t1) twice to
        sub   $t1,$t1,$a1             # obtain LSB of ($a1), or y[j], in $t1
        beq   $t1,$zero,noadd         # no addition needed if y[j] = 0
        add   $v0,$v0,$a0             # add x to upper part of z
        slt   $t0,$v0,$a0             # form carry-out of addition in $t0
noadd:  add   $t1,$v0,$zero           # copy ($v0) into $t1
        srl   $v0,1                   # halfe the unsigned value in $v0
        sub   $t1,$t1,$v0             # subtract ($v0) from ($t1) twice to
        sub   $t1,$t1,$v0             # obtain LSB of Hi in $t1
        sll   $t0,$t0,31              # carry-out converted to 1 in MSB of $t0
        addu  $v0,$v0,$t0             # right-shifted $v0 corrected
        srl   $v1,1                   # halve the unsigned value in $v1
        sll   $t1,$t1,31              # LSB of Hi converted to 1 in MSB of $t1
        add   $v1,$v1,$t1             # right-shifted $v1 corrected
        addi  $t2,$t2,-1              # decrement repitition counter by 1
        bne   $t2,$zero,mloop         # if counter > 0, repeat multiply loop
        jr    $ra                     # return to calling program

## Example 11.4 in the textbook. ##
shamu:  move  $v0,$zero               # initialize Hi to 0
        move  $v1,$zero               # initialize Lo to 0
        addi  $t2,$zero,32            # initialize repetition counter to 32
mloop:  move  $t0,$zero               # set carry-out to 0 in case of no add
        move  $t1,$a1                 # copy ($a1) into $t1
        srl   $a1,1                   # halve the unsigned value in $a1
        subu  $t1,$t1,$a1             # subtract ($a1) from ($t1) twice to
        subu  $t1,$t1,$a1             # obtain LSB of ($a1), or y[j], in $t1
        beqz  $t1,noadd               # no addition needed if y[j] = 0
        addu  $v0,$v0,$a0             # add x to upper part of z
        sltu  $t0,$v0,$a0             # form carry-out of addition in $t0
noadd:  move  $t1,$v0                 # copy ($v0) into $t1
        srl   $v0,1                   # halve the unsigned value in $v0
        subu  $t1,$t1,$v0             # subtract ($v0) from ($t1) twice to
        subu  $t1,$t1,$v0             # obtain LSB of Hi in $t1
        sll   $t0,$t0,31              # carry-out converted to 1 in MSB of $t0
        addu  $v0,$v0,$t0             # right-shifted $v0 corrected
        srl   $v1,1                   # halve the unsigned value in $v1
        sll   $t1,$t1,31              # LSB of Hi converted to 1 in MSB of $t1
        addu  $v1,$v1,$t1             # right-shifted $v1 corrected
        addi  $t2,$t2,-1              # decrement repitition counter by 1
        bne   $t2,$zero,mloop         # if counter > 0, repeat multiply loop
        jr    $ra                     # return to calling program
