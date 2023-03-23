Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C335CC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Awd6RLl1vAUL31RscpZNo46H4hfaybZDpR61t/Iceo8=; b=1IaJa7gnLxs3d4
	KvHFtlsqxKCEQ8FJoJ8yJFn3YTyXJJT6FmqKXdeGmLaOo4/68eAvOuz3vUBWHrkcm6X+ZenGYsD83
	fVvEeUUHPRDn6EhS6Y8C+Vjq9NZKGIPU65F/mMx+n8eWrUU1DJUl32ivdu0W1UpGGKtumVw+W8D/G
	/dysBtAI4nOry6HVZYukyzrEGD+GrR959FSO/iJ0hgDEM0aHo8Ac/gk++K8bh56pQ4q16y8lH5tSM
	wcfzc7fybg+6rZ+vj2xY3yAM6WlnmVSUY+lZC28MVfoyVYjYm1Vbc83jy4vj3hwJ1BrkOmv3g+Pyr
	USm1WBAVIFa2YHRHG0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJom-001rPp-0t;
	Thu, 23 Mar 2023 12:13:20 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJoj-001rO3-0X
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 12:13:18 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id e65so24479380ybh.10
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MLAcv2qG77POi+rjBlm8PmHg6ytZD4ZLUV8QpT2wDaM=;
        b=bytt0SXWcYEL1XQ0HwoywyXKCBsz2AhEBaYUFuKdflNNfSgRIFsGr6gHSnVvAssC8t
         Nn9yweer+1RRbOdaRKqwQD5pHVnv8RraxNFPCMOACHpCRjZUiC35VpVki8+FuuVW0Ogd
         Md3Itq/aiLCtm40VBmeRJUAyQUjdtuvPCKHIv6HcPYsg2635V6A7RB6I8o7m7qFgUbRp
         7zS99h2G7znErs+GZHHR8ZotXAX2PTkOp3jjzj5QI4c5AT5tSDpZq0SkxIqEx9/UAP2B
         rQfOCwg26bR1XcjzJkOrMa4IfzXJ2STHihBui4pPpPHq1YIZrRft3qXxD7s/3k4NMlKX
         d0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLAcv2qG77POi+rjBlm8PmHg6ytZD4ZLUV8QpT2wDaM=;
        b=QiSU9YUIf9y2iwL29ns6YF57UJvlX5xlZeeAQd0n4SQA8IaqOWGHk1Zu+mbuV1idHG
         k/ypl3EWWH4lT9oWBucNMrFP5ReyGuj1UmVh9dfSzLcOgcN2y+gRktGdgqMVBtmKdeqK
         TMgjMrbtBhP6XeQV9/XJpd3NfuS0b0na/qWrGtyeqbj8jr4/tssOamrT9GBQTzgOTVue
         ZbQnMvfV56ro9tPlwpMkv5YuI0ctCrd6wv/qQS7ML9odA1aYN8DZ1sFYbNRgE4ad+C48
         vQN7P0UdUWrmpb1u/ysSTWEGXH9rWbYcYyQua2B8a1pWNZQ4AbvPC9JDJY6b2LHrRgIQ
         r54w==
X-Gm-Message-State: AAQBX9ehoNDF7l0bzlFcO4zwKNZ35Vb3RVshU4KSF2WRK/7bExPl3adu
	QY/3IW6n+bU+6K9x9L8HQ+XGVDeFSv1c3PCxTLxTpA==
X-Google-Smtp-Source: AKy350bMfKNae9ZI0vTPsyNQRU09GxeoPcumQLYJeKNsqhQ5KjvfHMUAjLQBzmVS7QGv0G8NP4Kk1ScN7QBWiLN/cZI=
X-Received: by 2002:a05:6902:1705:b0:b75:8ac3:d5d8 with SMTP id
 by5-20020a056902170500b00b758ac3d5d8mr941513ybb.3.1679573595392; Thu, 23 Mar
 2023 05:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <858a592b-ebf4-99b4-74fc-21b4ad3382f8@gmail.com>
In-Reply-To: <858a592b-ebf4-99b4-74fc-21b4ad3382f8@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:12:39 +0100
Message-ID: <CAPDyKFqd7R=F-gC59UrKjXrF_CMN=Njy6zGe+jNM19V+1-QE6g@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: simplify usage of mmc_regulator_set_ocr
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_051317_201750_6B366FEA 
X-CRM114-Status: GOOD (  13.93  )
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

On Sat, 11 Mar 2023 at 23:27, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> After 087592395a96 ("mmc: core: Allow invalid regulator in
> mmc_regulator_set_ocr()") we can remove the checks here.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 2b963a81c..28e04dc4e 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -604,8 +604,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>          */
>         switch (ios->power_mode) {
>         case MMC_POWER_OFF:
> -               if (!IS_ERR(mmc->supply.vmmc))
> -                       mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
> +               mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
>
>                 if (!IS_ERR(mmc->supply.vqmmc) && host->vqmmc_enabled) {
>                         regulator_disable(mmc->supply.vqmmc);
> @@ -615,8 +614,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>                 break;
>
>         case MMC_POWER_UP:
> -               if (!IS_ERR(mmc->supply.vmmc))
> -                       mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
> +               mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
>
>                 break;
>
> --
> 2.39.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
