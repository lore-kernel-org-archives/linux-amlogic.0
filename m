Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12840C4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5p8ujU/N3nznkC+Nq1ZmU4DfolVBDoaEIDKFx8cY1A=; b=M5TzUq3p3l22Nf
	eqDBiG/f1TWj0b5RyQdeWlc7Bld0dIaSa2pGia89lXf+P8T58UkxJyMdBj54ROMCMNIPO/p4KX5OK
	ouXB0V8fxJPFoV+oA7z+cqz4JUlMC5Bm6jDRQ1kqFxUief80hu1hrKreeGisVEVTZf7oAZDREdRCj
	/WcWRuKUwHW+alLyyq/ibGR7nzFGk/56ZzGgVgxUPa8mPxg6Ek+8BkCM7ClHDO2OJxDQ0racyZLkH
	vm67BFyO4PoaIjAPSmbE9wcIfuVE1ZPUThV2UXA9FEfC2y65Dw+b99vMAgUXDj7xBCFnTHMCOYwiL
	yDJQdT9C6xzbOLsbMR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1585-00GKDV-NX; Fri, 02 Dec 2022 12:26:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1581-00GKAh-TH; Fri, 02 Dec 2022 12:26:55 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 3F1A95FD0B;
	Fri,  2 Dec 2022 15:26:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669984011;
	bh=8OBXNzSAS41lpYJ9BhmbrARwv9XI5QpXEVQ2Yvfc/tU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=ihCgOiIlELXCrpiiNICxGJoV1LWQ8yVz8asct5UUredVutLNjzuZzGGP98L78Jk27
	 kN62mykio3iggELzYidmLK0/Rwr9hX3A+AiWyee/sjbsRENF1jTvns51bqlB8seRX5
	 waaFao0pEXNng9fC/oErDwUTGMlVGPtzuF6a9xMAm5DwIwa4uOB1ZITqR3o8rAfjiz
	 R8duAW65C6r2TLY4skcIBg/y30jv52znpi4dqt3SeK72UEUQO8w3IGcN4eL0AUNUqO
	 5bOiARbtf2MHlHgySg2RST4PzqdhEcd5iVnigkXp6VjMIXMnbgZ6mnaMJR5MLde52X
	 AW3/Iz2wJRcPQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 15:26:50 +0300 (MSK)
Date: Fri, 2 Dec 2022 15:26:50 +0300
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
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20221202122650.bybwjszlgdnu3zvm@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <1jbkom83fg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jbkom83fg.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_042654_317524_D57E8059 
X-CRM114-Status: GOOD (  18.32  )
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

On Fri, Dec 02, 2022 at 12:11:53PM +0100, Jerome Brunet wrote:
> 
> On Fri 02 Dec 2022 at 01:56, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > From: Jian Hu <jian.hu@amlogic.com>
> >
> > Add the documentation to support Amlogic A1 PLL clock driver,
> > and add A1 PLL clock controller bindings.
> >
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
> >  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> >  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > new file mode 100644
> > index 000000000000..d67250fbeece
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
> > +
> > +maintainers:
> > +  - Neil Armstrong <narmstrong@baylibre.com>
> > +  - Jerome Brunet <jbrunet@baylibre.com>
> > +  - Jian Hu <jian.hu@jian.hu.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: amlogic,a1-pll-clkc
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +     - description: input xtal_fixpll
> > +     - description: input xtal_hifipll
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xtal_fixpll
> > +      - const: xtal_hifipll
> 
> Do we really need the "xtal_" prefix ?
> 
> Seems like the clock is the PLL, not the xtal
> 

This name was formed from specification registers description. Register
CLKTREE_SYS_OSCIN_CTRL has "gate en" field which calls "xtal ->
HIFIPLL", therefore if was transformed to xtal_hifipll name.

But I agree with you, that "hifipll" is better name choice.
 
-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
