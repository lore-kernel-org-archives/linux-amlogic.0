Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556A9C7EE29
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jun 2023 11:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIMSaImXR3Lj1mRQPtLhxAquL2bq72v3W71DAYwrbcU=; b=ks0irOZ7I+N7gJ
	Pm/s9uFTDK3VL5WHpoYjZxBHDBzgBFZzpYlPrnyXb4BH04EgJeZOiC0gyEUbihfekEZs/JU6uq30c
	JXpRUYKwZt60nb3clEXty32/cJfT3vWc/LMwxMQ3X85mJyuMgQ4m4nZZAF/vYzwRCRcZY4lC4VbQN
	6WA6Cfb0TwOK+lWuXJaYHRbvHu6DTpzqGUoBhDRnELOJ/o9LHnkxH7J9Gtfuevjcxvm9bbmYrguEb
	4foy6rI15bv7pMRHE1bIqtTHdxGuWwR+KNDg0zyTTbdqdVA2myc4ICfXwtliOxyF/dZcAQWdQ56G3
	PV7lvnP6TvZIsOpv4MrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Dt0-009Aho-1B;
	Thu, 08 Jun 2023 11:33:02 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Dsv-009Afp-2s;
	Thu, 08 Jun 2023 11:33:00 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0B9655FD17;
	Thu,  8 Jun 2023 14:32:48 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686223968;
	bh=ArxZiYt0qp/hxI5ZPD4sF0OBh5tn0afXnbxC4eDwIyU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=bNFA395QIg2BsNA+rX3UafWQ9sOwa9yOQtgOmsdIl2UtMWN8utqHCarZsMceg9yum
	 KO5qBWnXTDOGZ5d09RwLOdneTdZYl9ZTuOfvqgygCi6sfwggkdbHzBgXuhIX20l5sV
	 s4U9VZqLgVMxUL01k51Hdt1XY2TusRAQMDEodZVEkdYMoamrXWKTus5+M8S1lPSh6V
	 qTwKcegboO/TsdBUWvvRlc8reLOrBEP4+iW/J1pckPOIRxucnuR0daee7Gq+CAih68
	 RaV64ihAmqTqzBvJKJ+A0ixZCbKMQkadopYAYDLjZxD/4b6WOKuxyquvRd9FmcglkR
	 TGwxwbPprNI0A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 14:32:44 +0300 (MSK)
Date: Thu, 8 Jun 2023 14:32:44 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Yu Tu <yu.tu@amlogic.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>
Subject: Re: [PATCH V9 3/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Message-ID: <20230608113244.jvf7w4flwjy5soud@CAB-WSD-L081021>
References: <20230517070215.28463-1-yu.tu@amlogic.com>
 <20230517070215.28463-4-yu.tu@amlogic.com>
 <1j5y804q7u.fsf@starbuckisacylon.baylibre.com>
 <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
 <1jttvi9vnq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jttvi9vnq.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 06:55:00 #21458577
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_043258_653096_0ABAA455 
X-CRM114-Status: GOOD (  19.37  )
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

Hello Jerome,

On Thu, Jun 08, 2023 at 10:53:31AM +0200, Jerome Brunet wrote:
> 
> >>> +
> >>> +static struct clk_regmap s4_fclk_div4 = {
> >>> +     .data = &(struct clk_regmap_gate_data){
> >>> +             .offset = ANACTRL_FIXPLL_CTRL1,
> >>> +             .bit_idx = 21,
> >>> +     },
> >>> +     .hw.init = &(struct clk_init_data){
> >>> +             .name = "fclk_div4",
> >>> +             /*
> >>> +              * For more information, please refer to s4_fixed_pll_dco.
> >>> +              */
> >> While div2 and div3 got an explanation from previous SoCs, they others -
> >> like div4/div7/etc ... - have been able to cope with rw ops so far.
> >> Why is the S4 different for all these clocks ?
> >
> > The chip was changed fixed pll for security reasons.
> >
> > Fixed PLL registers are not writable in the kernel phase. Write of fixed
> > PLL-related register will cause the system to crash.
> >
> 
> That is definitely worth mentionning
> 
> >> Requiring RO ops (or fishy clock flags) is usually a sign that a clock
> >> is used without an appropriate driver.
> >>
> 
> Neil is currently dealing with the dt-bindings, please
> * Adjust your patchset accordingly
> * Wait for his v2 to land, you'll need it.
> 

I saw Neil patch series with merging 'private' and 'public' clock
bindings parts. Should I send the same patchset for a1 clocks after v6.5
landed?

> >>> +             .ops = &clk_regmap_gate_ro_ops,
> >>> +             .parent_hws = (const struct clk_hw *[]) {
> >>> +                     &s4_fclk_div4_div.hw
> >>> +             },
> >>> +             .num_parents = 1,
> >>> +     },
> >>> +};
> >>> +
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
