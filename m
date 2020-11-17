Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CC5C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:56:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F79C2463B
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RjS0IAqi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UyfIEOSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F79C2463B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9WESnTctvVJL6X9Vy7evGNWhEmZnTu4hJdcZDF2yUK0=; b=RjS0IAqiCuPBkhbZbvEpbwH32
	2UAiAlCkSMk6WdfZQ1xXxoku3C6EHUVFYgPKaumDydAFzCu+Am3svk0rsnkP4kiunTpQweJ3kfHBJ
	8ILOTJAcPPnVp34YgnZd8v/ovk4DZaY5RQxVrwX1RY4ws16wkez8xTMVIkvoSLMqjkkspW2tEmvUj
	a94vx2+8TDWUvMmHxWCwLuS7zjJT6V0uOg4BaVlYE0vWJ+5aQ1kGiiVXRd+ejSI4Ye7yi+2Go0sh7
	1tr4MnoVwaepXWFlZXEYwJsd/mK+w74iy8Hwr9MyqSo+MQNmj0RKIEXnoiptKbzYrNp2O5X/qpr3b
	cEOjwND7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewnA-0005eJ-Rw; Tue, 17 Nov 2020 08:56:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewn8-0005d5-9C
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 08:56:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id c9so2442803wml.5
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 00:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c5KSmRDGEl3hsllqycry6twggKRm77CSW4Bz3AtEeY8=;
 b=UyfIEOSXvYzQ1LIRaFKRPYlrWX1ASBFgIjbVqn61zyzqbpvbnC7yzN5JMVwQ4opSQY
 XIJRsaU8UqDVbM0VwMuiBkT7QxOfmilsC+EJJ98XiQIXXHO8fDcTXjCtGc4gtSyEAZEU
 gUPddrSCjOzBs6T6RfiNnxrCjCVE38xgpaK0nZRVl+6RGAgGkUAgZt2UmsShJAAd5n5h
 VDlmwmnfqg/mKerenD4ViFtwBIVnQXognkvzDodTGXDuZevbujWhJ9+y3PwDxwKtV7hn
 zb2+7/BOztaXRFj/DNcwYEOjw36LSDqYzGs+I4J/fZjPQOgJOc8CVhJZxTWbXXMr5nx9
 vMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c5KSmRDGEl3hsllqycry6twggKRm77CSW4Bz3AtEeY8=;
 b=qIJ6RWYAVgBJ37K04mIJveXW1RVRWAZ7yIJA2XeIEFA5+Iu7yWoTVCccIrWe0qgDIe
 a/FOxzMErYZ5IDBoSNNCSv6m/TA/F9N/1/N+o+FAnM5ibc1pNND2rRXz8Wwzylps5OYt
 noso8C3zwTum8bEJlk/Ens7G/c4iETU3PHHzkHs95h0Oxolb7WoJd1oPshS0J/zf3gYS
 RwZnURsxnl3EFABmMlg7HdnhpXIVVFRZzu8ceM5prt4vbtrNcsbCaMYtRbwE4Ka6Bdml
 8t/0frmBnC2jtZLYyw1p5OW83cn8ED56yFyNq8AQQ3HpTIOX/eJtyXstUVuAOIHZWN+3
 rDiA==
X-Gm-Message-State: AOAM531cKFaY6R9sTBVifq822LSxgTr8QeV9uAV4QO79gfdB2hcC7cEK
 tlGvY5mJp/SCComoq929CjYGtw==
X-Google-Smtp-Source: ABdhPJzLbjV0aH2YnB54kKKTAJPIxDX5cz6OI23wPHCs0KmOkmTHyZSbhOCqkzklX19/yAwu8Qc+/A==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr3141555wmj.178.1605603405138; 
 Tue, 17 Nov 2020 00:56:45 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26?
 ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id q2sm25746294wru.76.2020.11.17.00.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:56:44 -0800 (PST)
Subject: Re: [PATCH 4/4] drm/meson: dw-hdmi: Ensure that clocks are enabled
 before touching the TOP registers
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20201116200744.495826-1-maz@kernel.org>
 <20201116200744.495826-5-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1a76accb-d6ee-49b0-8268-1123ac8f246e@baylibre.com>
Date: Tue, 17 Nov 2020 09:56:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116200744.495826-5-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_035646_367381_CDBAEB12 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/11/2020 21:07, Marc Zyngier wrote:
> Removing the meson-dw-hdmi module and re-inserting it results in a hang
> as the driver writes to HDMITX_TOP_SW_RESET. Similar effects can be seen
> when booting with mainline u-boot and using the u-boot provided DT (which
> is highly desirable).
> 
> The reason for the hang seem to be that the clocks are not always
> enabled by the time we enter meson_dw_hdmi_init(). Moving this call
> *after* dw_hdmi_probe() ensures that the clocks are enabled.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Fixes: 1374b8375c2e ("drm/meson: dw_hdmi: add resume/suspend hooks")

> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 68826cf9993f..7f8eea494147 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -1073,8 +1073,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	DRM_DEBUG_DRIVER("encoder initialized\n");
>  
> -	meson_dw_hdmi_init(meson_dw_hdmi);
> -
>  	/* Bridge / Connector */
>  
>  	dw_plat_data->priv_data = meson_dw_hdmi;
> @@ -1097,6 +1095,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
> +	meson_dw_hdmi_init(meson_dw_hdmi);
> +
>  	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
>  	if (next_bridge)
>  		drm_bridge_attach(encoder, next_bridge,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
