import SwiftUI

struct IssueTypeButtonsView: View {
    @Binding var selectedItem: IssueType
    let action: () -> Void
    var body: some View {
        HStack (spacing: 16){
            IssueTypeButton(
                action: {
                    selectedItem = .CREATED
                    action()
                },
                buttonType: .CREATED,
                selecedType: $selectedItem
            )
            
            IssueTypeButton(
                action: {
                    selectedItem = .ASSIGNED
                    action()
                },
                buttonType: .ASSIGNED,
                selecedType: $selectedItem
            )
            
            IssueTypeButton(
                action: { 
                    selectedItem = .MENTIONED
                    action()
                },
                buttonType: .MENTIONED,
                selecedType: $selectedItem
            )
            
            IssueTypeButton(
                action: {
                    selectedItem = .SUBSCRIBED
                    action()
                },
                buttonType: .SUBSCRIBED,
                selecedType: $selectedItem
            )
        }
    }
}
