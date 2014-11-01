#!/bin/bash

OUTPUT="index.html" 

TITLE=get-iplayer

cat > $OUTPUT <<EOFheader
<!DOCTYPE html>
<html>

  <head>
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="description" content="packages.hedgerows.org.uk: $TITLE">

    <link rel="stylesheet" type="text/css" media="screen" href="/stylesheets/stylesheet.css">

    <title>packages.hedgerows.org.uk: $TITLE</title>
  </head>

  <body>

    <!-- HEADER -->
    <div id="header_wrap" class="outer">
        <header class="inner">
          <a id="forkme_banner" href="https://github.com/jon-hedgerows">View on GitHub</a>

          <h1 id="project_title">packages.hedgerows.org.uk</h1>
          <h2 id="project_tagline"></h2>

        </header>
    </div>

    <!-- MAIN CONTENT -->
    <div id="main_content_wrap" class="outer">
      <section id="main_content" class="inner">
        <h3>$TITLE</h3>

EOFheader
echo "<ul>" >> $OUTPUT
# ignore .git .* index.html mini-dinstall and buildindex*.sh
for filepath in $(ls -a | grep -v .git | grep -v "^.$" | grep -v "^index.html" | grep -v "^mini-dinstall" | grep -v "^buildindex.*\.sh"); do
  path=`basename "$filepath"`
  echo "  <li><a href=\"$path\">$path</a></li>" >> $OUTPUT
done
echo "</ul>" >> $OUTPUT
cat >> $OUTPUT <<"EOFfooter"
    </div>

    <!-- FOOTER  -->
    <div id="footer_wrap" class="outer">
      <footer class="inner">
        <p>Published with <a href="http://pages.github.com">GitHub Pages</a></p>
      </footer>
    </div>
  </body>
</html>
EOFfooter

