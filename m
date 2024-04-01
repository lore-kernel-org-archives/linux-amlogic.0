Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87400CD128A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEEYeQM/rL9w9YcMVgTCtt52VU6qO/Kq9vHptDbsK5w=; b=r9Vyu7gvhjBNdC
	4GCULz4nmFmJIppMhMfPc68VHGfRTWcv+viDbs8q7neoaoFmMrWaHDIjnhws3mtleDPMLD/ln7OTJ
	t84yTEVh6gO3GUeslGg/NbJSVRbePj9pTB7xJOs/y+NmYDCpOx/pfUbZde0jDc+inwrJ99BvW8d8M
	4xYegbDGnwWJx6yamtEzWdrFWzJiWb2VjuJeWd04vy0O1j58LOsvChj93DVreg4G8IJAFrcuQ8AMK
	h3NIAOjw5uaE7IXL/jocmTk34I6CeSk2s/lkkr3yzjFUpm03dSUTicTps3hGUJMHF2Z6ZGQo8lpym
	69d3fiwEF/S88P4lVHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLMx-00000008RvA-1Ss7;
	Mon, 01 Apr 2024 17:22:51 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLMt-00000008Rti-1dh8;
	Mon, 01 Apr 2024 17:22:49 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4EBEC120003;
	Mon,  1 Apr 2024 20:22:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4EBEC120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711992164;
	bh=tl1k+GzwBoZHvPC5wGd0gk/FR6ibdQtoq6i6yG3MDtE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=ePLJZ08v9l/Hp7+tshkLyConpJh3/E7UlPychQ8v4envB4os0v896owqaCmUZBjPw
	 CASP3Kvn8yjDiOVNug2zR0XVFAP5hfsR2f70JK4yUprzcIq+X0EfxdpSH+mXgwuB5P
	 9//DgLEl4FR7a0j5vgchoors49NzStQuA6+XtIawT/vGj/MGbgaQehjcYjwt2LM20g
	 rtq+7EgaEMsCG/LVOtZKVkUAMpAFl8cIcHkxzsdjEWYVb3CApexAknmGL033IXoPJZ
	 oX41ydw3Fjehxdcd681iiS8shzVEnB4Du+a1Y2CiY1y11Ylv1lpuvDO32cgmzFb4JG
	 psrARtLC41j3w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  1 Apr 2024 20:22:44 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 20:22:43 +0300
Date: Mon, 1 Apr 2024 20:22:43 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Rob Herring <robh@kernel.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240401172243.zuvj6d6ptkrt6p33@CAB-WSD-L081021>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-2-ddrokosov@salutedevices.com>
 <20240401142011.GA537763-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401142011.GA537763-robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184515 [Apr 01 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/01 16:37:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/01 16:36:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/01 15:13:00 #24563578
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_102247_793418_E9C82B31 
X-CRM114-Status: GOOD (  18.83  )
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

Hello Rob,

On Mon, Apr 01, 2024 at 09:20:11AM -0500, Rob Herring wrote:
> On Fri, Mar 29, 2024 at 11:58:41PM +0300, Dmitry Rokosov wrote:
> > The 'syspll' PLL is a general-purpose PLL designed specifically for the
> > CPU clock. It is capable of producing output frequencies within the
> > range of 768MHz to 1536MHz.
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
> >  include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > index a59b188a8bf5..fbba57031278 100644
> > --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > @@ -26,11 +26,13 @@ properties:
> >      items:
> >        - description: input fixpll_in
> >        - description: input hifipll_in
> > +      - description: input syspll_in
> >  
> >    clock-names:
> >      items:
> >        - const: fixpll_in
> >        - const: hifipll_in
> > +      - const: syspll_in
> 
> A new required entry is an ABI break. Please state why that's ok or make 
> it optional (minItems: 2).

Unfortunatelly, it cannot be optional. I've explained here why:

https://lore.kernel.org/all/20240401171933.bqmjsuanqsjvjosn@CAB-WSD-L081021/

"""
The clock source sys_pll_div16, being one of the GEN clock parents,
plays a crucial role and cannot be tagged as "optional". Unfortunately,
it was not implemented earlier due to the cpu clock ctrl driver's
pending status on the TODO list.
"""

Could you please provide guidance on whether there is any alternative
approach that could potentially make it possible?

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
