import XCTest
@testable import TaskTesting

final class TaskTestingTests: XCTestCase {
    func testHighPriority() async {
        taskTest(priority: .high)
    }
    
    /// This test would fail on an iPhone 14 Simulator, but not when running it on the Mac.
    func testMediumPriority() async {
        taskTest(priority: .medium)
    }
    
    func testLowPriority() async {
        taskTest(priority: .low)
    }
    
    func testUserInitiatedPriority() async {
        taskTest(priority: .userInitiated)
    }
    
    func testUtilityPriority() async {
        taskTest(priority: .utility)
    }
    
    func testBackgroundPriority() async {
        taskTest(priority: .background)
    }
    
    func taskTest(priority: TaskPriority,
                  file: StaticString = #file,
                  line: UInt = #line) {
        let exp = expectation(description: "Task with priority \(priority) was not executed")
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.3) {
            Task.detached(priority: priority) {
                exp.fulfill()
            }
        }

        waitFor(exp: exp, file: file, line: line)
    }
    
    func waitFor(exp: XCTestExpectation,
                 timeout: TimeInterval = 2,
                 enforceOrder: Bool = false,
                 file: StaticString = #file,
                 line: UInt = #line) {
        let result = XCTWaiter.wait(for: [exp], timeout: timeout, enforceOrder: enforceOrder)
        switch result {
        case .timedOut:
            XCTFail(exp.expectationDescription, file: file, line: line)
        default:
            break
        }
    }
}
