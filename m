Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76678C369CF
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Apr 2025 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oH3ZRrFAi7H1y7TT2eiFbdHdvlkrqDZRqbUGTGmABvM=; b=xSpk5/2fqWkyTS
	m0jMtby+aHaN5mI5a2ozOOMU2KLyNwBdceo0ZvImw2Kk/PquMmA5pUIMnikqL/ri2aaXhOhkeRtux
	EAWfWX+iCMq6Ae/ipO2MOr6KxRF39dz3KOQVlbsK94QmYUlztcnN2YpK3YeOhAblFCxScFTH7Tb9v
	IfHgQAko0B59GvSrOI3zI0/MJ+6hD960kG6g4/NQIlE+XUqp4/h5qH0FpiWfhh2ROQsS/few7+P0O
	1BbMGOToifmdUNV7wrZg5KeVLONKE8jDWQfd3Xxo5EM79niIZByXowufz9YtWsXSucWZSCQqL0iEj
	qO/YKEwRKX7suPSGzOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6R2T-00000002P0t-2zM2;
	Sun, 20 Apr 2025 09:32:37 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6R2Q-00000002P0M-1N0X;
	Sun, 20 Apr 2025 09:32:36 +0000
Received: from localhost (unknown [10.10.165.8])
	by mail.ispras.ru (Postfix) with ESMTPSA id ABE754076726;
	Sun, 20 Apr 2025 09:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ABE754076726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1745141546;
	bh=fWQY42eWCmlkXVWhry1af/CWnxEZndFo/0hIOaKShAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AS5dK+IKYudFHNvytmLk+fqj7yxTBZjUdVJCcuHfpJwstkabClzSTiwtPwAfKq/Ni
	 1uTL0d3nV+qGrUEpkz09E1oWlkkcgtdcDsX8bZzKHIUDIwRKpfFhQISndwdTZ2QQpQ
	 +kYUP272fI7LfR9Y2z3cZgPezv/ClCT/kEpObEJA=
Date: Sun, 20 Apr 2025 12:32:26 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux@martijnvandeventer.nl, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, neil.armstrong@linaro.org, 
	Furkan Kardame <f.kardame@manjaro.org>, Anastasia Belova <abelova@astralinux.ru>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
Message-ID: <mpoae5tfugsnvdyv5yzmiifr242mc62gouqqvql7ucjtdxo7b2@7y4plckbcdbn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_023234_859936_07905467 
X-CRM114-Status: GOOD (  10.14  )
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

Martin Blumenstingl wrote:
> @@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +dsi_encoder_remove:
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> +		meson_encoder_dsi_remove(priv);
> +hdmi_encoder_remove:
> +	meson_encoder_hdmi_remove(priv);
> +unbind_components:
> +	if (has_components)
> +		component_unbind_all(dev, drm);

As 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
states, it seems invalid to call component_unbind_all() before
drm_dev_put(). Wouldn't this patch reintroduce the problem here?

In that sense the diff proposed by Martijn <linux@martijnvandeventer.nl>
behaves more correctly.


I've also found this thread [1] with another error path fixing patch. It
was suggested to improve that fix with managed drm device [2] interfaces but
AFAICS using devm_drm_dev_alloc() will reintroduce the problem mentioned
in 6a044642988b, too.

I think [1] should be applied as well with Martijn's patch?

[1]: https://lore.kernel.org/dri-devel/20240809124725.17956-1-abelova@astralinux.ru/T/#u
[2]: https://lore.kernel.org/dri-devel/20240828110421.14956-1-abelova@astralinux.ru/T/#u


Thanks!

> +cvbs_encoder_remove:
> +	meson_encoder_cvbs_remove(priv);
>  exit_afbcd:
>  	if (priv->afbcd.ops)
>  		priv->afbcd.ops->exit(priv);
> @@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  free_drm:
>  	drm_dev_put(drm);
>  
> -	meson_encoder_dsi_remove(priv);
> -	meson_encoder_hdmi_remove(priv);
> -	meson_encoder_cvbs_remove(priv);
> -
> -	if (has_components)
> -		component_unbind_all(dev, drm);
> -
>  	return ret;
>  }
>  
> -- 
> 2.49.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
