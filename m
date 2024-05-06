Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C50C25B4F
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/skq90lc15fFgNhir4A2lhS9nigX/uxK/TaRLaygsw=; b=0HUIlDMv4Oom8F
	D2THGFBt1A6lBEOo0xnFRdtFZqIY2Di/Uz8x6H1sSPUGeMQJ2fz4K8OBIgPQJuqKyHe+TGmv6p2L2
	I6VHccK4PuVzbv1Ryrvhy9bb1cRt8RarPluFtjTQhzAX3iFpsMV/kAkeFQLanBKOVm91lPj7CIUo2
	m+YBqN7BdI8SKi+88007cD0nbE3PqdTTmsL2vkli7vwTXjskcOVP/py6NB7MXWLGWTIC0v5pTluFq
	wk1hk3Cxuwor+nvhCEtyIUfXekruEphvWA4t4ydGfFuKIzqNi2Ji4nxEWSieEOPOGOcVs859FsLTq
	tyiLHx7GYbT//spzrSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yhZ-00000007X9H-1jYt;
	Mon, 06 May 2024 13:48:21 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yhU-00000007X5w-1zfP;
	Mon, 06 May 2024 13:48:19 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 60933100006;
	Mon,  6 May 2024 16:48:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 60933100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715003282;
	bh=C6xCIPqri8hszP1/uAyU20bgm4X9w+t66Kn7K2I4Cjk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=O1mD1gye/Ty8pe/LCt05+rgMEvKmXUjoC8sBj+UUp3Y8ortjuHE+8JwTR9Bg5KbDP
	 t2N0lVMvoZubbQ+mt7ACU1KW0u/cg/JQaXFk6f+2tv40VROIcNry2kmjvIkxGJJ6ae
	 XeSWh/+ybCe9JTT1giWjan7WqRtwBjXrE4UoIn28X+3zwcYHUTNKZOKtNvfBJlc3lw
	 +nKP7WVXK3Lc6eD0wQFddT91C4ooMj/tpDgqAepw6r3vW4CJOx3rBR4P3yCPR5UJGw
	 TJvN3bKlQpwVzoDAH0GFYHzcrP1v+mexbUemsdOQeMFC2QHB7u77ysg507NgIBNjfY
	 UKGR70IW1RWzQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  6 May 2024 16:48:02 +0300 (MSK)
Received: from p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 6 May 2024 16:48:01 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru ([fe80::10c3:6e04:fd07:c511]) by
 p-i-exch-sc-m02.sberdevices.ru ([fe80::10c3:6e04:fd07:c511%9]) with mapi id
 15.02.1118.040; Mon, 6 May 2024 16:48:01 +0300
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
Thread-Index: AQHajBWjbcqi/hz3Ckugw/49eH+udbFpXY+AgCDP+AA=
Date: Mon, 6 May 2024 13:48:01 +0000
Message-ID: <20240506134754.jl633ncne7ct6szo@cab-wsm-0029881>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <20240411133832.2896463-18-avromanov@salutedevices.com>
 <20240415-schnapps-plating-eb0895459004@spud>
In-Reply-To: <20240415-schnapps-plating-eb0895459004@spud>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <FC46FF8DA00B1E429496D3165922BA1E@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185086 [May 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/06 12:01:00 #25108659
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_064817_286893_88B5DC6F 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, Apr 15, 2024 at 05:43:15PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 04:38:26PM +0300, Alexey Romanov wrote:
> > GXL crypto IP isn't connected to clk and seconnd interrput line,
> > so we must remove them from dt-bindings.
> 
> How does the device work without a clock?

It's clocked by a common clock, the vendor didn't provide more
information. It doesn't have any special clock domains.

> 
> Cheers,
> Conor.
> 
> > 
> > Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings
> > documentation for amlogic-crypto")
> > 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > ---
> >  .../bindings/crypto/amlogic,gxl-crypto.yaml         | 13 +------------
> >  1 file changed, 1 insertion(+), 12 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > index 948e11ebe4ee..d3af7b4d5f39 100644
> > --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > @@ -20,20 +20,11 @@ properties:
> >    interrupts:
> >      items:
> >        - description: Interrupt for flow 0
> > -      - description: Interrupt for flow 1
> > -
> > -  clocks:
> > -    maxItems: 1
> > -
> > -  clock-names:
> > -    const: blkmv
> >  
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> > -  - clocks
> > -  - clock-names
> >  
> >  additionalProperties: false
> >  
> > @@ -46,7 +37,5 @@ examples:
> >      crypto: crypto-engine@c883e000 {
> >          compatible = "amlogic,gxl-crypto";
> >          reg = <0xc883e000 0x36>;
> > -        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> > -        clocks = <&clkc CLKID_BLKMV>;
> > -        clock-names = "blkmv";
> > +        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
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
