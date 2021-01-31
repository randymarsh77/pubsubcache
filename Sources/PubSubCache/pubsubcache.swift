import Foundation
import Scope

public protocol PubSubCache
{
	func set(_ keysAndValues: [String : Data?]) throws -> Void
	func get(_ keys: Array<String>) throws -> [String : Data?]
	func subscribe(keys: Array<KeyMatch>, onChange: @escaping ([String : Data?]) -> ()) throws -> Scope
}

public enum KeyMatch
{
	case Exact(String)
	case StartsWith(String)
	case EndsWith(String)
	case Contains(String)
	case RegEx(String)
}

public extension KeyMatch
{
	func matches(_ key: String) -> Bool {
		switch self {
		case .Exact(let pattern):
			return pattern == key
		case .StartsWith(let pattern):
			return key.hasPrefix(pattern)
		case .EndsWith(let pattern):
			return key.hasSuffix(pattern)
		case .Contains(let pattern):
			return key.contains(pattern)
		case .RegEx(let pattern):
			let regex = try! NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
			let matchRange = regex.rangeOfFirstMatch(in: key, options: [], range: NSMakeRange(0, key.count))
			return matchRange.location != NSNotFound
		}
	}
}
