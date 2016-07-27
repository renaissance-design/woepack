﻿# Addition. Сложение.
@xvm.export('math.sum')
def math_sum(*a):
    return sum(a)

# Subtraction. Вычитание.
@xvm.export('math.sub')
def math_sub(a, b):
    return a - b

# Multiplication. Умножение.
@xvm.export('math.mul')
def math_mul(*a):
    return reduce(lambda x, y: x*y, a, 1)

# Division. Деление.
@xvm.export('math.div')
def math_div(a, b):
    return a / b

# Raise to power. Возведение в степень.
@xvm.export('math.pow')
def math_pow(a, n):
    return a ** n
