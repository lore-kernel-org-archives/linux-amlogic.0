Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060F1C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jVKmMaJdVDSxr55XJinmqeGJGCb4XB5smr2BojBNBs=; b=bkrzO1KswBmDnK
	Bi7K2Uhd69y82H0gW+GVJQ+sCdzfxg0AeX85ThJSdN5Zj2H868K0k8quDtOdwODDQoUkmWjw4c9Lr
	itw/5jVYpVJWiChqZMjxOj4QRi2/pCbKZvUxhcp1/HzzLbOWZSQ24gbwE/JCqodowE9tucRPYoGee
	nJacrR5/CU1tuIoXaDCetWGBxN51vhXGJeKvTHI/A7IC+Mcc5ppAvtKaS23nZ3KoHieHtgRth2ZID
	mXvbYcSulht0QnSKIPSLrnw1mKAwM9o9B1P/SIMu3Wd31v/kCHdwRtC43pU9D0ElHNzGDP9M7jb9q
	3MNURaJtTVPrEQiicbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOjTu-00DSyD-Re; Mon, 28 Feb 2022 17:06:42 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOjTR-00DSnB-HH
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 17:06:17 +0000
Received: by mail-lf1-x133.google.com with SMTP id i11so22521607lfu.3
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCqSJLVmzSiAQCZuGWx3jdcx0OAjD7prrRZYblRmLXk=;
 b=biJj7wivuUwsykg3cCHNhf5pu9DOv2jbE6fUXHgxl5AXqJvtb2ehNXEpFdBsjf5qD4
 vkHTAQcKYQZBp7geavn1aVx7d+zborulBdlwD7Z9JRROJb12Mj6rRHX0cdfRhdrBzE0T
 /VohSnvjl3cAMBB76kxjvj0WUoNEYnotB2u9aY4x3HQ8MsPfk5guRYXgM9MGsq6586hO
 P3k48kII6PkFhXlZjZdrwpfYsUaBAhs1H81yb5JvQCu2e5fNvNljwd6rz18hGoRAllT7
 8vpUEGH8aPTJnoNzpFlbD5QQcpiY4id2uDJYhd0pnDZxqOyuc1WlmXodzzdBd3L88bUq
 P45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCqSJLVmzSiAQCZuGWx3jdcx0OAjD7prrRZYblRmLXk=;
 b=jU7AFUArFfr+W1DRNF+1ZRQuBQpLJiZp6gOgTuQm/11CgW5qbpMKxV8BrxNLrdZQ+v
 +LtY1puR1ipK5KsZScDNaml79m0LS0egZIMlo7taeo7nbfv5DyibDkRoJe170pm56MKB
 UBJ10JchTio2jmVy0nFuWPvuUzIg/zMyv1gDE0OZvciEeYgLNCBUjSF83OMIhL6gwG70
 8Fu+kG9Y9bqayB5pgnd6KzkI0K3AhcJuOJVYnZf34F6RUxNx5sjAmhZruWXX0whVEaXu
 938NcnGwTyUsi8+ngvXI5uWH2mbEfNauwIQEPjWeYDIpJ9bOXqNXKMBmHZymVceYGs9m
 28Sg==
X-Gm-Message-State: AOAM533PAL2ZEd7A7JCtDb1XAfWFN1AzXqMxGX8NY4AV4WkzybkpmM3U
 N2DisUpoMY88IrEMZPDtuU9HdpkUf2yPo8QIsssSUA==
X-Google-Smtp-Source: ABdhPJyiqgn7SIzkaA0Z4EPVWwcwg577znE0wY62h7WlddpNO9W0l3Jz/eBXTKgDKMBrXh7YF6zOLSFPqFGqc/Yec0M=
X-Received: by 2002:a19:9144:0:b0:43b:86a4:1497 with SMTP id
 y4-20020a199144000000b0043b86a41497mr13291435lfj.254.1646067971343; Mon, 28
 Feb 2022 09:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20220216124239.4007667-1-rong.chen@amlogic.com>
In-Reply-To: <20220216124239.4007667-1-rong.chen@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Feb 2022 18:05:35 +0100
Message-ID: <CAPDyKFq797hihSwtX00V6tW2c035FLPnWonbBGcuh4L-zWqHTw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson: Fix usage of meson_mmc_post_req()
To: Kevin Hilman <khilman@baylibre.com>, Rong Chen <rong.chen@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 1131046452@qq.com, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 45581586@qq.com, Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_090613_625219_99A8A24E 
X-CRM114-Status: GOOD (  18.74  )
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

+ Hainer

On Wed, 16 Feb 2022 at 13:42, Rong Chen <rong.chen@amlogic.com> wrote:
>
> Currently meson_mmc_post_req() is called in meson_mmc_request() right
> after meson_mmc_start_cmd(). This could lead to DMA unmapping before the request
> is actually finished.
>
> To fix, don't call meson_mmc_post_req() until meson_mmc_request_done().
>
> Signed-off-by: Rong Chen <rong.chen@amlogic.com>

We should probably add a fixes tag to this, right?
Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")

Moreover, you want this tagged for stable kernels too, right?

I have applied it for fixes and added the above tags, please tell if
you want me to change it.

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 8f36536cb1b6..58ab9d90bc8b 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -173,6 +173,8 @@ struct meson_host {
>         int irq;
>
>         bool vqmmc_enabled;
> +       bool needs_pre_post_req;
> +
>  };
>
>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
> @@ -663,6 +665,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>         struct meson_host *host = mmc_priv(mmc);
>
>         host->cmd = NULL;
> +       if (host->needs_pre_post_req)
> +               meson_mmc_post_req(mmc, mrq, 0);
>         mmc_request_done(host->mmc, mrq);
>  }
>
> @@ -880,7 +884,7 @@ static int meson_mmc_validate_dram_access(struct mmc_host *mmc, struct mmc_data
>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> -       bool needs_pre_post_req = mrq->data &&
> +       host->needs_pre_post_req = mrq->data &&
>                         !(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
>
>         /*
> @@ -896,22 +900,19 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>                 }
>         }
>
> -       if (needs_pre_post_req) {
> +       if (host->needs_pre_post_req) {
>                 meson_mmc_get_transfer_mode(mmc, mrq);
>                 if (!meson_mmc_desc_chain_mode(mrq->data))
> -                       needs_pre_post_req = false;
> +                       host->needs_pre_post_req = false;
>         }
>
> -       if (needs_pre_post_req)
> +       if (host->needs_pre_post_req)
>                 meson_mmc_pre_req(mmc, mrq);
>
>         /* Stop execution */
>         writel(0, host->regs + SD_EMMC_START);
>
>         meson_mmc_start_cmd(mmc, mrq->sbc ?: mrq->cmd);
> -
> -       if (needs_pre_post_req)
> -               meson_mmc_post_req(mmc, mrq, 0);
>  }
>
>  static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
