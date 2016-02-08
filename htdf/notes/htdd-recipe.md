#HOW TO DESIGN DATA (HTDD)

Data definitions are a driving element in the design recipes.

A data definition establishes the represent/interpret relationship between information and data:

- Information in the program's domain is represented by data in the program.
- Data in the program can be interpreted as information in the program's domain.

A data definition must describe how to form (or make) data that satisfies the data definition and also how to tell whether a data value satisfies the data definition. It must also describe how to represent information in the program's domain as data and interpret a data value as information.

So, for example, one data definition might say that numbers are used to represent the Speed of a ball. Another data definition might say that numbers are used to represent the Height of an airplane. So given a number like 6, we need a data definition to tell us how to interpret it: is it a Speed, or a Height or something else entirely. Without a data definition, the 6 could mean anything.

The first step of the recipe is to identify the inherent structure of the information.

Once that is done, a data definition consists of four or five elements:

1. A possible <b>structure definition</b> (not until compound data)
2. A <b>type comment</b> that defines a new type name and describes how to form data of that type.
3. An <b>interpretation</b> that describes the correspondence between information and data.
4. One or more <b>examples</b> of the data.
5. A <b>template</b> for a 1 argument function operating on data of this type.

#### What is the Inherent Structure of the Information?

One of the most important points in the course is that:

- the structure of the information in the program's domain determines the kind of data definition used,
- which in turn determines the structure of the templates and helps determine the function examples (check-expects),
- and therefore the structure of much of the final program design.

The remainder of this page lists in detail different kinds of data definition that are used to represent information with different structures. The page also shows in detail how to design a data definition of each kind. This summary table provides a quick reference to which kind of data definition to use for different information structures.

