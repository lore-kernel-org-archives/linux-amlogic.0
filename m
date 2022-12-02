Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EF7C4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yU+IGR28GDz1NYATbSXQl7z9QVKyJsEzyahRVUjr8B8=; b=UVv+KAZUoJCoAM
	e6dBPI/EAHDb6VOEDTfB68FLNJJPEk12tWV3e6Ql7gByea/CfkLtB686p0S4D+irZvTDT9KzvNuVp
	I1d+tEP8/Wg/ws9ElMhWncbPXqRr01yK2ZwoY13Bo3kGbw8iDibT1WPYieOzmRVv+Ry1h0MWHmZFo
	wYuVqBJqv8Mn0IUH+vBm3WXVmu1lcJI2DKrGgUEmcJwUmdDCG/C0Ln9WPr9hgYOHtXWFBcYSangpl
	zqcsGBBMOdcmUO5Rt+5xtBF0hw52KOVXCbd+S2pNMAZpTRlxKvnKoy8yiji9c/w1WeEKTuvRgFjeY
	r1v2CO9Y2cMyb+cK0U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15Et-00GM38-77; Fri, 02 Dec 2022 12:33:59 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15Eq-00GM29-AH; Fri, 02 Dec 2022 12:33:58 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7EF755FD0B;
	Fri,  2 Dec 2022 15:33:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669984433;
	bh=282kx+HEwvxtZ+H+mSqaI8GU81yvcnptjbfPg0xRDS4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=d2P6mwXz96RuDx0v+EaGl68N58etx16QPu4Nh1WYVurzd7uW5M7ioALfUdL65oMw2
	 wi/9tGc91qZ+9tn1OgAeTZUN+WdoMzRb3iV2PVhbpCdkRYkN8naIgoKa79l3LOGghS
	 7zf1uUQgJY+ISVTDAden9/Lv4PKL+KvPd/+YPL7q94qufWxjljEB19Utm9SH0J4kGQ
	 oVWCreWmp9BrqkrLneDMJbQy9DHg2jOQqAap/afg175Rw1GZspgEoDhmiNlokTUjL1
	 qf7//iSE6/xQAGPT5zulmS+uXsP7762cCvnCJhgOUWj4gLr8zaVO3NzO8Kyr0xaPyU
	 tkOBMTScwLRCA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 15:33:53 +0300 (MSK)
Date: Fri, 2 Dec 2022 15:33:53 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 04/11] clk: meson: a1: add support for Amlogic A1
 Peripheral clock driver
Message-ID: <20221202123353.d6l5h5jb26fp5snm@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-5-ddrokosov@sberdevices.ru>
 <1j359y82fn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1j359y82fn.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_043356_713895_2B44E3DB 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

...

> > +		.ops = &clk_regmap_gate_ro_ops,
> > +		.parent_data = &(const struct clk_parent_data) {
> > +			.fw_name = "xtal",
> > +		},
> > +		.num_parents = 1,
> > +	},
> > +};
> > +
> > +static struct clk_regmap a1_xtal_fixpll = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = SYS_OSCIN_CTRL,
> > +		.bit_idx = 1,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "xtal_fixpll",
> 
> same here, this is not a crystal.
> It is the fixpll input gate, what about "fixpll_in"
> 
> Same bellow - you get the idea ...
> 

Yep, got it. Will fix in the v9.

...

> > +static struct clk_regmap a1_rtc_32k_sel = {
> > +	.data = &(struct clk_regmap_mux_data) {
> > +		.offset = RTC_CTRL,
> > +		.mask = 0x3,
> > +		.shift = 0,
> > +		.flags = CLK_MUX_ROUND_CLOSEST,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "rtc_32k_sel",
> > +		.ops = &clk_regmap_mux_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&a1_rtc_32k_xtal.hw,
> > +			&a1_rtc_32k_div.hw,
> > +		},
> > +		.num_parents = 2,
> > +		.flags = CLK_SET_RATE_PARENT,
> > +	},
> > +};
> > +
> > +struct clk_regmap a1_rtc_clk = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = RTC_BY_OSCIN_CTRL0,
> > +		.bit_idx = 30,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "rtc_clk",
> 
> Everytime there is an "_clk" suffix, you can remove it.
> In this driver, we know we are going to get clocks ;)
> 

Exactly! :-)

...

> > +static struct clk_regmap a1_dspa_en = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = DSPA_CLK_EN,
> > +		.bit_idx = 1,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "dspa_en",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&a1_dspa_sel.hw
> > +		},
> > +		.num_parents = 1,
> > +		.flags = CLK_SET_RATE_PARENT,
> 
> Maybe as a 2nd step, but I suspect a "CLK_SET_RATE_NOREPARENT" is going to
> be needed here at some point.
> 

I will think about it, and try to mark all needed points with that in
the next version.

...

> > +static struct clk_regmap a1_dspb_a = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = DSPB_CLK_CTRL0,
> > +		.bit_idx = 13,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "dspb_a",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&a1_dspb_a_div.hw
> > +		},
> > +		.num_parents = 1,
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> 
> Any chance we can remove this CLK_IGNORE_UNUSED, or comment why it is
> needed ?
> 

This is needed for DSP accelerator in the SoC. I'm afraid it can't be
disabled by kernel logic run on Core IP.

...

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
