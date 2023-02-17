Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04FDC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FH6sD4Zqt0Y0QE1H+0l5vaKrOCwzyw5oY9Z/8hR//sc=; b=01qX4Qa8JzT/ot
	rd33cbc+DaraTKOdujj75hPXWwaPQC42RwITGf7YyN8io1pvVOx56fiwKST5vBFz5DhwsQN8fdTFI
	XNYgKW854Hv9COb+2bSpSg8YRQpvP+Mx2WH1QZyGCJRc3bjpiBessAPT4k0mUsaZN8jCoCr/v46Li
	AecsJFs3a9OWyiCDwSbLH58duH1q6avk6JIBxgrQYxVALo0/TuWyIGvsuLB5NFZYDBR9ybzJ4nzIN
	G5yYgQs+j1romoMT4mk+uqxLdtJf8iI0XJZ6qPWOFelzdLDVIBJ9nuUOKJjYz9iAsUWtlnVd+t1zy
	J1RpPRiqQhjK4511zNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyQE-00Dljn-08; Fri, 17 Feb 2023 10:56:58 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyQ6-00Dlgs-59
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 10:56:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id n6so348687pgk.11
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 02:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676631409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3UCADC546vqcgvQAcCkRRuDpElH6K8OW6js21vuLDJM=;
        b=MHCR8VgijeXixy7MepbTesxZLaTehlks0wgRSy3RyhnYEQ5DnzmcjILk4hooJm1ym6
         oibq6KlWHJVF4zszDK/3lH5H3kfmLwaNJLlNUfiqGguZYUrJC4J0ks7jxc6m9XyntXId
         b1RlhNzhRan1VIqYdW1iSFrRxVVwacVkOTEE62U2feK+ysKxSMONYSk6fEr+fxjZxj3T
         vG/4clZ+93ZX1xOniIKLKgsJFpcy3IDQIjy3JJx64pyR8saC8p2xz4BgFMN/GEsj39ZD
         UXIWvzAK6OlKoT4eed6dRtxTDKYAdk154NvSNpTAUK9PZJPaaLp3m8jnR80uWtdHoGU6
         5c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676631409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UCADC546vqcgvQAcCkRRuDpElH6K8OW6js21vuLDJM=;
        b=K9xtHURD02OPEKSUJRmqpXb7yMca+dYSivyHoliDlTXPH+T5f+kDd5G6DvFmccAfPq
         XeQQXfmDmz4vAKQjxzH0kSTbPaJi/nvX9w6Mb4qFJm+Mep4h4AcEIATTvrH+ZoaO41kl
         AlFZjEQwa2Y9oVII5iP7OwpNJ3in3r9Cg7QsU9ssw5TIDAmXPIQKgpB86uj1SW0IIv7p
         DUTZv2XGrUcYlggz3Ef6Z8WCIrASeH+jn/QYIWZEyXinF36Tzun5IYjesglxY+k+VHXl
         VC6BJOm6VkkS1BqhDJk22sv3yvKDI5JFxrS1MX12JgZVz9pPZW+JLZ2iyNpbQTVNI+wX
         uIqw==
X-Gm-Message-State: AO0yUKWbSyr1MspR+ccuFBbbYayTc+0BcECGsBC4PYPsrotPF9fmLheU
	FjG+sibGcXusnwFAWIuvXpYwt7yD1u8mWMew+NFdZQ==
X-Google-Smtp-Source: AK7set8moOcMQkUUQC0J96rO72ysPNFh+d4PrDeRIUS9UDFf+wqRTay6xYcJkPFbC8RKM8j4kLJfCxJIq7aZb+jm56Y=
X-Received: by 2002:aa7:95a9:0:b0:5a8:ba5b:575 with SMTP id
 a9-20020aa795a9000000b005a8ba5b0575mr1435488pfk.40.1676631409050; Fri, 17 Feb
 2023 02:56:49 -0800 (PST)
MIME-Version: 1.0
References: <70e5520f-e327-111d-9ea4-824460e41561@gmail.com>
In-Reply-To: <70e5520f-e327-111d-9ea4-824460e41561@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Feb 2023 11:56:12 +0100
Message-ID: <CAPDyKFp=FWZ99Zq6us6Opym+9qkv6LO7HXOU0aMA3D7eFSq=Pg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: constify member data of struct meson_host
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_025650_239795_3F817142 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, 15 Feb 2023 at 21:01, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Constify member data of struct meson_host. This also allows to remove
> the cast as of_device_get_match_data() returns a const void *.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6ed95c555..641ea4292 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -150,7 +150,7 @@ struct sd_emmc_desc {
>
>  struct meson_host {
>         struct  device          *dev;
> -       struct  meson_mmc_data *data;
> +       const struct meson_mmc_data *data;
>         struct  mmc_host        *mmc;
>         struct  mmc_command     *cmd;
>
> @@ -1195,8 +1195,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         if (mmc->caps & MMC_CAP_SDIO_IRQ)
>                 mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
>
> -       host->data = (struct meson_mmc_data *)
> -               of_device_get_match_data(&pdev->dev);
> +       host->data = of_device_get_match_data(&pdev->dev);
>         if (!host->data)
>                 return -EINVAL;
>
> --
> 2.39.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
