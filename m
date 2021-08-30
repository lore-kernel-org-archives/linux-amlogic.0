Return-Path: <SRS0=wk+L=NV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3441CC4320A
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:53:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E3860FE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03E3860FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BaXTAH6rs9VzFM84TQIITo7JuM7shKKzXmuO/OpNSyM=; b=nLDBP3dHEpm8+uLsF4IaAeVj0i
	wLYt/RhOmiBidnGywo0al0eUtLn4k5gKmXQuOy0zaFWQPpSJYYRLM3o18Apd75Fk2yRUUVcg6UzfV
	0uHQIiRiZhsQAAGVTzqKwLkIjkBHd98c9EzBOVem7Km+wQezW7c/1weeW+Hws3wwLOZtWJ12zfKAk
	/09wePc2Ol1W/TygWIADS3MwzA+WnFx/kVhWprD0Ws1bf+2nvo+dsv8uIz2oYkwAgqFtxN7R3syQk
	IzigkVEd05JTYnz0ZvggSVHFaZzC8/YFbgsAkIfsaPyoO07xkf5yWSCZdjaFQce31EDFC4e3JbwN2
	cD0yUvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKc6S-00GfEP-Ph; Mon, 30 Aug 2021 07:53:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKc6P-00GfDz-GV
 for linux-amlogic@lists.infradead.org; Mon, 30 Aug 2021 07:53:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso8773733wmr.1
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Aug 2021 00:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZrLDblg+umHBGeI1VjxWmfZIEDgjzyBb0DrpQ9tl9GA=;
 b=pAifsPeau8pmEKt4bWJHt+8nBuyxzMb1ThBax/89K8fH8CeoXTWlRciY8PnSpDJcAo
 a+IGvnM601Kp6WLVmiP02SFWyQSJeoDVF27DIQuvl5G5Myl8P6hzxFl4qExvimJ8vkS3
 N2bb6bSMW/5a0b7LXs++YJxEqVMG6kE6Yg9s9gcLwawXHtrFxRuLXKHDUUbUTHG/v+av
 puNvbMjCbCSCc/tBR49+DskabKdmbSPalirXQl65TnGwozX1K9YuUStKWvAXRfbxZFdj
 AfR4pjeeMluawJnwz6V0S/+OTprtJ/wy7BT0IUZyi2tQIb81CTVUCRNq8OlCxZMONeaA
 t1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZrLDblg+umHBGeI1VjxWmfZIEDgjzyBb0DrpQ9tl9GA=;
 b=mS98IUYiqWcfs9RpZ9qyw+72xytr3xY2hKYZntlagZxEmArgMp6uZcndzdZ0ewvxoC
 ZyusMs4YTdPB/YNBO6s/frx+Agb1VsGqHczjY0+BFpT7xi9jJOKVlBq/jYjXieRkEIjZ
 oDpvKetAYhTt0ONCPWK39n4HouL5QhpuhrzJ79lsLmoaJcwXuypZLaV3M3CHdPowepeG
 4eyVf0bWcFAD9Gsk5xOVNXwDpgem1zcOjqvQavoOi1MMhyN6S9Wy6dqQ1GXMRnD28KYT
 tHB7vEwECQR9Wd/wTPmxJoq4zX4/Dn7K2JyXO8+6GN1g0ron8oL/FD0hcxEE4ppo+bZv
 MLwA==
X-Gm-Message-State: AOAM532U8gvgpoYc4gC4w49WZCtK6K9Q10590J/30orj0fYkAYDyLsdt
 NqlEGVFeAOJusuwyU5ZVD/TmqN57eBJixPxh
X-Google-Smtp-Source: ABdhPJwSbDcWTUAWMkgtt+3LqJc6fr0yF+7+fP6sRuFSpoBcIwD450Zlw3euD1NRThh/3WlznUMeAQ==
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr30890953wmz.174.1630309987647; 
 Mon, 30 Aug 2021 00:53:07 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2ecd:4eac:486d:7a1?
 ([2001:861:44c0:66c0:2ecd:4eac:486d:7a1])
 by smtp.gmail.com with ESMTPSA id z5sm18847504wmp.26.2021.08.30.00.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 00:53:07 -0700 (PDT)
Subject: Re: [PATCH] ARM: meson: Add S905Y2 SOC ID
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20210820021836.1024-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <06547fcd-2881-3601-d02f-77df56b9a258@baylibre.com>
Date: Mon, 30 Aug 2021 09:53:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820021836.1024-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_005310_039271_429BB7D6 
X-CRM114-Status: GOOD (  15.61  )
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

On 20/08/2021 04:18, Christian Hewitt wrote:
> Add the SOC ID for the S905Y2 to board info, see below for before/after
> tested with a Radxa Zero board:
> 
> SoC:   Amlogic Meson G12A (Unknown) Revision 28:b (30:2)
> SoC:   Amlogic Meson G12A (S905Y2) Revision 28:b (30:2)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm/mach-meson/board-info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-meson/board-info.c b/arch/arm/mach-meson/board-info.c
> index d16d3f194d..2421acd817 100644
> --- a/arch/arm/mach-meson/board-info.c
> +++ b/arch/arm/mach-meson/board-info.c
> @@ -64,6 +64,7 @@ static const struct meson_gx_package_id {
>  	{ "A113X",  0x25, 0x37, 0xff },
>  	{ "A113D",  0x25, 0x22, 0xff },
>  	{ "S905D2", 0x28, 0x10, 0xf0 },
> +	{ "S905Y2", 0x28, 0x30, 0xf0 },
>  	{ "S905X2", 0x28, 0x40, 0xf0 },
>  	{ "A311D",  0x29, 0x10, 0xf0 },
>  	{ "S922X",  0x29, 0x40, 0xf0 },
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
