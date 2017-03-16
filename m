From: architt@codeaurora.org (Archit Taneja)
Date: Thu, 16 Mar 2017 22:31:42 +0530
Subject: [PATCH v3 3/6] documentation: media: Add documentation for new
 RGB and YUV bus formats
In-Reply-To: <1488904944-14285-4-git-send-email-narmstrong@baylibre.com>
References: <1488904944-14285-1-git-send-email-narmstrong@baylibre.com>
 <1488904944-14285-4-git-send-email-narmstrong@baylibre.com>
Message-ID: <8963c4cc-daf2-1d4f-0c3e-3b963e118379@codeaurora.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 3/7/2017 10:12 PM, Neil Armstrong wrote:
> Add documentation for added Bus Formats to describe RGB and YUS formats used

s/YUS/YUV

> as input to the Synopsys DesignWare HDMI TX Controller.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/media/uapi/v4l/subdev-formats.rst | 4992 ++++++++++++++++++-----
>  1 file changed, 3963 insertions(+), 1029 deletions(-)

Do we know if there is a better way to add more columns without
adding so many lines?

If not, one option could be to create a separate tables for
48 bit RGB formats, 48 bit YUV formats etc.

<snip>

Thanks,
Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
