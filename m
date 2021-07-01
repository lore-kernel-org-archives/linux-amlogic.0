Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C449C11F67
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10276613DC
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10276613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0Pyd1QMfYp8FOKJulZEKxMNDbvworfSZbD/8wc5Bn8=; b=JulE004HFgZgAH
	coKKZT6pLw4OcomqXXmwNnSI+HGcZf81a1mCB6hrfsJtR6bjj/qAjAFzVRKf2yBYyHjCr1BCxO6FU
	gRaTEZTkaVrKUBUmL1eoykonDTixvCecqelQq51sBa4JklDzd/y/OYfZQNLDEqoTLC2zs35EUl+B2
	8AiB5MKMz1bqsnE4JUJ88o3nHKF3p+3XXlWn44nVLgKIAY6g5CVDw6nO5FbW4xtdPDsv6KphOgOQM
	19BPWI1MihyrGMscxYoYliQkjTog4N+AOeyhqjtVl41msOByS0awk4/M+y8qDrnLDF6fgbraqnDZR
	qyxCsgG6Yp1oNVEYmbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz4Kj-001DQC-11; Thu, 01 Jul 2021 21:34:53 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz4Kf-001DOU-S1; Thu, 01 Jul 2021 21:34:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id o5so12807066ejy.7;
 Thu, 01 Jul 2021 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPm2mNfDFAFz6LZYHsop45CBgdHBv6hIIQ/VkHD6NKA=;
 b=HvTjCzluEHCx88k64sQ1uGioAhhF0RaQdU2TKB3xXaeeJ5jaQe1vkBMflOMt0RMTxj
 iUISIublp8cNy2n9ZdkE02AYBeYCS1djQFxZvV2JGCHLdd66U9E93k7aFXQjQqUha4P3
 gRpV2RfUVWOWwQM5VAi6Iu2tuUxgsZtntXjHLJShIQOabUWw5/yhZM1Hznq5fkfwfPTZ
 d4U5x2mx1wgy1/l9DweE/vR+RveLBfEcovXEnJY8gbgzymFvtwmSmPVP3Rez8GQQcZeO
 PrNXkGm5v0mrRayTQyy39K48MnsXAF9RU2041qhATMIe45TwPkFjClaj2ONRwj87cH9L
 cDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPm2mNfDFAFz6LZYHsop45CBgdHBv6hIIQ/VkHD6NKA=;
 b=eQDg/LzZoIvxkAWgoJJwuB17+0eY0vz9duycvjFaM0tsWjdJs6rIMJ5y2zGjf4jkRg
 gxqh22w4WyeTfiRR0ff9lmpq0+9tfz9ZYUEiquFUVTG9mGNKbPoAV9YoGqQiwCR6+52N
 b+fUFpGNznEQGbU1hP33wKgWxrPdkApdc8NUVMMenkAwUO8/7QEfSAv+55ca+3sF8UMi
 CTWgq5dymj3MDY4BbN4jxnrs9CkSPXkYSHjFnp5VPRhB+D57NLfeli8PKrL7cC7As4yk
 5JDrUgwpKc1Alt3pJfX9SJXzB9ER5WG9QyoL9qxYFLRg0+QyBQCzUgGtG3Jb9jU69zp8
 zTIA==
X-Gm-Message-State: AOAM530HXUBoE3GtXiL12ir4/TkrB/bwZjWVUDWu9u3uX7XMjLtev3Jk
 IgI7C0WZY6BYVdP1cQrT0XU8Jc7+g2iL0M1SFAA=
X-Google-Smtp-Source: ABdhPJyZ3ThStcILU2DEuZlK8i1r5iDZm7d/h/AfGai6wlTFHJI9KAhQtrkXuxM3Ic6DSOSfkN1YPmywHBMsDeqD97Y=
X-Received: by 2002:a17:906:36d5:: with SMTP id
 b21mr2013027ejc.258.1625175287929; 
 Thu, 01 Jul 2021 14:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210618052800.89007-1-jjcao20@fudan.edu.cn>
In-Reply-To: <20210618052800.89007-1-jjcao20@fudan.edu.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Jul 2021 23:34:37 +0200
Message-ID: <CAFBinCCGpbCNOcbgCZcLa1O8mJd0wgLtt4_sAMvwQW4xOxkuWg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
To: Jiajun Cao <jjcao20@fudan.edu.cn>
Cc: yuanxzhang@fudan.edu.cn, Xin Tan <tanxin.ctf@gmail.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_143449_970418_CE2E7426 
X-CRM114-Status: GOOD (  19.07  )
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

Hello,

first of all: thanks for your patch and sorry for being late with my
review question.

On Fri, Jun 18, 2021 at 7:28 AM Jiajun Cao <jjcao20@fudan.edu.cn> wrote:
>
> Fix a potential NULL pointer exception when meson_drv_unbind()
> attempts to operate on the driver_data priv which may be NULL.
> Add a null pointer check on the priv struct to avoid the NULL
> pointer dereference after calling dev_get_drvdata(), just like
> the null pointer checks done on the struct priv in the function
> meson_drv_shutdown(), meson_drv_pm_suspend() and meson_drv_pm_resume().
I am trying to review Amlogic Meson related patches in the DRM
subsystem so I can help Neil with this.
However, I am still new to this so please help me educate on this topic.

[...]
>  static void meson_drv_unbind(struct device *dev)
>  {
>         struct meson_drm *priv = dev_get_drvdata(dev);
> -       struct drm_device *drm = priv->drm;
> +       struct drm_device *drm;
> +
> +       if (!priv)
> +               return;
My understanding of the component framework is that meson_drv_unbind()
is only called if previously meson_drv_bind() was called (and did not
return any error).
This is different from meson_drv_shutdown() (for example) because that
can be called if meson_drv_probe() returns 0 (success) in case the
"count" variable was 0 (then the probe function does nothing).

As I mentioned before: I am still learning about the DRM subsystem in
the Linux kernel.
So it would be great if you could help me understand for which
scenarios this newly added if-condition is needed.


Thank you!
Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
