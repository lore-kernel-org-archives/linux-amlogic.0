Return-Path: <SRS0=3iKr=57=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826F5C2BB55
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 12:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51131206D5
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 12:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DxStR/Jb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5O0ZNtI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51131206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLJleN9yAYf+q3VXSoGOhVqAD4F/wZeW+xTTd7dZtTs=; b=DxStR/JbMbAujK
	U32vafgIZlYR7g7atraORIJSqJOUU28Fr9uhXHG+IsBZfansF+0JxTDy3rw7EdujkyjtBJznbrU0n
	kFkUyRrBV621r8RfP6q29xR43A4sWZuzviPmXnNeRTHwupKiaFYf7qQcHbb87Z446ntStsei5Wxci
	PXyWzihxNOSZXhUZsdJolVk62z0HIMRsnKpOlmnInu/XH6NgQZGmBRNloW1Cp4IfYigQx3K+u/a1c
	tt2tyH5G613Yswip7eOo8t/apGuzUSQKAsb0aNSfoSO5aZ6oikZ+mTgdOMuCMFOwWZWfSoIEcw/tH
	PJRwhLNxEla3u3/zRWwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOhcJ-0004H9-NK; Wed, 15 Apr 2020 12:58:11 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOhc5-00042B-GS
 for linux-amlogic@lists.infradead.org; Wed, 15 Apr 2020 12:57:59 +0000
Received: by mail-ua1-x941.google.com with SMTP id v24so1276626uak.0
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2020 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r5sKn1JJVgm/fgQdr3rP8MdzsVK7nHhD8/ZfpnREROo=;
 b=G5O0ZNtI/lhvh2YbkeigqevONdPcJNyW36RJu6DaCTNULDY22D+wXKMjJdQd7KvBlv
 oTfthgAY1md6uAa3CEIDnutbFslq3+BYX7QggVz2V1zExH2exyxZetM5k1rTefLCgxtV
 iEpyKNYDo1nRA4Kq2/WKGKWa+NsM6AH3OujDgWXJRfQ0THNzaeyfZm9/dmFGqES1rja2
 m3zdbshttS6S6hL/oRkv/+nmnvpjca3VwFla3S0Tdd9HW7J9kmiObkbehxG3ekM93FcZ
 TUuwjMSuHc2pY+a8zt7Vfd5qR/ryC85oOzXRlBbFLTsUE6VyIrnCLTKqW55P49wf09wY
 8Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r5sKn1JJVgm/fgQdr3rP8MdzsVK7nHhD8/ZfpnREROo=;
 b=JF/LWFORVq8iJt/kEI638iMy+NamKKRpInbkfPipmhgRKuMiyaXmeNzHWljSOcAvsm
 Y4Uyd3V3oty/ckd/qepAVoAERhancBbcP+Lz6f+PFMbeqZKKM1n8CnP4NAm7ew0PohcY
 KSg/PpHrjCr/AMRBQPf/BpJdR6O3DfuTC0fILheBObieyC7ozzQ0Mc4v1ZvCPuO3ZTdL
 HckIElXpOVOcqp40YDoricqd/VFP2jEuXcbft+XtXD3bMTLj7wbaVRHhT5NRmgyj7Qsb
 bPYCGr9lfQUcCPTHJ5Xwcw4RiLygKtQP9P/6weUJ+kzauBkN/ujVcVEkThQDNzOPBd51
 qTaA==
X-Gm-Message-State: AGi0Pua/DYR6MGRH3iDgWt+yngiJNjCs1sRwUf91snKo8LXqtWG/RSg0
 LJDKuXvt1UfztsTHlvkgTwqt9PHkZWnRAcHuzOjTig==
X-Google-Smtp-Source: APiQypJI7c0NMJgUbFRtW4uPDq40cfg0SP5CzG4iio6GHzdHCd5X+k9Oy9LawY1QGN7bl3rJK38vw1RGEuY06aeP87Q=
X-Received: by 2002:ab0:6449:: with SMTP id j9mr4172749uap.19.1586955475320;
 Wed, 15 Apr 2020 05:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200410213043.1091851-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200410213043.1091851-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Apr 2020 14:57:19 +0200
