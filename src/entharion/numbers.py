def get_signed_equivalent(num):
    # This function takes an unsigned 16-bit number as an input and returns
    # the equivalent signed 16-bit number. 0x7FFF refers to the largest
    # positive 16-bit signed integer while 0x10000 is the smallest number
    # that is greater than the largest 16-bit unsigned number.

    return -(0x10000 - num) if num > 0x7FFF else num
