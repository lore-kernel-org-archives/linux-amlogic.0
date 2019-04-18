Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F47C10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 19:53:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5718220643
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 19:53:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHwCC+lR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RToypm0L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5718220643
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riY84MFeuzIv5sblqrziOyVqPpdgJYztwfCT7iak16o=; b=qHwCC+lRy09G8g
	JBomfz1dEYnMnfQLrMrsJ8AO1P80VTe5NUyR3lSyeXOc3/NWzgo+B8frE0y61uchm4NQ4vISnLrpV
	Xr/ah85zXIgoZ3WUSHKE5aQQp+6bMEjWkN3zggpFm4UBt3BMWM3o2jZSQ7+w37feYpmxd6+zUM5TI
	pYFUii+mHY0nFtPyiaBG2WGJyZivZQHhPMp6YLQNRPhcy/bt59qVKfTxwkrUlJKUwgD2fzLiaSE33
	NhOC7q+lmrCpaElFiNj8oTNjZfVKnzUZkwx5e45c5Gd8RJVngSldOKYTiXw0rCLHaFDT2Y7GRvDfR
	HnQQHveuQeu8xkW2AKxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHD5h-0001Fl-Ld; Thu, 18 Apr 2019 19:53:01 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHD5f-0001FC-0q
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 19:53:00 +0000
Received: by mail-oi1-x244.google.com with SMTP id t81so2522711oig.10
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHnwyGfhVr9Zztuv2ApDOuCX8Y7zltAfnvrToemqRvQ=;
 b=RToypm0LzA7aEPsdwcyZWsDpf7kcuyHilgD6PotVZegNUDJInGcPC/fDzBAYaIiy0x
 AftRuV639VZM/qmxzzm5wsCFHk5FAdzTUOqozhwTOxqkp6rYjzj+UTukmFd8/fD/33Yk
 jfpY1ja1LMNGV8HDnvlsTvc2KzGV3b+aJUl6lKcuBdKEnoge/hDSHtlTDsNnCgH9bc6m
 p1r23wKO/Rt1yKM5j44oTmmoOwcHg04+U4D7aMakK1D/VFpDV36vZpndGFhf1h9Ig2di
 4Y7R7+tmD7AQRVTtloegb8VhOpym7Fc8pw4VxWTprJg1ngV4BKa/oUscmzvJtYDDa8KY
 bkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHnwyGfhVr9Zztuv2ApDOuCX8Y7zltAfnvrToemqRvQ=;
 b=ALUcp3y09cHii3tHgXr5gDVyxaiqfP2WMHv/w7dyAovG8L8QlEh9cBm8nVpdKaOL2+
 LfCVHfCp6A5hNk0L6W4/uHU7pEVkJeMZjFe92ByzsNaecT+lzdjRRtAunnObYtW646g5
 hdPY4sR+UEQmR/9w/28wygSXFTeFvcSyy5DAu0W7hxugrT9Cujuz3qrcpGpP15fWK5kI
 Dvb0hhHH62bfbLY15oAi16KZLGaCPJSDN5tVm833CvRGtIchRYJWVmLrhqq8u1YT5lNC
 SqXEKNIMge861IETuqXqrArBVYVCK2rs0ydZ9djmTppy9nPvnrwLFiSk4HBFX8C30Bfa
 UXEw==
X-Gm-Message-State: APjAAAWtivQLSul8pOsEu88qX2MhBjFebkGsST4grGbRN2Sun2PzavaQ
 mps9i9jRnmnF1Wa16Q1OP/m2J4LVdWZTXvm5CtQ=
X-Google-Smtp-Source: APXvYqzhRGDYdQYcsQ0iJMDM/aYQoo017EmckJ6XW6iArqLhjBj6Bpkndhtr7fXXiXm4jsqSoVJyGr+edJFUU08wgF4=
X-Received: by 2002:aca:ecd1:: with SMTP id k200mr3131053oih.15.1555617177999; 
 Thu, 18 Apr 2019 12:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-4-jbrunet@baylibre.com>
In-Reply-To: <20190417204355.469-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 21:52:47 +0200
Message-ID: <CAFBinCCLr2-zBhAUcYsyqF1f0hvH03zoXd9SmSjMU5aA3K7Ytw@mail.gmail.com>
Subject: Re: [PATCH 3/7] mmc: meson-gx: irq is not shared
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_125259_059876_094E741F 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> There is no reason for another device to request the MMC irq. It should
> only be used the MMC device.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 8b690ecde4c5..3df50b53f834 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1328,7 +1328,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                host->regs + SD_EMMC_IRQ_EN);
>
>         ret = request_threaded_irq(host->irq, meson_mmc_irq,
> -                                  meson_mmc_irq_thread, IRQF_SHARED,
> +                                  meson_mmc_irq_thread, IRQF_ONESHOT,
>                                    dev_name(&pdev->dev), host);
the commit message reads as if the intention is to remove the IRQF_SHARED flag.
however, the commit message doesn't mention IRQF_ONESHOT (which was
not set before).

if you used IRQF_ONESHOT on purpose then please mention it in the
patch description.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
