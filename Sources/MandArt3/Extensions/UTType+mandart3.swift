import UniformTypeIdentifiers

/**
 Extend UTType to include org.bhj.mandart3 (.mandart3) files.
 */
@available(macOS 11.0, *)
extension UTType {
  static let mandart3DocType = UTType(importedAs: "org.bhj.mandart3")
}
