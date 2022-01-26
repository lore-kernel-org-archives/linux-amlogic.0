Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A52FC2BA4C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kld6nadCr7HTvqXHC68+2MCuNWoBs0imfG+X9X9Upkk=; b=ZNLAprinG059vK
	vLJiBU6mQ4D59xs1ckotKg6jwopz6EzLcSxWPGqjzEZPq7vTMX8irwViR90W/IsPXGIEgfzIzPBoM
	S8wDGwhDWvGvTgnIC7envHLuv+zQTSqSQ7rgg+cgdqBcAde9NFFv/hxKC4Yl9P3W3QQfVY5nO+wRA
	PplsVfDljJG04wISNnEr58CuKaE8NUFIhANi35CuNLM2uzcqpvyEBaIsRumArbfoCgSVXjxDZpamG
	zeUJLCHgO/612OKNI6NBO3bZqFbzUU3FHD+nzUU0AQIgXWqrHA0V856kRARqWJoW3HUBH/wUo/PBE
	DMxrs+1vjqTL06mS/+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeoq-00B2f2-QF; Wed, 26 Jan 2022 09:42:24 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeol-00B2co-EC; Wed, 26 Jan 2022 09:42:21 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 26 Jan
 2022 17:42:17 +0800
Message-ID: <27bf78f7-23b9-d759-28eb-0594006a30c6@amlogic.com>
Date: Wed, 26 Jan 2022 17:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v10 0/4] clk: meson: add a sub EMMC clock controller
 support
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao
 Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20220121074508.42168-1-liang.yang@amlogic.com>
 <f5a429f2-ffbc-ea03-810a-45a0f90959a2@baylibre.com>
 <6eb4f247-367b-d460-6314-fc94ccd00b89@amlogic.com>
 <1jy23226sa.fsf@starbuckisacylon.baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <1jy23226sa.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_014219_542208_DE560376 
