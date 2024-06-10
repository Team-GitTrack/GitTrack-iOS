import SwiftUI
import Charts

struct RepositoryView: View {
    @ObservedObject var viewModel = RepositoryViewModel()
    
    let name: String
    let description: String
    let orgName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            RepositoryInfoView(name: name, description: description)
            Text("Repository")
                .font(.body2SemiBold)
                .foregroundStyle(.blue800)
            Chart(viewModel.languages, id: \.name) { element in
                BarMark(
                    x: .value("languages size", element.count)
                )
                .foregroundStyle(by: .value("languages category", element.name))
                .opacity(0.8)
            }
            .chartXAxis(.hidden)
            .frame(height: 50)
            
            Chart(viewModel.contributors, id: \.hashValue) { element in
                BarMark(
                    x: .value("contributors", element.login),
                    y: .value("commit", element.contributions)
                )
                .foregroundStyle(.blue500)
                .opacity(0.8)
            }
            .frame(height: 200)
            .padding(16)
            .background(.white)
            .cornerRadius(16)

            Chart(viewModel.commits, id: \.hashValue) {
                LineMark(
                    x: .value("Mounth", Month(rawValue: $0.month)?.toString ?? ""),
                    y: .value("Commit", $0.commitCount)
                )
                .foregroundStyle(by: .value("User", $0.login))
            }
            .frame(height: 200)
            .padding(16)
            .background(.white)
            .cornerRadius(16)

            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .setCustomNavigationBarTitle("\(name)")
        .background(Color(.blue50).ignoresSafeArea())
        .onAppear {
            viewModel.getRepositoryLanguages(organization: orgName, repository: name)
            viewModel.getRepositoryContributors(organization: orgName, repository: name)
            viewModel.getRepositoryCommits(organization: orgName, repository: name)
        }
    }
}

enum Month: Int {
    case jan = 1
    case feb
    case mar
    case apr
    case may
    case jun
    case jul
    case aug
    case sep
    case oct
    case nov
    case dec

    var toString: String {
        switch self {
        case .jan: return "Jan"
        case .feb: return "Feb"
        case .mar: return "Mar"
        case .apr: return "Apr"
        case .may: return "May"
        case .jun: return "Jun"
        case .jul: return "Jul"
        case .aug: return "Aug"
        case .sep: return "Sep"
        case .oct: return "Oct"
        case .nov: return "Nov"
        case .dec: return "Dec"
        }
    }
}
