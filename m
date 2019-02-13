Return-Path: <SRS0=/lP5=QU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A23C282CA
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 08:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585E2222BE
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 08:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHYuuQ8e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NiYilG5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 585E2222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uxaq6aXHVWa7CJ3vbYZ2YgSlkEf08D41RDElIKJ1UQ=; b=oHYuuQ8e/aBboT
	uImYACK1xwqhRFlr3l4Va1nwbF2Rm6/OWcxnoKSjTGNgIr8fps0I1ILKskvS3VjsM4CjrWZHf8uwo
	Sl1W8Hf/1wr/egiBtUMik6jny758kIbD3WFvxIgs9e6KeIVh9CVGaMfavetvte6eBOjouwqNRAml7
	EPahU766LGqC01Kcs/FsvLy1BCka8AXed9r6AEQswSi2r4ZXcCGvgoTZnshtxmyINZW2CcFMeiRI9
	mM46dDkvlEB1Czhyzkm0c17KysztAYGKOmBa8VgWx5373KygQmIC2TMJhVoYTETXGqG635aqEpVWE
	xKgpCbLbsfvAjv2UT8tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtq10-0003mx-A8; Wed, 13 Feb 2019 08:35:34 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtq0x-0003m9-M9
 for linux-amlogic@lists.infradead.org; Wed, 13 Feb 2019 08:35:33 +0000
Received: by mail-vk1-xa41.google.com with SMTP id 197so353941vkf.4
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Feb 2019 00:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEJuA/CVqOqdf11K8MVRUa43ahzsWGYc2vCTimjDMLs=;
 b=NiYilG5ovc0665+noLtRsqe0pseSDEkhmjPOTzzquRnwDuIVQRLnTQQStaNK3TR/5S
 +x3Xfb09BgVElGMIGVvc76O+8WhYooUUQgEDmsoVkWTa1YY55NSFbXKpeT5jEJ4pYbgv
 DIwRcnN9BgP7n2REXfzhMQfJRlOQL8Dt7wtveGE0wTybBMcL81Ycoq4mr59ubkWOgBzX
 evBxxxZpK/K9Q7ilQucAQphIBvQN9bBX8KHOEbobRZkOg2Z9Ub0o8A8/3bWMRYmSNHso
 lfdymKcz06V2dVNLwPucP5KniSRAIPyc5MX77S7fn1pnaS6AvBJlYiZfP/6ol2OXPt3p
 IsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEJuA/CVqOqdf11K8MVRUa43ahzsWGYc2vCTimjDMLs=;
 b=l9KQx2hofMZxCLQeYuDfWfnHagKjdGUJw8cjnbBv3rEp21BgZODciOeUHCaJFriWX/
 Iy4KvNqXJmvxdhBlqETPLIarI8gMVMGOb+bnoY9YRErT0bI5hgB3V69gcDF9800hQonM
 v0ModKjdGjuO38sCXCEZ12iwj6VzYhIS3dkTCiVMcM+R3UUcteAw8s5ErTiVxHH69VUu
 9eTSlM15rLIkIh2rP80MVLC2FlV0MtDqYd5qmxJeHxgwjvoWclCtK6FXCRDaIj6l/8yG
 3Keu0b4wRmilyLcpSNyBA8dy3ve4vr/ZD+ud0GDzoD/mDIAkV8KCDZHj+gNYEuTPlu0k
 E+/Q==
X-Gm-Message-State: AHQUAubOK4ihQIkAJaOC6idFhjonE3WqCPN7YqJSDSSGpX5f9bJ6zycq
 oXnvXs3UcmP3tHAHQC0I3R79X7sLXibWLzjJKSeRxDwD
X-Google-Smtp-Source: AHgI3Iar92uKrY1QBRsuFskKuq94w5IqhEeacxpal0VDIQnOgJ/IDgoOQ+OsbEdosDF8mg1mEBswkcoVF3C6zbYTSIw=
X-Received: by 2002:a1f:1c81:: with SMTP id c123mr3370687vkc.52.1550046930571; 
 Wed, 13 Feb 2019 00:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20190209005850.11457-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190209005850.11457-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 Feb 2019 09:34:54 +0100
Message-ID: <CAPDyKFqFt4FPfWcpYzKsae_fPMuPtovxFdNUHviS_2vm5-YAYQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: fix interrupt name
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_003531_722628_7B1955A9 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Elie Roudninski <xademax@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Remi Pommarel <repk@triplefau.lt>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 9 Feb 2019 at 01:59, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Commit bb364890323cca ("mmc: meson-gx: Free irq in release() callback")
> changed the _probe code to use request_threaded_irq() instead of
> devm_request_threaded_irq().
> Unfortunately this removes a fallback for the interrupt name:
> devm_request_threaded_irq() uses the device name as fallback if the
> given IRQ name is NULL. request_threaded_irq() has no such fallback,
> thus /proc/interrupts shows "(null)" instead.
>
> Explicitly pass the dev_name() so we get the IRQ name shown in
> /proc/interrupts again.
> While here, also fix the indentation of the request_threaded_irq()
> parameter list.
>
> Fixes: bb364890323cca ("mmc: meson-gx: Free irq in release() callback")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index f19ec60bcbdc..2eba507790e4 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1338,7 +1338,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                host->regs + SD_EMMC_IRQ_EN);
>
>         ret = request_threaded_irq(host->irq, meson_mmc_irq,
> -                       meson_mmc_irq_thread, IRQF_SHARED, NULL, host);
> +                                  meson_mmc_irq_thread, IRQF_SHARED,
> +                                  dev_name(&pdev->dev), host);
>         if (ret)
>                 goto err_init_clk;
>
> --
> 2.20.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
