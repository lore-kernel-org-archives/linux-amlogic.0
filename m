Return-Path: <SRS0=3eID=6G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3F0C55189
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 21:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E15B20781
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 21:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F5mtzU0V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a0cqNtVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E15B20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RK+mc/CQFF5hwyyqg28M+ExZZdIOFSAO4VUh3WDHX5Q=; b=F5mtzU0VWWpWYi
	Ycj3Qy+jIbJgui1TQj6BONX9XP5uqtFt1yBMV5Q1mbgNB4hxmGO2uuYWkEB+TdVVTZkZwgPA0lZi6
	uEYUiEz147vAKWnMZMDj4U24jHptQnPPFRE6m/RFkanJ6mMMX9UA9pqZw83Gg+nKhRBfWu0P3JIPK
	SL7Hkz2/Uu+as5oPruDkJQM/AQsemY4i9haDitaSeJn3vSkBJVJ+Ok5wNMZq+/p/sWZg+2rDBJMjN
	fGVrYBNQw10Guo2QLTgP6go5x8y5TYtYcFqD+xZQ+QES5j1UmuOFCh5v1Vzf0szvnnm0JN7UKq1aB
	Q2gmTZhVJ7EmjI1d4v8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRMg5-0005Ef-IB; Wed, 22 Apr 2020 21:13:05 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRMg3-0005CM-2E; Wed, 22 Apr 2020 21:13:04 +0000
Received: by mail-ej1-x643.google.com with SMTP id nv1so3039452ejb.0;
 Wed, 22 Apr 2020 14:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1ihfPfQEm2aQwNzlV21Qu7y5TOw2uGbX6A635/ijcM=;
 b=a0cqNtVTTV+nhgMWLbfLbZJ1KDdwX/sQv0li7sAMa4YncTjRvmpf42R5qaJyoSk7xZ
 4fjblaEI1rkZU5E11tn1LivEd4rKY+iP0xqgwcoj0sWC79s6mY+p/Wvg8DMbuKUojeTk
 MKvLPlLE6a4MGwQsxRn1mzMVhI0UyQVxYWDBcIZ3BdQSMJNEk4GkWdo7ixo7B+9pTKz8
 nIvQM2yHiwbKRGcLES7cQFiaBaxGH+dI2un2gH0az0StWT7pBtvNwrPqdLF9J7wspqE2
 /Yj6lBV3bIcU57XdmeaokjOO+H7H9cVnl7HnZ0rrrD6/ox6h0Oh+VCg+zp2ZPVeBLn8m
 od5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1ihfPfQEm2aQwNzlV21Qu7y5TOw2uGbX6A635/ijcM=;
 b=Vp9jERUZJfDh4Gqg3ZQulptf5qOZ9WbXWF389AETGrjm8bB26WzGMFQri6Uiwusv4k
 K1r7pH50pJXz/PiGLmGbtBDoY7DHeJzs+0o5LnqpkJ1kIII9xJeqFxsLA+qEoijpeBuL
 efJqz9YnPmgKLn11bo65iCOcfnGX+OW796Hqn03YNUEyOTFVB+Q9PKM3d1XwHQmZLehB
 K/2MK36bGb8zVvtJ9QNIJWco8tWGoupeKXeXnssiibNps258gf7SFV6/N0oDZlUz8vML
 b0xB5pQCG9k1wcWoy/yOF1REnprKAjDdejeuIX5gs2iOWXq9MBkxHtXWTyaFjASA+2pW
 VfKQ==
X-Gm-Message-State: AGi0PuaJ0I3wRs4REfRb8wEvKWv7S4pcytD9qSZWwtgZKHbo0IBH5NXw
 MYcMyfwHXb+OlYRWv21arlwXlt9Aai6AqKPBTOGJnqlkkyw=
X-Google-Smtp-Source: APiQypJFSh3bXWuJ7x6+DbhV4xicuxImfcUvi6SvtUeplKK7p+MxUJ6HoV3iLTo8/qjdhHIAUdqX4A3BxnHAJhLGxbQ=
X-Received: by 2002:a17:906:1199:: with SMTP id
 n25mr287851eja.30.1587589981187; 
 Wed, 22 Apr 2020 14:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200421134410.30603-1-narmstrong@baylibre.com>
In-Reply-To: <20200421134410.30603-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Apr 2020 23:12:50 +0200
Message-ID: <CAFBinCAGP7ZE-OksaE=6E54r2e0VJk2wMTEwKU65qAoR4dQvxw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add mode selection limits against specific SoC
 revisions
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_141303_103473_B7E1D0DF 
X-CRM114-Status: GOOD (  10.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Apr 21, 2020 at 3:44 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e8c94915a4fc..dc3d5122475a 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -695,6 +695,13 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>         dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
>                 __func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
>
> +       /* Check against soc revision/package limits */
> +       if (priv->limits) {
> +               if (priv->limits->max_hdmi_phy_freq &&
> +                   phy_freq > priv->limits->max_hdmi_phy_freq)
> +                       return MODE_CLOCK_HIGH;
> +       }
I think that this will also be useful for the 32-bit SoCs as well.
is there a chance you can move it to meson_vclk_vic_supported_freq
(called right below), where all the existing frequency limit checks
are already?


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
