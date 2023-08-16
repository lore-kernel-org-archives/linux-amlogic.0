Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4935EC001E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Aug 2023 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyOag49TCZRQXV5OoglO9MQhfD2Pxe5As2vcWbmAzz4=; b=M/wZcLPUWNzOfF
	txCPkgNuxx5Ag7HtDsTOT0gb+f4iUVc0arMPNuhGz+nOEFMm59xBkubd5D8zbOnydcfyN4wTMTTdr
	5D5QcTBSKe0SByoq7gCKhS2eCJnPmHYeWRkFPEVaozc70icG7dF8GBBwUgOeACxQAYhjOS83sQ0yh
	FNEktXiHxOEXh2BDkBtNOrHaeF3cDEUsrQcuaT7MLf9XgZQnfqB8ILWBNidzfSe4AhcyDDY5MIcBv
	P/Tnwu7sQ4rhdcumS2veT0bItar+RBbhH9DZfSBbPkZWPnCOu0FuNhA5fOCKzHpPuT+sW9D/Lb+UO
	+z71QNE45ArfiXE2oFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJ5l-004Zpg-1v;
	Wed, 16 Aug 2023 16:09:53 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJ5j-004ZoY-0X;
	Wed, 16 Aug 2023 16:09:52 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B16B0100003;
	Wed, 16 Aug 2023 19:09:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B16B0100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692202188;
	bh=B2HLvs94ZpyDjEhHgl0bKYdQrJ2OEIc58j+r5lejfDQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=LAnKxNz9piHUK42ZplcB8KzTmUxxA+nY6EfsKwIOs/7kdjQhCymNtDfUB28H4FzbG
	 YDHbFrLY2y/i9S8zBmi9VWX4WnyntIFAcT04Qfd3Ey1IC0yO0/DhMg6X3dTe425gcF
	 ZhI2NHcWBzTXxXcZ4G1vgOmzDkQiqZM6Yqbl8crWxZOoRUS4PZbBSxHZGA0ouQyumv
	 GrXMohBoE5F5JxjoQPMRf1lt5/Dm0modDbsl37AZmA3rF+zKHktzSNN2aHndvTLvRR
	 BQK19d9UeQ5FgQhMPt/Bh2NnJkWUYeFelU9ExOhpu1pQWnrsE0UHl7skOBdHaIf+WZ
	 E7Z6pWnpWEBlw==
Received: from p-i-exch-sc-m02.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 19:09:48 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 16 Aug 2023 19:09:47 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([::1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::80e5:bab:4999:4480%7]) with mapi id
 15.02.1118.030; Wed, 16 Aug 2023 19:09:47 +0300
From: Alexey Romanov <AVRomanov@sberdevices.ru>
To: Conor Dooley <conor@kernel.org>
CC: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "olivia@selenic.com"
	<olivia@selenic.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "lists@kaiser.cx" <lists@kaiser.cx>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 2/3] dt-bindings: rng: meson: add meson-rng-s4
 compatible
Thread-Topic: [PATCH v2 2/3] dt-bindings: rng: meson: add meson-rng-s4
 compatible
Thread-Index: AQHZyS/vZjB/sdAqbUylJEW+ne6EZq/gHcWAgAAAdgCADNU+AA==
Date: Wed, 16 Aug 2023 16:09:47 +0000
Message-ID: <20230816160944.wwewoej4oj35irwa@cab-wsm-0029881.sigma.sbrf.ru>
References: <20230807130611.63914-1-avromanov@sberdevices.ru>
 <20230807130611.63914-3-avromanov@sberdevices.ru>
 <20230808-calcium-smasher-5f6c410fb226@spud>
 <20230808-diabetes-ultimate-f3f4afc53d6d@spud>
In-Reply-To: <20230808-diabetes-ultimate-f3f4afc53d6d@spud>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <190233EA3A283247AF55BB59E5C1E2B4@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179289 [Aug 16 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVRomanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Track_E25351}, {Tracking_internal2}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;cab-wsm-0029881.sigma.sbrf.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m02.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/16 12:02:00 #21629266
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_090951_572364_86E15FD4 
X-CRM114-Status: GOOD (  13.88  )
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

Hi, Conor!

Thank you for the review.

On Tue, Aug 08, 2023 at 01:11:24PM +0100, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 01:09:45PM +0100, Conor Dooley wrote:
> > On Mon, Aug 07, 2023 at 04:06:10PM +0300, Alexey Romanov wrote:
> > > Now the driver has a separate algo for S4 SoC.
> > > 
> > > Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Actually, one comment, please, for bindings, write commit messages that
> relate to the hardware rather than drivers. The bindings describe the
> hardware, after all.

Yeah, will fix this in V3.

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
