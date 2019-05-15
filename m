Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E1FC04E53
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 21:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E6420815
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 21:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cx7eYo7M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lxiRTmNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E6420815
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nyLinza+DmCyifeK3SFfXVmyPiriVbHBoZU/6HPJlg=; b=Cx7eYo7Mi5Nl5w
	Rr7AIXdGD2xKNCFHYD9n3qRx4KaKBCnm42NCznIOBasOJEsIIW2xaksAcI0f/F3mM/aNsJXIubfZo
	Jf1ZqulX5F+9oGwfyRiKreah3iWmXNuVVKEp0JgjV4xTXIQumzUOEsY0RtHykudO4C0bDUShlJmMH
	O+axKYVE/EBY8JmZleX3JyVKswvo+X29Z9T+TfIHfpVs7mef8F2TSMR0yd56SyzCmdlzNm4XfehsC
	R7n6HsfFEYNflUycYJ1p5LDUI6nuRH6bNfxZRt+EJhb0yYFINlwJxFZSSaN2iHHEwf2/+s4vWOprW
	3KzF2wNu+u9f5gqxUlQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR1IK-0001Im-01; Wed, 15 May 2019 21:18:36 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR1IH-0001IQ-VK; Wed, 15 May 2019 21:18:35 +0000
Received: by mail-ot1-x342.google.com with SMTP id u11so1423047otq.7;
 Wed, 15 May 2019 14:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KECxhG00vBm0IlDH9n6KSnmJxztUTqeZiXx2Brec6f4=;
 b=lxiRTmNOWVZoT2dnKAkBE35aDOk0GpZXsTGuC/FrYuP4RFUSpzz6R4+NBThg8+7Caq
 FlqWM2pP9jcBvRD6saFfOMWkCHzRc1E18PMXTwKslca5pVeoIHTG/yn90g+1xn5lTV0t
 cTbe2XWURr41z9tc0od/mJbjPb7jnWdwYSVP9P71J4dF4GeSFzh0f5hEoscDHNtaNPxo
 bLI2In6ZENqM9Tlp9NfLSQ5eKXxinuapLsYOkFuGqd3wCCTQw1xZEvupjlx+7VL2DPXc
 iSEpXXk48IgJIxWDu66zafTBGCh4hisAMnd0cYOKcniZvGduISlfqnJyCewQt9gLYUfn
 PuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KECxhG00vBm0IlDH9n6KSnmJxztUTqeZiXx2Brec6f4=;
 b=iAbpSwyMKbpp8/BPfEbodI1Y56jaxHLdUSNRlZlXyKmLIGW2IfzRZQhVlSDgI9G9K2
 ddbTVjeDVyGcIdSBLQPykjxDEpjcCQbNoGRQ2WnAfLg/y+aw43+m9DncXBBz8f2wWnAB
 6ELOXmr6hD34veQfjYomkXUqUw8b65H6xNn6DatfZQaF2P/wAfNrrRewpwcnqZlamAwu
 b17TJY+znnXIylXA3/4A+EGZ7XeGt9ovyQ6DCMB6ujp5q+3QBnIDKfcdCOcHkur5RUSd
 EwXN3OJXEBWQ57sEyT/s5iGMKnzp1injV883bfsd4+TbmWWmTx1jFvvSNAcOYq+aTyBu
 Wjfw==
X-Gm-Message-State: APjAAAUhMb6CEN9V4UMochH4i/yPUuEbhHXOz21vcdPdTF/iwzWVEKjs
 5mqGm7ly+P8vOYHS35q7URaGFbMIbVye3j0k/lM=
X-Google-Smtp-Source: APXvYqyQOB61kbFWuMCaUd5x0vsZQMGyFvBi3SwJNnEy3rL9O+2ei3JvJEQX5nvmjaXp7fQunZiagCxcjb0d9Zgfb1Y=
X-Received: by 2002:a9d:5618:: with SMTP id e24mr3459779oti.38.1557955108329; 
 Wed, 15 May 2019 14:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-3-narmstrong@baylibre.com>
 <CAFBinCAMoNDnxoQA9XHKy0Xo9MduxD1CvQXOeLZQ3zZ4ViWm7A@mail.gmail.com>
 <a54f7a4a-c280-6181-969f-4979dadb36b2@baylibre.com>
In-Reply-To: <a54f7a4a-c280-6181-969f-4979dadb36b2@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 15 May 2019 23:18:17 +0200
Message-ID: <CAFBinCCtNQmKKL8yw07DKOfPK=eusgCuYeBmwgiHm0SSVmuFPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: meson-gx: add ddr-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_141834_036234_C824581A 
X-CRM114-Status: GOOD (  20.12  )
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
Cc: ulf.hansson@linaro.org, baylibre-upstreaming@groups.io,
 khilman@baylibre.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, May 15, 2019 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 14/05/2019 19:58, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Mon, May 13, 2019 at 11:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > [...]
> >> @@ -1158,15 +1183,27 @@ static int meson_mmc_probe(struct platform_device *pdev)
> >>          */
> >>         mmc->caps2 &= ~MMC_CAP2_HS400;
> >>
> >> -       /* data bounce buffer */
> >> -       host->bounce_buf_size = mmc->max_req_size;
> >> -       host->bounce_buf =
> >> -               dma_alloc_coherent(host->dev, host->bounce_buf_size,
> >> -                                  &host->bounce_dma_addr, GFP_KERNEL);
> >> -       if (host->bounce_buf == NULL) {
> >> -               dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
> >> -               ret = -ENOMEM;
> >> -               goto err_free_irq;
> >> +       if (host->ddr_access_quirk) {
> >> +               /*
> >> +                * The MMC Controller embeds 1,5KiB of internal SRAM
> >> +                * that can be used to be used as bounce buffer.
> >> +                * In the case of the G12A SDIO controller, use these
> >> +                * instead of the DDR memory
> >> +                */
> >> +               host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
> >> +               host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
> >> +               host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
> > I'm curious: why do you need to set bounce_dma_addr in this case?
>
> We still need the physical bounce buffer address since we write in the registers,
so writing bounce_dma_addr to SD_EMMC_CMD_DAT is needed to make it work?

> and we need the logical address to memcpy() in the buffer.
as far as I understand that is what we use the "bounce_buf" member
for, but I don't see why we need "bounce_dma_addr"

> >
> >> +       } else {
> >> +               /* data bounce buffer */
> >> +               host->bounce_buf_size = mmc->max_req_size;
> >> +               host->bounce_buf =
> >> +                       dma_alloc_coherent(host->dev, host->bounce_buf_size,
> >> +                                          &host->bounce_dma_addr, GFP_KERNEL);
> >> +               if (host->bounce_buf == NULL) {
> >> +                       dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
> >> +                       ret = -ENOMEM;
> >> +                       goto err_free_irq;
> >> +               }
> >>         }
> >>
> >>         host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
> > if host->descs cannot be allocated then you need to conditionally skip
> > dma_free_coherent for the bounce buffer in the goto err_bounce_buf
> > case a few lines below (just like you did in meson_mmc_remove)
>
> It can be allocated, it's only useless. I can skip it but I don't want
> to break any logic in the driver.
I wasn't clear in my last email, I meant this error case:
  err_bounce_buf:
    dma_free_coherent(host->dev, host->bounce_buf_size, ...
when host->ddr_access_quirk is true then you skip the
dma_alloc_coherent call for bounce_buf


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
