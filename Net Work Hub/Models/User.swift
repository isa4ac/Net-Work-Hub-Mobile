//
//  User.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import Foundation

class User: Codable, ObservableObject, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "userData_WordPress_UserId_FK"
        case role = "userData_Define_Role_Id_FK"
        case timezone = "userData_Timezone"
        case email = "userData_Primary_Email"
        case firstName = "userData_Name_First"
        case lastName = "userData_Name_Last"
        case businessName = "userData_Name_Business"
        case bio = "userData_Profile_Description"
    }
    
    @Published var id: String
    @Published var role: String?
    @Published var timezone: String?
    @Published var email: String?
    @Published var firstName: String?
    @Published var lastName: String?
    @Published var businessName: String?
    @Published var bio: String?
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    required init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
        id = try contianer.decode(String.self, forKey: .id)
        role = try contianer.decode(String.self, forKey: .role)
        timezone = try contianer.decode(String.self, forKey: .timezone)
        email = try contianer.decode(String.self, forKey: .email)
        firstName = try contianer.decode(String.self, forKey: .firstName)
        lastName = try contianer.decode(String.self, forKey: .lastName)
        businessName = try contianer.decode(String.self, forKey: .businessName)
        bio = try contianer.decode(String.self, forKey: .bio)
    }
    
    init() {
        self.id = String()
        self.role = String()
        self.timezone = String()
        self.email = String()
        self.firstName = String()
        self.lastName = String()
        self.businessName = String()
        self.bio = String()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(role, forKey: .role)
        try container.encode(timezone, forKey: .timezone)
        try container.encode(email, forKey: .email)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(businessName, forKey: .businessName)
        try container.encode(bio, forKey: .bio)
    }
    
    public func dateToString(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public func stringToDate(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return dateFormatter.date(from: string) ?? Date()
    }
}
