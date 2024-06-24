Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04CCC2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/Qr8dou9NLtkj7MIS+kyhS3SryFIMeSAp1i36+Cpxg=; b=JVPhoKg3xa1smN
	vQdcIGEnkdwLeK0NkpZOPcamcK9rad/xBLr/Leza0EwqvwUl3WgRZcFywFnT718/Owo0urH4mJdbx
	RGsd3l7jCKDTKNFp7JPcZmuZnq6/W6iO5ymIFDQPbcGtq76ZIjl/6a9ov6YFEPfJsSJUUSDNvVzQl
	n54l8w5I2/Kz50Tb/E1fpYMAafTru96YWHFGUL9nQGS+kypCdFo53HrzM3AVnvyKj6XNWayb4cXca
	s4dzjYhucAselVoS5pdogmN55xQtWQZV+DAIQVz4nIfofFviy/HH/EgXwIi2Z7SYoy0z0x3uUGKbV
	puBWetTD5P7yFxCJZUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLk4M-0000000GzTb-327c;
	Mon, 24 Jun 2024 13:49:18 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLk4I-0000000GzRc-4Ahe
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 13:49:17 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8307E10000D;
	Mon, 24 Jun 2024 16:49:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8307E10000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1719236941;
	bh=1nrLHKRDeZOlG7iRG58yx2wRWxXJ1fEP3otaW6bOYCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=eV82MdePHKY4+5PfujA6iLId+JmoR8/qyNxs8zwwNYP5QLUcHCT/f1NqH4dfgdPKR
	 kdQB7pf8ZABRgSncq+bkldjgQiSljNaMHIcYX76DMJp3XD17LCdjA7BFKlWxjROXsG
	 19FQMMLBoxi4OsbDvTLSIjEh7hvefQo6e6E2zRA4VPeDED6lftndzH324OcfvpS2Pc
	 m64NreJwsgRiBhrRmeP26MWSpHLmGWZvPY0tuXXcumOuSbTSXFzuYRp1jV1Mim+2/m
	 xgVBdQeSDj43zZePtvj27iudeBm9gANJJKHvl04+xCZYc6w9Lz8FeckF/ks4K1KN7p
	 f2KjpgdcN0rfQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 24 Jun 2024 16:49:01 +0300 (MSK)
Received: from [172.28.192.142] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 24 Jun 2024 16:49:00 +0300
Message-ID: <f7b13cc0-6155-4b0f-9f63-c35d73c3032f@salutedevices.com>
Date: Mon, 24 Jun 2024 16:48:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] reset: amlogic: move reset drivers out of CCF
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186090 [Jun 24 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/24 10:37:00
X-KSMG-LinksScanning: Clean, bases: 2024/06/24 13:26:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/24 08:41:00 #25695455
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_064915_573375_24526D04 
X-CRM114-Status: GOOD (  16.48  )
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

Jerome,

Do you have any updates? I'm looking forward to these changes so I can
continue my work on a1 audio clock controller driver.

On 5/16/24 18:08, Jerome Brunet wrote:
> This RFC follows the discussion about having reset driver in the clock tree
> [1]. Ideally those should reside in the reset part of tree.
> 
> Also the code of the amlogic reset driver is very similar between the 2 trees
> and could use the same driver code.
> 
> This RFC moves the reset driver of audio clock controller of the g12 and
> sm1 SoC family to the reset tree, using the auxiliary bus.
> 
> The infrastructure put in place is meant to be generic enough so we may
> eventually also move the reset drivers in the meson8b and aoclk clock
> controllers.
> 
> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
> 
> Jerome Brunet (9):
>   reset: amlogic: convert driver to regmap
>   reset: amlogic: add driver parameters
>   reset: amlogic: split the device and platform probe
>   reset: amlogic: use reset number instead of register count
>   reset: amlogic: add reset status support
>   reset: amlogic: add toggle reset support
>   reset: amlogic: add auxiliary reset driver support
>   clk: meson: add auxiliary reset helper driver
>   clk: amlogic: axg-audio: use the auxiliary reset driver
> 
>  drivers/clk/meson/Kconfig                     |   6 +
>  drivers/clk/meson/Makefile                    |   1 +
>  drivers/clk/meson/axg-audio.c                 | 108 +--------
>  drivers/clk/meson/meson-clk-rst-aux.c         |  84 +++++++
>  drivers/clk/meson/meson-clk-rst-aux.h         |  14 ++
>  drivers/reset/Kconfig                         |   1 +
>  drivers/reset/reset-meson.c                   | 210 ++++++++++++++----
>  include/soc/amlogic/meson8b-auxiliary-reset.h |  17 ++
>  8 files changed, 293 insertions(+), 148 deletions(-)
>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
>  create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h
> 

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
