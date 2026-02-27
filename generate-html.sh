#!/bin/bash
# Generate HTML from markdown research files
# This script converts markdown research to HTML for the site

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESEARCH_DIR="$SCRIPT_DIR/research"

echo "Generating HTML from markdown research files..."

# Check if pandoc is available
if command -v pandoc >/dev/null 2>&1; then
    echo "Using pandoc for conversion..."
    
    for md_file in "$RESEARCH_DIR"/*.md; do
        if [ -f "$md_file" ]; then
            filename=$(basename "$md_file" .md)
            echo "Converting $filename.md to HTML..."
            
            # Create HTML with basic styling
            cat > "$RESEARCH_DIR/$filename.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$filename - OpenClaw Research</title>
    <style>
        :root {
            --bg-color: #0d1117;
            --text-color: #c9d1d9;
            --link-color: #58a6ff;
            --border-color: #30363d;
            --header-bg: #161b22;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem;
        }
        a { color: var(--link-color); }
        h1, h2, h3 { color: #f0f6fc; }
        h1 { border-bottom: 1px solid var(--border-color); padding-bottom: 0.5rem; }
        h2 { border-bottom: 1px solid var(--border-color); padding-bottom: 0.3rem; margin-top: 2rem; }
        code {
            background: rgba(110, 118, 129, 0.4);
            padding: 0.2em 0.4em;
            border-radius: 3px;
            font-family: 'SFMono-Regular', Consolas, monospace;
        }
        pre {
            background: var(--header-bg);
            padding: 1rem;
            border-radius: 6px;
            overflow-x: auto;
        }
        pre code { background: none; padding: 0; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
        }
        th, td {
            border: 1px solid var(--border-color);
            padding: 0.5rem;
            text-align: left;
        }
        th { background: var(--header-bg); }
        blockquote {
            border-left: 3px solid var(--border-color);
            margin: 1rem 0;
            padding-left: 1rem;
            color: #8b949e;
        }
        .nav {
            margin: 2rem 0;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border-color);
        }
        .nav a {
            margin-right: 1rem;
        }
    </style>
</head>
<body>
    <div class="nav">
        <a href="../index.html">← Home</a>
        <a href="../index.html#research-documents">All Research</a>
    </div>
EOF
            
            # Convert markdown to HTML and append
            pandoc "$md_file" -t html --wrap=none >> "$RESEARCH_DIR/$filename.html"
            
            # Close HTML
            echo "</body></html>" >> "$RESEARCH_DIR/$filename.html"
            
            echo "  ✓ Generated $filename.html"
        fi
    done
else
    echo "pandoc not available. Using markdown files directly."
    echo "Install pandoc for better HTML generation: https://pandoc.org/installing.html"
fi

echo ""
echo "Done! Files generated in $RESEARCH_DIR/"