X-CRM114-Status: GOOD (  26.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On 2022/1/26 17:14, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Wed 26 Jan 2022 at 17:08, Liang Yang <liang.yang@amlogic.com> wrote:
> 
>> Hi Neil,
>>
>> On 2022/1/25 22:54, Neil Armstrong wrote:
>>> [ EXTERNAL EMAIL ]
>>> Hi Liang,
>>> On 21/01/2022 08:45, Liang Yang wrote:
>>>> This driver will add a MMC clock controller driver support.
>>>> The original idea about adding a clock controller is during the
>>>> discussion in the NAND driver mainline effort[1].
>>>>
>>>> This driver is tested in the S400 board (AXG platform) with NAND driver.
>>> Thanks a lot for providing a fixed and updated version of this serie.
>>> After some chat with Jerome and Kevin, it seems the way the eMMC clock
>>> reuse
>>> for NAND was designed nearly 4 years doesn't look accurate anymore.
>>> Having a separate clk driver designed to replace the eMMC node when NAND
>>> is
>>> used on the board seems over engineered.
>>> Actually having the clock code you add in this serie _but_ directly in
>>> the NAND looks far better, and more coherent since having Linux runtime
>>> detection of eMMC vs NAND will never happen and even this serie required
>>> some DT modification from the bootloader.
>>> I'll let Jerome or Kevin add more details if they want, but I think you
>>> should resurrect
>>> the work you pushed in [1] & [2] but:
>>> - passing the eMMC clk registers as a third "reg" cell
>> Does it just need to define a 'reg' resource in NFC node and not 'syscon'
>> here?
> 
> Yes
> 
>>> - passing the same "clocks" phandle as the eMMC node
>>> - adding the eMMC clock code in the NAND driver directly
>>> I'm open to discussions if you consider the current approach is still
>>> superior.
>>
>> I don't have persuasive ideas, but really it shares the common clock
>> implementation for both NFC and EMMC. and we don't need to paste the
>> same code in NFC and EMMC.
> 
> You don't need to copy everything. If I understood correctly, all the
> Rx/Tx should not be needed. Yes, there is some duplication as it stands but
> it allows to avoid coupling the MMC and NAND driver. We can still think
> about optimizing things later on. Let's get something simply working
> first.
ok. i will do it. thank you.
> 
>>
>>> Thanks,
>>> Neil
>>> [1]
>>> https://lore.kernel.org/r/20220106033130.37623-1-liang.yang@amlogic.com
>>> [2] https://lore.kernel.org/r/20220106032504.23310-1-liang.yang@amlogic.com
>>>
>>>>
>>>> Changes since v9 [10]
>>>>    - use clk_parent_data instead of parent_names
>>>>
>>>> Changes since v8 [9]
>>>>    - use MESON_SCLK_ONE_BASED instead of CLK_DIVIDER_ONE_BASED
>>>>    - use struct_size to caculate onecell_data
>>>>    - add clk-phase-delay.h
>>>>    - define CLK_DELAY_STEP_PS_GX and CLK_DELAY_STEP_PS_AXG
>>>>
>>>> Changes since v7 [8]
>>>>    - move meson_clk_get_phase_delay_data() from header to driver
>>>>    - CONFIG sclk-div with COMMON_CLK_AMLOGIC instead of COMMON_CLK_AMLOGIC_AUDIO
>>>>    - remove onecell date and ID for internal MUX clk
>>>>    - use helper for functions for ONE_BASED in sclk-div
>>>>    - add ONE_BASED support for duty cycle
>>>>
>>>> Changes since v6 [7]:
>>>>    - add one based support for sclk divier
>>>>    - alloc sclk in probe for multiple instance
>>>>    - fix coding styles
>>>>
>>>> Changes since v5 [6]:
>>>>    - remove divider ops with .init and use sclk_div instead
>>>>    - drop CLK_DIVIDER_ROUND_CLOSEST in mux and div
>>>>    - drop the useless type cast
>>>>
>>>> Changes since v4 [5]:
>>>>    - use struct parm in phase delay driver
>>>>    - remove 0 delay releted part in phase delay driver
>>>>    - don't rebuild the parent name once again
>>>>    - add divider ops with .init
>>>>
>>>> Changes since v3 [4]:
>>>>    - separate clk-phase-delay driver
>>>>    - replace clk_get_rate() with clk_hw_get_rate()
>>>>    - collect Rob's R-Y
>>>>    - drop 'meson-' prefix from compatible string
>>>>
>>>>    Changes since v2 [3]:
>>>>    - squash dt-binding clock-id patch
>>>>    - update license
>>>>    - fix alignment
>>>>    - construct a clk register helper() function
>>>>
>>>> Changes since v1 [2]:
>>>>    - implement phase clock
>>>>    - update compatible name
>>>>    - adjust file name
>>>>    - divider probe() into small functions, and re-use them
>>>>
>>>> [1] https://lkml.kernel.org/r/20180628090034.0637a062@xps13
>>>> [2] https://lkml.kernel.org/r/20180703145716.31860-1-yixun.lan@amlogic.com
>>>> [3] https://lkml.kernel.org/r/20180710163658.6175-1-yixun.lan@amlogic.com
>>>> [4] https://lkml.kernel.org/r/20180712211244.11428-1-yixun.lan@amlogic.com
>>>> [5] https://lkml.kernel.org/r/20180809070724.11935-4-yixun.lan@amlogic.com
>>>> [6] https://lkml.kernel.org/r/1539839245-13793-1-git-send-email-jianxin.pan@amlogic.com
>>>> [7] https://lkml.kernel.org/r/1541089855-19356-1-git-send-email-jianxin.pan@amlogic.com
>>>> [8] https://lkml.kernel.org/r/1544457877-51301-1-git-send-email-jianxin.pan@amlogic.com
>>>> [9] https://lkml.kernel.org/r/1545063850-21504-1-git-send-email-jianxin.pan@amlogic.com
>>>> [10] https://lore.kernel.org/all/20220113115745.45826-1-liang.yang@amlogic.com/
>>>> Liang Yang (4):
>>>>     clk: meson: add one based divider support for sclk
>>>>     clk: meson: add emmc sub clock phase delay driver
>>>>     clk: meson: add DT documentation for emmc clock controller
>>>>     clk: meson: add sub MMC clock controller driver
>>>>
>>>>    .../bindings/clock/amlogic,mmc-clkc.yaml      |  64 ++++
>>>>    drivers/clk/meson/Kconfig                     |  18 ++
>>>>    drivers/clk/meson/Makefile                    |   2 +
>>>>    drivers/clk/meson/clk-phase-delay.c           |  69 ++++
>>>>    drivers/clk/meson/clk-phase-delay.h           |  20 ++
>>>>    drivers/clk/meson/mmc-clkc.c                  | 302 ++++++++++++++++++
>>>>    drivers/clk/meson/sclk-div.c                  |  59 ++--
>>>>    drivers/clk/meson/sclk-div.h                  |   3 +
>>>>    include/dt-bindings/clock/amlogic,mmc-clkc.h  |  14 +
>>>>    9 files changed, 529 insertions(+), 22 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
>>>>    create mode 100644 drivers/clk/meson/clk-phase-delay.c
>>>>    create mode 100644 drivers/clk/meson/clk-phase-delay.h
>>>>    create mode 100644 drivers/clk/meson/mmc-clkc.c
>>>>    create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h
>>>>
>>> .
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
