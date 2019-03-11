Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2B4C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23EB4206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iN05qQ9I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OpFFhfXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23EB4206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFBl3BrOixx6sowsadjCDmaVLvSTCyGgNvyPv0xRMRk=; b=iN05qQ9I6uYlf+
	gSHfaHHkwriuMsYLSZ2dugepczPIBMg9KSD6WcgnLQkXSRIeO0gJIvE6W/lnHB3KGqivKs11Fetwf
	ZaUMd4NQlig116v3oquattwRid+t8VKBkL8r/C3CHBsQl2Ri1zEc2sBm0nsSL4SynxFm5tIdr/reA
	x4i4dJ0b1SNHfzypv/QkEpRKiV+sWlcJbYL0TlqPbZuRrXVp69fU+TEcAXemRy7jqUnLXyuOixCX8
	/5tVqQ7gG/C0/SfiXY1kjwpULtfQJ+naJI7hUJRijyqooyrnXvJOtb1r4KebRNsIWI1WgzciqfWpp
	aNe6dN7pQqPEjPGPzVcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Hi3-0003dE-1h; Mon, 11 Mar 2019 09:59:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Hhr-0003aK-GZ
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:59:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id p8so2709875wrq.6
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J63OSK6jJV4RYXnglHExqatZ+hdW5fSRwa/MBq2INCM=;
 b=OpFFhfXt3p+3HgVr5AUJKNNRt6mXqaAXIYk8IwXFMaVNmo3gAouXRY3qM1zn9gOH2G
 8rSNlKOvjfGItABJyV3K1mDod5HePxVvk3faPZfRmG/4aCwN/KQ9ernsoCzNmRD5yP4l
 RCqMYt5KPcsh8J3BOpEJSsaJU62na5FR34aDp9TiF1DTiFNU7V0yWXJnBLPArc7BrlPE
 prjn5rTauwNPDCL5fDSgQolCWDarftydCgtLzSQgCb/+35WE53kY63dyckT/8HaxBjmS
 EBIXJj2c3CdOvC9ZhAVNgBAPgNAQl7ujDvgXovF0kLOJBg6aQEgrL50ML1AF8qXhvV3J
 TqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J63OSK6jJV4RYXnglHExqatZ+hdW5fSRwa/MBq2INCM=;
 b=HZew3NAwZAmnKJy0+S/nuW3IxuGCjRv7Miy14hgmLRkC4NGg7JtDGtYD0mbFZlB5ej
 KdQF43h40sK93ReX5+aCGAAjk4mnpwlfe92I07GlTR2Lzvd6KHOC8lQ7fO7nH53aNwX3
 ZuH0JeLNLai83aUnK8Batm6wl+ccKy93NTr3qX80p1zHBQPczkcebNvF3b9EJ+Hf1rV6
 3QjMYfBwHqNr5QdillL4CS/kkS2BILZTwzRkwgyRPiRmlF2tGu84+YQB2DwHXDBDpqW2
 /hsjWN11YMFmBkbCHoIpSHS7OUy+6mXMi+7Xhg7emnz2vWVLT3W6umpoymaKcKmoKmS8
 f2cQ==
X-Gm-Message-State: APjAAAVqEP9+CeVJ8Cdh7SSbK/jqISW1LL4OLXaeqvTcpC/wbeae34WR
 gipjpcImHtr8qHhQR1QzndKV3SI0cFs8VosoKJMT3Q==
X-Google-Smtp-Source: APXvYqzLQTudfyo5nuWqkKT9H6qp0gB9vcc45ut23eJmjVkjXYRlG6eVFyRl8AkTy+4LBn2twNDwudkCEMtxwYIzfsI=
X-Received: by 2002:a05:6000:124d:: with SMTP id
 j13mr18519993wrx.102.1552298329638; 
 Mon, 11 Mar 2019 02:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190204095532.27185-1-narmstrong@baylibre.com>
In-Reply-To: <20190204095532.27185-1-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 11 Mar 2019 10:58:38 +0100
Message-ID: <CAMO6nazS_vvx4z+AFZjfX6K8ipB0-Cqoqaj0-WXN_DDWQ_T4xg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: handle when meson_canvas_get returns
 -EPROBE_DEFER
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025851_626824_D340E037 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,
On Mon, Feb 4, 2019 at 10:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When meson_canvas is not yet probed, meson_canvas_get returns -EPROBE_DEFER.
>
> Handle this case but deferring the probe of the drm driver aswell.
>
> Fixes: 66cae477c380 ("drm/meson: Use optional canvas provider")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index ef4afaadaf8d..17e55d63daff 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -236,6 +236,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>                         meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
>                         goto free_drm;
>                 }
> +       } else if (PTR_ERR(priv->canvas) == -EPROBE_DEFER) {
> +               ret = PTR_ERR(priv->canvas);
> +               goto free_drm;
>         } else {
>                 priv->canvas = NULL;
>
> --
> 2.20.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

With the upcoming patch series that aims at removing the DMC register
range from the DRM driver's control, this fix will be incorporated,
although rewritten because of code modifications in this partilcular
area.

Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
