enum IssueType {
    case CREATED, ASSIGNED, MENTIONED, SUBSCRIBED
    
    var name: String {
        switch self {
        case .CREATED: return "생성"
        case .ASSIGNED: return "할당"
        case .MENTIONED: return "언급"
        case .SUBSCRIBED: return "요청"
        }
    }
    
    var filter: String {
        switch self {
        case .CREATED: return "created"
        case .ASSIGNED: return "assigned"
        case .MENTIONED: return "mentioned"
        case .SUBSCRIBED: return "subscribed"
        }
    }
}
