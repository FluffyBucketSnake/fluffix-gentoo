# Planning document for Gentoo Fluffix

This document is the central documentation file of the project . The main goal of this document is to lay out the foudations of this project, such as guiding values, principles, rules and steps.

## Values

Here is laid out the guiding values of this project, in descencending order of priority:

1. Minimalist - minimal number of installed applications;
2. Customizable - easy replacement of software and configuration.
3. Fast - small amount of latency between user input and system output;
4. Transparent - easy to debug any system issue;
5. Lightweight - minimal consumption of computational resources.
6. Stable - this is meant to be used as a daily driver, so reducing bugs and errors is important.

## Principles

1. Avoid do-it-all apps - prefer specialized solutions;
2. DRY - avoid repetion of code/work through apps/scripts;
3. YAGNI - only install that which is necessary;
4. SRP - components should be responsible for one thing;
5. Packaging - group similar components together in packages;
6. No ambiguity - document every choice;
7. Reactive - everything can change, including this documents;
8. Avoid unstable software - prefer stable alternatives.

## Rules

1. Each installed package should have a reason listed along explaining its utility;
2. Each package should have a URL, with the protocol representing the installation method, and the path holding a value pointing towards the package(e.g. ebuild atom);
3. Any unstable package needs to have an explanation along;
4. No package group shall use a package not included with itself or a higher package group.

## Steps

- Establish requirements;
- Define package groups;
- Determine installation steps;
- Update configuration files.

