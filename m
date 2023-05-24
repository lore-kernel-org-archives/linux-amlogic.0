Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35AAC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pce5sK7OUpZTJ2BX+TwTZ/qBl6QQHKed0LjTeQLTPjI=; b=349r3YMm9u86qg
	80NjQCccIK6mQEABBtGVryyu3fcdem6BHIwseGipYcATb2vELj/xiTOfw+X+JFLZ/E4MwG13Cz62Z
	OPddB+ebjqzvlmRo2uSL2Dpa6mtZpBL8gam9FLZ2wZ9nEpp1GyA92e1BEBr2LP0LIhuCDGsqIEHR8
	hknShgtF5nYhuMRrmcWCCDS+BoMR2OQJPybWlLoI4ofyTBBylMffB3GmaKZbfNTtnxIlg5RDPwewi
	r23tWzAlmg1Fz+zFxxuLtWeiYAHOOgIRE+2ji37zHJRgWm9KQkwnmSD1mVuT1WTfrIytDgtZQrQz0
	2JI4uqDbLy9W0+bJMw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oGw-00DXSz-2w;
	Wed, 24 May 2023 13:11:22 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oGu-00DXQo-0e
	for linux-amlogic@lists.infradead.org;
	Wed, 24 May 2023 13:11:21 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5648e904593so13766997b3.3
        for <linux-amlogic@lists.infradead.org>; Wed, 24 May 2023 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684933878; x=1687525878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MvZGpV39H6LWTzsLCijgX3+057w1b33nSMugKocz4KY=;
        b=RsvzRBXyg2HzzC8gG/xUrb3Dcbh95QtFJlZpWi84s1DTAD4gjXpoYWLi+17/llgvbf
         HI7yORJ0R55Nldwipx8Wm6J7sBRt6mrIHuXA1LuG+r5EvowNzPEqJXT1FQH/+GutYWo8
         Q7Hxu2TjrDn3gDyqBzedoEuNCNPvHx9ndrVCgweSn1Li5ysK49zalz/MpKS0vElza29t
         dKVbq13lqTLptPwl/a3lefmYJUtRiZwl9+qEncUDBcN02oMz//XsTZX5Jmet5v5v5uNh
         JxZYwwsjFmnt1Gx1/stRgiBlzbd8NbUvXDVJ2OAjiHgNAegX53HAaQeCuluAG4D1tPiw
         w0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933878; x=1687525878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvZGpV39H6LWTzsLCijgX3+057w1b33nSMugKocz4KY=;
        b=PkSHluDZexfnBxHWov2vXGYfRrjR9ybPiqTtKDALk1P5u7UT5a7mxLKUA2afpfyG2n
         mks1dqpmGO0sf6gVmgwPoKpLB2NXAM0nUHNmzJ20N4h3wyh+7GKGNqJvYlIx45NFKBRk
         c9i0OFsJY4fFdmwlnQVlobgXM6tseEBDKTxTtHdBXHadZbHXVSoWFFDtcOqSxGpd5fZZ
         6DcbksPul0miVFqoF1ydYgh/cI8ZjtBwIVDASr7xM2pktsuRtppLS9mH69ZPP3XY3Q5f
         e6lMstWdONK8yImXRHcPpgbGT7XyjMKZpFApeXpcUkOaJheLxykY/b76xnXZGcVp15od
         dWUA==
X-Gm-Message-State: AC+VfDwhSDpqb8VYXaVdKLvGXNZ7nTvpeydUqJ27UZnWkXrUDg6wXakz
	aTL4MYNTEgOc7RoA9LZ9+LqhNPIxc9/DNgameWcX7A==
X-Google-Smtp-Source: ACHHUZ7Mrhuw8pccSbQf9WGKebUOBDZeHw5kYpBk2mDjue1to21G1j5Hluqsi4/jn4RAAvknTppQxiz6JmxokHmHIf0=
X-Received: by 2002:a81:7405:0:b0:564:c4db:6329 with SMTP id
 p5-20020a817405000000b00564c4db6329mr15659384ywc.11.1684933878470; Wed, 24
 May 2023 06:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
In-Reply-To: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 May 2023 15:10:42 +0200
Message-ID: <CAPDyKFpj2BNEUTWeFZLWL-VDze9Ravw1SDEM=Zhe-v2Ov2udhA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_061120_236098_769B6BE9 
X-CRM114-Status: GOOD (  19.28  )
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

On Wed, 10 May 2023 at 14:39, Simon Horman <horms@kernel.org> wrote:
>
> Rather than casting mmc_free_host to an incompatible function type,
> provide a trivial wrapper with the correct signature for the use-case.
>
> Reported by clang-16 with W=1:
>
>  .../meson-mx-sdhc-mmc.c:791:38: error: cast from 'void (*)(struct mmc_host *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
>                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_action_or_reset'
>          __devm_add_action_or_reset(release, action, data, #action)
>                                             ^~~~~~
>
> The same approach is taken in litex_mmc.c with the function
> litex_mmc_free_host_wrapper(). There may be scope for consolidation.
>
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index da85c2f2acb8..97168cdfa8e9 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -776,6 +776,11 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
>         regmap_write(host->regmap, MESON_SDHC_ISTA, MESON_SDHC_ISTA_ALL_IRQS);
>  }
>
> +static void meason_mx_mmc_free_host(void *data)
> +{
> +       mmc_free_host(data);
> +}
> +
>  static int meson_mx_sdhc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -788,8 +793,7 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
>         if (!mmc)
>                 return -ENOMEM;
>
> -       ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
> -                                      mmc);
> +       ret = devm_add_action_or_reset(dev, meason_mx_mmc_free_host, mmc);
>         if (ret) {
>                 dev_err(dev, "Failed to register mmc_free_host action\n");
>                 return ret;
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
