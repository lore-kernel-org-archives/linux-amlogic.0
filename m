Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77457C46460
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 17:58:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E75620881
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 17:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BzhKg8Xk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kz2jzjhP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E75620881
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbi1AmcPDA48hz4R6ytNt7ee6E+bMuDU9k1moL7yEOk=; b=BzhKg8XkpNsylp
	iFjPhv8TQzvInJFyjFClDfhYWlMAAOAFwvM4qTtUBE+J0+NW6hTIXubZ8vglV10XNkNY457UBlpcO
	5csprqBzRBNkeDJhjFZxeNE7hh2RsRnpleUHOGq/1v466a78F7N5v6/a0ynjX78P9tig5RjsHCRpU
	K6QhatgbU2psMb6ApHNNxXaXr6ZAJVHogTIIaBmIPuafvQwheZPYUpfZuY4d981DqcZHuPDYOlOge
	rreXOdhQqceo/KViACdF1Pp7l5kcvTHXE+KnscDgryk4+4tkQCfeKyx4s+wf9VHugLktQLwFLMTw1
	uwkxp48zQDbO6ZnLXjUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQbgt-00019x-QJ; Tue, 14 May 2019 17:58:15 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQbgq-00019J-Ck; Tue, 14 May 2019 17:58:14 +0000
Received: by mail-oi1-x243.google.com with SMTP id k9so12801282oig.9;
 Tue, 14 May 2019 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbgR9sIIi020lB4uMc6drG+hzB7QuAOCTK+0TBCg8Cc=;
 b=kz2jzjhPKbEnQayS8dgCy5rubRTQIqMh2n4HuPMUyO1VSNt3vJVG3lRGzuhbsI7p3E
 n5/wGiKy0e9r4F73sN9EtnuBGim238QQ5IXF5Kg2gjaXohTQqng7UWygNuC1ygsw4VxO
 M+8UD/VB0e1f5gHNJ5O+jT/vi6m/8R5TT1B1SR0/EbOy5+baCCimbQfw+Ouljrb9YPGu
 625otuoxIyGC/IELiz1fY+/4lN6Eb0wqhrrG9xleiIuzj7FxDFLVYYI8nlUC3sT+Hwjz
 KX51hfprCqpxSkRn/DY8eE8dlw9qG4vCtS4Wli4x7zRqP6P0Rw2srvdyHRSt6iYncg3/
 uT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbgR9sIIi020lB4uMc6drG+hzB7QuAOCTK+0TBCg8Cc=;
 b=cQY+DJ5ouK1PiRXtog+U11ha+df9ReAwEnVnhUkRNrKP5sniDGAOGp9SzoQ4nys5sS
 PEWUlm4ZUfuFYAqPu1nUeZN8uBjr0BhNrIiM4K0uwZ2+t5NuVSRMHZA9WKdT8vx2tA4b
 xXdr4sqwz6s/s15yhU+IoR0W9WJxPPYgUU3wCuJWHIJisOmSfjd+w9oNQ7EsZZfPAbcH
 Pu5gdM/2HXcuLf/YLfPpvjDgE70DEm2gsUJ/3QRqICbGZ4g67BjSFEULndW5ZIWzve56
 FXniYC8l1LSOLEIj1Sbz+QLWS4eukJhOgl9z4dRZ54VrsNNevqdc9RGG41/bJfDppWUq
 +7lQ==
X-Gm-Message-State: APjAAAUb8898d1oBtnFNxfsHnRvVqu0pvjZO6vj0O7XmF3JIbdZavYcG
 cykOLn2ofTe6nJL87c91tuNvEgdZddJK5ZlOrLg=
X-Google-Smtp-Source: APXvYqysSJO7wFng5taFNsIZOMTqAUX0pN7PyrW8jgVBQnbRhhf71UhUYZKIQp8b0gAYrWujo+I5sI1OdRoLfcqfyqo=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr3946699oib.129.1557856691277; 
 Tue, 14 May 2019 10:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-3-narmstrong@baylibre.com>
In-Reply-To: <20190513091548.16674-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 19:58:00 +0200
Message-ID: <CAFBinCAMoNDnxoQA9XHKy0Xo9MduxD1CvQXOeLZQ3zZ4ViWm7A@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: meson-gx: add ddr-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_105812_496791_01CB4A9D 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, May 13, 2019 at 11:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> @@ -1158,15 +1183,27 @@ static int meson_mmc_probe(struct platform_device *pdev)
>          */
>         mmc->caps2 &= ~MMC_CAP2_HS400;
>
> -       /* data bounce buffer */
> -       host->bounce_buf_size = mmc->max_req_size;
> -       host->bounce_buf =
> -               dma_alloc_coherent(host->dev, host->bounce_buf_size,
> -                                  &host->bounce_dma_addr, GFP_KERNEL);
> -       if (host->bounce_buf == NULL) {
> -               dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
> -               ret = -ENOMEM;
> -               goto err_free_irq;
> +       if (host->ddr_access_quirk) {
> +               /*
> +                * The MMC Controller embeds 1,5KiB of internal SRAM
> +                * that can be used to be used as bounce buffer.
> +                * In the case of the G12A SDIO controller, use these
> +                * instead of the DDR memory
> +                */
> +               host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
> +               host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
> +               host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
I'm curious: why do you need to set bounce_dma_addr in this case?

> +       } else {
> +               /* data bounce buffer */
> +               host->bounce_buf_size = mmc->max_req_size;
> +               host->bounce_buf =
> +                       dma_alloc_coherent(host->dev, host->bounce_buf_size,
> +                                          &host->bounce_dma_addr, GFP_KERNEL);
> +               if (host->bounce_buf == NULL) {
> +                       dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
> +                       ret = -ENOMEM;
> +                       goto err_free_irq;
> +               }
>         }
>
>         host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
if host->descs cannot be allocated then you need to conditionally skip
dma_free_coherent for the bounce buffer in the goto err_bounce_buf
case a few lines below (just like you did in meson_mmc_remove)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
