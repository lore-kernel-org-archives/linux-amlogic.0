Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C73CC19F32
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Mar 2025 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJUauEdeRt+Gf98YLCKkfXccpNEVqmqcTheMUYKNxPE=; b=CO+CV35m/GWKH/
	C5ue+IGq3Epf8L1CCjPBaC6PnEVo8eqPtF3Lw8yT38nDhD++2wzS3XvFdBsBfvhfphvH4ci7DKV2r
	bDLl/vH5iBzzABwnIMuUKX4MJXt+VQ7jmir2APgG5abZ6vINtJiO6EsQp6PFa9LeYRxDLytk2K8OT
	Sh9Z/B0BozipMnES77MCYwBgB3bMp9813Z3HLAz/xm9zbFhYpcFEJOJ1aFQE0qE99+Yoro9kpEo+e
	NdHgwKjrN57dz7xGwepRahjYz+ecA+sFKKFDzuOzPX0e2IW/zclDnj1VMXRttF3ewHVOz3fFbDxSg
	dsXZynw+3I6hG4BkSgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqBI-00000008RLC-0mCZ;
	Wed, 05 Mar 2025 14:57:08 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq8L-00000008Ql2-3gAq
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Mar 2025 14:54:07 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6fead015247so1419587b3.2
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Mar 2025 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186445; x=1741791245; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VeNLwaFo16zfbUMvLDVk5OOLd3X39XkqYnX5zvlPNF0=;
        b=cv8P0dV3jNnmoS8motO1S7t8kB3faNffTXuS9rLLIQoredbffOZGR+ya1AoSAbiOhP
         3jbMCIr9xd2rbvXpTMT0PsQ+Rp7n0SuNlj8Yb3XRwVWqGfF4gnh9fnSQYYvzTECszYLa
         AyPol4xD/TlX+1xqUJg82qqvyY/mzH26fxcxFQnZQ1q0UrS27z3QqTURgVrFisaKhycV
         G4uL86CvgihB92zK7l4WOe/GMKtuDitRHVrbCz92Z3tIowxukOjvMCUB/vsDihCmne/d
         7QEaN17qG6Jr/M9z/q+wAXKB6UjhUOWlAMcmYNNCstabpfE0+FknrbpDGoUtz/6GgMaI
         BanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186445; x=1741791245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeNLwaFo16zfbUMvLDVk5OOLd3X39XkqYnX5zvlPNF0=;
        b=vvZDGb+luhjfi5fH0k+4UaRGLasKrTMM5JCKBN6LqXJSmuXh9lgcAq9kNfpBM6Nk2w
         rZgqiIgJ7QlCDh3REHDhJd2nPHQ9qkt7YO/PHgBtBCfbErcv4MSJOJFS6gKWNaob5XmW
         JScR3Tt6gKqVSnZ0Tn/MtOy2dRKCDD8F7uzhgM7ws42tKbWEqFi0jtw84R4u70Zo5N8c
         0ORuFBv7T80kMssgPPpwkQLSS7dk7zKp8Er0ajasEFaXG70Y+a7p6+mqWWVPnrAjC58J
         mJSOK03a1HJESM41kW/GaBn9czvStIj1a8ZR1+TKVMs08nhJibhW1YhiKcrgu3ojArqO
         u2BA==
X-Forwarded-Encrypted: i=1; AJvYcCWqzRHYFwMM2Amfo48tairPKRPIJQ4rYnIXwy4BbXMeXJCeImY29g5a6A3Mi2qB61PBeslX3JwfsIdVDeym@lists.infradead.org
X-Gm-Message-State: AOJu0YyQDl/S9iR3f3QdNFNXMktjDaLIamqqgZpcDqaMAd79FfC8SqfB
	9hHDw9C4+FdF+PkW6uP2pqC+jSnrziYddr2ZsQkV8BlhiABhKFbqJsQ3OiY/10m6tk4cj9HPWRU
	BLVUdB92x3PYA38ttAMsF0jw7zT0n5BfkqpvCXQ==
X-Gm-Gg: ASbGncuMHvSHSbmsg1995L4QRmunEBm+QrENhTIBzEnZDaOu6avWiUDJf0h1CHiM3Jc
	81Rn5Xfws1T5F6ZVdEBglhAZ2o3b2B0Uxf8CyijBDyyrTv5m5lmOpVZ/+6j0qDSLnVmxhn0q6mJ
	XB2m3tilRFT3JslQNAfgip3b0Fcpg=
X-Google-Smtp-Source: AGHT+IHaRzLfs4e0s/mjCkKbOX/Qq8AuRys4/xKKYjDcoyyp0XIFqNuIteg7ybYGY5j3p+l87FS/VuOkxSFDK6iD0FQ=
X-Received: by 2002:a05:690c:3749:b0:6fb:b78a:c0e5 with SMTP id
 00721157ae682-6fda310bbf6mr42777697b3.28.1741186444835; Wed, 05 Mar 2025
 06:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
In-Reply-To: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Mar 2025 15:53:29 +0100
X-Gm-Features: AQ5f1JpdUfHmjKXFkOL_14EaaLzX4OU9jP-SAbgoA1LHg0Ze3bkxnPXr7Krf_aI
Message-ID: <CAPDyKFoTBt4g=M1rHrZEPLO1y61csy3_cHfJDANPbvV+bH+YXw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: fix T7 ISP secpower
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_065405_917093_FBFC07DC 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, 3 Mar 2025 at 10:06, Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> ISP and MIPI_ISP, these two have a parent-child relationship,
> ISP depends on MIPI_ISP.
>
> Fixes: ca75e4b214c6 ("pmdomain: amlogic: Add support for T7 power domains controller")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 42ce41a2fe3a..ff76ea36835e 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -221,7 +221,7 @@ static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
>         SEC_PD(T7_VI_CLK2,      0),
>         /* ETH is for ethernet online wakeup, and should be always on */
>         SEC_PD(T7_ETH,          GENPD_FLAG_ALWAYS_ON),
> -       SEC_PD(T7_ISP,          0),
> +       TOP_PD(T7_ISP,          0, PWRC_T7_MIPI_ISP_ID),
>         SEC_PD(T7_MIPI_ISP,     0),
>         TOP_PD(T7_GDC,          0, PWRC_T7_NIC3_ID),
>         TOP_PD(T7_DEWARP,       0, PWRC_T7_NIC3_ID),
>
> ---
> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
> change-id: 20250303-fix-t7-pwrc-f33650b190ef
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
