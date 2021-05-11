Return-Path: <SRS0=CWO1=KG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA170C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 13:00:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E58761920
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 13:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E58761920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JMlQyhsMnZymMi6mT+h3JHkch8TBhiPUoIVSmJCB0Lc=; b=S8QY8RonA6b1HlVwo+Y0+wqT4
	g66vaB3A5rnoJksZNwWhA8H4BmB6vpbuyZ0e992hRtx87kf+lXiWuWQXw6PLpD8XXrOrejL4ACV1Q
	3yACxkult2p/JKdfJ6CUhwkI28d0TeS2JXTPuuBOojcuVJPRHHSZz1C3YPMgU6VHTNYal4vj1A9Hn
	DLPZDHKbdKHtUdaLYFm8d+kl/fcCZ8BbHb3x7NDAMxHtzjK1TLszQNHJEH5YKthr6qxJr9QkDZrQp
	IMZd9Bhw4rRU8gixCdpAO93v0OeNK/6AtumTNzLHWbn4h4/YHBbM6B90628CczVLXEC6f4kmtT9At
	ALnyA791g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgS04-00HXht-SJ; Tue, 11 May 2021 13:00:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQ4Q-00H2ak-KN
 for linux-amlogic@desiato.infradead.org; Tue, 11 May 2021 10:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=krrXoOQowFRAS4ha9BPKaEPs6gzq6K83uwGtNzWwAQg=; b=LqS077Du24ae9+qvy3QaibLa9C
 ivLJB92cmdAPWnVIRcaubpTT/x7bMram3lZM1+6lyeb0/2qT2s8VXH3eOiqGhvdZ8h1XhdCOyY8jR
 vEOKu9lC/MN2kysOozZmVVlTKua72j7chUNfR0gDtcmT8G/rNvLBv3Ac/5lzeWhulFGly9R+KuT3+
 7sK6YipkRrFd0ZcRPtENpBe+b6AcCU/xOymHRazWx2wAv0ca5T8EznXhzxFDKtIzGNWgs7mu2leiX
 7hdJz8FMjjRQhVrWDqfQQ1yIYZIMhC709aBDgcIeMbtMRjCLx/MwHi0506a7/rxGVf0eUsA4rKIPf
 H+WJ2wHw==;
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQ4O-009UwT-0h
 for linux-amlogic@lists.infradead.org; Tue, 11 May 2021 10:56:57 +0000
Received: by mail-vs1-xe36.google.com with SMTP id x17so5645470vsc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 May 2021 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=krrXoOQowFRAS4ha9BPKaEPs6gzq6K83uwGtNzWwAQg=;
 b=ACnL0dHkwLYgVRLIqXXl9waYOfpeGuw6bxFeIn0GshIdwkCzuuDbsUDkcHVa3iHWbD
 9dMFrYAOSH6caHfutfFKebSEauklzP02eMHhavj642e3BUN6RzyQTAZ06ZzHxH5bsX/p
 AO5X5sJBRZ75Y6HyMrXazCTDY3X8Nox9vnaFXMT0SZHfvuzMeEWhpEYw7g2kBWdv4XU/
 nbbCd5oy+j72M7FLpX1+PnQNZ7OqXnEicQbzxRRjqlV6NUFQB9dhBwOAfq+FiITsBFwL
 oyH4FpASr2Y92pOiXm8TsNiZY9xTSYUEJA7Xi575WTf8k0e/kRc+UgzvshXpjUIh+wTi
 FX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=krrXoOQowFRAS4ha9BPKaEPs6gzq6K83uwGtNzWwAQg=;
 b=K2CQ/AAhYIvReAoNHtjT3GeZKRFexmZgQo55u2jP97ugfDOCJ394yNPhth3YgTIxry
 vA5Y9qFhpwpAVZ0WEUR1azwd1X/hLeQsLenugTttCvPoE5tzrWvNxeJd+q0G+buZs9NF
 I/IEYqDazTySSgl4lIvQLIT2pKH5YzAx1MkCCjmlltXYSwgXfB2AV7xkSr1Lqm3ivgHX
 Q10QbMmMFyxoID2pTHRWzofYYtX3QJopgsyI4IrrvkOXIiiJq935F7tfjjW7EyaWbKX6
 uNKp7VfJdjhJbuaM3/LbSHVp7TLhRQQO+NdTPPretqmkjsrcv4qOUrwawQB7FozZn/8d
 Ye/w==
X-Gm-Message-State: AOAM533ZVVwlttIfpyiMSTnVX7xQpFAziAx7YlZK9LqJbBx8Oj4eigJx
 ufa/FXvE/oogdSXEyZH8NSGKGw8tI8iWGvz2ralDDg==
X-Google-Smtp-Source: ABdhPJxzT/keb4NOKXYCQGmWjolAOxpB1deXwetWTWdB7OlQ0knG8WgebyOQPjN1sx3avf7QixyvXZE1TGni0Xt+ppw=
X-Received: by 2002:a67:f60e:: with SMTP id k14mr25253513vso.48.1620730614934; 
 Tue, 11 May 2021 03:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210426175559.3110575-1-narmstrong@baylibre.com>
 <20210426175559.3110575-2-narmstrong@baylibre.com>
In-Reply-To: <20210426175559.3110575-2-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 May 2021 12:56:17 +0200
Message-ID: <CAPDyKFrZY0vdQrFfAGCRW2MM25WY1rivwiPv8u3aHsfwNPbe-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: meson-gx: also check SD_IO_RW_EXTENDED for
 scatterlist size alignment
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_035656_078111_5670B42E 
X-CRM114-Status: GOOD (  21.40  )
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

On Mon, 26 Apr 2021 at 19:56, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The brcmfmac driver can generate a scatterlist from a skb with each packets
> not aligned to the block size. This is not supported by the Amlogic Descriptor
> dma engine where each descriptor must match a multiple of the block size.
>
> The sg list is valid, since the sum of the sg buffers is a multiple of the
> block size, but we must discard those when in SD_IO_RW_EXTENDED mode since
> SDIO block mode can be used under the hood even with data->blocks == 1.
>
> Those transfers are very rare, thus can be replaced by a bounce buffer
> without real performance loss.
>
> Fixes: 7412dee9f1fd ("mmc: meson-gx: replace WARN_ONCE with dev_warn_once about scatterlist size alignment in block mode")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 1c61f0f24c09..016a6106151a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -236,7 +236,8 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>         if (host->dram_access_quirk)
>                 return;
>
> -       if (data->blocks > 1) {
> +       /* SD_IO_RW_EXTENDED (CMD53) can also use block mode under the hood */
> +       if (data->blocks > 1 || mrq->cmd->opcode == SD_IO_RW_EXTENDED) {
>                 /*
>                  * In block mode DMA descriptor format, "length" field indicates
>                  * number of blocks and there is no way to pass DMA size that
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
