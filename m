Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C18CC64ED6
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmaRPbKfDpttnN5Hc5SeOFAE69ooq7EnAtrGNF6qflk=; b=I7rs0Lx0tyix/K
	eDmTj5COIYBmWvJOoDBtEDkNu5EUpSWleOLQQAf1n215HAYn/CdcMdNVjW1th8/fP+wjYlfLGzLzE
	Yl5VAvDGDqyjqCtsmwlAHxjnVnMIlf19xglcJfvuJnc5AD0EU3f2HdcGV8lCjZO/QyfmkVbHWZ74J
	BYJYSjzfFqV4DfXundOz9eHMvVIl+TCFQWc8a/iHjHesuvhrSHqfryeN1Ns5rhxrLX/xnRfMMGvWS
	PP6Cyd6oXzf6hj8ZlH66PnmrrWWu5W8i+aakgV99spNOzmPxv5dTORnMOBLA80lKyRVXvESeREwGO
	7zbMjWfnCq7Fcg8wR8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuHB-001XqO-NU; Tue, 14 Feb 2023 12:19:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuH5-001Xml-QD
	for linux-amlogic@lists.infradead.org; Tue, 14 Feb 2023 12:19:09 +0000
Received: by mail-pj1-x1032.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so7715570pjb.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Feb 2023 04:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676377144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1WzS6VPcyP/6opcQNFoZ1phcotBjwqVN1tSszwsZD2g=;
        b=OfG8GT8Sx4a83BqgvCTp5wEACt/vwX+rkakSLH5KJOsm+0TlAhMDpUaG0hfcbHhTE4
         gOBPmySbxguF2ojn0k7AHmLaW7tfFdyizHgKIZ2kk0MJvqs+OquHZGu2TYIUAcn2FByy
         swnDTvy3KA+ndY7MpXeCn8TCZsZnTw4sLEeTyoLNxMVZxQjqRJC9OgdWWUG5w2gOq2os
         iUE7Vw4HjRE/vHYgH6lB7THX0VflR8TrLji+7KNocmdtEUituCKxipOobgEJ+jb2B+3g
         0drDcdFjpGFqWJYdE8xccEZyXqPavVxMbE0iYizJAKJVUNw+baRwWPngIcrNx/rvIxEg
         tBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676377144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WzS6VPcyP/6opcQNFoZ1phcotBjwqVN1tSszwsZD2g=;
        b=geP4yqmhqzsdcX7fqlHgmwZhRXCB2GWxVIxUjCh8zUX0WTLH44Mz3OOldTnlc7FbGj
         G5ng6Qso+A9lNdVcDDGzrzuWLply42zj0oOVaUkw3IpgfS90cZtbIikn7e7Pbi8QUDz/
         Segw2yDEkkUfqvFheiukrYzydHbqhLX5NMDQgE1/lpcTqz7uHcet0rMb0oWA+Ig5V75j
         edAals/vSSwotDLFr0lzeQtX4inxORgcNHmkZDta7Q9vEU4WKGHBHvGh5L3Zw5N58d54
         ouY3yOZwS7mFj1zBHQJjCcZaojGhDLtPaYKayb9yFp3DXi9t+efz87gYLZ8iGc6A90dM
         YKSw==
X-Gm-Message-State: AO0yUKUibgURuEDrvNK/4y3dCV45BCHgqcdixSeaYTfyVTAKOFY8zead
	Fg3sRzyySrq6NWqtwVNkfS821Jh+gSIgZn7D9TiX5g==
X-Google-Smtp-Source: AK7set8OlHY9s1D3pQ/SqG80jXWRcX+pmmsZd4D1HLLkiUEm4Scc10pIxJGVGroUZI8DgaHWkJyXVV+nZTTUkX4BAwo=
X-Received: by 2002:a17:902:d506:b0:198:99b5:cabf with SMTP id
 b6-20020a170902d50600b0019899b5cabfmr616842plg.25.1676377144348; Tue, 14 Feb
 2023 04:19:04 -0800 (PST)
MIME-Version: 1.0
References: <16502040-3beb-a3cc-b28d-28184fba0f10@gmail.com>
In-Reply-To: <16502040-3beb-a3cc-b28d-28184fba0f10@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Feb 2023 13:18:28 +0100
Message-ID: <CAPDyKFqtrTNV8AMHmZHbmyP=P4csMh=ESKwJxyq17gnNmRn7DQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: remove meson_mmc_get_cd
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_041907_913598_5C27080B 
X-CRM114-Status: GOOD (  18.31  )
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

On Sun, 12 Feb 2023 at 22:54, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> MMC core only checks whether return value of .get_cd() equals zero.
> Therefore -ENOSYS and 1 are effectively the same and the function
> can be removed.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6d5caf233..1d761f33d 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1064,20 +1064,6 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>         return IRQ_HANDLED;
>  }
>
> -/*
> - * NOTE: we only need this until the GPIO/pinctrl driver can handle
> - * interrupts.  For now, the MMC core will use this for polling.
> - */
> -static int meson_mmc_get_cd(struct mmc_host *mmc)
> -{
> -       int status = mmc_gpio_get_cd(mmc);
> -
> -       if (status == -ENOSYS)
> -               return 1; /* assume present */
> -
> -       return status;
> -}
> -
>  static void meson_mmc_cfg_init(struct meson_host *host)
>  {
>         u32 cfg = 0;
> @@ -1146,7 +1132,7 @@ static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
>  static const struct mmc_host_ops meson_mmc_ops = {
>         .request        = meson_mmc_request,
>         .set_ios        = meson_mmc_set_ios,
> -       .get_cd         = meson_mmc_get_cd,
> +       .get_cd         = mmc_gpio_get_cd,
>         .pre_req        = meson_mmc_pre_req,
>         .post_req       = meson_mmc_post_req,
>         .execute_tuning = meson_mmc_resampling_tuning,
> --
> 2.39.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
