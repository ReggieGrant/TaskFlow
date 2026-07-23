//
//  TaskFlowTests.swift
//  TaskFlowTests
//
//  Created by Reginald Grant on 7/22/26.
//

import XCTest
@testable import TaskFlow

final class TaskFlowTests: XCTestCase {
    
    var viewModel: TaskListViewModel!
    
    override func setUpWithError() throws {
        viewModel = TaskListViewModel()
    }
    
    
    
    
    // MARK: Class #2
    // UI Test
    func test_addTask_UI() {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        
        // Act
        app.textFields["New Task..."].typeText("Mlik")
        app.buttons["Add"].tap()
    }
    
    // TDD priority test
    func test_addTask_defaultPriorityIsMedium(){
        // Arrange
        
        // Act
        viewModel.addTask(title: "Task A")
        
        
        // Assert
        XCTAssertEqual(viewModel.tasks[0].priority, .medium)
    }
    
    // TDD High priority stroe test
    func test_assTask_withHighPriority_storesPriority() {
        // Arrange
        
        
        // Act
        viewModel.addTask(title: "Urgent", priority: .high)
        
        
        // Assert
        XCTAssertEqual(viewModel.tasks[0].priority, .high)
    }
    
    // TDD Test task with pirority returns only matching
    func test_task_forPriority_returnsOnlyMatchingTask() {
        // Arrange
        viewModel.addTask(title: "Low", priority: .low)
        viewModel.addTask(title: "High 1", priority: .high)
        viewModel.addTask(title: "High 2", priority: .high)
        
        
        // Act
        let highTasks = viewModel.tasks(for: .high)
        
        
        // Assert
        XCTAssertEqual(highTasks.count, 2)
        XCTAssertTrue(highTasks.allSatisfy {$0.priority == .high})
    }
    
    // TDD Test task sorted by priority high first
    func test_taskSortedByPriority_returnHighFirst() {
        // Arrange
        viewModel.addTask(title: "Low", priority: .low)
        viewModel.addTask(title: "Medium", priority: .medium)
        viewModel.addTask(title: "High", priority: .high)
        
        
        // Act
        let sorted = viewModel.taskSortedByPriority
        
        
        // Assert
        XCTAssertEqual(sorted[0].priority, .high)
        XCTAssertEqual(sorted[1].priority, .medium)
        XCTAssertEqual(sorted[2].priority, .low)
    }
    
    
}


