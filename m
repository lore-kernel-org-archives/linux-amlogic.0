Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64023C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rElkdAcAXTmzh6jPx2cNG6OvXmgDsMdfCbOIkI2iMdo=; b=Qo5wYPjMd+UvCG
	ctkmMN4GrjLgsrsBpyp7SKbte+YT/gcTNwKrmzfOsCIEGNgeQXRpPDxicxB4OkIwBpzXebJjF50pC
	4axeAMjBA/0xGZvza1QNGJZQVheCM46BtAinP2P2K8fpq5/vdrHLiL/1x8Ie9IrDJHxJruqm3rc14
	33J6QPfFTQEZkltYtQC8cwGupVd3mu9OPwwBQEl9HNoMJT67WLDIVOBNhgvvjZ8wBJ5WTTeMesIUB
	ohU3SW70UJy54zF9L3SIx8LpJfhMMIzOZV0Nyo0DRqgxkIPqz55l67eHwmFQMqNW57wM2wcC/a+g7
	uH9Jdh0PwULEMSTXth8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQlgn-00000003Ssg-3tAz;
	Mon, 08 Jul 2024 10:33:45 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQlgl-00000003Srq-1XjG;
	Mon, 08 Jul 2024 10:33:45 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 622EC120008;
	Mon,  8 Jul 2024 13:33:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 622EC120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720434821;
	bh=kBbfq6zVIOZORkXhMU7x0H9PE5kCZaCWJAnTAIPXkmY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=si4lGhfoSQTWKP9/NbaYbHvz1faTyy/JNf1vI3yqVkRZayYWHD0xzEnShKSZ2tZrE
	 a6IloUlEQ8PY/QvFvgUp6SxqspX0cQirhGdr7EK7Gr9NJ/Cqq1ObfH7s4ssHLk+Fcd
	 daX9+ezpKZO2aF8WU1BoVM/v1Xaf+Kv5We7VFzajZDsJE4KImCpoS/d3WmZwMwQ1c+
	 v6hJRRJJZb1MPNuGq+LFkyyiW3JkGJZnHMJ0THBrA4gQGvaC9fX+Uf2YroFHT8kYFY
	 x3iuKAmuVw3i4UIpFU3z5+nQ5QI7MUcXW4Vcb8KKGsBKa0lyTB9yYxOgUAHofDp/UG
	 UZ+CVfBeS7faw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 13:33:41 +0300 (MSK)
Received: from p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 13:33:40 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru ([fe80::81d7:3d68:fdfd:518]) by
 p-i-exch-sc-m02.sberdevices.ru ([fe80::81d7:3d68:fdfd:518%9]) with mapi id
 15.02.1118.040; Mon, 8 Jul 2024 13:33:40 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Rob Herring <robh@kernel.org>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
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
Subject: Re: [PATCH v8 17/23] dt-bindings: crypto: meson: correct clk and
 remove second interrupt line
Thread-Topic: [PATCH v8 17/23] dt-bindings: crypto: meson: correct clk and
 remove second interrupt line
Thread-Index: AQHauOTSAXN6fA211UWCwBG9LZMwhLHBZvKAgCs5hgA=
Date: Mon, 8 Jul 2024 10:33:40 +0000
Message-ID: <20240708103330.w2krusjlyoucsvcn@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
 <20240607141242.2616580-18-avromanov@salutedevices.com>
 <20240610222827.GA3166929-robh@kernel.org>
In-Reply-To: <20240610222827.GA3166929-robh@kernel.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <79D38F7E409215488E684887CF215ECF@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186370 [Jul 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;cab-wsm-0029881.sigma.sbrf.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 09:16:00 #25900162
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_033343_762838_78814CF4 
X-CRM114-Status: GOOD (  26.52  )
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

Hi Rob,

thank you for the review.

On Mon, Jun 10, 2024 at 04:28:27PM -0600, Rob Herring wrote:
> On Fri, Jun 07, 2024 at 05:12:36PM +0300, Alexey Romanov wrote:
> > GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
> > Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
> > engine is hard weired to a clk81 (CLKID_CLK81).
> 
> typo.
> 
> > 
> > Also, GXL crypto IP isn't to seconnd interrput line. So we must
> 
> 2 more typos. Spell checkers exist. Use them instead of me please.
> 
> I think you forgot the word 'connected' too.

Yep, sorry, I will fix all typos.

> 
> > remove it from dt-bindings.
> 
> 
> So did this binding not work at all? 

Yes.

> Are there any users? 

No.

> You need a bit 
> more justification for an ABI breaking change.

I will add more clarification information in commit message in V9.

> 
> > 
> > Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings
> > documentation for amlogic-crypto")
> 
> This line should not be wrapped.
> > 
> 
> Drop the blank line.
> 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > ---
> >  .../bindings/crypto/amlogic,gxl-crypto.yaml          | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > index 948e11ebe4ee..aff6f3234dc9 100644
> > --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > @@ -20,13 +20,15 @@ properties:
> >    interrupts:
> >      items:
> >        - description: Interrupt for flow 0
> > -      - description: Interrupt for flow 1
> >  
> >    clocks:
> >      maxItems: 1
> >  
> >    clock-names:
> > -    const: blkmv
> > +    const: clk81
> 
> Clocks are supposed be named local to the block like what function or 
> part of the block they clock. This sounds like something global. 
> 
> With only 1 clock, I'd just drop the name altogether.

I think I have to remove clock-names field in V9.

> 
> > +
> > +  power-domains:
> > +    maxItems: 1
> >  
> >  required:
> >    - compatible
> > @@ -46,7 +48,7 @@ examples:
> >      crypto: crypto-engine@c883e000 {
> >          compatible = "amlogic,gxl-crypto";
> >          reg = <0xc883e000 0x36>;
> > -        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> > -        clocks = <&clkc CLKID_BLKMV>;
> > -        clock-names = "blkmv";
> > +        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
> > +        clocks = <&clkc CLKID_CLK81>;
> > +        clock-names = "clk81";
> >      };
> > -- 
> > 2.34.1
> > 

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
