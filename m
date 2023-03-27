Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463DAC7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=makwXy+dGcfXYlhM0J7Kj9vlg3xKDUO8uexN5EZF2Is=; b=n1hsLWIh76Y68t
	lFB8tz5ZqhuXXsFaskV9yNP/ZmbSWPsoc6h4Qi7CNzrCx0BVt02c4toKBtr9Qr0tUwk7GDJTIYbjE
	D/iaBmqRcjqF1QDpp2S94nwXAyOBugMFG48Qf1NaCn1nyQQTnDrQQLx8L2DYEigarbyUAooCX9e3y
	WsRe1Joda+rzunvfq7o0c/MfErCxC0SH6LPIFgJbDX6VYAKoVrd4jYWelBJ+bD9AlCbFVR0OjV8nh
	H8bRJHUBzBwKbp+40K6Kc8QQ6Y30XrMsIQS37K0sRu36JBEtOWgxl90GmSqbS7dEjE5Cw5OeEC82c
	akkhZYTn8s9/Qq8DUP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmtB-00B7MT-0X;
	Mon, 27 Mar 2023 13:27:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmt8-00B7LH-0b;
	Mon, 27 Mar 2023 13:27:56 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A602B5FD0E;
	Mon, 27 Mar 2023 16:27:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679923671;
	bh=0YUCwwr3FkfqiCryYd0cXJ9WkdrM/lnNsAXWs5dkDmY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=PiIIdlWyfXI2YxfuVPMiERyUtS3e8apzsM0jw8aWpq7UM21heILNGgtUKsImAyvvL
	 fRKo6cr4JvAZ/FuUdfCeC+124LPi0DnRDf89y91DfYUrT7cJsbMhabscgA6+fd9LqU
	 DsBtoKouTA9kMPpc4atAN9fueKNM9qyPZLYSViLl7ptJpiwlrxTmy63hrYt15QEaOu
	 zScE0x+rQYGgaFGzlwJ3dthhuSWZ5r5GcMyWx13I3iLq/+pSJg3/AQMdZ72aLFQ3qO
	 076PL8UYUfdrqiljM3ocAVjeRlIfZj+zB/NkgUCOlPL38tgnIljPIgWLsJcNvrneQP
	 Gz1zhQgd+F+5A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Mar 2023 16:27:51 +0300 (MSK)
Date: Mon, 27 Mar 2023 16:27:50 +0300
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
Subject: Re: [PATCH v11 5/5] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
Message-ID: <20230327132750.pnao5t3mbm3pmzbe@CAB-WSD-L081021>
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-6-ddrokosov@sberdevices.ru>
 <1jtty6o5so.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jtty6o5so.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/27 05:49:00 #21016052
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_062754_567365_DA48EE25 
X-CRM114-Status: GOOD (  27.12  )
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

On Mon, Mar 27, 2023 at 11:58:30AM +0200, Jerome Brunet wrote:
> 
> On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > Introduce Peripherals clock controller for Amlogic A1 SoC family.
> >
> > A1 SoC has four clock controllers on the board: PLL, Peripherals, CPU,
> > and Audio.
> > This patchset adds support for Amlogic A1 Peripherals clock driver and
> > allows to generate clocks for all A1 SoC peripheral IPs.
> >
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  drivers/clk/meson/Kconfig  |   10 +
> >  drivers/clk/meson/Makefile |    1 +
> >  drivers/clk/meson/a1.c     | 2344 ++++++++++++++++++++++++++++++++++++
> >  drivers/clk/meson/a1.h     |   49 +
> >  4 files changed, 2404 insertions(+)
> >  create mode 100644 drivers/clk/meson/a1.c
> >  create mode 100644 drivers/clk/meson/a1.h
> >
> 
> [...]
> 
> > +static struct clk_regmap dspa_b_sel = {
> > +	.data = &(struct clk_regmap_mux_data){
> > +		.offset = DSPA_CLK_CTRL0,
> > +		.mask = 0x7,
> > +		.shift = 26,
> > +		.table = mux_table_dsp_ab,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "dspa_b_sel",
> > +		.ops = &clk_regmap_mux_ops,
> > +		.parent_data = dsp_ab_parent_data,
> > +		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
> > +		/*
> > +		 * DSPA_B clk can be inherited from more accurate RTC clock,
> > +		 * so in some situations we may want to freeze its parent.
> > +		 * Therefore force dsp parent setup on device tree side
> > +		 */
> 
> This gets copy-pasted A LOT.
> Please comment this once and for all ... then reference the comment if
> you need to.
> 

Agree. No problem. I'll collapse them in the next version.

> > +		.flags = CLK_SET_RATE_NO_REPARENT,
> > +	},
> > +};
> 
> [...]
> 
> > +static struct clk_regmap cecb_32k_sel = {
> > +	.data = &(struct clk_regmap_mux_data) {
> > +		.offset = CECB_CLK_CTRL1,
> > +		.mask = 0x1,
> > +		.shift = 31,
> > +		.flags = CLK_MUX_ROUND_CLOSEST,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "cecb_32k_sel",
> > +		.ops = &clk_regmap_mux_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&cecb_32k_sel_pre.hw,
> > +			&rtc.hw,
> > +		},
> > +		.num_parents = 2,
> > +		/*
> > +		 * CECB_32K clk can be inherited from more accurate RTC clock,
> > +		 * so in some situations we may want to freeze its parent.
> > +		 * Therefore force cecb_32k parent setup on device tree side
> > +		 */
> 
> How do you plan on doing that ?
> 
> You've made the parent "private" and it is not even available to be
> referenced in DT.
> 
> This whole concept of public and private to seems broken to me.
> I would much prefer you keep the existing model, with one big table and
> possibly some IDs not exposed in the bindings.
> 
> This gives an hint about the clocks we think consummers should use while
> allowing us to change things if we got it wrong, and keep the IDs stable
> for DT. This has been working so far. I don't see the benefit of
> changing that right now.
> 

As we disccused in the IRC, there is two approaches:

1) public/private clock bindings based on splitting bindings headers
2) public/private clock objects based on limited clock hw provider
   registration

I'll redesign the whole patch series to the 1st approach with keeping the
following strict rules in the mind:
"There is no option to chage public or private CLKID list numbers.
"Never said you were allowed to change the meaning of the ID, you are just
allowed to have them declared in the bindings (or not)"

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
