import SwiftUI

struct CustomNavigationBarViewModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    let title: String

    init(title: String) {
        self.title = title
    }

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .bold()
                            Text("Back")
                        }
                        .tint(.blue)
                    }
                    
                    Spacer()
                }
                .frame(height: 62)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                
                HStack {
                    Spacer()
                    
                    Text(title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
            }
            Rectangle().frame(height: 1)
                .foregroundStyle(.blue200)
            
            content
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
