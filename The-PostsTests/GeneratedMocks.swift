// MARK: - Mocks generated from file: The-Posts/API/JustTestProtocol.swift at 2018-09-25 19:37:12 +0000

//
//  JustTestProtocol.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/25/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Cuckoo
@testable import The_Posts

import Foundation

class MockJustTestProtocol: JustTestProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = JustTestProtocol
    typealias Stubbing = __StubbingProxy_JustTestProtocol
    typealias Verification = __VerificationProxy_JustTestProtocol
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    
    // ["name": "someProperty", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "String", "isReadOnly": true, "accessibility": ""]
     var someProperty: String {
        get {
            
            return cuckoo_manager.getter("someProperty", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    

    

    
    // ["name": "doNothing", "returnSignature": "", "fullyQualifiedName": "doNothing()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func doNothing()  {
        
            return cuckoo_manager.call("doNothing()",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_JustTestProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var someProperty: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockJustTestProtocol, String> {
	        return .init(manager: cuckoo_manager, name: "someProperty")
	    }
	    
	    
	    func doNothing() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockJustTestProtocol.self, method: "doNothing()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_JustTestProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var someProperty: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "someProperty", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func doNothing() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("doNothing()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class JustTestProtocolStub: JustTestProtocol {
    
     var someProperty: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    

    

    
     func doNothing()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

