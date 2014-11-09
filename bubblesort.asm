.begin
.org 2048 ! start at memory location 2048

! sorts a set of numbers using bubble sort


main:  ld [i], %r1    ! %r1 is counter for loop1 - i
       ld [j], %r2    ! %r2 is counter for loop2 - j
       ld [length], %r3 ! %r3 is the size of the array
       ld [temp], %r4   ! %r4 temp holder


       ! for(i=0;i < (length)
loop1: subcc %r3, %r1, %r0   ! i < length
       be done

         ! for(j=0;j < (length - i - 1)
  loop2: sub %r3, %r1, %r4    ! length - i
         sub %r4, 1, %r4      ! (length-i) - 1
         subcc %r4, %r2, %r0  ! j < (length - i - 1)
         be next

           ! loads arr info
           sll %r2, 2, %r4          ! current index in array
           ld [%r4 + arr], %r10     ! loads arr[j] into %r10
           ld [%r4 + arr + 4], %r11 ! loads arr[j+1] into %r11
       
           ! if statement
           subcc %r10, %r11, %r0 ! arr[j] > arr[j+1]
           bneg endif

             st %r11, [%r4 + arr]     ! stores arr[j+1] in arr[j]
             st %r10, [%r4 + arr + 4] ! stores arr[j] in arr[j+1]

           ! end if

    endif: add %r2, 1, %r2  ! j++
           ba loop2         ! end loop2
  
   next: ld [temp], %r4  ! temp = 0
         add %r1, 1, %r1 ! i++
         ld [j], %r2     ! sets j back to 0
         ba loop1        ! end loop1


done: halt


i: 0      ! loop1 counter
j: 0      ! loop2 counter
temp: 0   ! temperary holder
length: 9 ! array length
arr: 1    ! arr[0]
22        ! arr[1]
10        ! arr[2]
5         ! arr[3]
3         ! arr[4]
11        ! arr[5]
45        ! arr[6]
100       ! arr[7]
345       ! arr[8]


.end
