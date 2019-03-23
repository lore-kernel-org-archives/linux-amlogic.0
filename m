Return-Path: <SRS0=10CR=R2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6540C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80094218E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="paaMoBdz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mwI9m3BS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80094218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnRLX4yKlBjZwGeeRtqwUDc/i/TJl1jCkn+OqA/7zAk=; b=paaMoBdzPjfreP
	skY77XJBheUXb0OHkLrYu5bcrpq8nFX3dS+e9MKkiIypQIiSWYW5sIiMiEMfztvuPxmgFIR5jOpoR
	oHUxvSruNeQeaeYmja0+RunxZFoPZT2VonRMiEioHZFVsZM2yrm5WqXDCDhk7k2UDBhIFVLL3fVgt
	7vE849qvXkE0vAWgJyf2dAvKdZRs3Hp/6aF4TjASTd+I7sdsFZA3H2l6aH9UnxUchB3rZR+4FReK+
	UAecQYSjNNJzCjkwpSjxM0nArhMKCOJzl1MktHPj8sLAysimSAUE92bN8iVQigxcwhMsGmS+xIk5a
	QRWZ6dEekN724xXFOmnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7dLh-0000Gk-Ib; Sat, 23 Mar 2019 09:53:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7dLY-00008Y-0h
 for linux-amlogic@lists.infradead.org; Sat, 23 Mar 2019 09:53:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id y197so4347661wmd.0
 for <linux-amlogic@lists.infradead.org>; Sat, 23 Mar 2019 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=AqTw3EBFlRCQbfKZ0zY3HVveDzcE568cKPxJY5uy/KY=;
 b=mwI9m3BSRpS67Niq9PXBpjlBZK5SE5DemOE8eWmDSoh1IPtO1VOiUfc3DZh0OzO0cI
 rDEYTPZuvvGT+h/aZrtLjpM5VhUdHrcySPC2y8buq/bDis3V80hQH5F4mkQ1h6t4AO+N
 +eL9ZQrZENaFMuM3zQs3Axtsao5X0HCnkhz2QV9Gm5RIKlynzwlmrSArnuHR+rKHzilr
 UcyIw1yXOiFtzdvx+EaK9eDPekHEjnFUmgd+LVquOmKOlJ2d5DFKekGAej86yPSIvDf0
 KedJhyyOadaxsopsZEhma+D6M4D0r+Vqg6DqNlAuCR2floFTyyr4lZ4VT3seYMuf8Ziq
 fJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=AqTw3EBFlRCQbfKZ0zY3HVveDzcE568cKPxJY5uy/KY=;
 b=oKFgLvcrLHW3lUEika69GfgQ5Lml/u+rytkjTTdxQcZ9kizAqlhAMODfiN/u/UveM4
 3JbueragkYWMyFjCgdVBWh5Wwp+4yHwy35atyUlGSKrOZDfK/atFHJ3eh48zx1B3fyJt
 iLymKfz1my80SlBQOpRxFrEttbl4fHu55xZV60etK3leD0Ppif4p6UlU/2yd/S/qynBp
 JiK5SgjHjn+b7fsshJmgaudinvlUdJlerRBH4scQ0tomAbFrXwg17d/G3VvCX41BnmVV
 adDMIhrWv/0dGdJFjiKskAk15q3iqXZ3N8GP4erhejSRic4Pp2RT78V+Uac5hQGA9hA+
 nXQA==
X-Gm-Message-State: APjAAAUoyop4G1QO5SIVHRW+aFWZzUmzQwR1gTEQDnl3SWn9fb0UxSQX
 pDm789NdHb0GK6NRexXWb4DrPg==
X-Google-Smtp-Source: APXvYqxyNn8juG4k57tDDZzJPn7ALg0EqBHK2XXJfG1Gj95UX4C0NGGWwU96NE1KBeocTXfMwf3wAA==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr5181518wmc.38.1553334823514;
 Sat, 23 Mar 2019 02:53:43 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 24sm15495881wmf.23.2019.03.23.02.53.42
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 23 Mar 2019 02:53:42 -0700 (PDT)
Message-ID: <5C960225.2060504@baylibre.com>
Date: Sat, 23 Mar 2019 10:53:41 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 1/2] drm/meson: Fix invalid pointer in meson_drv_unbind()
References: <20190322152657.13752-1-jean-philippe.brucker@arm.com>
In-Reply-To: <20190322152657.13752-1-jean-philippe.brucker@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_025348_202650_0F735BFF 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: airlied@linux.ie, khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jean-Philippe,

Le 22/03/2019 16:26, Jean-Philippe Brucker a =E9crit :
> meson_drv_bind() registers a meson_drm struct as the device's privdata,
> but meson_drv_unbind() tries to retrieve a drm_device. This may cause a
> segfault on shutdown:
> =

> [ 5194.593429] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000197
>  ...
> [ 5194.788850] Call trace:
> [ 5194.791349]  drm_dev_unregister+0x1c/0x118 [drm]
> [ 5194.795848]  meson_drv_unbind+0x50/0x78 [meson_drm]
> =

> Retrieve the right pointer in meson_drv_unbind().
> =

> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controll=
er")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

Thanks for working on this,
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

I'll push it on drm-misc-fixes

> ---
>  drivers/gpu/drm/meson/meson_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 2281ed3eb774..7e85802c5398 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -356,8 +356,8 @@ static int meson_drv_bind(struct device *dev)
>  =

>  static void meson_drv_unbind(struct device *dev)
>  {
> -	struct drm_device *drm =3D dev_get_drvdata(dev);
> -	struct meson_drm *priv =3D drm->dev_private;
> +	struct meson_drm *priv =3D dev_get_drvdata(dev);
> +	struct drm_device *drm =3D priv->drm;
>  =

>  	if (priv->canvas) {
>  		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
