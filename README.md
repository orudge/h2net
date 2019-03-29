# H2 .NET NuGet package
This repository contains the build scripts necessary to generate the H2 .NET NuGet package.
# About
H2 (http://www.h2database.com/) is an open source SQL database written in Java. Although it is technically possible to access an H2 database via ADO.NET using a PostgreSQL connection, this has limitations and can be difficult to get working reliably. By using IKVM.NET (https://www.ikvm.net/), the Java bytecode implementing the H2 database can be executed under the .NET runtime, exposing the Java class structure for H2 to .NET.
# Licence
H2 is dual-licensed under the Mozilla Public License 2.0 and the Eclipse Public License 1.0. See http://www.h2database.com/html/license.html for details.

IKVM.NET is licensed under the zlib License, with portions covered by the GNU Classpath License.
