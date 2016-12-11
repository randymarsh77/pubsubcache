import Foundation
import Scope

public protocol PubSubCache
{
	func set(value: Data, forKey: String) -> Void
	func set(keysAndValues: [String : Data]) -> Void
	func get(key: String) -> Data?
	func subscribe(keys: Array<String>, onChange: ([String : Data]) -> ()) -> Scope
	func subscribe(pattern: String, onChange: ([String : Data]) -> ()) -> Scope
}
