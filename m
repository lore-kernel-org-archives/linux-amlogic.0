Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DD7C001E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Aug 2023 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2BPQ82iMvVwvA9KC1Jv8uc+G3T9gz/Nt/zi92r8Zzs=; b=EsE6/rML0Fb27v
	9gXCfVfplsFJm5wqwONPO5EayC83yUA7xZl07LaY+ioR4yGe9qzw++hG/5hGa2eBBCei06kNUhBrN
	1kjny+hbYWSyrC27hWpN5MdLH5I+yO+77v3jh+pnXMX8B9KZsfBdxGn9dYvOOfNADwZrlF/jpcSd6
	0AdX0Dl5IWg2YX1OaqfMP9hJxFt6I7DhTT1sybGOooaNuQfjJMHrx+LV+yPv/xdnWEu9i4Zc8Hrtv
	7VoC01i8doJsBmHT1Zi24gfL0LbctSOQn2YfAO85K0i/gT6tBRnL8BhK7So+Z5zR15mZm3B1z6Rwu
	w2X+PJNyLSMa7oJsw6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJ4I-004ZXY-0T;
	Wed, 16 Aug 2023 16:08:22 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJ4E-004ZUQ-2K;
	Wed, 16 Aug 2023 16:08:20 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 16518100003;
	Wed, 16 Aug 2023 19:08:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 16518100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692202087;
	bh=wGqvJOn5fP6VPclwBqfTYsb4NWORtmmUmxW9yBj0C14=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=pu+ViZnBT4SSAr62uJNCBMvDiuJCilFDki3AXaaLXyz4XH2VnUEiTE9Huf8B701oc
	 bxprMscRUVXlinABZqkwEkHGqofS+XCEHJp8oy6z8Z94iXDblbqV1pr7VRm24s0DQK
	 KwvnNuE+iWW2TIFXdBdCUGVcLz9JEvmBpmfTqEtLNBnkqdys9TvxZEg3zU+j7bU5IE
	 30rB589keO2aD3Nb3crBHjBYsVwxrxSSm5d9NrcLgzbb2o4qxgm10Ys7X+b2CXe6xG
	 Y+LIx72CggsxaVqPKn62YzN/FDyraKHJ1wrU1QwQhFq2zgcSio+B7CaDq3ZQpTWZaw
	 Z97Awe+AvAX1Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 19:08:06 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 16 Aug 2023 19:08:05 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([::1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::80e5:bab:4999:4480%7]) with mapi id
 15.02.1118.030; Wed, 16 Aug 2023 19:08:05 +0300
From: Alexey Romanov <AVRomanov@sberdevices.ru>
To: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "olivia@selenic.com"
	<olivia@selenic.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "conor@kernel.org"
	<conor@kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "lists@kaiser.cx" <lists@kaiser.cx>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 0/3]  Meson S4 HW RNG Support
Thread-Topic: [PATCH v2 0/3]  Meson S4 HW RNG Support
Thread-Index: AQHZyS/okR/Cmydlp02gvetqwMngtK/s8v8A
Date: Wed, 16 Aug 2023 16:08:05 +0000
Message-ID: <20230816160802.pi75gl2smx2llcf4@cab-wsm-0029881.sigma.sbrf.ru>
References: <20230807130611.63914-1-avromanov@sberdevices.ru>
In-Reply-To: <20230807130611.63914-1-avromanov@sberdevices.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <7146A6B2EA2EED4BA4EE46F3C863E684@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Track_E25351}, {Tracking_internal2}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;cab-wsm-0029881.sigma.sbrf.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/16 12:02:00 #21629266
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_090819_142964_E0AEFBEF 
X-CRM114-Status: GOOD (  16.34  )
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

Hi!

Really sorry for the noise, but
I would like to receive some feedback on my patchset.

On Mon, Aug 07, 2023 at 04:06:08PM +0300, Alexey Romanov wrote:
> Hello!
> 
> This patch series adds hwrng support for Amlogic S4-series.
> Now, S4 uses a new random number generation algorithm.
> This changes implemnents new algo and also adds description
> to meson-s4.dtsi.
> 
> V2:
> 
> - Use readl_relaxed_poll_timeout_atomic() function instead of loop.
> - Use two different functions: meson_rng_read() and meson_s4_rng_read().
> - Fix naming in DT schema (meson-s4-hwrng instead of meson-hwrng-s4).
> - A little code style fixes.
> 
> Alexey Romanov (3):
>   drivers: rng: meson: add support for S4
>   dt-bindings: rng: meson: add meson-rng-s4 compatible
>   arch/arm64: dts: meson-s4: add hwrng node
> 
>  .../bindings/rng/amlogic,meson-rng.yaml       |  1 +
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  5 ++
>  drivers/char/hw_random/meson-rng.c            | 80 ++++++++++++++++++-
>  3 files changed, 83 insertions(+), 3 deletions(-)
> 
> -- 
> 2.38.1
> 

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
