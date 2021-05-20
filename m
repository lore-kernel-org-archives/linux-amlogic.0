Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9679C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 20:26:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A47161057
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 20:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A47161057
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq4obMDx8fN7INTcnkE63tcZOaGzK4fvoeE6ne0RmJw=; b=YQMFC5Fh8wkP0VwV54Cn2b6F7g
	3w3RP+59eIQifcPcDC/CvS8/GpIi960EamMGQPbyvYZbFq7PEvW5EKhbYLhhpFwZQPY1QeFY3uqn0
	ezE5UUGU3lHvFj/33vz0UK1nkIJxl5tcUbjgh7UsZM0jqgl8JzlRJ52ATd9oZKib312YX3Z30/QQs
	Nt5qL26iLEVID0yeBr2sSIl7Nwl2NmCkQTVYmmUwywayhGEShUC0L5+gwBWGRJXR4POCLkeSMI2Xq
	IdE97+fOhlpJjGTT+7dlYJ5Xq8IM/1kxlsQXk1zz8IIVU0i7EUtacZPjI8yEaPIZSWENdDFF2tIke
	N4EFrRLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljpF6-002deo-Dk; Thu, 20 May 2021 20:26:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljpF3-002deQ-6C; Thu, 20 May 2021 20:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L6+wHMIa16BIAfcr0/AspV73VlTuSsDUuM2FpOlowOc=; b=kWgXDfKQ0ol2oGHpwodLOGwQ2e
 AVrTl5WSvymwDsEqus7CHTJuWZa06Q2QXeXZ3eM8fYtkhZxv+T8gK4on+sVipTHK44L6zL9GJx/YR
 IXVrsjfGV+h71++gIK0EhtyA5gzlrD2zbO3rK2acTRO06f2yAroP69MHTJxdcoIrrfglk1rpx3OvI
 JDmVEK2dcUZ9mqor8cj0dMFMrBJrNwdxVIgGhGmIfmZPRzmiqKoX23SE+kkOOiwOg0RBsoRjfXvra
 NtGxfMgOL09656ShYXz0TYtB3I9Ch2ieE9oepzhAgIEBK6YAZU2idewPe6NL9J5zKae6l+yHznwOH
 ZoXCd2Zw==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljpEz-00GeFq-Qu; Thu, 20 May 2021 20:25:59 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a25so20834929edr.12;
 Thu, 20 May 2021 13:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6+wHMIa16BIAfcr0/AspV73VlTuSsDUuM2FpOlowOc=;
 b=O9qoQYrizwrGO33O23Eh/taGb21Uq+Sf41L3WzruURauHfByuEuoJ1UE1mSl0b+3i4
 NSD8MlBu7ZqxAXskQNYjyW0Cf3HNjspL2OeWNALMprYILIwuDFRwj/iD5XNMi4tftycW
 EsknKdePJnUKRI7GwYUV4vgaiBNKlvfZYpI3YgA+pOtRuOdBwCcz6pJyixy1j6tnjTwA
 xc2nWDa5LBBVMSo3KVFY7ratdf/2jGMvaBkcjlxZeGivKjGwBBF3BqIOAyT5GGFYupwY
 OXfUcXE+pz37Vs2ya5wtU7hZnc0G6kQwzloGCssXZuruhVK/nWdQ7GD3YjcBN8DK7xpf
 IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6+wHMIa16BIAfcr0/AspV73VlTuSsDUuM2FpOlowOc=;
 b=YNQqDBcHOcnBFSB+T8JUgSlcfinEG8dX7iSp40kjsEVlqWoEpChFbnOSbayj7gUdL9
 mrDNJhEAMpsG3zw5IcHu5YQ3b2/WEapnGz0yZmeLbwA3Tsjc53M15J3SoODckX3m3LQU
 YNC8sWqqm6vhpMNv7KKYNt0+qieibUETNef3lNy0X0cxT3mxpTGE22S4/x4oPr4VcXGB
 3X7dFngcikfXOu4wVYb6qldNgZEScSAhO8m5kemXFEaiNnSp/dLIOOWZzM0xF7M0Atn1
 Z69/sMu8GAnpNYca0uHdDuuZvA576z7ZWazEKjSDn8ci99P7+RlvGfycDP40eV2OT/F7
 U5Mw==
X-Gm-Message-State: AOAM532xSglHuz1sNCpUXeyjLnj4KsVOdhU0TUe2V/dPgV4PxNHqCaU0
 GrwxY8rK6KXzzYwDlbxe+SG1cm6vUnlRXLWgFlk=
X-Google-Smtp-Source: ABdhPJw8pr02cKMNKMU/gav1Jo5Bo/EIho2tm3jRn7MMn/JFbkOi35Bg7rsUYA+POgIEX4ds0rT2SCk9e8a1tOYJReE=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr6952362edz.146.1621542356228; 
 Thu, 20 May 2021 13:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
In-Reply-To: <20210430082744.3638743-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 May 2021 22:25:45 +0200
Message-ID: <CAFBinCC0aaMUbBkJ4bjhFa0A+sZH1muyW6kqAQYfjjXOkrNPGg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_132557_890384_C95922CB 
X-CRM114-Status: GOOD (  17.21  )
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

Hi Neil,

since this has not received any Reviewed-by yet I tried my best to
review it myself

On Fri, Apr 30, 2021 at 10:28 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>         struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
this part made it hard for me because I was wondering where the
matching dev_set_drvdata call is
it turns out platform_set_drvdata is used instead, meaning for me it
would have been easier to understand if platform_get_drvdata was used
here
that's however nothing which has changed with this patch

> -       struct drm_device *drm = priv->drm;
>
> -       DRM_DEBUG_DRIVER("\n");
> -       drm_kms_helper_poll_fini(drm);
> -       drm_atomic_helper_shutdown(drm);
> +       if (!priv)
> +               return;
> +
> +       drm_kms_helper_poll_fini(priv->drm);
> +       drm_atomic_helper_shutdown(priv->drm);
>  }
then this part finally made sense to me (as non-drm person), as
platform_set_drvdata comes near the end of meson_drv_bind_master (so
any errors would cause the drvdata to be NULL).

with this I can also give me:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
in addition to my:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Can you please queue this up for -fixes or do we need to ask someone to do it?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
