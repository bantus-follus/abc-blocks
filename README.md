# `abc-blocks`

You are given a collection of blocks with two letters of the alphabet on each block. A complete alphabet is guaranteed among all sides of the blocks. You would like to check if a given word can be written with the provided set of blocks.

An example set of blocks:
```
 (F E)
 (A W)
 (Q V)
 (B M)
 (X H)
 (N P)
 (I Z)
 (G U)
 (S R)
 (K Y)
 (T L)
 (O C)
 (J D)
 (A N)
 (O B)
 (E R)
 (F S)
 (L Y)
 (P C)
 (Z M)
```

Your task for this challenge is to write a generator `abc-blocks`. It takes a cell of two arguments. The first argument is a `(list (pair @t @t))` which represents the input set of blocks. The second argument is a `@t` which represents the word that you'd like to check.

Your generator should first check if the input blocks cover all letters of the alphabet. If not, the generator should fail (possibly returning an error message). It should also check if the input word only has alphabetical characters (no spaces, numbers, or special characters). Otherwise it should fail. Then, it should check whether the word can be spelled with the blocks, either returning a `%.y` or `%.n`. It should not care about case, for the blocks or for the word.

Example usage:
```
> +abc-blocks [[['a', 'b'] ['c' 'd'] ['e' 'f'] ~] 'fad']
dojo: naked generator failure

> +abc-blocks [[['a', 'b'] ['c' 'd'] ['e' 'f'] ['g' 'h'] ['i' 'j'] ['k' 'l'] ['m' 'n'] ['o' 'p'] ['q' 'r'] ['s' 't'] ['u 'v'] ['w' 'x] ['y' z] ~] '12%-3']
dojo: naked generator failure

> +abc-blocks [[['a', 'B'] ['C' 'd'] ['e' 'F'] ['G' 'h'] ['i' 'J'] ['K' 'l'] ['m' 'N'] ['o' 'P'] ['Q' 'r'] ['s' 'T'] ['U 'v'] ['w' 'X'] ['y' Z'] ~] 'cat']
%.y

> +abc-blocks [[['a', 'B'] ['C' 'd'] ['e' 'F'] ['G' 'h'] ['i' 'J'] ['K' 'l'] ['m' 'N'] ['o' 'P'] ['Q' 'r'] ['s' 'T'] ['U 'v'] ['w' 'X'] ['y' Z'] ~] 'CAT']
%.y

> +abc-blocks [[['a', 'B'] ['C' 'd'] ['e' 'F'] ['G' 'h'] ['i' 'J'] ['K' 'l'] ['m' 'N'] ['o' 'P'] ['Q' 'r'] ['s' 'T'] ['U 'v'] ['w' 'X'] ['y' Z'] ~] 'BAT']
%.n
```

Two winners will be rewarded -- one for fastest solution, and one for best style (clear, elegant, well-commented, Hoonish). For style reference, you can see [previous winners](https://developers.urbit.org/blog/hsl-competition) and the [Hoon style guide](https://developers.urbit.org/reference/hoon/style).


For submission, fill out this [google form](https://forms.gle/8z7eB7sgoY47PGdj6) with your information. See instructions to create the repository below. Remember to make your repo private and add tamlut-modnys as a collaborator.

This challenge opens at noon EST on June 10, and will close at ~11:55 AM EST on June 17. Good luck!


## Using this Repository

**Please _do not fork this repository directly on GitHub._**  Instead, please use GitHub's "template" function following [the instructions below](#creating-a-repository) to copy this repository and customize it for your project.

If you are working with a fakeship, this is one way to set things up for rapid development:

1. Start a fakeship and `|mount %base`.
2. Clone this repo into the same directory as the fakeship, then copy the contents of `src/` into `zod/base/`.
3. Develop either in `zod/base/` or in this repo folder directly.  It's probably a bit easier to develop in the fakeship and copy back here frequently.

## Testing

This repo provides test cases you can use to verify that your code submission works correctly.

To run the tests, make sure you have mounted and committed the files into the `base` folder of your fake ship. Then from dojo run
```
-test %/tests/abc-blocks/hoon
```
This will run 20 tests, each of which will pass or fail. For debugging help you can inspect the test code to see which ones passed and failed.

To avoid issues, make sure your generator is written in the provided file at `/gen/abc-blocks.hoon`

For more info on testing in Hoon, see this link: https://developers.urbit.org/guides/additional/unit-tests

## Creating a Repository

1.  Log in to GitHub.
    (If you do not have an account, you can quickly create one for free.)
    You must be logged in for the remaining steps to work.

2.  On this page, click on the green "Use this template" button (top right)

3.  Select the owner for your new repository.
    (This will probably be you, but may instead be an organization you belong to.)

4.  Choose a name for your copy of the archetype repository.
    We recommend you call it `hsl-abc-blocks` (no 'template').

5.  Make sure the repository is **private**, leave "Include all branches" unchecked, and click on "Create repository from template". You will be redirected to your new copy of the template respository.

6.  Share the repo with tamlut-modnys on Github as a collaborator.

After this is complete, you can use this repo to handle your competition development and submission. Please note that by submitting a solution, you allow it to be made public under the GNU license.
