Return-Path: <SRS0=CWO1=KG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450E5C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 13:00:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8374661921
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 13:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8374661921
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rbX9e9FIMmapM1sZlHzEC88nAFDWJ9baqauzgVnLdk4=; b=Gu5Uxx+0B2z6uzeQUtMpRfZYf
	0VKHEnAArU4mVjJmkgBRqykKgzberCXTdq0p6U8i+aSho/NcKW+izPvVelN7i72pukwsOghFdV1Kz
	/YvBzl3LyOZ1hqetUmZvhst3SpgcbRVhYI6INTOsKrBqJJNxIk1O3OPauxqcyHClpQ4D9zo831ZBX
	/MSY36FDSAUN4bwGoDfXKdS/1yw+nK4Aw3RXetW2KfuD8r3JtgU3gL8PtLduC2qpCu8ze9Gc18WAq
	tobbM3JX8ScC4bhSbssGIvpOQDR607JTgkeG6HbqG2DQsdbk9k/ZGQmUKmzV3MbcaR/lFim468Apv
	CEXbini1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRzU-00HXSd-5a; Tue, 11 May 2021 13:00:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQ4M-00H2a6-Vm
 for linux-amlogic@desiato.infradead.org; Tue, 11 May 2021 10:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B1uNin7KdMToK7k5qzR9dcDANP4zzvkct1xdccaJQws=; b=AsJrHKxyqguFjgoVoIyhyCQu77
 MKRySxJIa74anh3LI6nZkxACd0xfSKDwwqwtfGSKJkuZpx4+bgrbaluDxgE2qPtYOJ/8ZkUcTQTpI
 HU3U+uapxPujgZkdO/2ZY73njrKucEOHZHygBFaHXD51b1RAPy5kYQpMMqnXEvf7SBoOOsmzohSM9
 tkWRCt8M91qnubO3sy/b2tIvwWqaWU9ccXuS0nxXKNcAhlqLeikOQq0I8ChFvkM4D0/nn0orY/WF2
 2FNUl4t9Isk4WhkvAbzkgu+zKV4L9QvySVcCQfuIo9H3Tpfb46OJFIhKLcIfet9nzhHe00sd4kKmG
 qAJXTnsw==;
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQ4K-009Uvk-B6
 for linux-amlogic@lists.infradead.org; Tue, 11 May 2021 10:56:53 +0000
Received: by mail-ua1-x92c.google.com with SMTP id n61so6198130uan.2
 for <linux-amlogic@lists.infradead.org>; Tue, 11 May 2021 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1uNin7KdMToK7k5qzR9dcDANP4zzvkct1xdccaJQws=;
 b=Q+zrTlsHYPpOEFR/1lxEQ1xDjGMHj/jHorL6odYvL/qu3iFZfK2dpRHu0G5WcNX5RK
 j3s9a7RHPljllfITPX7T7CcnNcZ7Vms3knS3IpG7Cp4YSIgTuRTxbJ1x6ZlpDfsw1ixw
 AiQZLZa27GTuFKLsWnR6yxFRrozKJv9y7sRnbg+5ouXeE14DdccjtIvHWc4FZr4cAXU9
 +dP32wOJsNd+/1shyrN4pyKTw8gLynAhuHxufYdsua1MUBtbTY7bszfcd+OxtylWOao2
 2AxD69artZaYniDzneJG2qyuZQKknwqGMk1gHJLVjDDFsIc7g2+b2O9hAZhNbN/FLnj9
 KtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1uNin7KdMToK7k5qzR9dcDANP4zzvkct1xdccaJQws=;
 b=aIRuDqbsxMUwzgVS6KpGs88FXbD3Tr1/L5f4Jp2y8G1BpfOXIHjfmlx9t2FkpP0YWC
 ZqgQPxhFO/v2uJKECU525ygq1QtdT9quQmS6YXUyIJrTkUIXmF8heoS9p14OGNMVKx13
 hWi4n5BF0SFiUF/UyhRxhc4aqRuxX7gp6Uheg8MyS4rEHYNLoRDfCzZgOJWrleY9QfdK
 sBkt0teXZE7nyt9hraepe2WHFTG14m/aKX2UqOOrWe50C/umRxnr6ozGGyPfTKe9W0Km
 Wz5wRTRkbXQ/EffJEZfJZILgeajmXgB0OkCu3to/jgQ+unQexDCteYSJqRRfCwIv5UG6
 Iahg==
X-Gm-Message-State: AOAM530291LfpQAe9MepQQUit7fTKtGjUX194HinpOg7FdwJKNOizjbY
 9G7QAmyiKHkvhlPeAEihsypAibUHiJ/15L0wSfHY0Q==
X-Google-Smtp-Source: ABdhPJzwusLl8Z0aiFBl2Lqp8RrtcLMyHfRb5ku4ea5ClE3f0h3GFfNnJiYu75fDrZlUzfkMBv2nhhZe1xi57xQY20s=
X-Received: by 2002:ab0:12a:: with SMTP id 39mr24423126uak.19.1620730611370;
 Tue, 11 May 2021 03:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210426175559.3110575-1-narmstrong@baylibre.com>
In-Reply-To: <20210426175559.3110575-1-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 May 2021 12:56:13 +0200
Message-ID: <CAPDyKFrJMFX5ztz6wiWVmwvVF+pms23_+qw8Ey_1pzrHqQ9vRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: meson-gx: make replace WARN_ONCE with
 dev_warn_once about scatterlist offset alignment
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_035652_422554_475B8326 
X-CRM114-Status: GOOD (  18.57  )
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
> Some drivers like ath10k can sometimg give an sg buffer with an offset whose alignment
> is not compatible with the Amlogic DMA descriptor engine requirements.
>
> Simply replace with dev_warn_once() to inform user this should be fixed to avoid
> degraded performance.
>
> This should be ultimately fixed in ath10k, but since it's only a performance issue
> the warning should be removed.
>
> Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index b8b771b643cc..1c61f0f24c09 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -258,7 +258,9 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>         for_each_sg(data->sg, sg, data->sg_len, i) {
>                 /* check for 8 byte alignment */
>                 if (sg->offset % 8) {
> -                       WARN_ONCE(1, "unaligned scatterlist buffer\n");
> +                       dev_warn_once(mmc_dev(mmc),
> +                                     "unaligned sg offset %u, disabling descriptor DMA for transfer\n",
> +                                     sg->offset);
>                         return;
>                 }
>         }
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
