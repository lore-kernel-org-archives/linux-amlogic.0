Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF07C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 13:14:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6058F61153
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 13:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6058F61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ga7m93xIGrYEBRzQqaBEWfS6vhcx6a+F9ODtivEHv7g=; b=loxRXvE/szm2koV/zW5kF7AaU
	bmXvoNlkan0w/bkoaRGYfdnGPH5If8kQkoOswm8eILomxsErnWue1P2oqeKuEcRniCPgGbALq0lCd
	PkOGLo+jpd/g4OXCBxmWhILnRNew5SwSHPjy/OwiBVtJFjy3x805VIgBk9gLspyKOvcb7b7Z9J90G
	ZkJDVEgw8hI+YuHsirSP2Mqf/xPW5Z9CFx0zcndyoBS8bYMHel0fbWDaX2sJkAVfDTEvQo2BylMnF
	QTAqqim3BSlqZcQ+a3QIiR4OzVxYvRdqnroya52qKA78sMSAMxxVzsdCxZ/MVoxnciivdPAH1zK4o
	6dlrr1vMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXOIh-002B8d-JK; Fri, 16 Apr 2021 13:14:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXOIW-002B7W-Up
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 13:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4h1/qVgfVmVO29jQ+MIl1szKMUmrXhtSX+2OCoy/0xE=; b=2gXoux5HP97Kc6EdUipIZy8Pml
 1i6BVOsUywFK6UZ5xMTaZ+SEcTChKjHCSRfw+JqV2a/vF4t9KDYMTef4yPRFmIZ54oPZrLtdGwx8g
 9Z9jDm25XrZGEVaKZ/LQxiw/6A2wi3FXT5by3WpUHrN05vJ9L8w7eRSx27GrofiOvfLErdGfxWWtR
 2OqIlaAqJx9AOvE9wFZnv5rA3eNzc5YMtTBY7jQ919lv1GTzDqRNZ8DuGVneyic90Rflbv4W/FY9M
 XVVvWQS+OoEAWz72AejdCyHlgl44zsvLZWKol2SlgHqnz97Tan1E+54hjjgqxTjIH5PMnioEL5yi6
 8Pjmk7VA==;
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXOIR-009NvB-TT
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 13:14:11 +0000
Received: by mail-vs1-xe31.google.com with SMTP id u22so2926717vsu.6
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4h1/qVgfVmVO29jQ+MIl1szKMUmrXhtSX+2OCoy/0xE=;
 b=vEIN9wTuGnvLfMHL0nZCUqEMjfTBglVX6XaJsr7R2LIMb0BMoV+UvdQUtcp9VsxR6S
 HkoBngcSDmDqCXmREfBA2N6pUdy/R7iLsTBf1XNOqkDEX5QYLQ2i4wn5DuYab7nw/6cv
 b7amVZfDEVWnvL1RNFg6X1r/a9mpalMMIUQy1qhEptGpX1dJNAfsWExtelO8ugFBY1Bx
 YW2RRnbnQ1pz6wTHum+Zbtw1DDkpUM2bD0s0PmG5wfsQxrLB5995b8FCLAlZx6O89nQT
 J2zpcdNxT44hVgr0csS3QduUiJfHZiyNEtksF1uPz9drJh9uSSlF9mNQQ5H7HlT/+zBu
 F1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4h1/qVgfVmVO29jQ+MIl1szKMUmrXhtSX+2OCoy/0xE=;
 b=s/x8PAoX0QbdYi37zCUfEOehgj/6OnVpLEvcMvCRAHAZ0Tup4xJdFCHkFgTtjrJ7Xi
 jNZCFCnjFgjsTTxgP/nYLznY+ZeB5nEV0QG4vqI+aPTA9S90KWTXtYPWGEXPnKebaB4b
 qAVRYLnUR+RutdM9u+lk77qR+LIPjG7STlJGpYHgljt2/bhgEi0g/i6TotAGldmuGh2/
 7Ck1NJknRwuCsz2BsAlFQa36WZbaqhSUgRAHtqR1F4NWin8n0/Gd5N/VTgWesw0RskOX
 4L9OVkZOuHvIuiVuIzhbsQIL+emy0NqRzKhif6qPJIDc0lOY9gLL4Nj2XDPadZPg9iDY
 H9/A==
X-Gm-Message-State: AOAM532Fl+sUFKQT/QjEv3B4lYaPcvxbYYkAIMVbat/OCpA+SXReR/44
 gGsuxWAwcLaB9nbTQX7SSshmIoNWqshaBz65031CZw==
X-Google-Smtp-Source: ABdhPJxcTAtmnm2jjHs5eDbwL/1quQG2UxTl/uhFb+0TrnDtXKBt5dcXt+k0jk/x4t+cKSRQ87jNmeHJHuUQPtkrzMI=
X-Received: by 2002:a67:ec51:: with SMTP id z17mr6648147vso.34.1618578843818; 
 Fri, 16 Apr 2021 06:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210416094347.2015896-1-narmstrong@baylibre.com>
In-Reply-To: <20210416094347.2015896-1-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 16 Apr 2021 15:13:27 +0200
Message-ID: <CAPDyKFpu3bz64R-t9KxEkobKKoOY6Dy6H9j2W2LEzeoz4-D4Yw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-gx: replace WARN_ONCE with dev_warn_once
 about scatterlist size alignment in block mode
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmitry Lebed <lebed.dmitry@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_061407_968668_A29861A9 
X-CRM114-Status: GOOD (  18.87  )
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

On Fri, 16 Apr 2021 at 11:43, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Since commit e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode"),
> support for SDIO SD_IO_RW_EXTENDED transferts are properly filtered but some driver
> like brcmfmac still gives a block sg buffer size not aligned with SDIO block,
> triggerring a WARN_ONCE() with scary stacktrace even if the transfer works fine
> but with possible degraded performances.
>
> Simply replace with dev_warn_once() to inform user this should be fixed to avoid
> degraded performance.
>
> This should be ultimately fixed in brcmfmac, but since it's only a performance issue
> the warning should be removed.
>
> Fixes: e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for next, thanks! (I move to fixes if there is another rc on Monday).

Kind regards
Uffe


> ---
> Changes since v1:
> - replace WARN_ONCE with dev_warn_once and explicit the warning message
>
>  drivers/mmc/host/meson-gx-mmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index eb6c02bc4a02..b8b771b643cc 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -247,8 +247,9 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>                  */
>                 for_each_sg(data->sg, sg, data->sg_len, i) {
>                         if (sg->length % data->blksz) {
> -                               WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
> -                                         sg->length, data->blksz);
> +                               dev_warn_once(mmc_dev(mmc),
> +                                             "unaligned sg len %u blksize %u, disabling descriptor DMA for transfer\n",
> +                                             sg->length, data->blksz);
>                                 return;
>                         }
>                 }
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
