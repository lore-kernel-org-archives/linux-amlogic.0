Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A5C3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9RD3gwfSeDsy2wpzuny2Ok7ahaLoMsqgnrofhHqQNE=; b=Mtz7UyZb+w+P8g
	Od+Cd4FNcsnOwQsDxSksGjfJm3OzqHOkXGec48lgHVd5DonUSSs9WIErW+raF9FmK5HSxxvf4hm/g
	03AR1fPoE/G+u+t0dsEgK0jYEEG7pW4QaBtacPC0iM7Saz2yAAvDSUMNQKE8k1p3RlsAPC22PUz/l
	f3ZH3nzFTq4oYA5U0pUKe37XnPBFrsT748ZpC9SklkGQyb+OaLUr40D11jeMw2UfGp2nsv6dhiXUJ
	nT6YdMCL0d4ReZ01kFEGmKDjEunLWmJmxUky/0/5N6W1W8Dm+wsAerrzrv9vUZDbYM/SwZWMg401j
	jzDW2DUkbFFoTvLnYZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQsl-0000000H3kX-0Hqz;
	Thu, 18 Jul 2024 13:09:15 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQsg-0000000H3jS-2JGE;
	Thu, 18 Jul 2024 13:09:13 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AC9D5120010;
	Thu, 18 Jul 2024 16:09:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AC9D5120010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721308145;
	bh=Rs10WoBRGbxVA1tpxhegD8xnv3KUn3Y5nh+zd+3yfX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=mPWZxvdBkbvEFNl+vpCubAemBLzMi854k4tuKT+wtnijRwNNVDI2bcUA2E99Tw9qA
	 Tp2U+oSqZgn9qewJg5NmYD0DHC3xyUC53V0cxO5YNYzNvLRreJ66GXyYekraMVmJMJ
	 sM7XHAs3TQ5ZnzFjopWxJw6JXN4XBGmr6rQ5fUR4qxqVwcubdG+jGdfMbO2nxlnODy
	 /57f97dKMW9T68Gb0AFUxRIrvyjmz9TNcikU0+sz3b/DzdPsMTuDkb28DP6uasJk3b
	 odCaxC/YWGyHDFmnbgFJUoUJZ8doNrcikgpUu6AV09A50Uih34uc5F9joe93ol4YuP
	 v4TEPm+nfrMZA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 18 Jul 2024 16:09:05 +0300 (MSK)
Received: from [172.28.129.66] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 18 Jul 2024 16:09:05 +0300
Message-ID: <52e2e211-a0b7-47b1-a451-34c304028097@salutedevices.com>
Date: Thu, 18 Jul 2024 16:09:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] pwm: meson: add pwm support for A1
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>
CC: <ukleinek@kernel.org>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <martin.blumenstingl@googlemail.com>,
	<jbrunet@baylibre.com>, <khilman@baylibre.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>,
	<hkallweit1@gmail.com>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240710234116.2370655-1-gnstark@salutedevices.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186588 [Jul 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/18 08:50:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/18 08:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/18 08:29:00 #26061289
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_060911_289599_04A835F1 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello

Excuse me, should I fix/improve anything on this series?

On 7/11/24 02:41, George Stark wrote:
> Add support for Amlogic meson A1 SoC family PWM
> 
> Changes in v2:
>    add patch with optional power-domains to pwm bindings;
>    fix syntax in a1 bindigns patch:
>    - use enum over const for amlogic,meson-a1-pwm beacuse adding more devices here
>      are expected
>    - leave only base compatible amlogic,meson-s4-pwm in check section
>    dt_binding_check and dtbs_check run ok now;
>    previous version: [1]
> 
> Changes in v3:
>    squash power-domains patch into main bindigns patch
>    add conditional to bindings that power-domains property is required only for a1
>    previous version: [2]
> 
> Changes in v4:
>    split bindings patch into power-domains patch and new compatible patch
>    previous version: [3]
> 
> [1] https://lore.kernel.org/lkml/20240701130113.433169-3-gnstark@salutedevices.com/T/
> [2] https://lore.kernel.org/lkml/20240701172016.523402-1-gnstark@salutedevices.com/T/
> [3] https://lore.kernel.org/lkml/20240702123425.584610-1-gnstark@salutedevices.com/T/
> 
> George Stark (3):
>    dt-bindings: pwm: amlogic: Add optional power-domains
>    dt-bindings: pwm: amlogic: Add new bindings for meson A1 PWM
>    arm64: dts: meson: a1: add definitions for meson PWM
> 
>   .../devicetree/bindings/pwm/pwm-amlogic.yaml  |  17 ++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 215 ++++++++++++++++++
>   2 files changed, 232 insertions(+)
> 
> --
> 2.25.1
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
