From: sashal@kernel.org (Sasha Levin)
Date: Thu, 15 Nov 2018 12:33:18 -0500
Subject: [PATCH v2] clk: meson-gxbb: set fclk_div3 as CLK_IS_CRITICAL
In-Reply-To: <5BEAFEA5.6060902@baylibre.com>
References: <20181105230820.3562-1-jbrunet@baylibre.com>
 <5BEAFE05.9070905@baylibre.com> <5BEAFEA5.6060902@baylibre.com>
Message-ID: <20181115173318.GG95254@sasha-vm>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Nov 13, 2018 at 05:41:09PM +0100, Neil Armstrong wrote:
>Le 13/11/2018 17:38, Neil Armstrong a ?crit :
>> Hi Stable team,
>>
>> Le 06/11/2018 00:08, Jerome Brunet a ?crit :
>>> From: Christian Hewitt <christianshewitt@gmail.com>
>>>
>>> On the Khadas VIM2 (GXM) and LePotato (GXL) board there are problems
>>> with reboot; e.g. a ~60 second delay between issuing reboot and the
>>> board power cycling (and in some OS configurations reboot will fail
>>> and require manual power cycling).
>>>
>>> Similar to 'commit c987ac6f1f088663b6dad39281071aeb31d450a8 ("clk:
>>> meson-gxbb: set fclk_div2 as CLK_IS_CRITICAL")' the SCPI Cortex-M4
>>> Co-Processor seems to depend on FCLK_DIV3 being operational.
>>>
>>> Until commit 05f814402d6174369b3b29832cbb5eb5ed287059 ("clk:
>>> meson: add fdiv clock gates"), this clock was modeled and left on by
>>> the bootloader.
>>>
>>> We don't have precise documentation about the SCPI Co-Processor and
>>> its clock requirement so we are learning things the hard way.
>>>
>>> Marking this clock as critical solves the problem but it should not
>>> be viewed as final solution. Ideally, the SCPI driver should claim
>>> these clocks. We also depends on some clock hand-off mechanism
>>> making its way to CCF, to make sure the clock stays on between its
>>> registration and the SCPI driver probe.
>>>
>>> Fixes: 05f814402d61 ("clk: meson: add fdiv clock gates")
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>>
>> Could this patch go into the next 4.18 stable release since it hit linus master with commit id e2576c8bdfd462c34b8a46c0084e7c30b0851bf4 ?
>
>I forgot, but it should also go into the next 4.19 stable release aswell.

Queued up for 4.19 and 4.18, thank you.

--
Thanks,
Sasha
