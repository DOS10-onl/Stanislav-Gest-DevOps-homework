a = int(5)
b = int(4)

str_1 = "this is string 1!"
str_2 = "this is string 2!"
list_1 = ["bmw", "audi", "honda", "volvo", "skoda"]

# Task 2
c = a + b
d = a ** b
e = b % a
f = b * a
g = b / a
h = b // a
print (c, d, e, f, g, h)
#
# # Task 3
list_2 = [list_1[0], list_1[1], list_1[2], list_1[3]]
print (list_2)
#
# # Task 4
str_3 = str_1 + " " + str_2
print(str_3)
#
# # Task 5
just_dict = {"name": "Gest Stanislav", "age": 20}
just_dict.update({"name": "Hello"})
age = just_dict.get("age")
print(just_dict.items())
print(age)