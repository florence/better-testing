#lang scribble/doc
@(require "base.rkt")

@title[#:tag "basics"]{Basic Usage of Cover}

The cover library adds the command @exec{raco cover} command to run test coverage. For
every file it is given it will execute that file and its @racket[test] submodule (it if
exists). It will then dump the coverage information into a directory, by default
@filepath{coverage}. By default the coverage information will be generated as html.

The @exec{raco cover} command accepts the following flags:

@itemize[@item{@Flag{f} or @DFlag{format}
               --- Sets the coverage output type. This flag defaults to html.
               valid formats are:
               @itemize[@item{html: Generates one html file per tested file.}]
               Other packages may install new formats. See @secref{plugin}}
         @item{@Flag{b} or @DFlag{exclude-pkg-basics}
               --- Equivalent to @exec{-n tests -n info.rkt -n scribblings}}
         @item{@Flag{d} or @DFlag{directory}
               --- Specifies the directory to output coverage information to.
               defaults to @filepath{coverage}.}
         @item{@Flag{n} or @DFlag{--no-output-for-path}
               --- excludes any directories by name from the coverage report.
               Files in these directories are still run, they are just excluded from the
               outputted coverage. This flag may appear any number of times.}
         @item{@Flag{i} or @DFlag{include-extensions}
               --- include the given regular expression in the list of file patterns
                   used when expanding directories, searching for files to cover.}
         @item{@Flag{v} or @DFlag{verbose}
               --- enable verbose logging}
         @item{@Flag{s} or @DFlag{submod}
               --- run the given submodule instead of the test submodule.}
         @item{@Flag{e} or @DFlag{include-extensions}
               --- Concider the given submodules irrelevant when generating coverage. If not
               provided defaults to all submodules. Can be included more than once.}
         @item{@Flag{c} or @DFlag{collection}
               --- Interprets the arguments as collections whose content should be
               tested (in the same way as directory content).}
         @item{@Flag{p} or @DFlag{package}
               --- Interprets the arguments as packages whose contents should be tested
               (in the same way as directory content). All package scopes are searched
               for the first, most specific
               @tech[#:doc '(lib "pkg/scribblings/pkg.scrbl")]{package scope}.}]


In addition @exec{raco cover} supports the @racket[_test-omit-paths] and
@racket[_test-command-line-arguments] @filepath{info.rkt} options like @exec{raco test}.  In
addition cover supports @racket[_cover-omit-paths], which is identical to @racket[_test-omit-paths],
but is specific to cover.

@section{Gotchas}

Internally cover uses the logger to transmit coverage. This means that dynamically loading a module
with @racket[current-logger] set to a logger who's (transitive) parent is not the global logger may
cause cover to hang.
