#Task 1

def my_decorator(func):
        def wrapped(*args, **kwargs):
            print (*args)
            buf = []
            for key, value in kwargs.items():
                buf.append(f'{key}:{value}')
            print(buf)
            return func(*args, **kwargs)
        return wrapped

@my_decorator
def foo (*args,**kwargs):
    return 1

foo (1,2,3, five=5, six=6, four=4)


# Task 2

users = ["Jack", "Nikole", "Antony","Martin", "Clementin","Joe","12345"]
# print(users)

def check_length(all_users):
    def wrapper(user_list):
        filtered_list = filter(lambda name: len(name)>4,user_list)
        return all_users(list(filtered_list))
    return wrapper

@check_length
def print_users(user_list):
    print(user_list)

print_users(users)



#Task3


MEMO = {}

def memo_decorator(fun):
    def wrapper(a, b):
        if not MEMO.get(fun.__name__):
            res = fun(a, b)
            MEMO.setdefault(fun.__name__, {})
            MEMO.get(fun.__name__).setdefault(f'{a}/{b}', res)
            return res

        if MEMO.get(fun.__name__).get(f'{a}/{b}'):
            print('We take memoized value')
            res = MEMO.get(fun.__name__).get(f'{a}/{b}')
            return res

        res = fun(a, b)
        MEMO.get(fun.__name__).setdefault(f'{a}/{b}', res)
        return res

    return wrapper

@memo_decorator
def mult(a, b):
    return a * b

@memo_decorator
def devi(a, b):
    return a / b

print("2 * 4 = ",mult(2, 4))
print("5 * 6 = ",mult(5, 6))
mult(9,6)


print("6 / 3= ",devi(6, 3))
print("10 / 2 = ",devi(10, 2))
devi (27,3)
print(devi(27,3))
