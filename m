Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BA0C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 14:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8FE61042
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 14:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D8FE61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7sfmnLVr53GCf4wGZ0NNgdLHw/PCVZg6zCS1Kv+SCrc=; b=MTQ9UR6s0ZU16KDn+7afCnHpX0
	dUPAe2D6uX08+nOxVSeEi73XxnHgJEpepI9L5Nb3fDuTEXSCNPoh3EfUDq7Dk4TD1alPoEtGOeGv8
	FijVjWheZAXlRvO+0oPFHj7JS0dxkG7wCV/6XcFyGfKxY297fgHWa9G3D48cd+zFQ6GXvXKRy6H56
	dr3zwU1CvpiDWUh3g5QksRUhUNZpkD6VTMthcBamoQwtVrhNaiPwN+gqAU3Xe8PpFE7zi4OxzmGJf
	ABUcMLjxbJ6DCx+JXJ5dHzm//HBMKpze+SJYQd/U68AMVL5ow91nJ551oxCuV2YKvDGZB9RaVwUZK
	iCZwD7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttTP-00ApHg-AF; Thu, 17 Jun 2021 14:58:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttTM-00ApFf-0P
 for linux-amlogic@lists.infradead.org; Thu, 17 Jun 2021 14:58:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c5so7128655wrq.9
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jun 2021 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZpkJ+MYgphvbo+BSBH3Zpu7neLYi4f02rnh8CEAedOQ=;
 b=ulwjGky6X26LXPC1yb3zn8bl0jSp6um6+lphjLL4AtnI3F7fKbqCto97dg/wZLIELG
 geqk0K+MYYWf5Rk9tgpAiNJRol3WZCza4miVvbqXhr7l5U3cqLcwvdHLcbUDCjU2La6H
 P1RLtnXU8fNWQ+omJ90vSDOJ+kFmgwLpCcLTKuo/gouam2wEp8JKCr+jP2qUmZ2R2ATK
 JXY7nNt6fy/sCIznCrjtvg+w1addU7qkpeO0W0ahJPgwxXTvm+UdeZWZtA0BClDd7tMx
 668UoML4dcwzxBW1yQBEBeNWa9L3RDElz3baBNgocfo8tiW9KFF4RTEAq9En5LAElA9Y
 getg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZpkJ+MYgphvbo+BSBH3Zpu7neLYi4f02rnh8CEAedOQ=;
 b=mHTkuDU0+rs34cn8c2ReKNH1Azr4tuzgqu53iVxnIRLx1seCFtpBlR3hmngINq+RMh
 q9uKPmXUfjnixujOCKlm56tSSxxmJiRMml8Y1fBU9HswLpth+ul1LmFxPJDYXT+YzXYl
 UtCjF/WCgqoF+9HW7DLJwYd9GbenGnx7Jgcr/trEhT0Dkn61+ML4uvOqP+udPxMsV/4K
 8uXmFvXpG2a9CZizpCaqvyxacj1daBnlLVWunMIoz3doaiz2lNv420a/IBp8+ApxxBeq
 I+dq9sa3Jk6somYxxRxnX3ybBBGHVweNtRJL0St2V+0XQ4Mr2V4NKJiuPYn00n63Pqw/
 qi/Q==
X-Gm-Message-State: AOAM530dEGg+fz0OEWFpgImziZcpkEnoAhXQYpg8/APPH+v5Ir5LKnDc
 1Yn6X8Qn6D0Ap5XJLslQFGsyeQ==
X-Google-Smtp-Source: ABdhPJyMYMaw4LO059nv3tFrQ3aLA9CMlV1w5nxei3W97dLFTJEiJJYci7iGLUD1oVqxmgJBv+OY7Q==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr6356429wrs.170.1623941901303; 
 Thu, 17 Jun 2021 07:58:21 -0700 (PDT)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x18sm5580002wrw.19.2021.06.17.07.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:58:20 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
To: Jiajun Cao <jjcao20@fudan.edu.cn>
Cc: yuanxzhang@fudan.edu.cn, Xin Tan <tanxin.ctf@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210617070737.50171-1-jjcao20@fudan.edu.cn>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0c367cae-9bad-d53a-01db-3d2dd801965b@baylibre.com>
Date: Thu, 17 Jun 2021 16:58:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617070737.50171-1-jjcao20@fudan.edu.cn>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_075824_147262_005E224B 
X-CRM114-Status: GOOD (  18.13  )
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

Hi,

On 17/06/2021 09:07, Jiajun Cao wrote:
> Fix a potential NULL pointer exception when meson_drv_unbind()
> attempts to operate on the driver_data priv which may be NULL.
> Add a null pointer check on the priv struct to avoid the NULL
> pointer dereference after calling dev_get_drvdata(), just like
> the null pointer checks done on the struct priv in the function
> meson_drv_shutdown(), meson_drv_pm_suspend() and meson_drv_pm_resume().
> 
> Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 07fcd12dca16..adea6a2b28f5 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -380,6 +380,8 @@ static int meson_drv_bind(struct device *dev)
>  static void meson_drv_unbind(struct device *dev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(dev);
> +	if (!priv)
> +		return;
>  	struct drm_device *drm = priv->drm;

Please move struct drm_device before the if like :

struct meson_drm *priv = dev_get_drvdata(dev);
struct drm_device *drm;

if (!priv)
	return;
drm = priv->drm;


>  
>  	if (priv->canvas) {
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
