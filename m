Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6102FC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2024 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn1g2I7xKCKbJCc3YHGsS0I/FpMhAEcxPmuzPCpx0EM=; b=3g37ooU+2q9ZOa
	0ZmxFe87xAct49/0ba9FvMrxHe+pZZmRj36/JrTbbnXINIY/1/X/dAqnw44zHfrRiDRp3U1L5h4w7
	SvdY+fEeGPG2Rcey466g9exuYbFnMjRH0riIwHgoHKELvzDLtB8oyXYqkV/n8qxC1eqG2Z6FTt5om
	IExRVQ4USTRpl8KmxlT+cOBdKb5TG5olxpGtLnKq4Y14XH/N3goSWA6YD9a5vFd2ydH/Ch2Nvqjwk
	NaIfzZUVps3D4w/7Z7bGgd8a/kI7Dr5O+RTlFs7BIls5Js+2O3Hdg3wLMK/sU5Zxp8MeVqeiztTtN
	ey7peqdyNb/tyM41UR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5yE-00000005w6C-0A6e;
	Thu, 23 May 2024 10:46:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5y9-00000005w4V-069w;
	Thu, 23 May 2024 10:46:47 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A0860100013;
	Thu, 23 May 2024 13:46:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A0860100013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716461196;
	bh=rnyJQc1d86XKiiLfsDTO95JbMJ3DJ5VaEkCq2oxfEnQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=XgKtqM6NCtTLA5Z/OdZI3BU+DWFC1tck1eSc02By5hPnEfP+2PSZe37i7YkyTPQi4
	 GC7CxA+kD1zMBVoKJ80AckALSi0Rx4vjV2jkTcHGUhH01+FmZCy+IGNrVA9fn1rxRa
	 G5OcH4R7Cgbc3iy1l4nBSAD1ng4w5UN28kuW5RtYsJyQcpHn57aDxxPgOjsjTJbHS1
	 RQ2J03s6BYYsE0HR0lYo3KSVtBj9bq5Dpizc318BEzxb624LgE6oVuc8kuPJCwbXrq
	 SiSTtbdrMp2ZTUVbmKkAN/JI/EnH3fOjwmkT2wsokp3r+pKlQPlLobb2jVCPZwh/r0
	 q5U3EBxOOIQUQ==
Received: from smtp.sberdevices.ru (p-i-exch-a-m1.sberdevices.ru [172.24.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 23 May 2024 13:46:36 +0300 (MSK)
Received: from p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) by
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 May 2024 13:46:36 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru ([fe80::10c3:6e04:fd07:c511]) by
 p-i-exch-sc-m02.sberdevices.ru ([fe80::10c3:6e04:fd07:c511%9]) with mapi id
 15.02.1118.040; Thu, 23 May 2024 13:46:36 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Conor Dooley <conor@kernel.org>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v7 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Thread-Topic: [PATCH v7 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Thread-Index: AQHajBWjbcqi/hz3Ckugw/49eH+udbFpXY+AgCDP+ACAACFpgIAaY4MA
Date: Thu, 23 May 2024 10:46:35 +0000
Message-ID: <20240523104624.tr5omyxnzxsjkpai@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <20240411133832.2896463-18-avromanov@salutedevices.com>
 <20240415-schnapps-plating-eb0895459004@spud>
 <20240506134754.jl633ncne7ct6szo@cab-wsm-0029881>
 <20240506-distrust-famine-6848f75dd3fe@spud>
In-Reply-To: <20240506-distrust-famine-6848f75dd3fe@spud>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <60740C6C7B2A8844930F23000BCA19F7@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185437 [May 23 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;cab-wsm-0029881.sigma.sbrf.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/23 07:54:00 #25244744
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_034645_778324_2B69E000 
X-CRM114-Status: GOOD (  28.19  )
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

Hi Conor,

On Mon, May 06, 2024 at 04:47:29PM +0100, Conor Dooley wrote:
> On Mon, May 06, 2024 at 01:48:01PM +0000, Alexey Romanov wrote:
> > On Mon, Apr 15, 2024 at 05:43:15PM +0100, Conor Dooley wrote:
> > > On Thu, Apr 11, 2024 at 04:38:26PM +0300, Alexey Romanov wrote:
> > > > GXL crypto IP isn't connected to clk and seconnd interrput line,
> > > > so we must remove them from dt-bindings.
> > > 
> > > How does the device work without a clock?
> > 
> > It's clocked by a common clock, the vendor didn't provide more
> > information. It doesn't have any special clock domains.
> 
> So the hardware block does have a clock, which, even if it is a clock
> shared with other hardware blocks, makes your patch incorrect.
> 
> Is the "blkmv" clock the shared clock?

I received accurate information from the vendor. Starting from GXL,
DMA engine is used for crypto HW and clock is hard weired to it (at RTL
level). That's why we have to remove it from device tree, because we can't
control it anyway.

I will add clarification about this in commit message in text patch
series.


> 
> Cheers,
> Conor.
> 
> > > > Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings
> > > > documentation for amlogic-crypto")
> > > > 
> > > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > > ---
> > > >  .../bindings/crypto/amlogic,gxl-crypto.yaml         | 13 +------------
> > > >  1 file changed, 1 insertion(+), 12 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > > index 948e11ebe4ee..d3af7b4d5f39 100644
> > > > --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > > +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > > @@ -20,20 +20,11 @@ properties:
> > > >    interrupts:
> > > >      items:
> > > >        - description: Interrupt for flow 0
> > > > -      - description: Interrupt for flow 1
> > > > -
> > > > -  clocks:
> > > > -    maxItems: 1
> > > > -
> > > > -  clock-names:
> > > > -    const: blkmv
> > > >  
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > >    - interrupts
> > > > -  - clocks
> > > > -  - clock-names
> > > >  
> > > >  additionalProperties: false
> > > >  
> > > > @@ -46,7 +37,5 @@ examples:
> > > >      crypto: crypto-engine@c883e000 {
> > > >          compatible = "amlogic,gxl-crypto";
> > > >          reg = <0xc883e000 0x36>;
> > > > -        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> > > > -        clocks = <&clkc CLKID_BLKMV>;
> > > > -        clock-names = "blkmv";
> > > > +        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
> > > >      };
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> > 
> > 
> > 
> > -- 
> > Thank you,
> > Alexey



-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
