========================================================
AV editing using FFmpeg, sox, Blender, Audacity
========================================================

.. .. contents::

.. .. section-numbering::

.. .. raw:: pdf

..   PageBreak oneColumn

.. .. footer::

..	Page: ###Page###/###Total###


Brief introduction to digital media
-----------------------------------

Digital Audio/Video
~~~~~~~~~~~~~~~~~~~

Compared to the conventional tapes, they are convenient to store, share and
highly cost effective. The A/V data is stored in files with certain extensions. 
Example, mov, mp3, mpg, mp4, mkv etc.

Media compressions
~~~~~~~~~~~~~~~~~~

The raw media files are often considered good for video editing as they retain 
unaltered data from camera/microphone. However, the raw size could be in order 
of hundreds of GB for just an hour of 1080i video. This isn’t suitable for 
transmission and storage. Hence, a compression on original data is applied 
according to the production house requirements. Most studio however prefer 
lossless compression. 

  	
Containers or Formats or Extensions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The formats are often the extensions of the file, technically may be called 
as containers. We will use the term container henceforth. 
A container is a software wrapper which carries encoded A/V and its metadata. 

Codecs
~~~~~~

(Coder-Decoder) The compression of the data is crucial. There are several 
algorithms implemented to optimize the encoding and decoding process. However,
there are known tradeoffs, such as, a highly compressed file may require 
higher CPU while decoding, and so on. The selection of codecs is a thoughtful
process based on factors such as end user, bandwidth, quality, cost etc. 

Few popular codecs are h264, vp8, lame, DivX etc. 
Find more at this `wiki page. <https://en.wikipedia.org/wiki/List_of_open-source_codecs>`_

.. figure:: ../data/containers.png
   :scale: 80%	
   :align: center

   MP4 container holding audio, video, and metadata `image source <http://blog.gramant.com/wp-content/uploads/2013/10/container.png>`_

FFmpeg
------

A simple yet powerful cross platform, cross architecture, command line tool to record, convert and 
stream audio and video data. 
There are several projects which use **FFmpeg** in backend, an extensive list 
can be found `here.  <https://trac.ffmpeg.org/wiki/Projects>`_

.. figure:: ../data/ffmpeg-bd.png
   :scale: 80%	
   :align: center

   FFmpeg block diagram 

FFmpeg quick help
~~~~~~~~~~~~~~~~~

Frequently used command line arguments
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* ``-i`` ``input file``
* ``-f`` ``force format``
* ``-r`` ``frame per second``
* ``-vcodec or -c:v`` ``video codec``
* ``-acodec or -c:a`` ``audio codec``
* ``-vb`` ``video bitrate`` 
* ``-ab`` ``audio bitrate``
* ``-vf`` ``video filter``
* ``-af`` ``audio filter``
* ``-q:v`` ``video quality`` (1 highest, 31 poorest) more details on quality `here. <http://slhck.info/video-encoding.html>`_


Size reduction by either reducing the video resolution or by lowering bit rate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To check the bit rate, codec, frame rate info ::

	ffmpeg -i sample-video.mp4

Size reduction by restricting bandwidth ::

	ffmpeg -i sample-video.mp4 -vb 500k -c:a copy reduced_vb.mp4 

Size reduction by scaling down ::

	ffmpeg -i sample-video.mp4 -c:a copy -vf scale=640:360 reduced_scale.mp4

Joining media files
~~~~~~~~~~~~~~~~~~~

It is easier to concatenate less compressed files, H.264 and modern codecs 
are highly compact and complicated, however, it is possible to concantinate
them using advance options in ``FFmpeg``. 
We will use the more widely used approach where we will convert 
complex codecs to a simpler one's.

Let us convert ``sample-video.mp4`` to ``sample-video.mpg`` ::

	ffmpeg -i sample-video.mp4 -q:v 2 sample-video.mpg

Please note, we haven't mentioned target codec, ffmpeg choose the best codec
for the ``mpg`` container. Once converted we can verify ::

	ffmpeg -i sample-video.mpg

By the way, the ``-q:v 2`` factor is chosen for best results. It can also be done
with ``-vb`` flag. Also, note the size and bandwidth for the ``mpg`` file due 
to its poor compression. 

Let us join videos ::

	ffmpeg -i "concat:sample-video.mpg|sample-video.mpg" -c copy output.mpg

More on concatenation at ``https://trac.ffmpeg.org/wiki/Concatenate``

Muxing/Demuxing (splitting and joining)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



Suggested readings and credits
------------------------------

#. http://docutils.sourceforge.net/docs/user/rst/quickref.html

#. http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html

#. http://sphinx-doc.org/sphinx-rst2pdf.pdf

#. http://sphinx-doc.org/
