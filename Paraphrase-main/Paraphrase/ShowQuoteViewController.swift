//
//  ShowQuoteViewController.swift
//  Paraphrase
//
//

import UIKit

class ShowQuoteViewController: UIViewController {
    @IBOutlet var quoteLabel: UILabel!

    var quote : Quote?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let quote = quote else {
            navigationController?.popToRootViewController(animated: true)
            return
        }

        title = quote.author
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareQuote))

        // format the text and author of this quote
        var textAttributes = [NSAttributedStringKey: Any]()
        var authorAttributes = [NSAttributedStringKey: Any]()

        if let quoteFont = UIFont(name: "Georgia", size: 24) {
            let fontMetrics = UIFontMetrics(forTextStyle: .headline)
            textAttributes[.font] = fontMetrics.scaledFont(for: quoteFont)
        }

        if let authorFont = UIFont(name: "Georgia-Italic", size: 16) {
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            authorAttributes[.font] = fontMetrics.scaledFont(for: authorFont)
        }

        let finishedQuote = NSMutableAttributedString(string: quote.text, attributes: textAttributes)
        let authorString = NSAttributedString(string: "\n\n\(quote.author)", attributes: authorAttributes)
        finishedQuote.append(authorString)

        quoteLabel.attributedText = finishedQuote
    }

    @objc func shareQuote() {
        guard let quote = quote else {
            return
        }

        // format the quote neatly and share it
        let fullText = "\"\(quote.text)\"\n   — \(quote.author)"
        let activity = UIActivityViewController(activityItems: [fullText], applicationActivities: nil)
        present(activity, animated: true)

        SwiftyBeaver.info("Sharing quote \(fullText)")
    }
}