Message-ID: <CAPDyKFpsTTUaTLy--DvOr0oAB71cTBdH1pfTV63LtcKOKOsnDw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: meson-mx-sdio: Set MMC_CAP_WAIT_WHILE_BUSY
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_055758_070172_B1693FF1 
X-CRM114-Status: GOOD (  22.85  )
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

On Fri, 10 Apr 2020 at 23:30, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The Meson SDIO controller uses the DAT0 lane for hardware busy
> detection. Set MMC_CAP_WAIT_WHILE_BUSY accordingly. This fixes
> the following error observed with Linux 5.7 (pre-rc-1):
>   mmc1: Card stuck being busy! __mmc_poll_for_busy
>   blk_update_request: I/O error, dev mmcblk1, sector 17111080 op
>    0x3:(DISCARD) flags 0x0 phys_seg 1 prio class 0
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> I'm sending this as RFC because I'm not sure if this is a proper fix.
> It "fixes" the issue for me but I want the MMC maintainers to double-
> check this.

Thanks for sending this! I assume it's a regression and caused by one
of my patches that went in for 5.7. Probably this one:
0d84c3e6a5b2 mmc: core: Convert to mmc_poll_for_busy() for erase/trim/discard

Now, even if enabling MMC_CAP_WAIT_WHILE_BUSY seems like the correct
thing to do, I suggest we really try understand why it works, so we
don't overlook some other issue that needs to be fixed.

Would you be willing to try a few debug patches, according to the below?

First, can you double check so the original polling with CMD13 is
still okay, by trying the below minor change. The intent is to force
polling with CMD13 for the erase/discard operation.

diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index baa6314f69b4..bbf1dff0ae2a 100644
--- a/drivers/mmc/core/mmc_ops.c
+++ b/drivers/mmc/core/mmc_ops.c
@@ -452,7 +452,7 @@ static int mmc_busy_status(struct mmc_card *card,
bool retry_crc_err,
        u32 status = 0;
        int err;

-       if (host->ops->card_busy) {
+       if (host->ops->card_busy && busy_cmd != MMC_BUSY_ERASE) {
                *busy = host->ops->card_busy(host);
                return 0;
        }
-- 

Second, if the above works, it looks like the polling with
->card_busy() isn't really working for meson-mx-sdio.c, together with
erase/discard. To narrow down that problem, I suggest to try with a
longer erase/discard timeout in a retry fashion, while using
->card_busy(). Along the lines of the below:

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 4c5de6d37ac7..240e52fcdf2d 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1746,6 +1746,11 @@ static int mmc_do_erase(struct mmc_card *card,
unsigned int from,

        /* Let's poll to find out when the erase operation completes. */
        err = mmc_poll_for_busy(card, busy_timeout, MMC_BUSY_ERASE);
+       if (err) {
+               pr_err("%s: Erase poll failed err=%d timeout_ms=%u - retry!\n",
+                       mmc_hostname(host), err, busy_timeout);
+               err = mmc_poll_for_busy(card, 30000, MMC_BUSY_ERASE);
+       }

 out:
        mmc_retune_release(card->host);
-- 

Let's see what this gives us...

Kind regards
Uffe

>
>
>  drivers/mmc/host/meson-mx-sdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 8b038e7b2cd3..fe02130237a8 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -570,7 +570,7 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
>         mmc->f_max = clk_round_rate(host->cfg_div_clk,
>                                     clk_get_rate(host->parent_clk));
>
> -       mmc->caps |= MMC_CAP_ERASE | MMC_CAP_CMD23;
> +       mmc->caps |= MMC_CAP_ERASE | MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY;
>         mmc->ops = &meson_mx_mmc_ops;
>
>         ret = mmc_of_parse(mmc);
> --
> 2.26.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
