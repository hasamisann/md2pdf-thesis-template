# Markdown to PDF Thesis Template
Markdownで執筆し、GitHub Actionsを使って自動的にPDF論文を生成するためのテンプレートです。 `src/thesis.md` を編集してGitHubにプッシュするだけで、フォーマットされたPDFが自動生成されます。

## 使い方

### 1. 準備
このリポジトリをテンプレートとして使用してください。

### 2. 執筆
`src`ディレクトリ内のファイルを編集して論文を作成します。
- 本文: `src/thesis.md`
- 表紙情報: `src/cover.tex`
- 参考文献: `src/references.bib`
  - BibTeX形式で文献を追加し、本文中で `[@key]` のように引用します。
- 画像: `src/images/`
  - Markdownから `![キャプション \label{fig:image}](images/filename.png)` で参照します。

### PDF化
変更を`main`ブランチにプッシュすると、GitHub Actionsが自動的に走り、ビルドが成功するとルートディレクトリにthesis.pdfとしてコミットされます。
