From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 17 Mar 2017 17:11:22 +0100
Subject: [PATCH v3 3/6] documentation: media: Add documentation for new
 RGB and YUV bus formats
In-Reply-To: <8963c4cc-daf2-1d4f-0c3e-3b963e118379@codeaurora.org>
References: <1488904944-14285-1-git-send-email-narmstrong@baylibre.com>
 <1488904944-14285-4-git-send-email-narmstrong@baylibre.com>
 <8963c4cc-daf2-1d4f-0c3e-3b963e118379@codeaurora.org>
Message-ID: <97b0c618-a3f4-11d7-d117-c83e8949633a@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/16/2017 06:01 PM, Archit Taneja wrote:
> 
> 
> On 3/7/2017 10:12 PM, Neil Armstrong wrote:
>> Add documentation for added Bus Formats to describe RGB and YUS formats used
> 
> s/YUS/YUV

Thanks again....

> 
>> as input to the Synopsys DesignWare HDMI TX Controller.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  Documentation/media/uapi/v4l/subdev-formats.rst | 4992 ++++++++++++++++++-----
>>  1 file changed, 3963 insertions(+), 1029 deletions(-)
> 
> Do we know if there is a better way to add more columns without
> adding so many lines?

It seems not, the reason is written in the commands.

> If not, one option could be to create a separate tables for
> 48 bit RGB formats, 48 bit YUV formats etc.

It would be simple indeed, any V4L guys for an advice here ?

Thanks,
Neil

> 
> <snip>
> 
> Thanks,
> Archit
> 
