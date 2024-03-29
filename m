Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD92CD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 11:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOTm8ASbLro0GQgJ1pnmwyfwIWx70wJl6GZ7UGKI2l0=; b=vRQ95ETiW+B8UJ
	6sjkDpF+xNSPyLT44BqjqFtBmpWFxkQoiDIxaIayozwKAwKP+y/X8vhewsQDOHgK15Wr0EoeQPkuL
	Jx6GoLh73ieeLhfFQ8eYbdUcnmivgTu4a7DIksqpiG9wSOfHnl8r0ema/DtdZ288O3oEJoKnPTyS/
	KpICvUSHaMrYWLHUjNh3jBuPCnnNXYQG9AYngjZ+tY4mEMocFB9/RotMu6o8pAY8LcZVfteiv+B9a
	GQsx9lnYNKDjUV6Hea5m762rXETzQMQ+h8xmLezkYGqfvLk7uSeDeBDhFQBRYoceuHpcXcem+D/x1
	7kOysS4mfbJ+r6G9/03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqAC3-000000009ee-0oXK;
	Fri, 29 Mar 2024 11:14:43 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqABz-000000009dk-2oM7;
	Fri, 29 Mar 2024 11:14:42 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A777510001B;
	Fri, 29 Mar 2024 14:14:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A777510001B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711710870;
	bh=lFNNpWUo5GpWFV+9AKZ9Cfm8NfVqj08JFZwNdFWkc2I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=WKjL+cp6zqFDN/D6whRQUAVUpp/FDIit+CaMjN0kz1d5zAIPPdxXNyS1P2mCOKAO+
	 NXgvBjHQ+S6JtVkha3w9clLOQaN0BdzYV1iJevPPQrECJ4vo91NQ9mawoNS95juTAY
	 1xnxZf/yb2w56JZNiExZrDNMqk8jYs+iVoSwpq0/0EDY6M79zOPmW47e5Hy8HpU6Jj
	 As6WSS1vmMGNqX/MiF0nwqRYA+ur/8SDn4hxh8HCrUFJjpjlGD8Rg+tcVocZVqoXZ4
	 MDs8Tvc1ePQPgd5h8Qm1pPjEyVKJL5d7YnB0MjKZDVlEI0+QUmp/GCdKcErFqR+eXz
	 o+2Le3qA6CscA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Mar 2024 14:14:30 +0300 (MSK)
Received: from p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 14:14:30 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru ([fe80::10c3:6e04:fd07:c511]) by
 p-i-exch-sc-m02.sberdevices.ru ([fe80::10c3:6e04:fd07:c511%9]) with mapi id
 15.02.1118.040; Fri, 29 Mar 2024 14:14:30 +0300
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
Subject: Re: [PATCH v6 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Thread-Topic: [PATCH v6 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Thread-Index: AQHaf5LgFGLoYbivnUaU5PLAkeGrbrFKIBaAgARC/AA=
Date: Fri, 29 Mar 2024 11:14:29 +0000
Message-ID: <20240329111424.i2zp2coznqpnibk4@cab-wsm-0029881>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-18-avromanov@salutedevices.com>
 <20240326-obscurity-angriness-d7bb48bc9eaa@spud>
In-Reply-To: <20240326-obscurity-angriness-d7bb48bc9eaa@spud>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <CEBAC2ABE34F8A4AB4996A1D926E8A4F@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184489 [Mar 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/29 06:35:00 #24505095
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_041440_421993_7B2B1E79 
X-CRM114-Status: GOOD (  20.23  )
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

On Tue, Mar 26, 2024 at 06:09:37PM +0000, Conor Dooley wrote:
> On Tue, Mar 26, 2024 at 06:32:13PM +0300, Alexey Romanov wrote:
> > GXL crypto IP uses DMA engine, which doesn't require clk input
> > and second interrupt line.
> > 
> > Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
> 
> How does this fix a commit that only modifies a dts? The commit cited
> here should be a dt-bindings commit.

Yep, my bad. Will fix it in next series.

> 
> However, your commit message says "require" but you do more than remove
> these as required, you remove them entirely. What am I missing?

Crypto HW isn't connected to clk / 2nd interrput line, so we must remove
them from dt. I will reformulate commit message.

> 
> Thanks,
> Conor.
> 
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
