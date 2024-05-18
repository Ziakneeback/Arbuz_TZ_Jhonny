import SwiftUI

struct HomeView: View {
    @State private var selectedProduct: Product? = nil
    @State private var showBottomSheet: Bool = false
    
    var products: [Product] {
        return [
            Product(name: "Banana", price: 1400, quantity: "7 pcs.", imageName: "banana"),
            Product(name: "Apple", price: 830, quantity: "1 kg.", imageName: "apples"),
            Product(name: "Snickers", price: 350, quantity: "1 pcs.", imageName: "snickers"),
            Product(name: "Twix", price: 350, quantity: "1 pcs.", imageName: "twix"),
            Product(name: "Coca-cola", price: 800, quantity: "1 pcs.", imageName: "cola"),
            Product(name: "Arbuz", price: 3000, quantity: "1 pcs.", imageName: "arbuz")
        ]
    }
    
    var body: some View {
        ZStack{
            createBackground()
            VStack{
                createTitle()
                createScrollView()
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showBottomSheet) {
            createProductDetail()
        }
    }
    
    func getProductList() -> [Product] {
        return [
            Product(name: "Banana", price: 1400, quantity: "7 pcs.", imageName: "banana"),
            Product(name: "Apple", price: 830, quantity: "1 kg.", imageName: "apples"),
            Product(name: "Snickers", price: 350, quantity: "1 pcs.", imageName: "snickers"),
            Product(name: "Twix", price: 350, quantity: "1 pcs.", imageName: "twix"),
            Product(name: "Coca-cola", price: 800, quantity: "1 pcs.", imageName: "cola"),
            Product(name: "Arbuz", price: 3000, quantity: "1 pcs.", imageName: "arbuz")
        ]
    }
    
    func createBackground() -> some View {
        VStack(spacing: 0){
            LinearGradient(colors: [.white, .yellow], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            LinearGradient(colors: [.yellow, .white], startPoint: .top, endPoint: .bottom)
        }
    }
    
    func createTitle() -> some View {
        Text("Arbuz.kz")
            .font(.largeTitle.weight(.semibold))
            .padding(.top, 50)
    }
    
    func createScrollView() -> some View {
        ScrollView(showsIndicators: false){
            VStack{
                Title(title: "Horizontal")
                createHorizontalScrollView()
                Title(title: "Vertical")
                createVerticalScrollView()
            }
        }
    }
    
    func createHorizontalScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 10){
                ForEach(products) { product in
                    createProductButton(product: product)
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    func createVerticalScrollView() -> some View {
        ForEach(0..<products.count / 2) { index in
            HStack{
                createProductButton(product: products[index * 2])
                if index * 2 + 1 < products.count {
                    createProductButton(product: products[index * 2 + 1])
                }
            }
        }
        .padding(.top, 5)
    }
    
    func createProductButton(product: Product) -> some View {
        Button(action: {
            self.selectedProduct = product
            self.showBottomSheet = true
        }) {
            ProductCard(product: product)
        }
    }
    
    func createProductDetail() -> some View {
        if let product = selectedProduct {
            return AnyView(ProductDetailView(product: product, isPresented: $showBottomSheet))
        } else {
            return AnyView(Text("No product selected")) // Default view
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
