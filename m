Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02333C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hW4GMivNzFH98C6tRuKtR9u3Bd29pqN8ieTQdLAvrXA=; b=38x3ULIpIr7uNp
	c+WyHPfjJYmc5EF1BBwWlrxNC36P2A8pi7EPVkl7br+xnI3o9/mYYi9myNkimAJa+guETbvERswU7
	+rH2Xxjmzdi5OagsYZxLbBV2V86kBYBUE8PKN+U5l1BLDZBffRlAls6k7OGpLz2lqVDrDKKZdt8um
	S4OQ17oTnZXORZp3P+QwnYkquxEQ6oDbMZwMYHgKyi5AiD2Q16vLZkR2yfrZETLUFqZxiZAAOT0u4
	mbemJjk13h1VEJVKlANMGntPJrgbAtgqzuWzaIq1qkOilUetJC51pCgdXk1EzCvZf0gYP09PYNxVc
	plh5Qr3flVYbEKfi8Ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQljn-00000003T8a-3dhI;
	Mon, 08 Jul 2024 10:36:51 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQljk-00000003T7C-0RUa;
	Mon, 08 Jul 2024 10:36:49 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3F310120009;
	Mon,  8 Jul 2024 13:36:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3F310120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720435006;
	bh=XEY2NBRjbxqea/5PRY6OMWGLU8etYTc47TSQerXA1j4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=C0UFvPKr/f5dyEG9KFHKZ8BQnxrk4RbSGdGKLMt0QcvYTAKuqm+BCNOWUZKZjy2xA
	 702tlsz1XXBBs7A+x5tQm/hwLY/A1Qh10DnUic4ym4x4M1u7fOSZCJ4zgNrNeIrgvS
	 Y6B5H7rjBmyOSyg6Kid7g8I6Fd7bUznEiHKl64R22qPUrkfGVFHNVu8ZaTN/+nefEx
	 OAb0aeHpuZ0uRj+TpvUsPvTZ423FdbqqJt0iswsA4pWZRIys2ZBPMQVFKhyO+UBzGJ
	 b/j9kvKu7odhYOmMUzAlsXQryrYEIaTc0kcLiwXEK3vUBLvRxWv1mB6vgLSPVkWB2F
	 L1s/U+ycioNcA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 13:36:46 +0300 (MSK)
Received: from p-i-exch-a-m1.sberdevices.ru (172.24.196.116) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 13:36:45 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) by
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 8 Jul 2024 13:36:45 +0300
Received: from p-i-exch-sc-m02.sberdevices.ru ([fe80::81d7:3d68:fdfd:518]) by
 p-i-exch-sc-m02.sberdevices.ru ([fe80::81d7:3d68:fdfd:518%9]) with mapi id
 15.02.1118.040; Mon, 8 Jul 2024 13:36:45 +0300
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
Subject: Re: [PATCH v8 19/23] dt-bindings: crypto: meson: support new SoC's
Thread-Topic: [PATCH v8 19/23] dt-bindings: crypto: meson: support new SoC's
Thread-Index: AQHauOTTNCzPPbvGFkCsgbh4L4mRC7HBaAeAgCs5UwA=
Date: Mon, 8 Jul 2024 10:36:45 +0000
Message-ID: <20240708103640.g62urznl37jltcvk@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
 <20240607141242.2616580-20-avromanov@salutedevices.com>
 <20240610223219.GA3175091-robh@kernel.org>
In-Reply-To: <20240610223219.GA3175091-robh@kernel.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <E64D23A2DAFEC54B8C21464339A86309@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, cab-wsm-0029881.sigma.sbrf.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 09:16:00 #25900162
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_033648_497817_6A09C9E4 
X-CRM114-Status: GOOD (  21.21  )
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

On Mon, Jun 10, 2024 at 04:32:19PM -0600, Rob Herring wrote:
> On Fri, Jun 07, 2024 at 05:12:38PM +0300, Alexey Romanov wrote:
> > Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
> > 
> > 1. Add new compatibles:
> >   - amlogic,g12a-crypto
> >   - amlogic,axg-crypto
> >   - amlogic,a1-crypto
> >   - amlogic,s4-crypto (uses a1-crypto as fallback)
> > 
> > Difference between this compatibles:
> >  * Different registers offset and the number of setup descriptors.
> >  * GXL doesn't support hashing like the others.
> >  * G12A/B and A1/S4 crypto HW don't support 192 AES key.
> >  * GXL, G12A/B and AXG require a reverse IV key before processing.
> > 
> > 2. Add power-domains in schema, which is required only for A1.
> 
> You added it in the prior patch, was that supposed to be done here? Kind 
> of strange for h/w to optionally have a power-domain... It either has 
> one or it doesn't. OTOH, making required is an ABI break.

This is vendor design. In old SoC's power domain for crypto HW
was not configurable, but in A1-series it is configurable.

> 
> > 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > ---
> >  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 21 +++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > index aff6f3234dc9..a8344de71b4a 100644
> > --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > @@ -11,8 +11,16 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - const: amlogic,gxl-crypto
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - amlogic,s4-crypto
> > +          - const: amlogic,a1-crypto
> > +      - enum:
> > +          - amlogic,gxl-crypto
> > +          - amlogic,axg-crypto
> > +          - amlogic,g12a-crypto
> > +          - amlogic,a1-crypto
> >  
> >    reg:
> >      maxItems: 1
> > @@ -37,6 +45,15 @@ required:
> >    - clocks
> >    - clock-names
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: amlogic,a1-crypto
> > +    then:
> > +      required:
> > +        - power-domains
> > +
> >  additionalProperties: false
> >  
> >  examples:
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
