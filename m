Return-Path: <SRS0=swgy=Y5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537DDC47E49
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Nov 2019 08:54:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D062084D
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Nov 2019 08:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNdBMr+S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BsQ63bXJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D062084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/vDBsVBkuso4I71a8S6DfQKdq3Vnnxplh13FjYumdXg=; b=aNdBMr+SfwUkTE6m5qFUL56z9e
	Y5bwUwLUZf+Du2TWGRyHSl14gSzj5PGkXmHc/N7wIAM1aL+Z1Rr6921hkCWRLJtUYyNOh0mJEwa11
	/zcXX6JV8IGDyI+BGhNOa56swm40XCi7c8qVrGodDHq1go/k2GdlzK8wE/fxoj/l3qg62psD88epe
	w4eaqwZpSRFmcW1kACp4JtxKCInBan8h+FdWbW0DtkmBHPBUOIzSANLtkGOwlLQhy9mOZcdY2xX0v
	MQVOhacbsh7hyj9BxO0E3I28Kdo3bAujWE/cJaJyxB1zat5a5XiBP9jjBBGwXwOZ3ghdd5a2vRflD
	78S35x+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRubs-0000JF-7Z; Tue, 05 Nov 2019 08:54:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRubo-0000IM-AI
 for linux-amlogic@lists.infradead.org; Tue, 05 Nov 2019 08:54:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id z26so6691988wmi.4
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Nov 2019 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=bceDJHtyc/Gkpk2vkbmTb36e6CcHkOGhOjOBn4t9oXE=;
 b=BsQ63bXJSBOvzsjA7Jg0wTxrVHCNvgB2K/zGBlEUeHdSaIjrGH2fSQ/stDcujWWpvN
 NjVnwf4Io22VUXNP5xyNo96XQEeuh/cpSE5ZpoHbHzUwE+kLb5vdeDX2Dd0anIucf+Cw
 kLX7nqsnA5L4SZrI3Ow1zQmQclrRIsnJG0RiZDpgsKv8mO2cUqncFscJIXR3Zrld8Mw5
 bNKfi5hrQ0dQ3D9TmzYvDTwOF+UMOowZPoYZPZ/sSUwgP4k082zs1ofz4Y8SfPvmikib
 gPs8WC/qQO3Wtv64xHUTluH2ODQP7J7YgxVitXgd0KFaeoOS/ie/KMSuH5A+5cGpxpmU
 xnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=bceDJHtyc/Gkpk2vkbmTb36e6CcHkOGhOjOBn4t9oXE=;
 b=Xi5lakXhV3ICosS9Z51NtqxfSK173qooINTVI0WQplXDQdOhbIde/huI4SgzKAkBXJ
 1tqx8vYb//EafLJBItUrgXyjjSNPbmocRxtLu2YthDBz2uCvu6G6+SzNisBbqkQO5aeM
 8kYQIyOKrWnXzgzXSuzXhergL7OnNWaq4uD7iZ1Xhld7QXohzwe/y3nAGmgOCPv9rGNf
 eh73YNwZAdz86IYnF+KPEX/WwVHFFftS+Y93Lm8R6A7llay9KcqmOC9lzLdAPA4pSDbZ
 Bkd+CNdqzQe4Cebed1qTa23kWrzSbPlvMB8G5/tFNgisHpDSq6sR3DZqTbfnDmSS/pvv
 4BIg==
X-Gm-Message-State: APjAAAXG7RyuwugcUOiNOfzToCqlffTAGL1ZkAoYBIT02ZbDLegt1OrT
 SQaRUG7T6le/tNkuAUXh0DOXqg==
X-Google-Smtp-Source: APXvYqxlZQTgjwBbU5U3hS0UOPR3njYlFwK9eM9pu7ZTObIRHu2SYqJhwmdcdBzMvNbhjUgkajEH8w==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr2934616wmc.32.1572944078270; 
 Tue, 05 Nov 2019 00:54:38 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b66sm22614377wmh.39.2019.11.05.00.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 00:54:37 -0800 (PST)
References: <1572868495-84816-1-git-send-email-jianxin.pan@amlogic.com>
 <1ja79b4mje.fsf@starbuckisacylon.baylibre.com>
 <e80cb817-e58a-68ce-a3c6-d82636aaf7d3@amlogic.com>
 <1j8sou4u1g.fsf@starbuckisacylon.baylibre.com>
 <7ec2e682-cfec-395e-cf38-58f050440c40@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Nan Li <Nan.Li@amlogic.com>, Jianxin Pan <Jianxin.Pan@amlogic.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2] mmc: meson-gx: fix mmc dma operation
