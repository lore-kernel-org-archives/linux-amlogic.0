Return-Path: <SRS0=khgl=75=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399BEC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2020 11:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0804E20B1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2020 11:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H0oP8oQm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VibwAZSD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0804E20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqIGbWqZQp6kwT77czr+Ezwr4itF/H9o4udEQvZqp8s=; b=H0oP8oQmVNvK0V
	FBYjxQxn8kNjoDjoUuAK1zUQhkRumjqiF244JSrjUYqw4wdRbhWV1QOybykXn8hf/0/EGWyv2FlW/
	ewgNQHN5LPZR4KWB7fNf5EqwTKIlEO5cIdQceDulxr0J1AthlzVYv/BIo+sNmcz6/RSa/+d0Sv5sq
	QN0kDGdD3LaxrcsQ6HdX55PmS+PTr4K/32HZF86a9TeizuBjI3Vt7/LhWI6zzOoW70ZwRFfBR9b17
	yQjXZdGeTgR+o1+IX2BRhl+a+3WBBACGTp1n2JkoyflXJAUUqbpblY3XiQMffUNr4Um0jdACuUq5Z
	NLpij2lUF4Z4ZdqZSHtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl9qJ-0005Ww-Fn; Tue, 16 Jun 2020 11:33:27 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl9q6-0005Kz-3n
 for linux-amlogic@lists.infradead.org; Tue, 16 Jun 2020 11:33:15 +0000
Received: by mail-vk1-xa41.google.com with SMTP id s192so4711279vkh.3
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Jun 2020 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSg0muGbkwOyh6Ot3lTlpvo0Mmt4wgCAweHT5tRHxm0=;
 b=VibwAZSD84LU+4hHmx7H20bVV8ZpftSbkJ7qeyM+fPSnWy5b52HMmY8uC6oN/TOJ3N
 Ppd7MeLLzhu4lLdwL1u8+HFFzEJwEkIRbPl3l2liiO84a2tEXnOOLJLVeD2eQr2LEdo1
 GuqKU5ksA+/+QuCtf656nkvB+l8BnzLR+CwMeWI8NMKjSG87T6hTFLog6RcU8uJ5b42y
 lBqr6ENJXZQ31zwwwbbWm8fG8NZlpIVe4l6fg47KvRL/VkNsBi3g56UkQTQ64+dQKFpF
 89zZO5b6w/YjOAiLDeGYGxLcR5EKhAFvvlLFVKqumAr2y0DtwWTd9++bWUxaqHYG4fEh
 NmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSg0muGbkwOyh6Ot3lTlpvo0Mmt4wgCAweHT5tRHxm0=;
 b=pT1xZjpciymmgIocLGCB83RwdhJz7A70TalDpQY+puwfo13r3hJY1sk6by5ae+44le
 70x0WehIKoCwV64FvbgJJlXEMZsXkS63MRSdxW242VyjnEwm6MHlSInUdGrZFxWf8SCO
 4UbmsjFEZwQEm9EYh3dn49loRqWksa48Pwjd1mNSCTrGYfLcUtDnukj0YZh1ZuZRAkIv
 tVKgrVW4DgDjigbZXyXmFZNsyRiDE+HPDWVUbDnlczi5vbuaJCM8u1h6HVSRl6/MXZyE
 6bs5/xG7DR0F/wEG6Kl8Yga5ByTOycbLRRo7ilPtCUCpU9oLq/6+t5Zp1mjKLXZjA3lt
 aD7Q==
X-Gm-Message-State: AOAM5314SC0oTAuVpHZlIdFCCRvN0zpEIRRcFIC37A5foflQ/piuOfFC
 973FJ4/vl+dlk+D8077wtrgMQ8sWQPBZ/wNmekc6kA==
X-Google-Smtp-Source: ABdhPJznqqxzYSq4IwrFjXL5kmjhHPScZNDOA7H32xZbM7qlqeiuriVkd5OOYnJKbb8oO4Q4Ov7r07YvZL4Xn1v7YjE=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr1118293vkh.53.1592307192362; 
 Tue, 16 Jun 2020 04:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200608084458.32014-1-narmstrong@baylibre.com>
In-Reply-To: <20200608084458.32014-1-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 16 Jun 2020 13:32:36 +0200
Message-ID: <CAPDyKFo7VA-wbOZUxExUpPoc+u446KecFARX0KNCakaubowpXg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: limit segments to 1 when dram-access-quirk
 is needed
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_043314_408039_160BE814 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Art Nikpal <art@khadas.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 8 Jun 2020 at 10:45, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The actual max_segs computation leads to failure while using the broadcom
> sdio brcmfmac/bcmsdh driver, since the driver tries to make usage of scatter
> gather.
>
> But with the dram-access-quirk we use a 1,5K SRAM bounce buffer, and the
> max_segs current value of 3 leads to max transfers to 4,5k, which doesn't work.
>
> This patch sets max_segs to 1 to better describe the hardware limitation,
> and fix the SDIO functionnality with the brcmfmac/bcmsdh driver on Amlogic
> G12A/G12B SoCs on boards like SEI510 or Khadas VIM3.
>
> Reported-by: Art Nikpal <art@khadas.com>
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Fixes: acdc8e71d9bb ("mmc: meson-gx: add dram-access-quirk")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 35400cf2a2e4..cfaf8e7e22ec 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1143,9 +1143,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
>
>         mmc->caps |= MMC_CAP_CMD23;
>         if (host->dram_access_quirk) {
> +               /* Limit segments to 1 due to low available sram memory */
> +               mmc->max_segs = 1;
>                 /* Limit to the available sram memory */
> -               mmc->max_segs = SD_EMMC_SRAM_DATA_BUF_LEN / mmc->max_blk_size;
> -               mmc->max_blk_count = mmc->max_segs;
> +               mmc->max_blk_count = SD_EMMC_SRAM_DATA_BUF_LEN /
> +                                    mmc->max_blk_size;
>         } else {
>                 mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
>                 mmc->max_segs = SD_EMMC_DESC_BUF_LEN /
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
