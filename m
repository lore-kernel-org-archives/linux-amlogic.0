Return-Path: <SRS0=10CR=R2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C47C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BF4218E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GEPfQ1c9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rnxuaMgE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BF4218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BK0FBsOLUx1q2ZziFnS+o3Oc1snaieGBbouZw0U93rA=; b=GEPfQ1c9db5Ass
	7E3LOeJfk/y+imBsUQThhrJmNvpXfYJpPPEorMaGXP9VIsM+1aRe6EqBxOZPaPWTUeW93FCvSVofd
	gYL+XIA04scQDyijFWXYiBUNQqohJYLaLqpLvJaWlVKr5usii/cUnnxMfRnOBnIRAN0nkx3mWqOzS
	C8YYFHc1vaa2KCK7U8WcBovfgGEpmVxQgUa0xzc763JoECgh7g1jrC5MxGz+W/FyDiG9Nm04JDBe9
	IT8LTaXx28GVkWDh7V5PWe9kTVWUnke8aBH03y7YCqRnGXNHLMyoNmx3eM7LuqmxU8hPd2DR9/DVc
	IZgrpC6GokBlmomsh+Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7dLu-0000Rc-St; Sat, 23 Mar 2019 09:54:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7dLs-0000Q4-0N
 for linux-amlogic@lists.infradead.org; Sat, 23 Mar 2019 09:54:09 +0000
Received: by mail-wm1-x341.google.com with SMTP id t124so4317505wma.4
 for <linux-amlogic@lists.infradead.org>; Sat, 23 Mar 2019 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=FxHgPoZEjMO9SDJmwZxcVCuI/Olq9qG3JdDklkMGO2M=;
 b=rnxuaMgEcCfETSLUyP3/jaHYGqMI+GK8RvQh02jW8lIptDUeHMPnQM0h8jpZDV0BA7
 eB936/+18vLOxSjoHtqjC55IsHmMfW6jZuSMg0fbCT1g4QiHA6FL/ECw/3VSNjTNpRR9
 CPjQSKVdziKrP01MMxdCdVFzLVV4XJDQddTEEtJ6WCE5Uk8/CDlW5DaoB9vjbeTnpQkU
 HZIsG+wUJNOBLpE145Y+4lFP0t7glaQfIm5YqBWC6wRh1vj/v1pNFwnIFktZ+iem0bbQ
 4OYNh/PIdlZJ/Kw5FEwJfMNC660fu/0GXHbOyo+zD7cRRkTejQBKU3IdyFAqtDNvWWZ0
 QlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=FxHgPoZEjMO9SDJmwZxcVCuI/Olq9qG3JdDklkMGO2M=;
 b=pqSqTar1SMut6MESSmOB+5UXGGS02VFD/bfcfIiW4tWzJrwvfsThwaMPbVDlNZKtpq
 xSlBMX63LQwb89cgTqz2paUWe/LQ21o/yUxx6/q156ekHyEPPg52wQdZGgSsv+iXaw46
 SahsTvvOhFQ0z5xQzXzekQ3pO0k9y1Iwvj3JiZQJhZUaOW7o6nrm0UZUQSKkkSL++2XA
 99y9pzL2z4iRK699WZAMIU0cl3s0+skN/X/c9afkQWcAh42IFIpBImM+HdXjwEey474a
 R51NYotAu5Za6/VO7L+nJjoE5aqNZTvgPMeWALTqVJ29aPVpr315ZVaWW6QEqtyiYNEn
 pFIg==
X-Gm-Message-State: APjAAAWu0kC/pTwWrVWEmfP/oGN/9YSnZJgaA3168pRiUE3PnFbCR6Dw
 tO0N56qU5TZgaA2n9N6PeWTMuxgkwuGhgA==
X-Google-Smtp-Source: APXvYqxFgOejeTyj9TjkXRiHH8X0aGBETxOEQIOOQjBOmZRBH4zSUB/+FvjLW/PljBskHEW6w18d7w==
X-Received: by 2002:a1c:ef08:: with SMTP id n8mr214557wmh.142.1553334845501;
 Sat, 23 Mar 2019 02:54:05 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 7sm34048903wrc.81.2019.03.23.02.54.04
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 23 Mar 2019 02:54:04 -0700 (PDT)
Message-ID: <5C96023C.6050809@baylibre.com>
Date: Sat, 23 Mar 2019 10:54:04 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 2/2] drm/meson: Uninstall IRQ handler
References: <20190322152657.13752-1-jean-philippe.brucker@arm.com>
 <20190322152657.13752-2-jean-philippe.brucker@arm.com>
In-Reply-To: <20190322152657.13752-2-jean-philippe.brucker@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_025408_045589_A86ACD8A 
X-CRM114-Status: GOOD (  17.56  )
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
> meson_drv_unbind() doesn't unregister the IRQ handler, which can lead to
> use-after-free if the IRQ fires after unbind:
> =

> [   64.656876] Unable to handle kernel paging request at virtual address =
ffff000011706dbc
> ...
> [   64.662001] pc : meson_irq+0x18/0x30 [meson_drm]
> =

> I'm assuming that a similar problem could happen on the error path of
> bind(), so uninstall the IRQ handler there as well.
> =

> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controll=
er")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks for working on this,
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

I'll push it on drm-misc-fixes

> =

> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 7e85802c5398..8a4ebcb6405c 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -337,12 +337,14 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>  =

>  	ret =3D drm_dev_register(drm, 0);
>  	if (ret)
> -		goto free_drm;
> +		goto uninstall_irq;
>  =

>  	drm_fbdev_generic_setup(drm, 32);
>  =

>  	return 0;
>  =

> +uninstall_irq:
> +	drm_irq_uninstall(drm);
>  free_drm:
>  	drm_dev_put(drm);
>  =

> @@ -367,6 +369,7 @@ static void meson_drv_unbind(struct device *dev)
>  	}
>  =

>  	drm_dev_unregister(drm);
> +	drm_irq_uninstall(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	drm_mode_config_cleanup(drm);
>  	drm_dev_put(drm);
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
