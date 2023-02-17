Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD56C636D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ih3Xtxoi0f58ZVcaypGD4C4kHszrW8WChpsTNa0Q+10=; b=gzkEfXDMi72fO8
	P0Z0RSiw+pp41+BxXTgolAYOzyj1PkD3LT2iMDQyfJe0d9CPHcpPelnULWFJtDcnwecl+kZoPPmAc
	n8g4Rq/M5IhqrM9dB5Hjgsz104ZMGSs9cGp4+VnSy59QfhFIUH5Cvulr5yQA/iv0MiWtuRBk+00dY
	DPLAko9Zc6te4oGD2WKf8HoVXWiFtkhyc01pRrSDt7o1snkRRbJWwdsOKSG2Gy4M4Z5BUtOXiF5nu
	7ihhB8M9CiLGQRvbQQxYZb/bgygrhTe9zN5/bF13E641PpXNk+uH+D1xI9GMl9YV7KeUzHgi9negj
	S6R54AZcP3HrTU5Njd1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyQW-00Dls1-30; Fri, 17 Feb 2023 10:57:16 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyQB-00Dlgs-TH
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 10:56:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id n6so348791pgk.11
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676631415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szUhwp36rcjb9tm6Fq6IRBOldXj/Qr9+MV3mTH4JZqc=;
        b=Sl/gWwXYliiGzO1kxdx4PEwWlOhqHX2W21cS5077geTdVD28AFldoZT39SLz+XS03r
         Si5wG9hNaGdAQtfHmMoqEcQXSXFB6qjkweOY7lGiItuM0iURGyua2F7i0iXoa6SGj6lB
         amqHIAbEdliUgxwDFB3YipJlwWI+9JmjoQ5PZ+aCokky4Neh9fOC6lGt5NtxMfrBXktr
         Edtt/PC2kbU9tQvdODI0fIFa7FTBDCE60kBB+sYgtGgigQYfYCFn9sn13Xm3XJZSEysA
         MEVuw3DORANo/FGKKuWTsnx3sX3Olyzp7kb24TF9EDqA37kDWqijMmNK0VlIpBI6KsM8
         noiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676631415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szUhwp36rcjb9tm6Fq6IRBOldXj/Qr9+MV3mTH4JZqc=;
        b=lm8xzbCUlI7zufo2Z8yZS6s4XeKjG0MMGYnv8g1wg6HuMNQkNVdUrpSlhqg3wDsNjC
         DORW+foR5U+UGK5JsU4l2C2IaE5xlxN+2jwUeHrEAr946k8GWisLYZwZm6/+4SK+klOA
         hhco6wuTGqLcXa/0Mw7JtaSF/ZL3VMgVxkDoXH5YQX2T231tAjcfoeeqb9/QMXd2jpFR
         q0cDkCUg0U9rQ/FueNqrX2aNiaGzHHob3EQYxZrSdui8UbMBvH7tnWtBMnzI3JuVIrl1
         GhDhx8O22RV9VYgirJ9sBSqQvtlbzBfo8azFPHI9ijxBIaW+mkBhMpSR0WGx16YzfwEB
         5U/w==
X-Gm-Message-State: AO0yUKU5Hf408j85oaVIFRSfCuJMU01OHaeE0S3JoMnXxAm3uF4NMJjw
	0ckxsssRNnFr99EtQM5UxL2RKjCanXbEsDLtpMI1jXjWh7EwcQ==
X-Google-Smtp-Source: AK7set9nL74tFK1Sxv7hRt+wGq8ZRPEIHYTChESsds6ZxneeX3u1CkXORrg6bZkJ+nCm/EYFXia/2yuxMofU5j4BVYI=
X-Received: by 2002:aa7:95a9:0:b0:5a8:ba5b:575 with SMTP id
 a9-20020aa795a9000000b005a8ba5b0575mr1435521pfk.40.1676631415538; Fri, 17 Feb
 2023 02:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20230217083005.128668-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230217083005.128668-1-yang.lee@linux.alibaba.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Feb 2023 11:56:18 +0100
Message-ID: <CAPDyKFoUJ-j9NocWTiTVHSRBQ1YAtM2TH1SrCHByh911Jaa1UA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: meson-gx: Use devm_platform_get_and_ioremap_resource()
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_025655_972757_71A56710 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, 17 Feb 2023 at 09:30, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 079c52dbeca6..a5a9a19a9a42 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1204,8 +1204,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret, "device reset failed\n");
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       host->regs = devm_ioremap_resource(&pdev->dev, res);
> +       host->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>         if (IS_ERR(host->regs))
>                 return PTR_ERR(host->regs);
>
> --
> 2.20.1.7.g153144c
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