In-reply-to: <7ec2e682-cfec-395e-cf38-58f050440c40@amlogic.com>
Date: Tue, 05 Nov 2019 09:54:36 +0100
Message-ID: <1j7e4e4sab.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_005440_362119_95556128 
X-CRM114-Status: GOOD (  25.92  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 05 Nov 2019 at 09:30, Nan Li <Nan.Li@amlogic.com> wrote:


>
> Based on Uffe comment I tried something else.
>
> Basically, it enables chained mode in the driver only when the framework
> calls pre/post_req callback. As far as understood, the framework calls
> this when there is more than one request pending ... which seems to be
> when chained mode actually make sense
>
> Jerome, what you are talking about is the system framework problem when you call pre/post_req,
>
> which is not related to the patch I submitted.
>
>
>
> I strongly disagree.
> As far as I understand from your description, the problem was with the
> life cycle of the dma mapping. This is tighly related with pre/post req.
> Just the variable names you have picked clearly show that.
>
>
>
> As you said, pre/post_req is called only when there is data to implement the chained mode,
>
> but it is also possible to cause memory consistency problems,
> resulting in incorrect data.
>
>
>
> The life cycle of the mapping is also taken care of with patch,
> since dma mapping is no longer handled in .request(). IOW the mapping,
> if any, will be released after the request is done using .post_req()
>
> If you think otherwise, please elaborate.
>
>
> I see what you mean. You want to pull the pre/post_req operation out of the request interface and invoke it at the top.
>
> I didn't notice the following modification of patch in your last email and reply in time. I'm really sorry.
>
> The following patch removes all pre/post_req operations,

No it does not. Callbacks are still provided to the MMC framework.

> but you do not send out the operation patch added to the upper layer
> together.

There is no modification needed in the upper layer

>
> Then the patch is incomplete, which will affect the dma data transfer function in start_cmd function and affect the multi-block write operation.
>

No it is not incomplete. pre and post request are correctly called. You
can check that with ftrace if you want.

Maybe you could try it ?

> Please send your complete patch, including core layer modification,
> thank you.
>
>
>
>
>
> Therefore, this patch is added to make memory consistent and obtain real effective information.
>
>
>
> ----8<-----
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index e712315c7e8d..399604b4124d 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -126,8 +126,7 @@
>  #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
>  #define SD_EMMC_DESC_BUF_LEN PAGE_SIZE
>
> -#define SD_EMMC_PRE_REQ_DONE BIT(0)
> -#define SD_EMMC_DESC_CHAIN_MODE BIT(1)
> +#define SD_EMMC_DESC_CHAIN_MODE BIT(0)
>
>  #define MUX_CLK_NUM_PARENTS 2
>
> @@ -228,7 +227,6 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>         struct mmc_data *data = mrq->data;
>         struct scatterlist *sg;
>         int i;
> -       bool use_desc_chain_mode = true;
>
>         /*
>          * When Controller DMA cannot directly access DDR memory, disable
> @@ -251,12 +249,11 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>                 /* check for 8 byte alignment */
>                 if (sg->offset & 7) {
>                         WARN_ONCE(1, "unaligned scatterlist buffer\n");
> -                       use_desc_chain_mode = false;
> -                       break;
> +                       return;
>                 }
>
> -       if (use_desc_chain_mode)
> -               data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
> +       /* The planets are aligned, let's chain them up */
> +       data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
>  }
>
>  static inline bool meson_mmc_desc_chain_mode(const struct mmc_data *data)
> @@ -278,7 +275,6 @@ static void meson_mmc_pre_req(struct mmc_host *mmc, struct mmc_request *mrq)
>                 return;
>
>         meson_mmc_get_transfer_mode(mmc, mrq);
> -       data->host_cookie |= SD_EMMC_PRE_REQ_DONE;
>
>         if (!meson_mmc_desc_chain_mode(data))
>                 return;
> @@ -803,25 +799,11 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> -       bool needs_pre_post_req = mrq->data &&
> -                       !(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
> -
> -       if (needs_pre_post_req) {
> -               meson_mmc_get_transfer_mode(mmc, mrq);
> -               if (!meson_mmc_desc_chain_mode(mrq->data))
> -                       needs_pre_post_req = false;
> -       }
> -
> -       if (needs_pre_post_req)
> -               meson_mmc_pre_req(mmc, mrq);
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
> ---->8-----
>
> No performance hit AFAICT.
> From your description, it should address your problem too.
>
>
>
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index e712315..7667e8a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -173,6 +173,7 @@ struct meson_host {
>         int irq;
>
>         bool vqmmc_enabled;
> +       bool needs_pre_post_req;
>  };
>
>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
> @@ -654,6 +655,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>         struct meson_host *host = mmc_priv(mmc);
>
>         host->cmd = NULL;
> +       if (host->needs_pre_post_req)
> +               meson_mmc_post_req(mmc, mrq, 0);
>         mmc_request_done(host->mmc, mrq);
>  }
>
> @@ -803,25 +806,23 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> -       bool needs_pre_post_req = mrq->data &&
> +
> +       host->needs_pre_post_req = mrq->data &&
>                         !(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
