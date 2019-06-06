Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96397C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68CC620652
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U2Y+Ghob";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qETdpu1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68CC620652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEl/Nri/yntBYW2q28nGnbqYpTUu7wNkrvfFDnszM/U=; b=U2Y+GhobZQFRXH
	qAMCrg72Bz+yQ0RhuWzvsJmhcGrhmVmcqayygWFJRYZdT3OMrMWjE+hJAALJJkxVDxIKtnzewctM5
	1iozGEaiKKb2O7nFbnKeH2Hltf4y4Tu+Rg/D0DROLB4K+nEiNCsU1dFuZqgETmu6cwyoyuvW1Tc9Y
	pXQll3u7slZe+n1MdydGz+LJY+HiaccxnhuhjKIioBb5EJP5t1qkyhSHQSkTTvQtcO1H3b5w02rzv
	HJbVoFxLLruGdF7EkwrRuQ7GNiu5hsI14l3dxjgLYvJ/eKO2LqUtg/v7U0fNjVHQhZJmVJhwboQhr
	JwQSzcgeP4wr2L3abd+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYvI3-0006jo-FM; Thu, 06 Jun 2019 16:30:59 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvHz-0006im-VP
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 16:30:57 +0000
Received: by mail-pg1-x541.google.com with SMTP id h2so1665720pgg.1
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HUlzUdoZEuwBcIsFcfZEEwizXh8qoMoVTwGXgk651gw=;
 b=qETdpu1fq3YKAf+PIZM1StDrgV04HFfNxDbOwFwICih/0OGyExQlCsDvVUOYGpik2Y
 2gjJfDYHyR1f73PJKlKkPLUz0l0GTn/HYutjpmDgQis3C/fLVHDiMPAHQWe5abO1CxR5
 gzEYFYbOrID4vQAzWHjf9Km7CDWQ+YgyDk6XU59IjAjlriBoJDBeFpD1qYriONA0b96g
 as+fClyo/e/mPDsvW3CinLUXehamtCIGCz+GWe39ZTYfBfsTJCpXWi5sbo6KcpZH4vfU
 65XNfvzv4dThucKEFN8kGfxpVv32WFy2ilzisbYA6jRwPLAp4Ty+WQbW+p7s0mzzxyfP
 PCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HUlzUdoZEuwBcIsFcfZEEwizXh8qoMoVTwGXgk651gw=;
 b=WrBQaiRS0hdhH9xCrIYKkrjjteI10RapIiVqKn5EWdJ4uVpXaNhXogDxilzUZ/PZ91
 qSisaCWdmxpNduiqhFyFJ41ho82nja/G7TIwlObBgoAutnPZNhT1zlmJPqjoWfezBIOM
 RV+8MbQSEwBHi0OGYMLfzwj0WkarsWih/WhQOWw3pL4A4860OYC9kw1wvK33QclDhlU9
 KBnnd7tBmu+Ip6KOjWQOeSfoz3c16Hgg6dFgTxGeuJcL+Z0SF947kOfePYoUsf4I3kpw
 moBHk5ED4LrbmDdnG0Sm7XwyO92JAdgX8+epAxItrwAOvOZOLeqxuvBwYcbjuUdMvELj
 faFA==
X-Gm-Message-State: APjAAAVby1GSRb1hII5dnFojVU87HnOdJMsXlrzl3wxXNjmBBOF4Jrw6
 V75V2jqjIW7bhQ96leL+/TzTKuvVQMc=
X-Google-Smtp-Source: APXvYqwWK98UYLF0wDJKBybt9Rv8pjx46kTpnSnQ3dBiL60FgKPLRXlPXhLbIuisO9V+PN/eTZZzkQ==
X-Received: by 2002:a62:2983:: with SMTP id
 p125mr13170922pfp.154.1559838654627; 
 Thu, 06 Jun 2019 09:30:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g8sm2370035pgd.29.2019.06.06.09.30.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:30:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: fix G12A HDMI PLL settings for 4K60 1000/1001
 variations
In-Reply-To: <20190605125320.8708-1-narmstrong@baylibre.com>
References: <20190605125320.8708-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:30:52 -0700
Message-ID: <7hh892fzgj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_093056_006036_44C53B06 
X-CRM114-Status: GOOD (  13.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The Amlogic G12A HDMI PLL needs some specific settings to lock with
> different fractional values for the 5,4GHz mode.
>
> Handle the 1000/1001 variation fractional case here to avoid having
> the PLL in an non lockable state.
>
> Fixes: 202b9808f8ed ("drm/meson: Add G12A Video Clock setup")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_vclk.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 44250eff8a3f..83fc2fc82001 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -553,8 +553,17 @@ void meson_hdmi_pll_set_params(struct meson_drm *priv, unsigned int m,
>  
>  		/* G12A HDMI PLL Needs specific parameters for 5.4GHz */
>  		if (m >= 0xf7) {
> -			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0xea68dc00);
> -			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5, 0x65771290);
> +			if (frac < 0x10000) {
> +				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4,
> +							0x6a685c00);
> +				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5,
> +							0x11551293);
> +			} else {
> +				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4,
> +							0xea68dc00);
> +				regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL5,
> +							0x65771290);
> +			}
>  			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL6, 0x39272000);
>  			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL7, 0x55540000);
>  		} else {

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

nit: this is continuing with more magic constants, and it would be nice
to have them converted to #define'd bitfields.  But since that isn't a
new problem in this patch, it's fine to cleanup later.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
