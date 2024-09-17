/**
 * @name Summary Statistics
 * @description A table of summary statistics about a database.
 * @kind table
 * @id rust/summary/summary-statistics
 * @tags summary
 */

import rust
import Stats

from string key, string value
where
  key = "Extracted files" and value = count(File f | exists(f.getRelativePath())).toString()
  or
  key = "Extracted elements" and value = count(Element e | not e instanceof Unextracted).toString()
  or
  key = "Unextracted elements" and value = count(Unextracted e).toString()
  or
  key = "Lines of code" and value = getLinesOfCode().toString()
  or
  key = "Lines of user code" and value = getLinesOfUserCode().toString()
select key, value
