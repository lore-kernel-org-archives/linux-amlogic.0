Return-Path: <SRS0=qPrc=6V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5D7C38A2A
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2020 09:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF20E20747
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2020 09:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jiytyG5h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kI+WeYFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF20E20747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/f+A9sI9XwWOthUxcXjRsvRaxPH0+XlRN1I3sLXpHa8=; b=jiytyG5hekz3wk
	3bH0//qUoiQAZLI7SSNil5+7EgKMyiawp+/0z/ltsvdQvb+Q9qabJch6d80Cf1VqAuZSFpz/CVjqX
	zxlZ9uEU2ry//6S5bIOm9xFveAXSK7uTzeaYrKPmHzXqASmGSb2sJk1yT59iq9ztol0jcN/1g9FhF
	0DaQCbLB31V6OGGbxHNeWEcYGiCXLvNCba/kpdKjFhoaGKlQJ74ZYUotMD1dlQ45JALFu1G91QRa+
	l24okjdcfKZ2bHRpWd+bKMQm9CfJkjss4abPUtQsaE6Eh4Z0bVPy3kGSzOM1ci9p2M5YFT9yXkEVm
	eCLn+0nwEFJdxxXmf79Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWcrI-0003FY-Hi; Thu, 07 May 2020 09:30:24 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWcqs-00011x-0y
 for linux-amlogic@lists.infradead.org; Thu, 07 May 2020 09:29:59 +0000
Received: by mail-vs1-xe44.google.com with SMTP id a5so2940279vsm.7
 for <linux-amlogic@lists.infradead.org>; Thu, 07 May 2020 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=viH1iV0igem6dG1osD5lXSFto5UeKQo6I/r6j41w2Kg=;
 b=kI+WeYFEEA9jLoKV2d3E7dwUyyonlIPIl242k9750XKo5ORe4klWfuAV7grrUmx0pe
 81oSbWvf2JRpXrMDhtyaIzsMHzryrCqE0t4iOTWk45BvIr2QwotvhUUNbfqfE0msdui8
 A/+Tx3vLGOvtTPE1kWGs//HDeaZI2xem+qIyqcHHUztTiprouVP8b8AuR5o78AMr89UA
 HQzNycaDph+I3X8/VRavIrGj+mUVMK/JPdIhTI7VAtbK0NComAh/lF/6zjRcrVSpW9xG
 GFPpsYWE/TH2D45e4L0+VhUZX/H6aNF9Tc8iOkF1hmV0MpGcaJAkoIVvTpDm7sSAnW/t
 gQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=viH1iV0igem6dG1osD5lXSFto5UeKQo6I/r6j41w2Kg=;
 b=t6mIRVJ0IYw2XU9XWZfYaYEF7IjdWXka8WnMLZ3enRK4rdNb6pQtOd1OzsSyimue1h
 Qr8qOKTMGMdD0Up5UIMIehgW+wfETmrg+z/VDJuHmoOyXlNXnnRNVe9y1NYmxjkAtjmc
 kL790qR8tmOgEsFP4fChj+gMFQnbJznHUWfS1rf+/Q+FbqBia3V9b7UaIMO+wmqM99Sv
 jVYzSN+PusCrC8JuR5j37sEbgFa0WwwgqsQ5M5O+QF7dnT5Xwrrv6bBmMUAduuQzKvN2
 k6Pujf6FZc/231wJnhNr8x91bhxxNhCGf0lJpDBgllm5c5j0gi1g9MEwDFyh97yfxS6y
 wHEA==
X-Gm-Message-State: AGi0PuYphyHWN1cjWfyh/VitDKZTvr8w45YuX20UgaEaEuepWxNHJ5Gk
 ZwTuYDAZQE1FNRiI6IRljrjPcxyEkIA//lquOZtZmA==
