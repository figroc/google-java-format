# google-java-format

`google-java-format` is a program that reformats Java source code to comply with
[Google Java Style][].

[Google Java Style]: https://google.github.io/styleguide/javaguide.html

## Using the formatter

### from the command-line

[Download the formatter](https://github.com/figroc/google-java-format/releases)
and run it with:

```
java -jar /path/to/google-java-format-1.15.0-all.jar <options> [files...]
```

The formatter can act on whole files, on limited lines (`--lines`), on specific
offsets (`--offset`), passing through to standard-out (default) or altered
in-place (`--replace`).

To reformat changed lines in a specific patch, use
[`google-java-format-diff.py`](https://github.com/figroc/google-java-format/blob/master/scripts/google-java-format-diff.py).

***Note:*** *There is no configurability as to the formatter's algorithm for
formatting. This is a deliberate design decision to unify our code formatting on
a single format.*

### Third-party integrations

*   Gradle plugins
    *   [spotless](https://github.com/diffplug/spotless/tree/main/plugin-gradle#google-java-format)
    *   [sherter/google-java-format-gradle-plugin](https://github.com/sherter/google-java-format-gradle-plugin)
*   Apache Maven plugins
    *   [spotless](https://github.com/diffplug/spotless/tree/main/plugin-maven#google-java-format)
    *   [spotify/fmt-maven-plugin](https://github.com/spotify/fmt-maven-plugin)
    *   [talios/googleformatter-maven-plugin](https://github.com/talios/googleformatter-maven-plugin)
    *   [Cosium/maven-git-code-format](https://github.com/Cosium/maven-git-code-format):
        A maven plugin that automatically deploys google-java-format as a
        pre-commit git hook.
*   SBT plugins
    *   [sbt/sbt-java-formatter](https://github.com/sbt/sbt-java-formatter)
*   [maltzj/google-style-precommit-hook](https://github.com/maltzj/google-style-precommit-hook):
    A pre-commit (pre-commit.com) hook that will automatically run GJF whenever
    you commit code to your repository
*   [Github Actions](https://github.com/features/actions)
    *   [googlejavaformat-action](https://github.com/axel-op/googlejavaformat-action):
        Automatically format your Java files when you push on github

### as a library

The formatter can be used in software which generates java to output more
legible java code. Just include the library in your maven/gradle/etc.
configuration.

`google-java-format` uses internal javac APIs for parsing Java source. The
following JVM flags are required when running on JDK 16 and newer, due to
[JEP 396: Strongly Encapsulate JDK Internals by Default](https://openjdk.java.net/jeps/396):

```
--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED
--add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED
--add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED
--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED
--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED
```

#### Maven

```xml
<dependency>
  <groupId>io.opil</groupId>
  <artifactId>google-java-format</artifactId>
  <version>1.15.0</version>
</dependency>
```

#### Gradle

```groovy
dependencies {
  implementation 'io.opil:google-java-format:1.15.0'
}
```

You can then use the formatter through the `formatSource` methods. E.g.

```java
String formattedSource = new Formatter().formatSource(sourceString);
```

or

```java
CharSource source = ...
CharSink output = ...
new Formatter().formatSource(source, output);
```

Your starting point should be the instance methods of
`com.google.googlejavaformat.java.Formatter`.

## Building from source

```
gradle build
```

## License

```text
Copyright 2015 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License. You may obtain a copy of
the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
License for the specific language governing permissions and limitations under
the License.
```
