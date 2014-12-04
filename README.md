# wp3-to-sab

## Summary

[Microsoft Photo Story 3](http://www.microsoft.com/en-us/download/details.aspx?id=11132) creates slideshows using digital photos.  [Ken Burns Effects](http://en.wikipedia.org/wiki/Ken_Burns_effect), audio, and text are added to produce a WMV that can be viewed on Windows and mobile devices.

[Vernacular Media Services](https://www.jaars.org/what/media) (VMS) has used this to create Bible stories in many languages and has templates in [wp3 file format](http://file.org/extension/wp3).

This format was considered binary until it was discovered that it is actually a [Cabinet file format](http://en.wikipedia.org/wiki/Cabinet_%28file_format%29), an archive file format for Windows.

This project takes a wp3 format file created by VMS for Bible stories and generates the files to be used in Scripture App Builder which support a Bible story format using [USFM](http://paratext.org/about/usfm).

## Picture Story Book File Format

#### What do picture story book files look like?

They start with an id of your choice:

```usfm
\id STO29
````
and a title:

````usfm
\toc2 The Story of the Unmerciful Servant
````

Each page begins with the \page marker:

````usfm
\page 1
````

followed by an image filename:

````usfm
\img obs-29-01.jpg
````

and then the text for that page, using USFM markers like \p for paragraphs:

````usfm
\p One day, Peter asked Jesus, “Master, how many times should I forgive my brother when he sins against me? Up to seven times?”
\p Jesus said, “Not seven times, but seventy times seven!”
\p By this, Jesus meant that we should always forgive. Then Jesus told this story.
````

Here's an example:

````usfm
\id STO
\toc2 The Story of the Unmerciful Servant

\page 1
\img obs-29-01.jpg
\p One day, Peter asked Jesus, “Master, how many times should I forgive my brother when he sins against me? Up to seven times?”
\p Jesus said, “Not seven times, but seventy times seven!”
\p By this, Jesus meant that we should always forgive. Then Jesus told this story.

\page 2
\img obs-29-02.jpg
\p Jesus said, “The kingdom of God is like a king who wanted to settle accounts with his servants. One of his servants owed a huge debt worth 200,000 years' wages.”

\page 3
\img obs-29-03.jpg
\p “Since the servant could not pay the debt, the king said, 'Sell this man and his family as slaves to make payment on his debt.'”

\page 4
\img obs-29-04.jpg
\p “The servant fell on his knees before the king and said, 'Please be patient with me, and I will pay the full amount that I owe you.' The king felt pity for the servant, so he canceled all of his debt and let him go.”
````
etc.

#### Where do the pictures go?

Add them in the Images > Illustrations page in Scripture App Builder.

You can use either PNG or JPG files. Try and make them as small as possible without compromising image quality. This will keep your app size small and reduce page load time.

#### What audio timing labels are used?

1a - 1st phrase on page 1
1b - 2nd phrase on page 1
1c - 3rd phrase on page 1

2a - 1st phrase on page 2
2b - 2nd phrase on page 2, etc.


#### Where can I get sample story book text and pictures?

Have a look at Open Bible Stories here: https://door43.org/en/obs


#### What about recording audio?

Use your favourite sound recording software, such as Audacity.
You'll need to decide how fast or slow you want the reader to read. In some contexts, it might be good for picture story books to be read fairly slowly.



