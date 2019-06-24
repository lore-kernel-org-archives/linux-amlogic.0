Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0097C4646C
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 23:15:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DB120674
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 23:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCe9qmQo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fNoiNIAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95DB120674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XXjxbtE0NCxh4BirbhapzkB8X+Gi984AmOYRvUHa2g=; b=gCe9qmQoZZJeEY
	DMGvxbS6Y+FJx352AH8teTO/WtkcsIFOUcKEWpfquWi16AfTyk7sa7mt3vshtZtvYjhkL05iDuDxH
	61qzMhEftfAsnVmSgKtzg/lUAhuBodABmcePTnVz9cI6rzJBUmRi/3n2/22kIW37xIpJ1JTx6GF4d
	+vPSqZ1FhMLj4IKbLr6Q+QHmTIs4/QAxG+UhYayyltvphzXyOenoyTbzF0ChxnkIMeLOHCFjkrURG
	svisKswRT3nY4CUw/u17fqVTu8bZ9BgnB/BxpPgNj0P3ywudsUztl0qEIp0MswOwbiMKfGmYJL1VE
	NKxuSjNG3s3KhgZTs97A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfYBb-0004go-Q0; Mon, 24 Jun 2019 23:15:43 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfYBR-0004YL-Nh
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 23:15:35 +0000
Received: by mail-pl1-x642.google.com with SMTP id t7so7716941plr.11
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2IMAKyHpnPJ1yDvedXi3maHRvnqNVDYJ2coEjzpqvcg=;
 b=fNoiNIAlRLn2QPb90BjGH37+vFNKA/mLAyGEzncUaIUNKlz7FLzTUan3SXPxa1rNq8
 7saw0x1+SkHrlvHHaLtCzAuR7AUl5tVeWeM7dauo2/iU1K+AVzbwctFJ5zSEeVx94FuT
 7MMlmAJrW3AOOmVZ7ElmnT16ufcPs1Zow5dWLjMaqdWX+cWwAom1Wk+c0lBAehDJdbr2
 unMFbvikaH6zQO3eS25IrkX5zlnygUySo3Ybd8VG/p9wqDGJZ0CibWSLbx/Bn46+GRrn
 C9SbdikcTznE1mRjY+HDMes2guFt2BWypwoXZuPoBwsmUusAWHuddfXUtfS0d8dJlRFd
 Hhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2IMAKyHpnPJ1yDvedXi3maHRvnqNVDYJ2coEjzpqvcg=;
 b=VyAtSu2MtbNQj9jQ+4jMEP0lY+miHUpaoNPPuSZ8MdGlJtpQCpCr7CdaDTMIjUkZnN
 DQ2qvNsqGOV2QRaLk9wu2lVeO6J1vMT60q8deSnpbGIb8P6JIsNZue3xyQnFhu4yUlTM
 EvXv2EqLZ0X6QIWZeONK8cB9TG0XKKtrA2tZ8bIF+Hetzq0p6G7TXjo3gPEvARoNdD18
 jgK3VN6fPy54dVX05mfT4/nZSvKJv4bM7o27FcbHo2oi+kBunrdEJfRi4w3LXxVu2Ec6
 W7MWPo+wCwYe5Hu+uzrGc7yFC2GTCawKd9Hj+1ox+9TnO3TvHD7l+B71fK2j63Xph2r0
 YwXQ==
X-Gm-Message-State: APjAAAXxkd1zx5z05quurwTe5ScaVPQVEaJpWAh5g+mnpdh7nBRTP/Tb
 Qwy/OFRf5cRxDDL/iWgogEAUEQ==
X-Google-Smtp-Source: APXvYqwROTeApbbRvj7XZr2xOey7lePNY05i1p2vtda9bu6wK0pvM2dbxuFwX8hcBJqIgVsFRVqElQ==
X-Received: by 2002:a17:902:42d:: with SMTP id
 42mr144122426ple.228.1561418132182; 
 Mon, 24 Jun 2019 16:15:32 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:559b:6f10:667f:4354])
 by smtp.googlemail.com with ESMTPSA id v9sm16566583pgj.69.2019.06.24.16.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 16:15:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: 86zhm782g5.fsf@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/9] drm: meson: vpp: use proper macros instead of magic
 constants
In-Reply-To: <86tvcf82eu.fsf@baylibre.com>
References: <86zhm782g5.fsf@baylibre.com> <86tvcf82eu.fsf@baylibre.com>
Date: Mon, 24 Jun 2019 16:15:28 -0700
Message-ID: <7h36jyy3qn.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_161533_918231_5399FE2B 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Julien Masson <jmasson@baylibre.com> writes:

> This patch add new macros which are used to set the following
> registers:
> - VPP_OSD_SCALE_COEF_IDX
> - VPP_DOLBY_CTRL
> - VPP_OFIFO_SIZE
> - VPP_HOLD_LINES
> - VPP_SC_MISC
> - VPP_VADJ_CTRL
>
> Signed-off-by: Julien Masson <jmasson@baylibre.com>

[...]

> @@ -97,20 +97,22 @@ void meson_vpp_init(struct meson_drm *priv)
>  	else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu")) {
>  		writel_bits_relaxed(0xff << 16, 0xff << 16,
>  				    priv->io_base + _REG(VIU_MISC_CTRL1));
> -		writel_relaxed(0x20000, priv->io_base + _REG(VPP_DOLBY_CTRL));
> -		writel_relaxed(0x1020080,
> +		writel_relaxed(VPP_PPS_DUMMY_DATA_MODE,
> +			       priv->io_base + _REG(VPP_DOLBY_CTRL));
> +		writel_relaxed(0x108080,

nit: still a magic constant here, and it's not obvious why it's
different from the current one.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
