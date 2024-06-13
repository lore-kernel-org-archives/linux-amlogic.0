Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318CBC27C4F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxBkAvAgJBgHQu6mi1ScwiUQQ7ihlIM6O2Nt+3EgTaU=; b=DTC9BNs7QPKmgt
	Lu8UdOHapzSqsnTeahRVED4YRB4F/83OkvayzNiu/MCE8P6+HhRb0KW0J42O1cpxdBcUC2W4gjmbf
	fczvrtA4ek4+rLmmcYFVVjJ9mKKKGy435z+DNtF9qLV2kyA0+HBly+uVdeEjMNZ77LbvO17CY2mp8
	so38b/c5ZSrKDLWJP4zLa9TJrBeN9SGrFPb6FJAXc/+K0o/i7Wjk85F7unrknFCWbOfAKJn+xNbOa
	aQHhuFrz7IY22li/mzhpAyt9fCoq+p9UmoDrIqyF+6g0lX52uWl9pe58IEPFOsylTI6882mQqHxBu
	jOIrD0ELaRjSgQ7oCFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgMw-0000000FsRr-1rC8;
	Thu, 13 Jun 2024 09:03:42 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgMs-0000000FsNr-0NFV;
	Thu, 13 Jun 2024 09:03:40 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E9AB4120009;
	Thu, 13 Jun 2024 12:03:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E9AB4120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718269410;
	bh=0eA1sXoPzlJDy1NTJKWN6Wp5FWbVIxxhC+wH9/qzD2Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=cpo8W4V9eXHR1J54kiJTCFakcjoI/TafsZULXAXcMd0VmwTu1Hne/wsLpD/7yVkif
	 LvKsDHvXeMr8r7rQ8MbEqnUkCGw6uzg031t8bDLuJuqEBSjt0hN7QyhDSJ+d0zK1RL
	 tExrNFiZ79tlNrC3+DBg5MlZdR9sUpma/oxNA/o+euZqWHsQzzZjONoOpkryxgD6og
	 er6btO9JCk8gvtU8QlX5z+lrQWZjiZtH3QoklomuEUMaHdiVaGqpcnppplsaX3HsiH
	 ftq+iobNrEP/KnfNG26umtlD/FjWu1f+pBm2fFT68KGId4LnieUI1rxvSWGyAES59S
	 PuocWvpneQf2A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 13 Jun 2024 12:03:30 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 13 Jun
 2024 12:03:30 +0300
Date: Thu, 13 Jun 2024 12:03:30 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: clock: meson: add A1 CPU clock
 controller bindings
Message-ID: <20240611210007.bzm5vawqgdhh2g5s@CAB-WSD-L081021>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
 <20240515185103.20256-7-ddrokosov@salutedevices.com>
 <1jtti1p10m.fsf@starbuckisacylon.baylibre.com>
 <20240610111826.im3mz64hjfkxrxhr@CAB-WSD-L081021>
 <1j7cexow91.fsf@starbuckisacylon.baylibre.com>
 <20240610124842.mpy4rtlwtwasqf7h@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610124842.mpy4rtlwtwasqf7h@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185894 [Jun 13 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;devicetree.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/13 08:11:00
X-KSMG-LinksScanning: Clean, bases: 2024/06/13 08:10:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/13 06:22:00 #25590998
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_020338_827021_85FEBD23 
X-CRM114-Status: GOOD (  30.98  )
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

On Mon, Jun 10, 2024 at 03:48:42PM +0300, Dmitry Rokosov wrote:
> On Mon, Jun 10, 2024 at 01:47:06PM +0200, Jerome Brunet wrote:
> > On Mon 10 Jun 2024 at 14:18, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
> > 
> > > Hello Jerome,
> > >
> > > Thank you for the review!
> > >
> > > On Mon, Jun 10, 2024 at 12:04:09PM +0200, Jerome Brunet wrote:
> > >> On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
> > >> 
> > >> > Add the documentation and dt bindings for Amlogic A1 CPU clock
> > >> > controller.
> > >> >
> > >> > This controller consists of the general 'cpu_clk' and two main parents:
> > >> > 'cpu fixed clock' and 'syspll'. The 'cpu fixed clock' is an internal
> > >> > fixed clock, while the 'syspll' serves as an external input from the A1
> > >> > PLL clock controller.
> > >> >
> > >> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > >> > Reviewed-by: Rob Herring <robh@kernel.org>
> > >> > ---
> > >> >  .../bindings/clock/amlogic,a1-cpu-clkc.yaml   | 64 +++++++++++++++++++
> > >> >  .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   | 19 ++++++
> > >> >  2 files changed, 83 insertions(+)
> > >> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> > >> >  create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
> > >> >
> > >> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> > >> > new file mode 100644
> > >> > index 000000000000..f4958b315ed4
> > >> > --- /dev/null
> > >> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> > >> > @@ -0,0 +1,64 @@
> > >> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > >> > +%YAML 1.2
> > >> > +---
> > >> > +$id: http://devicetree.org/schemas/clock/amlogic,a1-cpu-clkc.yaml#
> > >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> > +
> > >> > +title: Amlogic A1 CPU Clock Control Unit
> > >> > +
> > >> > +maintainers:
> > >> > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > >> > +  - Jerome Brunet <jbrunet@baylibre.com>
> > >> > +  - Dmitry Rokosov <ddrokosov@salutedevices.com>
> > >> > +
> > >> > +properties:
> > >> > +  compatible:
> > >> > +    const: amlogic,a1-cpu-clkc
> > >> > +
> > >> > +  '#clock-cells':
> > >> > +    const: 1
> > >> > +
> > >> > +  reg:
> > >> > +    maxItems: 1
> > >> > +
> > >> > +  clocks:
> > >> > +    items:
> > >> > +      - description: input fixed pll div2
> > >> > +      - description: input fixed pll div3
> > >> > +      - description: input sys pll
> > >> > +      - description: input oscillator (usually at 24MHz)
> > >> 
> > >> According to the documentation, fdiv5 is also an input of the CPU clock
> > >> tree.
> > >> 
> > >> That is typically the kind of things we'd prefer to get right from the
> > >> beginning to avoid modifying the bindings later.
> > >> 
> > >
> > > Could you please share which documentation you are referencing? I have
> > > the A113L documentation, and there is no mention of the CPU clock IP.
> > 
> > You should get in touch with Amlogic.
> > 
> 
> Okay, I will double check with Amlogic and back with accurate
> information.
> 

According to a statement from an Amlogic FAE, there is an error in the
datasheet's CPU clock controller figure. The FAE clarified the
following:

"""
The d5/d7 clock source inside the A1 chip is not supplied to CPU_CLK and
is instead used by other peripherals. Therefore, you can connect a fixed
frequency divider (div5/div7) to peripherals in A1. The CPU control only
supports fclk_div2/div3.
"""

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
