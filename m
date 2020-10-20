Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E329C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 23:18:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1EF1223BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 23:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KEbk2Hft";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fKVYaGX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1EF1223BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1tNMtgus8U022ejmQS4QtydPuGIz2ipN1POgzhNNsiY=; b=KEbk2HftkfME9zdXsVDXf+2tW
	kZCO7MTS/Fz1j7seYU8QOSkDZOyuD2FVxAWQwe0exyWSCPgac62qcuGgoc81WcTZazl/x0r455WOj
	cmmoWEwiEv/wmaMteho4bKqgd1ukTTSJg+qmNVI66HJUDibeYNdaQWlq2FvKyF6auvHIBU10fkYBb
	fbTztTBFoOHXVT2+C7m83OimhzViVPAk5PwfAhokS7BrZ1BspXmJUMvKA0ZtId5Fp4wxlKmeWR5sG
	76coOfHHn2krmIjNL6kwR64334jdVDsKqNNgjhpFm9+8Tt40WP+zhKHRouwSsP2sivwdeOuO/617c
	Wli93IEWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV0tq-0001jV-9F; Tue, 20 Oct 2020 23:18:38 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV0tn-0001iN-8s
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 23:18:36 +0000
Received: by mail-pg1-x543.google.com with SMTP id n16so254244pgv.13
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 16:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2wqgvG8HHvOH4aVEaKKNvxTjnCsiFpKpB4iBa9voxnM=;
 b=fKVYaGX7WM+dPst1qT3K6kcPzLP81IP/ceU8fyBoqKHqaa+l6FhVzKrogLJ4DxdW/w
 VLxbKL2j+3LivkFel5Yn/DCrkxTslkOBBEzFGCqum4HBzK9x4gDMCfdGvn4zjPwW4Nwm
 YHMQT8bPIpbcXtKFN3/sK1c/aLQqtgeyZpsSNjXWy/U1KALs8hWmO30nHLt2iI+Ohv14
 xHbkQamrxEi30Hxd7haxzXX1guOcLYWO88E6ppfkTpFbKk4HxPJOStazQBfcQFJK75AH
 OdiW5tpR8Uj0hwz3/AV80KsR52MGss1ktc8kLM6IUlZycIF7BMdDLGQWMNs4nqnyc31e
 OoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2wqgvG8HHvOH4aVEaKKNvxTjnCsiFpKpB4iBa9voxnM=;
 b=U79tfqR15ZIdhuEgXxevVsoMzapwU6Tb6ov7vDniLv+cbBvSP3n5HXIHjtHyuWoB/M
 maAjdHwIz5oHe+LEbgyPAByWdnSlrIpqZO+AWswTCXDh3YsvP1o5umCEY3icnDmfWErm
 aa6pe59+VHjKRMf5Zi8h1EZ+aTNrO0C9rOgL6sYnNKnNFZ3Mh0SYgRZe3k3KDM9MAwSe
 QSvoImvBRvFPrRM8aa5EmIFpBVhgUbvzkm3Qobuh05JcAXPuSQtWeWGU006ZIpIgwO8D
 RXeB4rVgmwKyJdYZONoCiixVcpB9O3SMwR0ukbzYOJ5LpQUAWcyWYn8ubI7U+zCuPNwd
 aQxg==
X-Gm-Message-State: AOAM532Qg2RXDPJiaQauQnLUK54LehSCoMwdfUi0koutUA5cQ3oZ/sV+
 yKrYMg/w7m8xrR+dPKmhjL2NkTaqEgmXbcm/
X-Google-Smtp-Source: ABdhPJzwAtKxmBx7kSlE0opZP+bvVbWO0/UxsnavNinj1fSw1OPF6+Mb2m3pQiwt6vpbJh13wnWaxg==
X-Received: by 2002:a62:1844:0:b029:152:80d3:8647 with SMTP id
 65-20020a6218440000b029015280d38647mr412213pfy.18.1603235913131; 
 Tue, 20 Oct 2020 16:18:33 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id n2sm185306pja.41.2020.10.20.16.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 16:18:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org
Subject: Re: [PATCH 2/2] arm64: meson: remove MESON_IRQ_GPIO selection
In-Reply-To: <20201020072532.949137-3-narmstrong@baylibre.com>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-3-narmstrong@baylibre.com>
Date: Tue, 20 Oct 2020 16:18:31 -0700
Message-ID: <7hv9f4ij08.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_191835_325156_59F5A5A6 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Selecting MESON_IRQ_GPIO forces it as built-in, but we may need to build it
> as a module, thus remove it here and let the "default ARCH_MESON" build as
> built-in by default with the option to switch it to module.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

I'll queue this one via the amlogic tree since we'll likely be removing
the rest of these selects soon too.

Kevin

> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cd58f8495c45..dfb66917f665 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -157,7 +157,6 @@ config ARCH_MESON
>  	select COMMON_CLK_GXBB
>  	select COMMON_CLK_AXG
>  	select COMMON_CLK_G12A
> -	select MESON_IRQ_GPIO
>  	help
>  	  This enables support for the arm64 based Amlogic SoCs
>  	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
