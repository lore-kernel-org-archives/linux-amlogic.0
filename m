Return-Path: <SRS0=Qsxt=JM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE5BC433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Apr 2021 09:08:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FFCB61073
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Apr 2021 09:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FFCB61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fZBb4VnznUNMeW54IX87bcOYnazNj+okqH/JUOzT40I=; b=LM5xFbosPdAiRU+FbxWe+QQ7N
	DOdt8Esq4wSI+CSntIhmiBCGKk5QDbKYbs31EqryKXpoOvfHyx8FVW9AXu1RUVnKZzMKsSI/XeoE/
	WzQ+ax5fScu2JENZd6CYzquyvPvksLu43STy/Mk43zES5W48AKhfrL92FvzLDxMaj3MKhPAdxrcae
	5xDrXNGs2jHwL0DaqskmMCTHF+roP4B0rUu4jstfVtnwEfK7ovbxYNu/y+v1OOBtk64895m/p9nHv
	OWzYpouz8vUKbhF5BpobP8+Wi30p9ClI48XQ4KLV6fxQHZ4q7nXfDI/9MYaLMABOZk832AwAUGsx/
	pB52HpsXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxyh-00FSV4-RW; Thu, 15 Apr 2021 09:07:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxyS-00FSS8-Fo
 for linux-amlogic@desiato.infradead.org; Thu, 15 Apr 2021 09:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kjVJwjzWYr1/sR0XamTsvtpkvMNA+5snLIJZWYxDhFI=; b=WaL0b/29QweVR15REZML7eRmdv
 ACDte4y5TOrLmaTAWeAn3qqOa9NDBQkLlsBCXZuST3pc9z1Hhc6MUUtIigRCKCxXSfrUPRwtnowxz
 X5odqMi9qeMcgfNWL0lKE/MTaazH8fOR5n4OgvbPQZKEPv/A0SE+deb6LcKSpN5fNhkmgcE95UVum
 ZX+On51TXOpLUqxuVBBIKY0vRIDodu4vBW29HlROeV1aCDDYqOSE+mDr3lih7tUhX3IYfwfeiX7I9
 uTju+P5CnnCzK6K99CrFdKGvh4Gzecvvgsf+7JjXtD4L3o22tXhFZc5kGO5HupGru3vo+9NZKRdQe
 Z75Uw0Zw==;
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxyO-008PUI-WC
 for linux-amlogic@lists.infradead.org; Thu, 15 Apr 2021 09:07:42 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 25so1266522vkq.0
 for <linux-amlogic@lists.infradead.org>; Thu, 15 Apr 2021 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjVJwjzWYr1/sR0XamTsvtpkvMNA+5snLIJZWYxDhFI=;
 b=UyrLPEOZuT1ziKU+PyL1rJHq7rNyJg+UeOgK0vbNVbHgo9TdDnHuc+z5wtHB5da8cA
 G+eyDGuYo4jyss1OzbjpexQ1IRvennZUdBbRenPx4Yah7ic1Za0jpMLgARxClGCfccbQ
 la+cauI00P0pXwi8nnpjnuobj6IVxaU5KLorR9GLgmrM87RNMG2TxXIjwxkorvE0BAmE
 zH8TnvhSXF640s8pNdpUhEMJsqERIBzh+keXwLTULu70N1bYEdBNjeHg/tDr7EJnIIzm
 a8VZIsXsEW+0idHwtn7r+QltlRl5lNlAGJB11tkdsNyIqC5UkivcIK1+5f3qWV9Lxje1
 nUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjVJwjzWYr1/sR0XamTsvtpkvMNA+5snLIJZWYxDhFI=;
 b=r4YXXFaK9FZFJbHvbcblX4HNZcXcL27oJe2rP68DvjDehxqEgc7mlVdVoOziBG12vg
 5vIbYgSabIbM2lLokYGmBGB0804+DxdHIi1RkIzBYjnQEGSFU2ndk9VrPhIeswD26KCt
 RWpk2NBB2u0vB/FTU3Nk8WPWCpJcLqiPiivu4zNR097tBKxvnT3BhrmWnPJwb+hwssI1
 uPXpzY8081q31EXLWZhOjmP8gF3SoUrBnLV0ZQaV0Pfcbxc33IFemfZ3Aehfn17JYAH0
 9JhbUymqx38ZKsPbkqiWPVFWOqg+Mu6aDIFCshakosOZcHEw1tuQmH4GVaC2UFZOOJB5
 iWXg==
X-Gm-Message-State: AOAM5300NzPzNi3rNF6j708/J5tZ5GiabmAz9ltccG+Sy1oR7fhgzZnz
 6hqf2HYsiYdGaDrrNvCEW37iTvSUfnV44yXm4j74CA==
X-Google-Smtp-Source: ABdhPJy/tFAI7hIwRCSFL3zc12707ikZU7bG/40bLAl8ttRArxQYWSFbL/u1pKeyKIZ0A2iQgJwfGHELnGwKLccsYO8=
X-Received: by 2002:a1f:2c58:: with SMTP id s85mr999684vks.15.1618477659418;
 Thu, 15 Apr 2021 02:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210414100010.3877669-1-narmstrong@baylibre.com>
In-Reply-To: <20210414100010.3877669-1-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Apr 2021 11:07:03 +0200
Message-ID: <CAPDyKFpNLu3R+7ODZaC7yWMYbSOujswgLTkN97FQNg5zhwSxgw@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: remove useless warning about scatterlist
 size alignment in block mode
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmitry Lebed <lebed.dmitry@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_020741_045444_EA5A4E95 
X-CRM114-Status: GOOD (  18.22  )
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

On Wed, 14 Apr 2021 at 12:00, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Since commit e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode"),
> support for SDIO SD_IO_RW_EXTENDED transferts are properly filtered but some driver
> like brcmfmac still gives a block sg buffer size not aligned with SDIO block,
> triggerring a warning even if the transfer works in degraded mode.
>
> This should be ultimately fixed in brcmfmac, but since it's only a performance issue
> the warning should be removed.
>
> Fixes: e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index eb6c02bc4a02..6bc151045843 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -246,11 +246,8 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>                  * size, otherwise chain mode could not be used.
>                  */
>                 for_each_sg(data->sg, sg, data->sg_len, i) {
> -                       if (sg->length % data->blksz) {
> -                               WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
> -                                         sg->length, data->blksz);

Rather than removing this warning, perhaps an option could be to use
dev_warn_once() instead?

> +                       if (sg->length % data->blksz)
>                                 return;
> -                       }
>                 }
>         }
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
