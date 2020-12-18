Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5C7C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:42:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F60723A7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F60723A7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkx9IiT0r/nip35tUzLJNzIW1v9dzYtu/5DJeyjb9xA=; b=Eu6kJ4Mu3yGonMxeU6nTnK2YZI
	9qMFGZ6RUVKAxj9II1W6LxhuKbMzXblmmNOv6tyZMC5V0q6V3oMcQUyd/yXMB9BtqVc8AHD4MFC8x
	e5k9zDo09aCz/2Ri9+PUZ2jtmMUlGqUa51xdv/f6emeY8XTb4fD6UlNOZD0c92I6WTNfXXDxoHgMN
	muytK7w0BoPYfvUvdWGsTxDpaAYORanUB8KOH3KU6oSoVmV3bjEb/GPCNCy9SGKZpEfylTia0nyqR
	uapF/ODTIAKh45WQQnXEbgNsRIwmqA6GO+zjlIP4USNji0Ca/rkvlhXr1GrFVn/toaurNFF9CnPEZ
	oIlMWhNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqCHh-0002ZH-NV; Fri, 18 Dec 2020 09:42:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqCHf-0002Yo-AF
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 09:42:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id y17so1408578wrr.10
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rWjAeEtOXDa5d8yW88uulTvw7F7U7U+z+Rg+Cla3MVo=;
 b=xcn0o9ykZ/E6vWcG+b3B2Eu+/1IRL6OLOVkAGkhpRB3EBrfmyWPol4t2HSAcy1ueOg
 rBuYswIp61jvcMc7qUGVxeDL7DE9ACO6uTFA+oa8sBTgFK8RztZs0WHoPS/0v5DBWVTO
 extC4XYQJSZ2x4MOhFnBMIHTi+ZvBkFfxsKR1whbC1PS2ykFMXVOEkEUc0vKzwWx5yl/
 YSL9ZlxStxdHw8u5mVpZ0pMtdSyOeTuHUz1WSrIdo1knv0j38xdtnWAViOhN7ckxKNMv
 6jHXCZ+0dEUux0iQiLdXzzgVrIUaFlL+mSQyvVJ+rLR317uZdWtp9OwifAdIPRtjS/F7
 Fs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rWjAeEtOXDa5d8yW88uulTvw7F7U7U+z+Rg+Cla3MVo=;
 b=GsjLazenFeGDM9xhCtnSGT10ZOKufLPLyriehbpqbQVt9CvEstxSRDOLkUgGD6361j
 VnBF9jSEk0NbuUzIY9bLoXLe389bOCkuR/JMhpoDgyLgklDLXLleD6oVuU2GZUGsVb2H
 FV5tPGIyQ9FBgFpQXbnIV0bwEssNsmbW0uKt7ktvAhxsnokfy8GLWd1B8NqE1r5YmMNG
 N7HcuWfuVE6d5qn43PQWvrjmORRxlAuQGNCmMSKdfs1c/vph0y48rzqCU9Kbg6qOI9V7
 tVcpqI/kn7itdFR0f5AghLPrAxQpqxODuwTW0qUiTZKkH7vziOseP2ZsO23ZmL46FPh6
 OEig==
X-Gm-Message-State: AOAM532WJchvnbg5zUGj75eYkXxnjtVTRWHrsfStF+qdLHZX/9zlbHsW
 JD+HOSXOtY5rbULZM4MMBRSfUGpdqWkDZONY
X-Google-Smtp-Source: ABdhPJytl2T3ZE1fl/FHlL3bVDTEvCdCbLjx/lnhv46aIJDb5far+cWAIjicEqPaLuLa107eZsPasw==
X-Received: by 2002:adf:f70c:: with SMTP id r12mr3395645wrp.234.1608284565549; 
 Fri, 18 Dec 2020 01:42:45 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:d897:20cf:5b8c:50ad?
 ([2a01:e35:2ec0:82b0:d897:20cf:5b8c:50ad])
 by smtp.gmail.com with ESMTPSA id s20sm10532964wmj.46.2020.12.18.01.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 01:42:44 -0800 (PST)
