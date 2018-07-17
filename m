From: jian.hu@amlogic.com (Jian Hu)
Date: Tue, 17 Jul 2018 20:20:48 +0800
Subject: [RESEND PATCH v2 2/2] clk: meson-g12a: Add EE Clock controller
 driver
In-Reply-To: <1531738834.12853.64.camel@baylibre.com>
References: <1531728707-192230-1-git-send-email-jian.hu@amlogic.com>
 <1531728707-192230-3-git-send-email-jian.hu@amlogic.com>
 <1531738834.12853.64.camel@baylibre.com>
Message-ID: <8db634aa-fc1a-1145-d761-89423aa839d8@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 2018/7/16 19:00, Jerome Brunet wrote:
> On Mon, 2018-07-16 at 16:11 +0800, Jian Hu wrote:
>> Add a Clock driver for the Everything-Else part
>> of the Amlogic Meson-G12A SoC.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> 
> Point raised about fdiv gates remains un-answered.
> Please address all the point raised before reposting your patches.
> 
> 
> 
> .
> 

So sorry, I have missed the question of fixed div gates.

You are right, g12a has gates in front of these fdivX clock, And they 
are controlled by bit 20 to 25 in HHI_FIX_PLL_CNTL1 register. The 
details are in the attachment which I have marked.

clock gate     control bit

fclk_div2      24
fclk_div3      20
fclk_div4      21
fclk_div5      22
fclk_div7      23
fclk_div2p5    25

Maybe it is not clear in your datasheet.

I will update the code for this.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: Mpll diagram .png
Type: image/png
Size: 201707 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180717/6ccb09dc/attachment.png>
