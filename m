Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BA3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CgN3jB5NWCGTYx/s8wXgliAv/xBCMoyhd9Lf/GiSW4I=; b=usvfrXYbUjzsq72mB6O5AgWQae
	7aklsG+UBGffzR0pFVBfoOgcJ0sQg78RuizYGYzQOKRlHR3161gT/+1v1m5pHYVPhdDcnP+UL1F34
	hr+TlBdUyiVfTZXu+w2YN9SvtKBEvfCraRculO8SiOpr8j8fhStUR8a40Jr/PXKISkDSuDZPGH2zV
	Q0FK7ri+uBCgH2S8KUR68tclfUQKc4TRSmXnvanrLcDf8S/2peUfrxGuebgv57GR/0waVj+GLCe8Z
	1CzOeNSECOgc3oE2mGFouUGxgDJsCYKTY6ZtlzrKvjYjHZP8ErYuiCoctRnfla7DpVCcyc1ZLi7Pv
	DCOnfygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwlPw-009hG1-9A; Mon, 13 Dec 2021 13:31:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwlPs-009hCM-0H
 for linux-amlogic@lists.infradead.org; Mon, 13 Dec 2021 13:30:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id y196so11897631wmc.3
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Dec 2021 05:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r2HS8LXycqYlvkyk1XtSS91naiCW1cjlSGDJBqmdHWg=;
 b=RUCPa4BU55mGZ3TPxnm4P9VciYv4X75/TbhC+EkFMF61gjOKbFsj5x49+Ef4rCRs0y
 CjN/eRIvxorXtf5guYPabAbXaRmpiQQB/t9gB+FOiMM2fXsIJpuUqTbmEjW4Tvf3+TOV
 zlHbinqcNCTNdGL6iyXFR5f/ulG5ButbS/JmOy1gErM30r0DBGytKnLJ4nFx0FmzoDkz
 /+8+8wCetkc8kX0RxeS0qbLymfqJMSHlAfD9IFapDXQDT1yYPUycajrNjucdZPgfVf4O
 WhnBvW/AsrmRm95+9g/Eo/9xMzQbeNQ0OuziNbYZNHZvIMuoEN130pKeF11Qpd1DDbjJ
 B6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r2HS8LXycqYlvkyk1XtSS91naiCW1cjlSGDJBqmdHWg=;
 b=OXHtiRbg3xrg3btqIpjVCZi0r+TEfo8yzct4hPBC04WdtkwIRsYw2xAUtzIVlzDmRJ
 odfb4gM+IAVRAsJaCJpTzJsHZKZw8T+hFdpEZ9dOeI/zGBsUr270Y9gGGsOEaBnv0w3c
 VH9TNX3iVpfUWNB6QP2nQfCqjvRHcgQ1YCCyd31FPXekee2n+qnUahXnz6WtFieIFGQN
 aad2jQNNfZKM49c15CfKmbpOnSXwj6agsy1IUTyP8Q0VnOZDZVrylsiHMbNdgCG8ag6k
 usVNS+FWokqMsCaWI000ybNxd8hwEg6bw18X/0FHQyabrxh6YKHZrV2l7mL11iNUB+2g
 xwuA==
X-Gm-Message-State: AOAM533Y4Wd/ODCs5gubnXksvx6/iyuDGrKyfyxTDlFDTrzo3bE07zRH
 A3BHg2JJgx6wPdpmsQ0uW9oGMg==
X-Google-Smtp-Source: ABdhPJyWkKnbNBpJs/AcEzDRZ6MIPMKl4r6vPgd/oMbTn650gQez7KXqYtOuijioggr4iU7HWEvJcg==
X-Received: by 2002:a05:600c:3c85:: with SMTP id
 bg5mr37251416wmb.58.1639402254025; 
 Mon, 13 Dec 2021 05:30:54 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:3328:f8ef:d20f:532a?
 ([2001:861:44c0:66c0:3328:f8ef:d20f:532a])
 by smtp.gmail.com with ESMTPSA id g124sm7083697wme.28.2021.12.13.05.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 05:30:53 -0800 (PST)
Subject: Re: [PATCH v5 0/3] usb: meson: fix shared reset control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, khilman@baylibre.com
Cc: p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20211212201844.114949-1-aouledameur@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <91db0d03-aa52-9810-8831-b5e44793a4d4@baylibre.com>
Date: Mon, 13 Dec 2021 14:30:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_053056_126203_793518A4 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Amljad,

On 12/12/2021 21:18, Amjad Ouled-Ameur wrote:
> This patchset fixes a usb suspend warning seen on the libretech-cc by
> using reset_control_rearm() call of the reset framework API. 
> This call allows a reset consummer to release the reset line even when 
> just triggered so that it may be triggered again by other reset
> consummers.
> 
> reset_control_(de)assert() calls are called, in some meson usb drivers, 
> on a shared reset line when reset_control_reset has been used. This is not
> allowed by the reset framework.
> 
> Finally the meson usb drivers are updated to use this new call, which
> solves the suspend issue addressed by the previous reverted 
> commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
> use").
> 
> changes since v4:
> - call reset_control_rearm() after clk_prepare_enable() fails
> 
> Amjad Ouled-Ameur (3):
>   phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
>   phy: amlogic: meson8b-usb2: Use dev_err_probe()
>   phy: amlogic: meson8b-usb2: fix shared reset control use
> 
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
>  drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 

For whole serie:

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks for fixing that !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
