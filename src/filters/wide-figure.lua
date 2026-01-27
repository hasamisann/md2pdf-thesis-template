-- 画像に {.wide} クラスが付いていたら figure* 環境に変換するフィルター

function Figure(elem)
  -- Figure内の画像を探す
  local image = nil
  pandoc.walk_block(elem, {
    Image = function(img)
      if img.classes:includes('wide') then
        image = img
      end
    end
  })

  -- .wide クラス付きの画像が見つかった場合
  if image then
    -- 1. キャプションをLaTeX形式に変換
    -- elem.caption.long はブロックのリストなのでPandocドキュメントとしてラップして変換
    local caption_doc = pandoc.Pandoc(elem.caption.long)
    local caption_tex = pandoc.write(caption_doc, 'latex')
    
    -- 余計な改行を除去
    caption_tex = caption_tex:gsub("\n+$", "")

    -- 3. LaTeXの figure* 環境を構築
    -- [t] はページ上部配置。必要に応じて変更可。
    local raw_tex = string.format(
      "\\begin{figure*}[t]\n\\centering\n\\includegraphics[width=\\textwidth]{%s}\n\\caption{%s%s}\n\\end{figure*}",
      image.src, caption_tex, label_tex
    )

    -- 4. RawBlockとして返す（元のFigureを置換）
    return pandoc.RawBlock('latex', raw_tex)
  end
end