Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C07C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513BF20663
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2p9XJp1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fnv8tMY0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 513BF20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svFWumgCPvC/lgmeREOfKFaw0UFxL3t/waBoaMczHo0=; b=C2p9XJp1EpC4OC
	sbrhX8GammF8nm5sppKFHOpeVaNP53X09wcUpUMoTDobnLkZRhXbPzMKswNXFxxl8T99v1eaMoDQw
	Y5aASRs37OObapjqrFhv3onhnZ1wbCkfUzMYTnwqfVVgs2UzXXQmgv3AnI8PChKbqnDvd0mFZPuUc
	rsZD9R71TNI1gz/LghCG8QOcV1SBfbRrUMIzjwFL/7cIgxWW2/CwwtGwkEYB5MdsIvrrBd3rcIwwM
	Rq5SK3zh9hfRl0JGn5gz833YJIQ7QyNtAnDvplP68dJmxFOccuZjtTl1g/s3Y88UlgDa0ghJdHddH
	n84LEuu7tIJrNQ63POAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmLO-0007C7-SY; Tue, 09 Apr 2019 08:43:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmLM-0007Aq-D3
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:43:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id a184so2431798wma.2
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=xujZFl7+mdLrITdSmQph4p4nUeZGxoKQhCsVJeIsGCI=;
 b=Fnv8tMY00LRKWvdQcKO3+D1iN3jujpEgawAVIcc/f29A5jD1oh9gXCKdKfuZgJfx0M
 5yUYYyHd/Jh3z1vi0QdHOFWJfZNXgQ5Hfo4vpLvTZmXVtFEUkchLIJzleYnmEv0rz2Sg
 d5+JCTmby3YSPXsMA+38wcNxSHE99tDn2GO2CHFB/seJsYu8sRiKGPf40NxThUwrYjj/
 BrAwyOWPzQc5h87iO6KzUO+jNUvr62uc5g8h8+iYi85tvdWqPgWujfG704KycP0yyW6q
 +NqjHYMXgphLBLtmvuVfOYLmIEXv+FrFh/SToEpwbk5Xys/jS3Bx88TE0rOx64l0Ef4q
 V/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xujZFl7+mdLrITdSmQph4p4nUeZGxoKQhCsVJeIsGCI=;
 b=SSixk8Xg5AtcbI6sUhve5RbzxWe5zPN21fbVbqayjvIvL1CTwM9pY61jE24MGd+qOt
 ZB4uPrg0CQFifeAaSTgBQeHzJimv1lmwbGuqaQHNNfHsleF5LctASLdWtlyA2ZXNapwy
 OWnc6UdJrMe1K8ZT+kwEcYAy/gMaK6ZrU4BxaQCEWToXaTN730erRwqhQJTxRMP4TM+S
 RksCdiQ/Y3ruEX74U4jDjffGTvNUUM5hc3wZq5SDPg8viWY4X9QVgsK5B51rDhCt60WO
 ZWy4lBSFvUdCEtaQRana0aWR9xgjVrQdrZxk+/UGpFzozyutGEiEfcdnl9qrB5Et4Tf5
 Ze4g==
X-Gm-Message-State: APjAAAUW2t+ZkTfu5alXYpecnlZSEdwSRnL/XvkT/X/LCbJn0EyDXFPF
 im4ws9pjxZk4NjkPtsMPa1/DSQ==
X-Google-Smtp-Source: APXvYqwXlCbKIR4f2RliTNtIcOOhdK2k3B1AWnP1a3bXBKPQpcUVT17DOyrrL5Trg9+dxSLFsMC/7w==
X-Received: by 2002:a1c:9991:: with SMTP id b139mr19664950wme.53.1554799379124; 
 Tue, 09 Apr 2019 01:42:59 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 q3sm42779575wrr.75.2019.04.09.01.42.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Apr 2019 01:42:58 -0700 (PDT)
Message-ID: <824430c056a151003d82755a00a06263be1d877e.camel@baylibre.com>
Subject: Re: [PATCH 06/11] drm/meson: Add G12A Support for the Overlay video
 plane
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Date: Tue, 09 Apr 2019 10:42:57 +0200
In-Reply-To: <20190325141824.21259-7-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
 <20190325141824.21259-7-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_014300_510627_16FA796E 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
> Amlogic G12A SoC supports the same set of Video Planes, but now
> are handled by the new OSD plane blender module.
> 
> This patch uses the same VD1 plane for G12A, using the exact same scaler
> and VD11 setup registers, except using the new blender register to
> disable the plane.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_overlay.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index b54a22e483b9..bdbf925ff3e8 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -516,8 +516,14 @@ static void meson_overlay_atomic_disable(struct drm_plane *plane,
>  	priv->viu.vd1_enabled = false;
>  
>  	/* Disable VD1 */
> -	writel_bits_relaxed(VPP_VD1_POSTBLEND | VPP_VD1_PREBLEND, 0,
> -			    priv->io_base + _REG(VPP_MISC));
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
> +		writel_relaxed(0, priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
> +		writel_relaxed(0, priv->io_base + _REG(VD2_BLEND_SRC_CTRL));
> +		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_GEN_REG + 0x17b0));
> +		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_GEN_REG + 0x17b0));

Is it possible to add a comment explaining this 0x17b0 value ?

> +	} else
> +		writel_bits_relaxed(VPP_VD1_POSTBLEND | VPP_VD1_PREBLEND, 0,
> +				    priv->io_base + _REG(VPP_MISC));
>  
>  }
>  



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
