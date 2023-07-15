Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE71FC001B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25kFHKgt7dumUj+iDyDGX1BaYkyFAKRfV1ptO7jDfCs=; b=ak7jUWD2R9KKCT
	AjH3aQevHH3wU79kevfIYrpCtsFDHeQqh/M9gmOTBcPehtfuK/UYnksW/q1KfItG/e3RpCiTd5x9r
	sL7U8ljUs18QrJSjIJFsc+ygCq47BleYSMgWn73Wtw9Z5nVhVgtckFU1qA1bHZ+S7fMvDNa/4CcpJ
	CNq88HWcfVS7eUAIwlQIQur2h+TpCp0urVVobfChkjp4G/7/II1QWPyQCZCBgtnZE640mUtRrL0xC
	51PwPkXqcAE63CeTFkfYqinSlM5Dk2saXaV5sgkKJaLoMknZONV5LWGgeABwN76qLgsUiv1pag5lr
	IKlYLm9CnMixsXjh4C+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgw9-0090vv-0Q;
	Sat, 15 Jul 2023 15:11:57 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgw3-0090tC-0h
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Jul 2023 15:11:54 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-346129c9512so6465675ab.1
        for <linux-amlogic@lists.infradead.org>; Sat, 15 Jul 2023 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433909; x=1692025909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
        b=KpbiwA9NRF8+W6tdUk7oAEajedYliLcT3fLwx1hKWNPafETFpJG9nnPmhVRp1UdI1a
         ec9mVwfBesk49WkdsrPfeQTQNowRCIhbKJuP16XD7dO7TZekJ8yDxNsj6kgUO5dmVinN
         O/xItmOPmt9BnCnKdfjfmpm5zf8eizKb7wHPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433909; x=1692025909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
        b=gH/nwRY3LABQd7JApS3u7LvMlCyXfOsyTVWoSnscz0tTqnVKwinVhbFxkNu/WQPuEO
         n1OVhnhkUzuG6YDazRVGnqv73tEykcuE1dCcIeCWpkkOwvMm+7M9e6rEszGTMqj9kRCA
         LffobZWw8Sr2JVChCXGFE6yy0AuLMIIb4rb4izZJNRqsBfN/3WWiP56l3I4+UBE4lf6V
         DxBmBHO9DjduW9Uwo+DQcGaw9RUyyQodpM57YuWZwpjdnvbMVSEsGOIQshDxy2UHBLp6
         PwkGb8ilcu9mqc4Qw2eXsTh2FLpmhZ5kjY1D/LqMs14iebSmXy1i4q91KKnfYqC+TyTd
         kg2g==
X-Gm-Message-State: ABy/qLbhytSYLn8EKSufjKfa/v2X01V2ZbeP+OiJhkDO8c2vHYILRDHc
	QQMXga2Kjgxir6AmzZzwlwDMTA==
X-Google-Smtp-Source: APBJJlGJVqbBu5lKEA54CgyQF24n/fOTJfhIYz9w3XH4VGOvH3KCmWksDsEmgsEiSCeG83sO26Hgmw==
X-Received: by 2002:a05:6e02:1148:b0:343:ef5e:8286 with SMTP id o8-20020a056e02114800b00343ef5e8286mr3847417ill.7.1689433909634;
        Sat, 15 Jul 2023 08:11:49 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id f8-20020a056638022800b0042b2959e6dcsm3321388jaq.87.2023.07.15.08.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:11:48 -0700 (PDT)
Message-ID: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
Date: Sat, 15 Jul 2023 10:11:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] net: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wpan@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org
References: <20230714174809.4060885-1-robh@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_081151_445636_532DD1E1 
X-CRM114-Status: GOOD (  14.74  )
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

On 7/14/23 12:48 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

(I significantly reduced the addressee list to permit the message
to be sent.)

For "drivers/net/ipa/ipa_main.c":

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/net/can/bxcan.c                                 | 1 -
>   drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
. . .
>   drivers/net/ieee802154/ca8210.c                         | 1 -
>   drivers/net/ipa/ipa_main.c                              | 2 +-
>   drivers/net/pcs/pcs-rzn1-miic.c                         | 1 +
>   drivers/net/phy/marvell-88x2222.c                       | 1 -
>   drivers/net/phy/mediatek-ge-soc.c                       | 2 --
>   drivers/net/wireless/ath/ath10k/ahb.c                   | 2 +-
>   drivers/net/wireless/ath/ath11k/qmi.c                   | 1 -
>   drivers/net/wireless/ath/wcn36xx/main.c                 | 3 +--
>   drivers/net/wireless/intersil/orinoco/airport.c         | 2 +-
>   drivers/net/wireless/mediatek/mt76/mt7915/soc.c         | 1 -
>   drivers/net/wireless/silabs/wfx/bus_sdio.c              | 2 +-
>   net/core/of_net.c                                       | 1 +
>   124 files changed, 110 insertions(+), 120 deletions(-)

. . .

> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 6a2f2fc2f501..da853353a5c7 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -13,8 +13,8 @@
>   #include <linux/firmware.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_device.h>
>   #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/soc/qcom/mdt_loader.h>

. . .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
