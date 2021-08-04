Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAB0C4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 12:45:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EE6601FD
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 12:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38EE6601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bciXHShLmIOFKuyzi9naTE/uyyzryXz61yX+zQbMnWE=; b=1BAOOMZCXy/qQlgrc0rxeIz7Fg
	V1jrKPGe0C+EN5f3XykO7IF4p+P6xpFpoZ7ubw+GpmppBQiqiPf9qahIxo4ToBivDFFq8CYWMCFGI
	ddgpLBSF1rYOyFFMkM92fFC6SFY6Haja+XWiC2JFtWkPzuAzgNaXKP9bhWT/YZJ5lAQmpHBEobQ74
	+SQ0UidvnOSZ8JNsn2wqN8ZahMq4B20CqFIN2yAEERB6ctdYJycYw8FRY1ZQrK/hkslJFNYboDqam
	lITpFdKRKMzv+pF2eSm+1XzgdEPX4UypWabeYiHhMDi+ZM8SwgQrg01E4PhFbo53WJ2GYG6bALHYG
	V9BXHseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBGGz-0062da-H0; Wed, 04 Aug 2021 12:45:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBGGA-0061zc-Hx
 for linux-amlogic@lists.infradead.org; Wed, 04 Aug 2021 12:44:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id u15so1136621wmj.1
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Aug 2021 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lrTwnHoERuORHpP8BmbxNQaxIFslmRzMvjQ2TSzQzHg=;
 b=j+1tb86A7NTfge67ZbX4FCyjr7UqNJspwWPsBSbvVk+2kOkkUSUrKS8BeP5dGFC6aY
 GW5p0jfFy+lkST1oF2lwROnR8XvOI4iGOg2t3kTgZ07EF0DM9AgFWXDZzBlqNSWQwD3U
 bsksGK+5Z0L84I49hzpbBiGjgn53dcVEJcRFNH16QuEheG7+yHwoRRIfkuVo10OkoWs5
 y01TNJobw2Ca/Lny3mA8DGt/sRTUwZQZLLh71TT1wLHVE+zHHtyd1owUJmt0sOsS/Qfj
 GijWUmYZDQ6OBu0GPmBNeZ0L+lYR4XqXHFfiyXP9qnTGgBE8P8AHo0Wv126ivwnAJAzI
 nrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lrTwnHoERuORHpP8BmbxNQaxIFslmRzMvjQ2TSzQzHg=;
 b=rUrl7gzdETe53ra8rEQuOQHAbAd6UOmvKScPnIKfi2v4AipxBg2TO1vpEoD+T/6pfx
 yIQHa6dqSZpNZM2+LdTJPKkPVgfK2Rr4wRHt52aFT2LvZ1kb9atw2+M1rWjelQPtPu6O
 y8mR2RkVfyYiTCrdQ9DuTG7rgV69Nzftgr+fJqExvb/xFvugZ9wbX6O7xQuNW9LQmfQk
 ssApswBdXowECUUIe3CJawTSbk+Zhbqc5oRSbCKUJ+Edej+KwK5UfimBVnjINcMagkXx
 3ODl1KLeOYjYbYMntvRg4mGMCl3vc6QFl9uO7N9U/gl4aVgRPaFEo54Nn3ws9KZASIrO
 6UVQ==
X-Gm-Message-State: AOAM532sPHu0Ba3YVsVkJlELhOniW9K/EJVXOMrl4HvNn3VViqjBVD28
 PZRFctQtdsj+pIsFJmLa/94JLFpMs2Dv/Eme
X-Google-Smtp-Source: ABdhPJx4eoNQKnYuYW7xE4KklfihmgzVqmnKZncopKc045fEyO/oEDELbLy64AFKplWKauYXal36Gg==
X-Received: by 2002:a1c:1bcd:: with SMTP id
 b196mr26970270wmb.160.1628081072104; 
 Wed, 04 Aug 2021 05:44:32 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:de59:840f:2bf4:7e67?
 ([2001:861:44c0:66c0:de59:840f:2bf4:7e67])
 by smtp.gmail.com with ESMTPSA id d67sm6739464wmd.9.2021.08.04.05.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 05:44:31 -0700 (PDT)
Subject: Re: [PATCH] board: amlogic: odroid-n2: fix fdtfile suffix for n2-plus
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20210804110107.2127-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c892e443-78f5-4a77-9d17-d83b6b2df0a8@baylibre.com>
Date: Wed, 4 Aug 2021 14:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804110107.2127-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_054434_695404_2D17FE98 
X-CRM114-Status: GOOD (  18.56  )
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

On 04/08/2021 13:01, Christian Hewitt wrote:
> The N2+ dtb is meson-g12b-odroid-n2-plus.dtb, not n2_plus, so
> correct the suffix provided in the board file. Also align the
> board ident string shown during boot to match.
> 
> Fixes: 8bc780106c13 ("board: amlogic: odroid: add runtime detection of the N2/N2+/C4/HC4 variants")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  board/amlogic/odroid-n2/odroid-n2.c | 2 +-
>  configs/odroid-n2_defconfig         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/amlogic/odroid-n2/odroid-n2.c b/board/amlogic/odroid-n2/odroid-n2.c
> index 88a60f34fe..acfd107fc5 100644
> --- a/board/amlogic/odroid-n2/odroid-n2.c
> +++ b/board/amlogic/odroid-n2/odroid-n2.c
> @@ -48,7 +48,7 @@ static struct meson_odroid_boards {
>  	/* OdroidN2 rev 2019,2,7 */
>  	{ MESON_SOC_ID_G12B, 330 * 4, 350 * 4, "n2" },
>  	/* OdroidN2plus rev 2019,11,20 */
> -	{ MESON_SOC_ID_G12B, 410 * 4, 430 * 4, "n2_plus" },
> +	{ MESON_SOC_ID_G12B, 410 * 4, 430 * 4, "n2-plus" },
>  	/* OdroidC4 rev 2020,01,29 */
>  	{ MESON_SOC_ID_SM1,   80 * 4, 100 * 4, "c4" },
>  	/* OdroidHC4 rev 2019,12,10 */
> diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
> index bac44b61ab..1f718a3154 100644
> --- a/configs/odroid-n2_defconfig
> +++ b/configs/odroid-n2_defconfig
> @@ -9,7 +9,7 @@ CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-odroid-n2"
>  CONFIG_MESON_G12A=y
>  CONFIG_DEBUG_UART_BASE=0xff803000
>  CONFIG_DEBUG_UART_CLOCK=24000000
> -CONFIG_IDENT_STRING=" odroid-n2/n2_plus"
> +CONFIG_IDENT_STRING=" odroid-n2/n2-plus"
>  CONFIG_DEBUG_UART=y
>  CONFIG_OF_BOARD_SETUP=y
>  # CONFIG_DISPLAY_CPUINFO is not set
> 

Indeed, thx for the fix

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

If nobody complains I'll push it at the end of the week !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
