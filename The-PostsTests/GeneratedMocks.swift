// MARK: - Mocks generated from file: The-Posts/Application/ApplicationAssembly.swift at 2018-09-30 21:25:40 +0000

//
//  ApplicationAssembly.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Cuckoo
@testable import The_Posts

import UIKit

class MockApplicationAssembly: ApplicationAssembly, Cuckoo.ProtocolMock {
    typealias MocksType = ApplicationAssembly
    typealias Stubbing = __StubbingProxy_ApplicationAssembly
    typealias Verification = __VerificationProxy_ApplicationAssembly
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    
    // ["name": "applicationNavigator", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "ApplicationNavigator", "isReadOnly": true, "accessibility": ""]
     var applicationNavigator: ApplicationNavigator {
        get {
            
            return cuckoo_manager.getter("applicationNavigator", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    

    

    
    // ["name": "migrate", "returnSignature": "", "fullyQualifiedName": "migrate()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func migrate()  {
        
            return cuckoo_manager.call("migrate()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "configureRootScene", "returnSignature": "", "fullyQualifiedName": "configureRootScene()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func configureRootScene()  {
        
            return cuckoo_manager.call("configureRootScene()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_ApplicationAssembly: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var applicationNavigator: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockApplicationAssembly, ApplicationNavigator> {
	        return .init(manager: cuckoo_manager, name: "applicationNavigator")
	    }
	    
	    
	    func migrate() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockApplicationAssembly.self, method: "migrate()", parameterMatchers: matchers))
	    }
	    
	    func configureRootScene() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockApplicationAssembly.self, method: "configureRootScene()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_ApplicationAssembly: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var applicationNavigator: Cuckoo.VerifyReadOnlyProperty<ApplicationNavigator> {
	        return .init(manager: cuckoo_manager, name: "applicationNavigator", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func migrate() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("migrate()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func configureRootScene() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("configureRootScene()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ApplicationAssemblyStub: ApplicationAssembly {
    
     var applicationNavigator: ApplicationNavigator {
        get {
            return DefaultValueRegistry.defaultValue(for: (ApplicationNavigator).self)
        }
        
    }
    

    

    
     func migrate()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func configureRootScene()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: The-Posts/Domain/API/ApiClient.swift at 2018-09-30 21:25:40 +0000

//
//  ApiClient.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/26/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Cuckoo
@testable import The_Posts

import Foundation
import RxSwift

class MockApiClient: ApiClient, Cuckoo.ProtocolMock {
    typealias MocksType = ApiClient
    typealias Stubbing = __StubbingProxy_ApiClient
    typealias Verification = __VerificationProxy_ApiClient
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "sendRequest", "returnSignature": " -> Observable <Response>", "fullyQualifiedName": "sendRequest(router: TargetType) -> Observable <Response>", "parameterSignature": "router: TargetType", "parameterSignatureWithoutNames": "router: TargetType", "inputTypes": "TargetType", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "router", "call": "router: router", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("router"), name: "router", type: "TargetType", range: CountableRange(259..<277), nameRange: CountableRange(259..<265))], "returnType": "Observable <Response>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func sendRequest(router: TargetType)  -> Observable <Response> {
        
            return cuckoo_manager.call("sendRequest(router: TargetType) -> Observable <Response>",
                parameters: (router),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_ApiClient: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func sendRequest<M1: Cuckoo.Matchable>(router: M1) -> Cuckoo.ProtocolStubFunction<(TargetType), Observable <Response>> where M1.MatchedType == TargetType {
	        let matchers: [Cuckoo.ParameterMatcher<(TargetType)>] = [wrap(matchable: router) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockApiClient.self, method: "sendRequest(router: TargetType) -> Observable <Response>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_ApiClient: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func sendRequest<M1: Cuckoo.Matchable>(router: M1) -> Cuckoo.__DoNotUse<Observable <Response>> where M1.MatchedType == TargetType {
	        let matchers: [Cuckoo.ParameterMatcher<(TargetType)>] = [wrap(matchable: router) { $0 }]
	        return cuckoo_manager.verify("sendRequest(router: TargetType) -> Observable <Response>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ApiClientStub: ApiClient {
    

    

    
     func sendRequest(router: TargetType)  -> Observable <Response> {
        return DefaultValueRegistry.defaultValue(for: Observable <Response>.self)
    }
    
}