X-Google-Smtp-Source: APiQypI4am7jPf3se8Tdni9X7LAo6FYulFfGe4r2VYbr/7W89ZmzBdleCOUBkENYjHbYMqRf6aOMQjzkJhq36+9MZOM=
X-Received: by 2002:a67:ee0d:: with SMTP id f13mr11495244vsp.191.1588843795661; 
 Thu, 07 May 2020 02:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200503222805.2668941-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200503222805.2668941-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 May 2020 11:29:19 +0200
Message-ID: <CAPDyKFrY0ApUCNL4gVHRc2FRcYaS0PKr_P4a18RUZHxcVceVWg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdio: trigger a soft reset after a timeout
 or CRC error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_022958_070542_43890CB3 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 4 May 2020 at 00:28, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The vendor driver (from the 3.10 kernel) triggers a soft reset every
> time before starting a new command. While this fixes a problem where
> SDIO cards are not detected at all (because all commands simply
> timed out) this hurts SD card read performance a bit (in my tests
> between 10% to 20%).
>
> Trigger a soft reset after we got a CRC error or if the previous command
> timed out (just like the vendor driver from the same 3.10 kernel for the
> newer SDHC controller IP does). This fixes detection of SDIO cards and
> doesn't hurt SD card read performance at the same time.
>
> With this patch the initialization of an RTL8723BS SDIO card looks like
> this:
>   req done (CMD52): -110: 00000000 00000000 00000000 00000000
>   clock 400000Hz busmode 2 powermode 2 cs 1 Vdd 21 width 1 timing 0
>   starting CMD0 arg 00000000 flags 000000c0
>   req done (CMD0): 0: 00000000 00000000 00000000 00000000
>   clock 400000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 0
>   starting CMD8 arg 000001aa flags 000002f5
>   req done (CMD8): -110: 00000000 00000000 00000000 00000000
>   starting CMD5 arg 00000000 flags 000002e1
>   req done (CMD5): 0: 90ff0000 00000000 00000000 00000000
>   starting CMD5 arg 00200000 flags 000002e1
>   req done (CMD5): 0: 90ff0000 00000000 00000000 00000000
>   starting CMD3 arg 00000000 flags 00000075
>   req done (CMD3): 0: 00010000 00000000 00000000 00000000
>   starting CMD7 arg 00010000 flags 00000015
>   req done (CMD7): 0: 00001e00 00000000 00000000 00000000
>   starting CMD52 arg 00000000 flags 00000195
>   req done (CMD52): 0: 00001032 00000000 00000000 00000000
>   [... more CMD52 omitted ...]
>   clock 400000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 2
>   clock 50000000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 2
>   starting CMD52 arg 00000e00 flags 00000195
>   req done (CMD52): 0: 00001000 00000000 00000000 00000000
>   starting CMD52 arg 80000e02 flags 00000195
>   req done (CMD52): 0: 00001002 00000000 00000000 00000000
>   clock 50000000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 4 timing 2
>   starting CMD52 arg 00020000 flags 00000195
>   req done (CMD52): 0: 00001007 00000000 00000000 00000000
>   [... more CMD52 omitted ...]
>   new high speed SDIO card at address 0001
>
> Fixes: ed80a13bb4c4c9 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Ulf, I consider this non-critical because as long as the meson-mx-sdhc
> driver is not merged we only have one MMC driver for these platforms.
> I don't know anybody to prefer SDIO wifi over SD card access, so this
> can go into -next (in my option at least).
>

Alright, applied for next, thanks!

Kind regards
Uffe


>
>  drivers/mmc/host/meson-mx-sdio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 2e58743d83bb..3813b544f571 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -246,6 +246,9 @@ static void meson_mx_mmc_request_done(struct meson_mx_mmc_host *host)
>
>         mrq = host->mrq;
>
> +       if (host->cmd->error)
> +               meson_mx_mmc_soft_reset(host);
> +
>         host->mrq = NULL;
>         host->cmd = NULL;
>
> --
> 2.26.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
