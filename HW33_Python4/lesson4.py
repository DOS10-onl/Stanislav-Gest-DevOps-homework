class Enumerate():
    def __init__(self, list):
        self.list = list
        for item in list:
            index = list.index(item)
            print(f'item {item} has index {index}')

list = ('fdf','dfdf',234,54)
print(f'Example first')
Enumerate(list)

class Enumerate_2():
    def __init__(self, list):
        self._list = list
        self._index = -1
    def __iter__(self):
        return self
    def __next__(self):
        if self._index < len(self._list) - 1:
            self._index += 1
            return self._index, self._list[self._index]
        else:
            raise StopIteration

print(f'Example second')

for index, value in Enumerate_2(list):
    print(f'item {value} has index {index}')