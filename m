Return-Path: <SRS0=kT+d=VT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF118C76188
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 13:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B502166E
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jul 2019 13:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lkvvx+E/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E/But+Yu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1B502166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NL+Msj85EItRhaZQrdtJJbE77UDpQ1maBrIMCG9/DQ=; b=Lkvvx+E/RWaaLu
	hobmtkD2BiHo8Oap1kPPsjM37EHpKt8A0RRPrX/h2Ib19dVcd23v856INixGc5X1jfTNOeKFqXBC4
	c43fC13750Tq6uqJAhQYUn849KxbTWqwE1eVajmkOPZgxKewiAK0pKMaxv8zkdvQ8X5CpLsLHq4fH
	LRHFZ+3DyIWQuACm0AqQ2B6H8ldkbxuBNFa9WpArOi1ybeRgMtd3mHoAUBdh03NOX/mshan8P/e6L
	HCw2diSm5UuglfoSFdzULKiexFbbEfTJNyp1dVQOCGlqWaAD1WROtrGQpKkKArJtYygqhpRfwdP1V
	lqq3jkyiSt/JT6l1gBGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpYbg-00016k-1H; Mon, 22 Jul 2019 13:44:00 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpYbO-0000u6-VW
 for linux-amlogic@lists.infradead.org; Mon, 22 Jul 2019 13:43:44 +0000
Received: by mail-vk1-xa41.google.com with SMTP id o19so7838031vkb.6
 for <linux-amlogic@lists.infradead.org>; Mon, 22 Jul 2019 06:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfWmDXv4BPNqOTEY9hU9q6gKX1IYDQYRoMyC7yt2MNI=;
 b=E/But+YuUKIzOcn6HUyy4svfKw8XGm9k9ye+AQjkaG9X/TWQ3EMinTa8z7xp3u05Ky
 JWLgAuxe+lrOiI6YgBbO1YHkcwMk6k9b1ZRdkUtPGe/4LwAz1LutDwQ5KqLZ7Z3lJ5Yv
 6Aab+564w4FX4UBEEuWjzVfV67IBm1INTk5+0MvliPxcuFfyrM6BdfkDALKnY9IIkVKq
 qjRaHqKPO3eI5FFDdjleOVM/8YI/580dxzUMI/vSffxY/2VAgjXK7Azfvw9IQUmo+Ise
 qXJvgJTr3m1dzRR0XTuq6QeYuVikSCmxtlV7q25GKKMyCmReGzDEOYl/7YtUodEuC0UN
 UtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfWmDXv4BPNqOTEY9hU9q6gKX1IYDQYRoMyC7yt2MNI=;
 b=FjvPR1vuoDBbzUOU2LwtUf3uKV4ZfdYJZRaoRxMPUTBhTgYCuUkne5V/yHvTjY7w1s
 fnwbIDNEyF/orJjX7hL8pC3JVbAAKnyTRrrhwHVGTghV5Sx/GDA9DKsX3lAdmCZq2AUz
 RRuzGA4WUeVliVQIocKM0kVhSr6DNYJ9LxFcPWRiLo9/HLtqtTYo4XevcSjfHBZn1G63
 jN4oG67qBU+fngd1UJ/s8JmXYwB5t4UkexMfzBxMDCNRvtdRuPiX7WV1siWW8+N/nZh5
 KeK17sITMLcq46Jb7nNYDqQpudzHDP6F7zwMZbcHpSYgaTEui4/dH70MDQbxLjp2NOZX
 QW2w==
X-Gm-Message-State: APjAAAXtuTdRmMO/7Mfmxz1T8lNixR4HH5hfSWi5BKIxPNpbBRYWk6q6
 mL52IVE2diqkf8s/48SxSmPHsXJoncxGy5nOhdTVTkM5
X-Google-Smtp-Source: APXvYqx14wMKbyhub1IcdyQKRP208Xy4cOVwN13tySgJSo9PZ3oI+ibBZ47r4EOcKXyhteGxLy3BIFkVyqio17fYhcQ=
X-Received: by 2002:a1f:f282:: with SMTP id q124mr25220311vkh.4.1563803021647; 
 Mon, 22 Jul 2019 06:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562734889.git.joe@perches.com>
 <94dcbeb13b08a67ae9f404aa590c1c1459bc5287.1562734889.git.joe@perches.com>
In-Reply-To: <94dcbeb13b08a67ae9f404aa590c1c1459bc5287.1562734889.git.joe@perches.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Jul 2019 15:43:05 +0200
Message-ID: <CAPDyKFpmc3qkU4mXk7X0nGkOLnZ060e-n-en5T-Z7FXzcO5ymw@mail.gmail.com>
Subject: Re: [PATCH 06/12] mmc: meson-mx-sdio: Fix misuse of GENMASK macro
To: Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_064343_644126_EEDDDD2A 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 10 Jul 2019 at 07:04, Joe Perches <joe@perches.com> wrote:
>
> Arguments are supposed to be ordered high then low.
>
> Signed-off-by: Joe Perches <joe@perches.com>

Applied for fixes by adding a fixes+stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 2d736e416775..ba9a63db73da 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -73,7 +73,7 @@
>         #define MESON_MX_SDIO_IRQC_IF_CONFIG_MASK               GENMASK(7, 6)
>         #define MESON_MX_SDIO_IRQC_FORCE_DATA_CLK               BIT(8)
>         #define MESON_MX_SDIO_IRQC_FORCE_DATA_CMD               BIT(9)
> -       #define MESON_MX_SDIO_IRQC_FORCE_DATA_DAT_MASK          GENMASK(10, 13)
> +       #define MESON_MX_SDIO_IRQC_FORCE_DATA_DAT_MASK          GENMASK(13, 10)
>         #define MESON_MX_SDIO_IRQC_SOFT_RESET                   BIT(15)
>         #define MESON_MX_SDIO_IRQC_FORCE_HALT                   BIT(30)
>         #define MESON_MX_SDIO_IRQC_HALT_HOLE                    BIT(31)
> --
> 2.15.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
