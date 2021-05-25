Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7C5C2B9F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 07:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB9360FE3
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 07:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB9360FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fxOMTc31svdgaQ7UMh4bccN+L+hbPEqNyL+ALM9M2JI=; b=3zobBeLmGoFqnTeJh9sccWquY/
	t7eJ2y54I4q1t9jWXUWMavhpsAwwBEfXX9d+BkaQcsKu/RtMY/8x8HWrYc9VzamvMljJgx/0NmfzG
	yCTpr3CShtO9P+bGGtM7lfeS1iHHLx/W+BWfHnTxJ6ySFrN9JYw9zVYaD51V+Eh/xn+j2QXnj/VIC
	TG1h/G4h+8p6sR0fQSKc0CZmXQAzzIvB/xHOB0gIZRp4sHOiVGjqkP3+G1tKcg5lFDFD7EShEkVrj
	XT809WTXP2WKuntDMpheSH1Ts34C77fax3g8jSxDdTbINClXzx6X7L3LHIX8PqFGyKu/lrloWsFzB
	PKko5KOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llRTC-003syM-3g; Tue, 25 May 2021 07:27:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llRT8-003swr-Gc
 for linux-amlogic@lists.infradead.org; Tue, 25 May 2021 07:27:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so9574969wmq.0
 for <linux-amlogic@lists.infradead.org>; Tue, 25 May 2021 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ULzEBN0Jp6XpJ/GBCDjzUsE47Bj6V3OGDqs3nkCmBQ=;
 b=NfZNK3AP4Og/CCDj7YYSs3dxKXI9Yon/pw5TGBatv6Z3hbr71FBpaqjvfhyK00mUnl
 UIdBQiPqdFiqwOhmVUnNfwiV1y9R0umkNt4Tq0w+gZos6CmFq5RECL9MXuLRIQ7275Qq
 Gn822MmikBlAoDmGTjlFZkWki47X/e14d2JPNIsjYO+YmYRhHCufrKtatPJXvdkpt8nM
 Mjj12l2nlaOhCn+tfBhEr01K9++dRz3EyUJ4WNfwiWiqeZvhnjC6drVmX9Trd7PKhdrJ
 LpKweY3Q0tJHgXpqzwAm9sjT0HmmWfJXVQrZU+AkvDHHcMpfsBCQaPANLPWiGNGMNpMC
 H0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3ULzEBN0Jp6XpJ/GBCDjzUsE47Bj6V3OGDqs3nkCmBQ=;
 b=A48uwLpWo0GIVUbUbDYaR8LpcBT4SPi6DY3n2FCf8J5sAKGToAAinQ+aLjb4S1omYA
 79mGUCAzhF32AEywPy9rQWCnl9V74RyZ6ChIfg7sYGCX9xZ98xmYgLLcWTKY9CDJNEDx
 pNa4akdWCv2GMosk5ULllVF399DykrFjVjqhwYAGwNM0VIzE2rvPOJuAAyDWZvMo6Jwc
 QCwJnYGKD82e/io/cBn0ugEwi4++HQLaMuFr2cPbwsoDteEYd3Hb8/A+tqRc/srfVQax
 iqjzFJM3l5lHyIrg0oO1p/KE0QTop4EyrZWlPpIdxS2LafyOL9F7b5QJRiqeKtayQxWb
 e/zA==
X-Gm-Message-State: AOAM5314lX6qlc11Iz1T96FR9JIp4QW5N//3DNz5a0muWX+GFD+ipWK0
 GUYcMIFHLKtKTe6CnH9kmAtWvA==
X-Google-Smtp-Source: ABdhPJxyYxttWGaOHQK/+i3OGI3H2+FM/NOaYwrT/XMwPbrCsfvs/WLauniXQAHjriF6Y7oiTOIgDw==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr2458736wmf.58.1621927632859; 
 Tue, 25 May 2021 00:27:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1062:9531:8150:c5f3?
 ([2a01:e0a:90c:e290:1062:9531:8150:c5f3])
 by smtp.gmail.com with ESMTPSA id h14sm1932369wmb.1.2021.05.25.00.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:27:12 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0359d826-49d5-d724-b38e-012e3389ae43@baylibre.com>
Date: Tue, 25 May 2021 09:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430082744.3638743-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_002714_627855_28BCFCED 
X-CRM114-Status: GOOD (  20.88  )
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

On 30/04/2021 10:27, Neil Armstrong wrote:
> When main component is not probed, by example when the dw-hdmi module is
> not loaded yet or in probe defer, the following crash appears on shutdown:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> ...
> pc : meson_drv_shutdown+0x24/0x50
> lr : platform_drv_shutdown+0x20/0x30
> ...
> Call trace:
> meson_drv_shutdown+0x24/0x50
> platform_drv_shutdown+0x20/0x30
> device_shutdown+0x158/0x360
> kernel_restart_prepare+0x38/0x48
> kernel_restart+0x18/0x68
> __do_sys_reboot+0x224/0x250
> __arm64_sys_reboot+0x24/0x30
> ...
> 
> Simply check if the priv struct has been allocated before using it.
> 
> Fixes: fa0c16caf3d7 ("drm: meson_drv add shutdown function")
> Reported-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 453d8b4c5763..07fcd12dca16 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> -	struct drm_device *drm = priv->drm;
>  
> -	DRM_DEBUG_DRIVER("\n");
> -	drm_kms_helper_poll_fini(drm);
> -	drm_atomic_helper_shutdown(drm);
> +	if (!priv)
> +		return;
> +
> +	drm_kms_helper_poll_fini(priv->drm);
> +	drm_atomic_helper_shutdown(priv->drm);
>  }
>  
>  static int meson_drv_probe(struct platform_device *pdev)
> 

Applied to drm-misc-fixes

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
