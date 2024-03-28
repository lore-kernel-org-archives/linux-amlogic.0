Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F3C54E67
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwNQt1hhasipWkSqlyXsYbisbnzKglTbVavHGjDO5Z0=; b=0IZeZ+ewuoYKl0
	2d/wuMEClzJgba9HqgeNQazpEizdFS7cZc5SYv+tvQImcKgFo2+5dFB74waCQlZtE+wb5eRsUTONM
	nwQSTZZUIHcGx6hA0w7g96cXkTdDa/OW8G+4YY3li2Qr6cNbMknB3QdHfPUWEvYKU7yOR8BCFtIqq
	fhilyKalGs1XU79GOuDWSalpa0iujJR7f+L3k57JhCnLDvriv8Lxgb/qpoauL6HVW7uVKiEsIYG0/
	6V58PalcZjh3SYM5NXrHm6Z+fUAOFaKhGdqB0FLDFZwoBt0NZG1Z+NIypmqrGAA9l+Uz3ym96zf7m
	4OgQtvBVjzsNqo+qpanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqki-0000000EK63-2xAr;
	Thu, 28 Mar 2024 14:29:12 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqkf-0000000EK5Q-3xYm;
	Thu, 28 Mar 2024 14:29:11 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DEDE310000E;
	Thu, 28 Mar 2024 17:29:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DEDE310000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711636146;
	bh=evQRgmgfpBfE7ABI70oDODcWR8kPQd8V040QqDbhPSQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=oMB4Ha4FC7ybfhcUSoswKvOJhUj29Bq5Rd7h9qEdYDfmYH7X6DJiSC3G3MjYM3NY2
	 Q6AEQZ0Uehd+MoAVb6NF6Tc+smi0HRsRNtne5+hMWylFb81NajdGQTQnMX7Pa3ljjk
	 7cydUzFlqQR/nVUHzL8PYiEArvuxzgVzoOznVGd5UsK2045PhR3qTFE72O4+sRZmVQ
	 Y2NkNOLFaYacssXKdGiaIv5mGrUwvEYWoel4FmFgrNEwJECRldQ2PWBrU16zqCosGq
	 pi/X9Z3buwa97hVkDR2yKV5KCw2wbBVA9UJj7F+ovgEgl2yFMDJPAlAE1G4W4WbGKG
	 d/kIiQbh6xIbA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 17:29:06 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 17:29:06 +0300
Date: Thu, 28 Mar 2024 17:29:06 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>
CC: <jbrunet@baylibre.com>, <mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: amlogic: add support for A1
 thermal sensor
Message-ID: <20240328142818.5mnktmaq2dctos6o@CAB-WSD-L081021>
References: <20240328133802.15651-1-ddrokosov@salutedevices.com>
 <20240328133802.15651-2-ddrokosov@salutedevices.com>
 <19897482-2fa1-4688-aeec-855123558374@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19897482-2fa1-4688-aeec-855123558374@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184473 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 12:54:00 #24494464
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_072910_347537_E55C6C44 
X-CRM114-Status: GOOD (  17.22  )
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

Hello Neil,

Thank you for quick feedback.

On Thu, Mar 28, 2024 at 03:07:52PM +0100, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 28/03/2024 14:37, Dmitry Rokosov wrote:
> > Provide right compatible properties for Amlogic A1 Thermal Sensor
> > controller. A1 family supports only one thermal node - CPU thermal
> > sensor.
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >   .../bindings/thermal/amlogic,thermal.yaml          | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > index 20f8f9b3b971..0e7f6568d385 100644
> > --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > @@ -13,11 +13,15 @@ description: Binding for Amlogic Thermal
> >   properties:
> >     compatible:
> > -    items:
> > -      - enum:
> > -          - amlogic,g12a-cpu-thermal
> > -          - amlogic,g12a-ddr-thermal
> > -      - const: amlogic,g12a-thermal
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - amlogic,g12a-cpu-thermal
> > +              - amlogic,g12a-ddr-thermal
> > +          - const: amlogic,g12a-thermal
> > +      - items:
> > +          - const: amlogic,a1-cpu-thermal
> > +          - const: amlogic,a1-thermal
> 
> In this case you can just use "amlogic,a1-cpu-thermal" or "amlogic,a1-thermal", no need for a fallback.

Okay, I will send v2 with only one compatible w/o fallback.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
