Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7DFC43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 18:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6AA20859
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 18:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObB3pcdu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PufgkLK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6AA20859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byGfFsbKlhpao+wCLZ1IXLSWKEZTGRe2p8zboRUh6qk=; b=ObB3pcductKnmC
	pak5VTBYCYf13ylQA5Kenvirn1j8pkTD7qO2R7mtLNopM22A1UUAJU1YPwcd7vvZdqtHcLpUtB4E6
	aeelzsCB8NGjEzKN6OXORLszB+XZoQQQzR156rAAyseCEi8USJS70W7TdFOTg0qoQWh9vrJlQhiLM
	KXQfTIy69NOBJ77WkT/qfoQXfwetCrqRqMST5+k7Q393HVFpTHD2WWvHGnpfsv9gvX8gDsAYs8dD1
	u3xxmr5TeXwed1KwLFKqD5Cn4O1dXc+SGwrwF1N3sMp7K4el92NndTbheqvXO85CVvGiKgrQxMf8L
	fS4lZTYM7FGE2qoZP1Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghJ0U-0004qd-NX; Wed, 09 Jan 2019 18:55:14 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghJ0S-0004qD-Es
 for linux-amlogic@lists.infradead.org; Wed, 09 Jan 2019 18:55:14 +0000
Received: by mail-oi1-x241.google.com with SMTP id i6so7178026oia.6
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jan 2019 10:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l23tRoJyNH/aRGl6SY9XuO7gGDTC9LhKkPqoiQNNxj0=;
 b=PufgkLK6tFkM5345Cseqs8mNxahheiCAek6p+7FjmsK1s5rbiWT8sv5uSO3fhfwinb
 euM+Us8wKnus10hNbPH2gjYgEHCZQq+Sfhnux5IT4W7Gn4c56R/AaynlVS733xff1Aia
 tLFG8quFva5UzvLRVg29r+rQj62heiLBR8dJcAAwVhgIaD4NwJZR6GnsnXRfr7LYpnPc
 dFUCPIGjBBlPrv+bqRXT5PYRilgvJtRtok863mDYz8nS7e7rwZmbta2owV9dDSFnRb9p
 2DgDshszHFoi/p/dCcO3yyqKEUtgYPbHh84iNbXDtE2hpyz7kDeQimf5VTFPLZTIPnwq
 XNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l23tRoJyNH/aRGl6SY9XuO7gGDTC9LhKkPqoiQNNxj0=;
 b=o6YgNhK8A/kS2hhp0Tw8u4ipRoR2sEu6k+HRQQ7RbdcH0ch3dM931MEvNK9sbiqO4B
 Bhl+34ZPKpr/wsyWqOtVQ9qLtPhlrE4r6gjXq4uxafzojNXlhZdOvTjN9DRBzODFtdvs
 UV8u/D8vPg9JIuslogKf1poit7+0t1qk2g+5y/yKPBudjCoj/Fk+qzy14QBdsTfPPSBr
 6f9auFVCpwvQW/W7LNt6pUgv9ljUsQ7TAFrgPbgw6SmUzHGBd4APuS4riN8nTiVtJzE1
 VJLtWJt310NQFakvO9g0sgX9/IREJ2CpxH0FwVnlZ/fPQviavkHRYBr5G9LE+ADBrg6M
 L2QQ==
X-Gm-Message-State: AJcUukcr3T267vr3WGq9YX2OkkD4GdWWIdT1saSnYQlOXkTQmH7Bia4g
 kHfXP1DYeMRZYtlpfeKaJ8UUtBl6yqm4xzNUtZg=
X-Google-Smtp-Source: ALg8bN5ZqdSTEtt70rNxGq0xw0PF7lDYOtkNEuLx+mAQj74V5FZowtROENJbsEgGyM18FBHEPoFSVex44w/T/gvwquM=
X-Received: by 2002:aca:5b88:: with SMTP id p130mr4415551oib.96.1547060110599; 
 Wed, 09 Jan 2019 10:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
 <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 10 Jan 2019 00:24:58 +0530
Message-ID: <CANAwSgQVaeAb5ta+zC6Fhc3xLjSCMY5-XzQpK7SwdS4LNAYfNA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: core: don't override the CD GPIO level when
 "cd-inverted" is set
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_105512_524819_7A8B9FB5 
X-CRM114-Status: GOOD (  21.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, bgolaszewski@baylibre.com,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Wed, 2 Jan 2019 at 01:14, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Since commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
> tree") gpiolib-of parses the "cd-gpios" property and flips the polarity
> if "cd-inverted" is also set. This results in the "cd-inverted" property
> being evaluated twice, which effectively makes it a no-op:
> - first in drivers/gpio/gpiolib-of.c (of_xlate_and_get_gpiod_flags) when
>   setting up the CD GPIO
> - then again in drivers/mmc/core/slot-gpio.c (mmc_gpio_get_cd) when
>   reading the CD GPIO value at runtime
>
> On boards which are using device-tree with the "cd-inverted" property
> being set any inserted card are not detected anymore. This is due to the
> MMC core treating the CD GPIO with the wrong polarity.
>
> Disable "override_cd_active_level" for the card detection GPIO which is
> parsed using mmc_of_parse. This fixes SD card detection on the boards
> which are currently using the "cd-inverted" device-tree property (tested
> on Meson8b Odroid-C1 and Meson8b EC-100).
>
> This does not remove the CD GPIO inversion logic from the MMC core
> because there's at least one driver (sdhci-pci-core for Intel BayTrail
> based boards) which still passes "override_cd_active_level = true" to
> mmc_gpiod_request_cd(). Due to lack of hardware for testing this is left
> untouched.
> In the future the GPIO inversion logic for both, card and read-only
> detection can be removed once no driver is using it anymore.
>
> Fixes: 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/mmc/core/host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index f57f5de54206..cf58ccaf22d5 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -234,7 +234,7 @@ int mmc_of_parse(struct mmc_host *host)
>                 if (device_property_read_bool(dev, "broken-cd"))
>                         host->caps |= MMC_CAP_NEEDS_POLL;
>
> -               ret = mmc_gpiod_request_cd(host, "cd", 0, true,
> +               ret = mmc_gpiod_request_cd(host, "cd", 0, false,
>                                            cd_debounce_delay_ms * 1000,
>                                            &cd_gpio_invert);
>                 if (!ret)
> --
> 2.20.1
>

Please add my.
Tested on Odroidc1+ and Odroidc2 both booted up fine.

Tested-by: Anand Moon <linux.amoon@gmail.com>

>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
