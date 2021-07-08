Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FADC07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:31:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62AD616E8
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B62AD616E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWqHXWd814GIQ4DsZS8a9P3rmvLnmR3tIzqI4+oxIWY=; b=2ISHa0ILJdUGxe
	xyN8//u8B+wGISmWBczAO7S5Gq1UWVQ6vgyg0MdWuj1/jJ4boQtYXgy3VlamG9fr/Pb155yGo/51O
	4lFptMLJpFMkzHlbE/mAVDvpc3j10CuR6KVM6ERqZgWkquna/LVMuRjcG1FCMouZF60RvbcNHFUlc
	SbOujuLLgWbIADWWsiOAW/NJUeMs3OgBl9QiNCTRollftXW6BNRFRGEWFHjBAQU1sLsTLI7dvkPYC
	iXit5iy9LexIus/oYCMqEk4ipENNSX6t5CP6d4vSyIbRSbeBuUCC+GRB8ltx108E5CG7u/ca4ugnk
	fsYm0reFOsUVdhQbiZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1U7b-00H5g8-F9; Thu, 08 Jul 2021 13:31:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1U7Y-00H5ds-NS; Thu, 08 Jul 2021 13:31:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id v1so8547421edt.6;
 Thu, 08 Jul 2021 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbBlMrdzCHr2lmFYFbQ5SL9VUQbtB6r7wdoFOJEg6lA=;
 b=l536WO3E6ytMOoRVLjIKSbUy2kj7dfkrlmAGKmLAXF22od2sLSKcIGRTxNO6g9aGv9
 OeLBoOAZYvGmZPdhUjJ3CkK6NBWDxwF2Nw4QpC1+P2/z/pP9oiiRr/iy2nM2tNoKd/k1
 hbOhwHCjylUcTWHxoFCY3K+K1TVEmbBpHFAJA85hCA/qRC1BE1HxUWRnopSzddh7akzo
 pDzNc3ntpC1gx88R/jKUZPr74y2qmey8MXRKv6Q4HFIWG3lBUNojDyGor2XRqYqgwY/B
 1C7AwfUDhKwMSdcRTFYUg5Q7nB8gjKESOWjBd8KPw3pUr3kM735ZB170BE31PMpk5RyB
 gJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbBlMrdzCHr2lmFYFbQ5SL9VUQbtB6r7wdoFOJEg6lA=;
 b=iPH9xjOt597UO3IUsdbaWow88mLYr4F1qCC9ADSGiI986km7GhWO7f12HnN/cckCLQ
 1MblN+HdouoivNbd/GF6SLRDPMTmMiwRHT4W8kZKH5WymQb+ypjrr55akijm5FIAmp02
 AK13QwmMR8vzKbVxmfDM4yZc/+BaUTWSFiGBCp2bc5o/zye0uqBJhW94OawH+uj2koo3
 YR5TevoHatAx7AZWCjtgiqcO2Ph7cozvR4URC4+RBxc2CiSn3o3Bdm5TfjRSYH+EW/sk
 cQaQXywuwgZdEhR77ESjpqPaw/oER+t7l0Nd2DvHyl125rqK6C4g8PXwuMQrYQVy3Kx7
 BVJA==
X-Gm-Message-State: AOAM530C2UW9N1PDpkyNBQ6gNOZ9rlbU7/ugeGVx5BpJbNusfQ+L/B3h
 7ZWWNaz/jL1duy4Tc3xxyOo1gFEdbcoHUxzPiEY=
X-Google-Smtp-Source: ABdhPJwefplt4Ey3YR2GmBxncjju00jiuUjHd6+wuxj6ezWvhyYVTI4u17n9Y3MKyz86FKbNwLEpepyX8ig+kHdUBYc=
X-Received: by 2002:a05:6402:1c06:: with SMTP id
 ck6mr38245289edb.287.1625751073938; 
 Thu, 08 Jul 2021 06:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210706074545.8763-1-tzimmermann@suse.de>
In-Reply-To: <20210706074545.8763-1-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 15:31:03 +0200
Message-ID: <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_063116_804621_1D4C077B 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Thomas,

On Tue, Jul 6, 2021 at 9:45 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
and also (although I am no drm subsystem expert):
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> -       ret = drm_irq_install(drm, priv->vsync_irq);
> +       ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
I'd like to use dev_name(dev) instead of drm->driver->name in the
future as that'll make it much easier to identify the corresponding
IRQ in /proc/interrupts for example
your patch makes this possible - thanks for this!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
