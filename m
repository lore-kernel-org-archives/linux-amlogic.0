Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D49C3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HQoTJFW/HFt4o0krHWhqMoU4tFLqKGLL21FsGu7Fv0=; b=XAAO/wIhZnkqSP
	xtJ3R4wnIdaMt0cMyRX44BiGme17tfkMUijKGXdMkiTkRuSvb8yGAt59hj2v+QHDOsEMHjp0vZZvG
	eIN0CHu+CFMMDM7/PZXVASjzL2xlkfsnrM+AiU2vALJKa6eejb4eWuvmI4yDKDQDxFRA6h29j4k1q
	ZoX0DSa7zsc3AuOV9Jafm5wJZX4aeKDs6CDQm6V4AfXcf98ds7rEw7fvSA0JNIsBI3o9Jjq408wl1
	eqJB9dKOaaiD+Hc8x+6jcsaOqo++ciHbBpjOkhOiB+EVuChVLZMgUH/yT7pdV5GUxxyPAVTYgJnOJ
	klJfn5P5G8ZyCqSHPyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUS18-0000000HG26-1fJJ;
	Thu, 18 Jul 2024 14:21:58 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUS14-0000000HG1R-3I3w
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 14:21:57 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 049A2100023;
	Thu, 18 Jul 2024 17:21:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 049A2100023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721312509;
	bh=hv9yQJjhlaFavYGxLanR/jVIoSKLN0ySNfyS5FHaCQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=gntoFL0+4pb9iNHyZVdyAuF8qCor5uemLXT6B+t56M67fAySsNPyvsuIBc3jh5DoW
	 0JNDFZsQIn97aB0sHHcNziJSwHxwuVcSB8uLddEdePbO+EWmp4/HqiJyQ82qFs7YV9
	 JZfBuyfMxwOAFIYtDh5x2RPBKsZ9j/INfCN70bI+IRJguoKroYGqHn2qzjJREJr2H1
	 lXu2WSaoJkONNTFyQXmcA/Kvh9qRSwLSUynLczb8xypGHy9ZU7Q97xSYlu0HvN5Kcd
	 iNoKqd4dirhYI65hmGCAKLjRDGqb65m1c0gKhvTgjHShflY/Xdd4OgWi/1oTdSlNsN
	 FJF9FHs9t9vOw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 18 Jul 2024 17:21:48 +0300 (MSK)
Received: from [172.28.192.11] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 18 Jul 2024 17:21:48 +0300
Message-ID: <07b4e6b9-7448-45fb-b5a0-d069addb5dc2@salutedevices.com>
Date: Thu, 18 Jul 2024 17:20:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] reset: amlogic: move audio reset drivers out of
 CCF
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186588 [Jul 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/18 08:50:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/18 08:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/18 08:29:00 #26061289
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_072155_426796_F9787933 
X-CRM114-Status: GOOD (  23.04  )
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

In previous series there was a patch "[PATCH 8/8] clk: amlogic:
axg-audio: use the auxiliary reset driver", but I don't see it here. Did
you removed it, or I missed something?


On 7/18/24 12:57, Jerome Brunet wrote:
> This patchset follows the discussion about having reset driver in the
> clock tree [1]. Ideally those should reside in the reset part of tree.
> 
> Also the code of the amlogic reset driver is very similar between the 2
> trees and could use the same driver code.
> 
> This patcheset alignes the reset drivers present in the reset and clock
> then adds support for the reset driver of audio clock controller found in
> the  g12 and sm1 SoC family to the reset tree, using the auxiliary bus.
> 
> The infrastructure put in place is meant to be generic enough so we may
> eventually also move the reset drivers in the meson8b and aoclk clock
> controllers.
> 
> Changes since v1 [3]:
>  * Fixes formatting errors reported by Stephen.
>  * Changed parameters type to unsigned
>  * Fix usage of ops passed as parameters, previously ignored.
>  * Return 0 instead of an error if reset support is absent
>    to properly decouple from the clock and have a weak
>    dependency
>  * Split the platform and auxiliary modules in 2 distinct modules
>    to fix the COMPILE_TEST error reported by ktest robot.
> 
> Change since RFC [2]:
>  * Move the aux registration helper out of clock too.
> 
> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
> [2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
> [3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com
> 
> Jerome Brunet (9):
>   reset: amlogic: convert driver to regmap
>   reset: amlogic: use generic data matching function
>   reset: amlogic: make parameters unsigned
>   reset: amlogic: add driver parameters
>   reset: amlogic: use reset number instead of register count
>   reset: amlogic: add reset status support
>   reset: amlogic: move drivers to a dedicated directory
>   reset: amlogic: split the device core and platform probe
>   reset: amlogic: add auxiliary reset driver support
> 
>  drivers/reset/Kconfig                         |  15 +-
>  drivers/reset/Makefile                        |   3 +-
>  drivers/reset/amlogic/Kconfig                 |  27 ++++
>  drivers/reset/amlogic/Makefile                |   4 +
>  .../{ => amlogic}/reset-meson-audio-arb.c     |   0
>  drivers/reset/amlogic/reset-meson-aux.c       | 136 ++++++++++++++++
>  drivers/reset/amlogic/reset-meson-core.c      | 140 ++++++++++++++++
>  drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
>  drivers/reset/amlogic/reset-meson.h           |  28 ++++
>  drivers/reset/reset-meson.c                   | 153 ------------------
>  include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
>  11 files changed, 455 insertions(+), 169 deletions(-)
>  create mode 100644 drivers/reset/amlogic/Kconfig
>  create mode 100644 drivers/reset/amlogic/Makefile
>  rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
>  create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
>  create mode 100644 drivers/reset/amlogic/reset-meson-core.c
>  create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
>  create mode 100644 drivers/reset/amlogic/reset-meson.h
>  delete mode 100644 drivers/reset/reset-meson.c
>  create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h
> 

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
