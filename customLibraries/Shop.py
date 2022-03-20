from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib=BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self,productList):
        i=1
        print(len(productList))
        productsTitles=self.selLib.get_webelements("xpath://h4[@class='card-title']")
        for productsTitle in productsTitles:
            print(productsTitle.text)
            if productsTitle.text in productList:
                self.selLib.click_button("xpath:(//div[@class='card-footer']//button)["+str(i)+"]")
            i=i+1
        self.selLib.click_link("css:li.active>a.nav-link.btn.btn-primary")


