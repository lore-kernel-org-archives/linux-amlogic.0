Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57702C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 09:03:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31946509D
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 09:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31946509D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8+zS3GxNwdqS2lDTy4qWsjrZ0itFyOluwF5PY3phtVQ=; b=beeAoItOdyTHOIVTcMIvnvC41
	bw6Than/+wU3oEyV/AJW1ECig7sNGKDiekrIvGt5uBtjXW/DMMm/456TDsY0NSdXdQEa+4BiuxigQ
	iz/YC+sQyZP+MXzSOYM75de9LREien7Y7Xf174Ts+im9eGqDkicfYYEhXdF8p8nJMMievSqaEc9jX
	wBY2NoF47YvsupNUd5BEjWmCGck8mNE0R0NiFFkxuKoDphHs3TXXAGKZHF4P3rMK919OcPp6N995W
	q5zbF8YhnE+JS0/3AcT1nOwVvrlPMPozkBllee1EdYcr5sypiohfhMwSFXuDGrFA/Qs6MOYQtXws3
	xq3J1DWZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBnM-00G4ND-7d; Mon, 08 Mar 2021 09:03:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBn3-00G4Ga-He
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 09:03:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so3306872wmy.5
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 01:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VduCoy9cY/POZZOiEWzngRwLsbws5z84iVhRIR40VNU=;
 b=x2smg4jRl66r5msS9Ra8Bf5luC9Q4x3G6RAvuNOlXyTD3q3j34dQ5a3PbDZUa2fju7
 oNgDc6xvV0BdxK33za3HYCXXCD8jIzgTCtH1HOFRGXMnEBXk/Ysh8wCSsz12OOD6Z/R7
 JVfPefEYX1rYHDt4Tm9vzgz+nS7pQqxU7slmSukfGLTqmytPq/UZ5JPZ+TFSpovNCLQC
 fvg0KsYnt15PF4DiWfEJzIXIOrHq0aqn4/wEXosQ8KeUzv82BYLr+uiU1S033OPH2ZgO
 oYHQ1yIZ8Fe1WcUNa7N+hcs1Wtw2KLKogoaAZ5wHa6usk0GDk+m86y2UO+6vkdcQbXT0
 wBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VduCoy9cY/POZZOiEWzngRwLsbws5z84iVhRIR40VNU=;
 b=SSNlmXG46D/Z5L7yughg7re5t8y06bIHlzLh9L/qsveAVXRcJeBi/nddHOsUdpfCFb
 hKwiI7lfky8vdf/vbbLYC6CInJNshQqqBE673g+Pr9alZmhrWQKdosof2aEVux5vsqWm
 YgWJYPmyz0rPLshZ0QCfkQBckJNE+7JwtqKj2sWvuxPNBtAgFd1QTuSYjA9poytK2/jv
 6d6KT1CVGuHEtSEBO1gDXNBxNo0MEbsanGgl03qIdNJdyQirc4WrLmPf5L7gY2+HaLcT
 7X222jaQlXEReJ5k07+/dI9T8pd2yfSTdL7aEHK3GW3wtsSpu0ZSptH9epxmxlyazINY
 dOFw==
X-Gm-Message-State: AOAM532sX9G5QW6KpwoEkjvcWirJHCLEZXbsfpHA2Qs/zcmlYkcH47uj
 geGvkt+VBNceR/FBL/NZTs8zsg==
X-Google-Smtp-Source: ABdhPJw647ZQzOe1DVLylHSEYurbHed+mUA4hUQ1dLTxvO2puE2ijCTTxgq1I+MpUWWgSlIZkuJ7FQ==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr21301749wml.100.1615194180723; 
 Mon, 08 Mar 2021 01:03:00 -0800 (PST)
Received: from [192.168.1.10] ([88.164.51.138])
 by smtp.gmail.com with ESMTPSA id y10sm17441439wrl.19.2021.03.08.01.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 01:03:00 -0800 (PST)
Subject: Re: [PATCH] drm: meson_drv add shutdown function
To: Artem Lapkin <email2tema@gmail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com
References: <20210302042202.3728113-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c8570873-d518-16c2-b66c-36d9dba07db5@baylibre.com>
Date: Mon, 8 Mar 2021 10:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302042202.3728113-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_090301_845800_8405A8D2 
X-CRM114-Status: GOOD (  20.83  )
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

On 02/03/2021 05:22, Artem Lapkin wrote:
> Problem: random stucks on reboot stage about 1/20 stuck/reboots
> // debug kernel log
> [    4.496660] reboot: kernel restart prepare CMD:(null)
> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
> ...STUCK...
> 
> Solution: add shutdown function to meson_drm driver 
> // debug kernel log
> [    5.231896] reboot: kernel restart prepare CMD:(null)
> [    5.246135] [drm:meson_drv_shutdown]
> ...
> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
> [    5.338331] reboot: Restarting system
> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
> bl31 reboot reason: 0xd
> bl31 reboot reason: 0x0
> system cmd  1.
> ...REBOOT...
> 
> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
> and Odroid boards, WeTek Play2 (GXBB)
> 

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")

> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> 
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 42c5d3246..693bb1293 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
>  	return count;
>  }
>  
> +static void meson_drv_shutdown(struct platform_device *pdev)
> +{
> +	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> +	struct drm_device *drm = priv->drm;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +	drm_kms_helper_poll_fini(drm);
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
>  static int meson_drv_probe(struct platform_device *pdev)
>  {
>  	struct component_match *match = NULL;
> @@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>  
>  static struct platform_driver meson_drm_platform_driver = {
>  	.probe      = meson_drv_probe,
> +	.shutdown   = meson_drv_shutdown,
>  	.driver     = {
>  		.name	= "meson-drm",
>  		.of_match_table = dt_match,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
