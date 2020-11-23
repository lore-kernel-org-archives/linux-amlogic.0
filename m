Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9DCC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:03:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BBA92075A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rD57A20R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lYFt4ET2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BBA92075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HVMW/nWgQqLXcrPg79tOeHuxgu8sZzjjZN24u/1CG+E=; b=rD57A20RJPE+GDNz7TThB1mtU
	NIqQCyJtPSEsQmhdaRLlt0uCpPT6sdD//kzhIy1israQSkfUPn/KwEytZ4L8YLcZ0XnPOJBZoDVBP
	eYbHjWxSiL69RbMVNh970IA2k4gyduNJUFum9aZag7lWlWAk4uAJemoI1/sZdbY3iJO/qzLI6MY+P
	ygpYjNoqo89BR69iq7gVYQFlttxBvNDAAMMl7aGynsQr5U8yix9VlqRKkRtq1VC24S3jcxmN9Rc1F
	qByeFD1rDrsYd4+5cKpeh4gkWuOJ/ixnCE4LJcRh9Yd54cRRk9f0SXy3S2RbpEwLzXwPbw/7vFXR1
	0lKRwxm+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCRW-0002Xc-V8; Mon, 23 Nov 2020 14:03:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCRR-0002VT-SQ
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 14:03:43 +0000
Received: by mail-wm1-x343.google.com with SMTP id w24so17362711wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=vXp3Sxctq9VkObljnq0YBLK27eqIoDcu7q1uLV6sriI=;
 b=lYFt4ET27fdwgzZV6Gkc4ybnFVihvBTJaIa6rJ+vsitRg1hhECDLPMNrdpsgFQdmOV
 0PTTMUTD+GZaxQySyfd5XbbEFujkcJjieVRlxFDe2/cD7kUTHyl3x8+xjDTROhn/uE8j
 5szxCxVKimS4TgY7ddfjMuND/xhWdZtPeKnv22na0aqW4L7tpe3g64rtV9D4Mh6JmQGj
 uH3GPwVwP9bDxDOFnpKADgK3RvvxajRKflO4Jh6QR0VkwDZIhAEhr/F6hNFeQX96NQYR
 UFBgfSgnWtnabYKvAS52Dmla9BQ1+EtyRfZ5vPL1hctcZTHhwrfBLfz540p28PkzWkzz
 9DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=vXp3Sxctq9VkObljnq0YBLK27eqIoDcu7q1uLV6sriI=;
 b=seYSLKzu7REU2Io7NMi2hiB2hot0UQP6BfcrLpMU3RMi6P1UkwAkEksX6cQvD7PKaj
 N6itij5vtxhg4wZYEqMpapdJGxm4GUMqZWnknptqgtgK1Iw/KdPcOV+3roKmVU7ui9f2
 m3z3Az3MIYWmJxMA/5uAxRRKQTc15cy6/FPbZ13GsnbOalQaBp2CUcxnQaYZgvMUJOTC
 X//J1AHwf+l4yqYRMGd+ALbxTX7bAZopnNP2sjjrlWhaksLvR2p5pvc8Fj9gOAXPdCq0
 dP8v3rGaNLd9vgfJY+xNkZybKHWzT9MFb+xQSuWBp2MSs1LOdoUhR29+iNGnRmzqcGdV
 od+A==
X-Gm-Message-State: AOAM533LfAtCaPHMcElRQl5og+u6Xlm9cUeuh2Vf7euhenVUNMBQUf3H
 0dCfddI3CeadCOMwSHlv2MRzWQ==
X-Google-Smtp-Source: ABdhPJw3gonmwJioLtDDPdO6LRztyMyzSHRvtjQP+sbEh6Jcgi2gQk8QcqDyOUwDBlBkeT0oTnf5sQ==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr7258057wmc.67.1606140219296; 
 Mon, 23 Nov 2020 06:03:39 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id x4sm4284619wrv.81.2020.11.23.06.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:03:38 -0800 (PST)
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-2-maz@kernel.org>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] drm/meson: dw-hdmi: Disable clocks on driver teardown
In-reply-to: <20201120094205.525228-2-maz@kernel.org>
Message-ID: <1jwnyc41c6.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 23 Nov 2020 15:03:37 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_090342_020416_F27FB98A 
X-CRM114-Status: GOOD (  21.12  )
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
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 20 Nov 2020 at 10:42, Marc Zyngier <maz@kernel.org> wrote:

> The HDMI driver request clocks early, but never disable them, leaving
> the clocks on even when the driver is removed.
>
> Fix it by slightly refactoring the clock code, and register a devm
> action that will eventually disable/unprepare the enabled clocks.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 7f8eea494147..29623b309cb1 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -145,8 +145,6 @@ struct meson_dw_hdmi {
>  	struct reset_control *hdmitx_apb;
>  	struct reset_control *hdmitx_ctrl;
>  	struct reset_control *hdmitx_phy;
> -	struct clk *hdmi_pclk;
> -	struct clk *venci_clk;
>  	struct regulator *hdmi_supply;
>  	u32 irq_stat;
>  	struct dw_hdmi *hdmi;
> @@ -946,6 +944,29 @@ static void meson_disable_regulator(void *data)
>  	regulator_disable(data);
>  }
>  
> +static void meson_disable_clk(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
> +static int meson_enable_clk(struct device *dev, char *name)
> +{
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = devm_clk_get(dev, name);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Unable to get %s pclk\n", name);
> +		return PTR_ERR(clk);
> +	}
> +
> +	ret = clk_prepare_enable(clk);
> +	if (!ret)
> +		ret = devm_add_action_or_reset(dev, meson_disable_clk,
> clk);

Thanks for fixing this Marc.

FYI, while it is fine to declare a function to disable the clocks, a quick
cast may avoid it

devm_add_action_or_reset(dev, (void(*)(void *))clk_disable_unprepare, clk);

> +
> +	return ret;
> +}
> +
>  static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  				void *data)
>  {
> @@ -1026,19 +1047,13 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (IS_ERR(meson_dw_hdmi->hdmitx))
>  		return PTR_ERR(meson_dw_hdmi->hdmitx);
>  
> -	meson_dw_hdmi->hdmi_pclk = devm_clk_get(dev, "isfr");
> -	if (IS_ERR(meson_dw_hdmi->hdmi_pclk)) {
> -		dev_err(dev, "Unable to get HDMI pclk\n");
> -		return PTR_ERR(meson_dw_hdmi->hdmi_pclk);
> -	}
> -	clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
> +	ret = meson_enable_clk(dev, "isfr");
> +	if (ret)
> +		return ret;
>  
> -	meson_dw_hdmi->venci_clk = devm_clk_get(dev, "venci");
> -	if (IS_ERR(meson_dw_hdmi->venci_clk)) {
> -		dev_err(dev, "Unable to get venci clk\n");
> -		return PTR_ERR(meson_dw_hdmi->venci_clk);
> -	}
> -	clk_prepare_enable(meson_dw_hdmi->venci_clk);
> +	ret = meson_enable_clk(dev, "venci");
> +	if (ret)
> +		return ret;
>  
>  	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>  					      &meson_dw_hdmi_regmap_config);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
