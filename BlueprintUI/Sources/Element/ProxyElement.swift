import UIKit

/// Custom elements commonly use another element to actually display content. For example, a profile element might
/// display an image and a few labels inside a `Column` element. The ProxyElement protocol is provided to make that
/// task easier.
///
/// Conforming types only need to implement `elementRepresentation` in order to generate an element that will be
/// displayed.
public protocol ProxyElement: Element {

    /// Returns an element that represents the entire content of this element.
    var elementRepresentation: Element { get }
}

extension ProxyElement {

    public var content: ElementContent {
        return ElementContent(child: elementRepresentation)
    }

    public func backingViewDescription(bounds: CGRect, subtreeExtent: CGRect?) -> ViewDescription? {
        return nil
    }

}

public protocol ContextElement: Element {
    func elementRepresentation(in environment: Environment) -> Element
}

extension ContextElement {
    public var content: ElementContent {
        return ElementContent(builder: self.elementRepresentation(in:))
    }

    public func backingViewDescription(bounds: CGRect, subtreeExtent: CGRect?) -> ViewDescription? {
        return nil
    }
}

protocol ChildBuilder {
    func build(in environment: Environment) -> Element
}

struct ChildBuilderWrapper: ChildBuilder {
    var builder: (Environment) -> Element

    func build(in environment: Environment) -> Element {
        return builder(environment)
    }
}

