From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Fri, 31 Mar 2017 15:14:35 +0200
Subject: [PATCH v5 3/6] documentation: media: Add documentation for new
 RGB and YUV bus formats
In-Reply-To: <1490864675-17336-4-git-send-email-narmstrong@baylibre.com>
References: <1490864675-17336-1-git-send-email-narmstrong@baylibre.com>
 <1490864675-17336-4-git-send-email-narmstrong@baylibre.com>
Message-ID: <75ede5b8-ad35-c23f-2f02-c206df379357@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 30/03/17 11:04, Neil Armstrong wrote:
> Add documentation for added Bus Formats to describe RGB and YUV formats used
> as input to the Synopsys DesignWare HDMI TX Controller.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/media/uapi/v4l/subdev-formats.rst | 871 +++++++++++++++++++++++-
>  1 file changed, 857 insertions(+), 14 deletions(-)

This looks good, but the "Packed YUV Formats" documentation should be updated.

Currently this says:

-  The number of bus samples per pixel. Pixels that are wider than the
   bus width must be transferred in multiple samples. Common values are
   1, 1.5 (encoded as 1_5) and 2.

I propose this change:

-  The number of bus samples per pixel. Pixels that are wider than the
   bus width must be transferred in multiple samples. Common values are
   0.5 (encoded as 0_5; in this case two pixels are transferred per bus
   sample), 1, 1.5 (encoded as 1_5) and 2.

With that additional change you can add my:

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

	Hans