Subject: Re: [PATCH 2/5] boards: amlogic: add Beelink S922X board family
 support
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20201218084545.29135-1-christianshewitt@gmail.com>
 <20201218084545.29135-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9cc2d431-9bc1-fef4-eb4b-a726e9c9b6fb@baylibre.com>
Date: Fri, 18 Dec 2020 10:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218084545.29135-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_044247_438360_FB682796 
X-CRM114-Status: GOOD (  20.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 18/12/2020 09:45, Christian Hewitt wrote:
> Copied from Odroid N2. Add myself as maintainer.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  board/amlogic/beelink-s922x/MAINTAINERS     |  9 ++++
>  board/amlogic/beelink-s922x/Makefile        |  6 +++
>  board/amlogic/beelink-s922x/beelink-s922x.c | 54 +++++++++++++++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 board/amlogic/beelink-s922x/MAINTAINERS
>  create mode 100644 board/amlogic/beelink-s922x/Makefile
>  create mode 100644 board/amlogic/beelink-s922x/beelink-s922x.c
> 
> diff --git a/board/amlogic/beelink-s922x/MAINTAINERS b/board/amlogic/beelink-s922x/MAINTAINERS
> new file mode 100644
> index 0000000000..7f223df4ae
> --- /dev/null
> +++ b/board/amlogic/beelink-s922x/MAINTAINERS
> @@ -0,0 +1,9 @@
> +BEELINK-S922X
> +M:	Christian Hewitt <christianshewitt@gmail.com>
> +S:	Maintained
> +L:	u-boot-amlogic@groups.io
> +F:	board/amlogic/beelink-s922x/
> +F:	configs/beelink-gtking_defconfig
> +F:	configs/beelink-gtkingpro_defconfig
> +F:	doc/board/amlogic/beelink-gtking.rst
> +F:	doc/board/amlogic/beelink-gtkingpro.rst
> diff --git a/board/amlogic/beelink-s922x/Makefile b/board/amlogic/beelink-s922x/Makefile
> new file mode 100644
> index 0000000000..27b1a74105
> --- /dev/null
> +++ b/board/amlogic/beelink-s922x/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# (C) Copyright 2020 BayLibre, SAS
> +# Author: Neil Armstrong <narmstrong@baylibre.com>
> +
> +obj-y	:= beelink-s922x.o
> diff --git a/board/amlogic/beelink-s922x/beelink-s922x.c b/board/amlogic/beelink-s922x/beelink-s922x.c
> new file mode 100644
> index 0000000000..dc0d933a39
> --- /dev/null
> +++ b/board/amlogic/beelink-s922x/beelink-s922x.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2020 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <env.h>
> +#include <init.h>
> +#include <net.h>
> +#include <asm/io.h>
> +#include <asm/arch/sm.h>
> +#include <asm/arch/eth.h>
> +#include <asm/arch/boot.h>
> +
> +#define EFUSE_MAC_OFFSET	20
> +#define EFUSE_MAC_SIZE		12
> +#define MAC_ADDR_LEN		6
> +
> +int misc_init_r(void)
> +{
> +	u8 mac_addr[MAC_ADDR_LEN];
> +	char efuse_mac_addr[EFUSE_MAC_SIZE], tmp[3];
> +	ssize_t len;
> +
> +	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG) &&
> +	    meson_get_soc_rev(tmp, sizeof(tmp)) > 0)
> +		env_set("soc_rev", tmp);
> +
> +	meson_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
> +
> +	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
> +		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
> +					  efuse_mac_addr, EFUSE_MAC_SIZE);
> +		if (len != EFUSE_MAC_SIZE)
> +			return 0;
> +
> +		/* MAC is stored in ASCII format, 1bytes = 2characters */
> +		for (int i = 0; i < 6; i++) {
> +			tmp[0] = efuse_mac_addr[i * 2];
> +			tmp[1] = efuse_mac_addr[i * 2 + 1];
> +			tmp[2] = '\0';
> +			mac_addr[i] = simple_strtoul(tmp, NULL, 16);
> +		}
> +
> +		if (is_valid_ethaddr(mac_addr))
> +			eth_env_set_enetaddr("ethaddr", mac_addr);
> +		else
> +			meson_generate_serial_ethaddr();
> +	}
> +
> +	return 0;
> +}
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
