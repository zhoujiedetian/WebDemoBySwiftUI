//
//  TestView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                startNetWork()
            }
    }
    
    func startNetWork() {
       _ = WBNetworkManager.shared.requestGet(path: "PostListData_recommend_1.json", parameters: nil) { result in
            switch result {
            case .success(let data):
                let parseResult: Result<PostList, Error> = self.parseData(data)
                print(parseResult)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func parseData<T: Decodable>(_ data: Data) -> Result<T, Error> {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            let error = NSError(domain: "NetworkAPIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Can not parse data"])
            return .failure(error)
        }
        return .success(decodedData)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
