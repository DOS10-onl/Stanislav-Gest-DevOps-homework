import requests
import pprint   # module can print output with your params
pp = pprint.PrettyPrinter(indent=2) # set the 2 spaces from each string
check_param = ['food', 'transport', 'lodging', 'shopping']

class GeoParser():
    def __init__(self):
        self._url = 'https://coinmap.org/api/v1/venues/'
        self._result = {}
        self._category = None
    @property
    def category(self):
        return self._category
    @category.setter
    def category(self, category):
        self._category = category

    def send_request(self):
        dict = requests.get(self._url).json()
        return dict

    def parser_geo(self):
        if self.category in check_param:
            dict = self.send_request()
            for key, value in dict.items():
                for item in value:
                    if item.get('category') == self.category:
                        d_name = str((item.get('name')))
                        d_cordinates = str((item.get('geolocation_degrees')))
                        self._result[d_name] = d_cordinates
                self._result = pp.pprint(self._result)
                return self._result
        else:
            print('Sorry, you entered wrong category')

geo1 = GeoParser()
geo1.category = 'lodging'
geo1.parser_geo()