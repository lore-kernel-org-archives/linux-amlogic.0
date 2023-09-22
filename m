Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ECACD4F2B
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Sep 2023 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMe4KWvU0XT7D/4FFUYlE+QSXSSOoDg+J0B+KHt7dlM=; b=TipwMruQ+CpPGT
	AZCghUXg8P/U2tzMWilzCJ4mS9e3gQnrvcFXSlDOc51TRrFjne/+qbaKvP3OY4F4eMpS0ixUski+9
	3/qpvq1pqh2NZ6iy4Hex96ejVBJTf4OLunV6XQvfuNmlUjI8ruRzykZpJ45k+iMUPpRAu4ENGDNCv
	3KagCUv3KhYCjZPLh4Yv0K+GHnninhFJG3oECiDFFvbKk+Rx1Vqz7xG3s9elz9TU03Mth9tz/mqiy
	sstLUP9x7T07XV30/erq8iq72nORlXciOCrLv9jfmUsXWcSbZ47p+LyP1J/7sNnIhMunAFaaZaPif
	WuVC1kWmExQm7Ccta/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbK9-008Nm0-0b;
	Fri, 22 Sep 2023 08:15:41 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbK4-008NjQ-2c;
	Fri, 22 Sep 2023 08:15:40 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8B185120008;
	Fri, 22 Sep 2023 11:15:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8B185120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1695370527;
	bh=K1IdM7b2w3Jp7BqUE1a2gm3KjIWU/wcpomoHzmDaVCg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=NqChQCJB5VrtPsxCf4DXrKDDVhQ3xfSBgHj5B1TC+Pna+YdUQIsgNI+u3IWFFa6Zf
	 qf3qHxEIFOX7hdQr3VLZeYJAnuk7YFeJ0oGmiVPQVrIwo4wG2lwPHu7hPAIJZXopL3
	 Z5RPnOKylezELRtaTl7BPE1JBRKYxBwlHejCQ5dds/Il2RXjqJU3QPfPihdOHp0z67
	 Mj4HEgAxudLMBxB+s/BLBEEqMGpMpR4Cx1p5DRDYDIiDS7hj24PN4i+MGzjf/Pn1yo
	 le8AbSDCZVzKLw0rYXiX6i1x51YbNdj4AnMSqppCQXn7C89JnpIOuYzvBW+FvnZtH3
	 aTdSJuX/p6ozA==
Received: from p-i-exch-sc-m02.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 22 Sep 2023 11:15:27 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 22 Sep 2023 11:15:27 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([::1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::80e5:bab:4999:4480%7]) with mapi id
 15.02.1118.030; Fri, 22 Sep 2023 11:15:27 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Alexey Romanov <avromanov@salutedevices.com>, "narmstrong@baylibre.com"
	<narmstrong@baylibre.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "olivia@selenic.com" <olivia@selenic.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "conor@kernel.org"
	<conor@kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "lists@kaiser.cx" <lists@kaiser.cx>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 1/3] drivers: rng: meson: add support for S4
Thread-Topic: [PATCH v3 1/3] drivers: rng: meson: add support for S4
Thread-Index: AQHZ5JhbK/N+gymR9EW47MRKmDtTx7AjAeSAgANcfQA=
Date: Fri, 22 Sep 2023 08:15:27 +0000
Message-ID: <20230922081514.p7patdvkp4mujk6k@cab-wsm-0029881.sigma.sbrf.ru>
References: <20230911101129.10604-1-avromanov@salutedevices.com>
 <20230911101129.10604-2-avromanov@salutedevices.com>
 <ZQp7Rf3qzoN6c2Le@gondor.apana.org.au>
In-Reply-To: <ZQp7Rf3qzoN6c2Le@gondor.apana.org.au>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.92]
Content-ID: <649DC8FD1411CD4C87B0DBDF3645D2E3@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180037 [Sep 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 534 534 808c2ea49f7195c68d40844e073217da4fa0d1e3, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;gondor.apana.org.au:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m02.sberdevices.ru:5.0.1,7.1.1;cab-wsm-0029881.sigma.sbrf.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/09/22 07:23:00
X-KSMG-LinksScanning: Clean, bases: 2023/09/22 07:23:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/22 02:22:00 #21944311
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_011537_546872_1E111775 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Herbert,

On Wed, Sep 20, 2023 at 12:55:33PM +0800, Herbert Xu wrote:
> On Mon, Sep 11, 2023 at 01:11:27PM +0300, Alexey Romanov wrote:
> >
> > +struct meson_rng_priv {
> > +	int (*read)(struct hwrng *rng, void *buf, size_t max, bool wait);
> > +};
> >  
> >  struct meson_rng_data {
> >  	void __iomem *base;
> >  	struct hwrng rng;
> > +	struct device *dev;
> > +	const struct meson_rng_priv *priv;
> >  };
> 
> Is data->priv really necessary? It doesn't seem to be used anywhere
> after the probe.
> 

Are you suggesting remove meson_rng_priv and putting a pointer to read
function in meson_rng_data?


> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
