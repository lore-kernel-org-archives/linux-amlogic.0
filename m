Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9B1C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A46E20823
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PFJbAYVh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0X4NXhoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A46E20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFIsziuLP8+CzQNoZrWMQua2Udd5HNyUCsdRXjwzQYE=; b=PFJbAYVh73sl66
	PH5qH9oGEhmLWDtychKc73HxrISovo2pKXiUU6YbDGmNlTeVF8pZBS13sBM2cQKm+4rVBi2cgpkBr
	nNmKp8u6DPKa9ITfTXD7N1Sx/jvli2ODRJzGqALEABzQ9hpIZx3grtm1ChS4a/7Kf91iOV1kb6IgJ
	/tCtcalsxkdTlQL+XJl5rZYCDWcHk+UuFzbWVnBeZ4XV8G/ZRzonvKrM3lzyjv1zOZIX7ODeBCsrw
	EMHMEV67ki8zA2lnxvG67sgwYq7Kfdlo+64IdwW4EWPI1oVHx5pwmdAoVPDCLTV6Nrljn8fu8Z/eJ
	ClWCHRnsWgq9fyl/FQ9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkRMW-00061h-PS; Fri, 18 Jan 2019 10:26:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkRMT-00060W-1m
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:26:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id 96so14407920wrb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=3I4s99unS0cZz9bTZyrCfa/7OetFzjQYvvxubHTovzg=;
 b=0X4NXhoHDtRXL66xb/c60f/c2hQBPgf5cN8E2EOM8se39yTAUnhj0VLOQVaTRxYULz
 fyn83+XKp66++/NCmtcB530c1sReHZ1QMsnbVcZM6OUXwQ/LQfPTCHFR1aN2fcx6mC4S
 vBKzSc1Z8aCBKReWbD4jmEiRP1i85bT8S3dKGkNKBrrRXEFeZ1jShl4a47HEhGGyfXhD
 xlyZ9mEqlsoaPEz/nJlabS6ZJKST+1yG4Nz0DhUDktk5UUCm3W+VLAgenbiRtUB9CDCo
 sC8a/YItEFjRvwcTEBhbHUhC1TAERcVw8d6BPpbT/TTP0X/3kg2mqNpvBtn/i96QRwCw
 Y9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=3I4s99unS0cZz9bTZyrCfa/7OetFzjQYvvxubHTovzg=;
 b=lZm0uW/soQx+euMOPW7ebiIm+fE8VnbAVNLuEb815Jo5uNHXjgwf87uxNOUrlXfyt8
 0/M+Wt277jc/Rf+OTx3s6XL3WnQYP/EjlyZpqqY7KdrjsmiNp9sPCMUd26xVFdr3WdK/
 ydLM6zdl4BUh4GclmGVQSEQ1lNrt7GOLQLVIfxsoydz3QFyJoUfuS9p2Dx4Pj1+dx2Qa
 uP3OrcquTDyiLAOPMu/FHbtzBDG9wpKIpY9NkNRkxA3NQn2aFwasSyVIIXIH+gbQqbbn
 JOsigB0ax1GvritGgP3i6CYnH6lCfrabdGLbjn2ETjjyJ/t/3WLC2ALnn21WP//0IY6m
 FBAA==
X-Gm-Message-State: AJcUukdIeWabOg/24DzBU4mCCSX0WfJV6GgBhh5Ye3TBwLc9xaHJtTvR
 MNOEbpoz7l8Lz3CveFmrOOiG6w==
X-Google-Smtp-Source: ALg8bN7y8DhNBo/zjGzVk4cC7Wz971s3OGHhEckYZs1TthZ1zVn3VC7D3jULqM0BqyAxcEWRPcvj+A==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr15349029wrq.69.1547807211289; 
 Fri, 18 Jan 2019 02:26:51 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 l6sm83312324wrv.70.2019.01.18.02.26.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 02:26:50 -0800 (PST)
Message-ID: <3d03d45f18e8b3e10edc7dd7dd03c5b7167abcbc.camel@baylibre.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andreas Fenkart <afenkart@gmail.com>
Date: Fri, 18 Jan 2019 11:26:48 +0100
In-Reply-To: <CALtMJEC=MUp-rigViGP3LkAwBpqooVfhq1zHu7VrLZmmM6+qQA@mail.gmail.com>
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
 <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
 <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
 <150bb9f497ba4a2bee055f49557b4dd8216bfa22.camel@baylibre.com>
 <CALtMJEAp0DJmNYsDWe9WJGH0zeZ2sVyFKe909ehzv87ita4ehw@mail.gmail.com>
 <c0ab226f363d22f31e13db5ae0af85ea7f7b451e.camel@baylibre.com>
 <CALtMJEC=MUp-rigViGP3LkAwBpqooVfhq1zHu7VrLZmmM6+qQA@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_022653_112759_F966F5DC 
X-CRM114-Status: GOOD (  24.69  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 krzysztof.michonski@digitalstrom.com, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-01-18 at 11:05 +0100, Andreas Fenkart wrote:
> From 7ea0b63ddfc841251cbcc33c8ed0151e52e372f2 Mon Sep 17 00:00:00 2001
> From: Andreas Fenkart <afenkart@gmail.com>
> Date: Thu, 17 Jan 2019 15:39:52 +0100
> Subject: [PATCH] mmc: meson-gx: enable signal re-sampling together with
> tuning
> 
> card detection fails on "BeeLink Mini M8 SII" if enabled too early
> mmc1: error -110 whilst initialising MMC card
> 
> Fixes: 71645e65729f ("mmc: meson-gx: add signal resampling")
> Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
> ---

Andreas,

Your patch gets corrupted by your mailer which makes it quite annoying to
apply.
I would suggest using git send-email

Plus, when sending patch it is better if the actual subject of the mail allows
patchwork to pick it up.
Since it is 2nd version, of your fix, the subject should start with
[PATCH v2].
This helps maintainers (and patchwork) track things

Jerome

>  drivers/mmc/host/meson-gx-mmc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-
> mmc.c
> index c2690c1a50ff..dba499009d0c 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -738,6 +738,11 @@ static int meson_mmc_clk_phase_tuning(struct
> mmc_host *mmc, u32 opcode,
>  static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
>   struct meson_host *host = mmc_priv(mmc);
> + int adj = 0;
> +
> + /* enable signal resampling w/o delay */
> + adj = ADJUST_ADJ_EN;
> + writel(adj, host->regs + host->data->adjust);
> 
>   return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
>  }
> @@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host
> *mmc, struct mmc_ios *ios)
>   if (!IS_ERR(mmc->supply.vmmc))
>   mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
> 
> + /* disable signal resampling */
> + writel(0, host->regs + host->data->adjust);
> +
>   /* Reset rx phase */
>   clk_set_phase(host->rx_clk, 0);
> 
> @@ -1166,7 +1174,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
> 
>  static void meson_mmc_cfg_init(struct meson_host *host)
>  {
> - u32 cfg = 0, adj = 0;
> + u32 cfg = 0;
> 
>   cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
>     ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
> @@ -1177,10 +1185,6 @@ static void meson_mmc_cfg_init(struct meson_host
> *host)
>   cfg |= CFG_ERR_ABORT;
> 
>   writel(cfg, host->regs + SD_EMMC_CFG);
> -
> - /* enable signal resampling w/o delay */
> - adj = ADJUST_ADJ_EN;
> - writel(adj, host->regs + host->data->adjust);
>  }
> 
>  static int meson_mmc_card_busy(struct mmc_host *mmc)
> --
> 2.20.1
> 
> Am Do., 17. Jan. 2019 um 16:08 Uhr schrieb Jerome Brunet <
> jbrunet@baylibre.com>:
> > On Thu, 2019-01-17 at 15:47 +0100, Andreas Fenkart wrote:
> > > From: Andreas Fenkart <afenkart@gmail.com>
> > > Date: Thu, 17 Jan 2019 15:39:52 +0100
> > > Subject: [PATCH] mmc: meson-gx: enable signal re-sampling together with
> > > tuning
> > > 
> > > card detection fails on some p212 derived boards if enabled too early
> > 
> > Please clearly mention what board you are using, this is too vague.
> > 
> > > mmc1: error -110 whilst initialising MMC card
> > > 
> > 
> > missing the 'Fixes' tag here
> > 
> > > Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
> > > ---
> > >   drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++------
> > >   1 file changed, 10 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-
> > > gx-
> > > mmc.c
> > > index c2690c1a50ff..b65ec4bea980 100644
> > > --- a/drivers/mmc/host/meson-gx-mmc.c
> > > +++ b/drivers/mmc/host/meson-gx-mmc.c
> > > @@ -709,7 +709,8 @@ static int meson_mmc_find_tuning_point(unsigned long
> > > *test)
> > >   static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32
> > > opcode,
> > >          struct clk *clk)
> > >   {
> > > - int point, ret;
> > > + struct meson_host *host = mmc_priv(mmc);
> > > + int point, ret, adj = 0;
> > >    DECLARE_BITMAP(test, CLK_PHASE_POINT_NUM);
> > > 
> > >    dev_dbg(mmc_dev(mmc), "%s phase/delay tunning...\n",
> > > @@ -729,6 +730,10 @@ static int meson_mmc_clk_phase_tuning(struct
> > > mmc_host *mmc, u32 opcode,
> > >    if (point < 0)
> > >    return point; /* tuning failed */
> > > 
> > > + /* enable signal resampling w/o delay */
> > > + adj = ADJUST_ADJ_EN;
> > > + writel(adj, host->regs + host->data->adjust);
> > > +
> > 
> > That's really what I meant.
> > 
> > Here, you are enabling the signal resampling after the tuning.
> > Several boards won't tune without signal resampling.
> > 
> > This should be done at the very beginning of the function at least.
> > I would prefer if it was done in meson_mmc_execute_tuning() before calling
> > meson_mmc_clk_phase_tuning()
> > 
> > Signal resampling should not be dealt with in the unrelated phase tuning
> > function
> > 
> > >    clk_set_phase(clk, point * CLK_PHASE_STEP);
> > >    dev_dbg(mmc_dev(mmc), "success with phase: %d\n",
> > >    clk_get_phase(clk));
> > > @@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host
> > > *mmc, struct mmc_ios *ios)
> > >    if (!IS_ERR(mmc->supply.vmmc))
> > >    mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
> > > 
> > > + /* disable signal resampling w/o delay */
> > 
> > nitpick : 'disable signal resampling' is enough.
> > when disabled, the delay does not matter.
> > 
> > > + writel(0, host->regs + host->data->adjust);
> > > +
> > >    /* Reset rx phase */
> > >    clk_set_phase(host->rx_clk, 0);
> > > 
> > > @@ -1166,7 +1174,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
> > > 
> > >   static void meson_mmc_cfg_init(struct meson_host *host)
> > >   {
> > > - u32 cfg = 0, adj = 0;
> > > + u32 cfg = 0;
> > > 
> > >    cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
> > >      ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
> > > @@ -1177,10 +1185,6 @@ static void meson_mmc_cfg_init(struct meson_host
> > > *host)
> > >    cfg |= CFG_ERR_ABORT;
> > > 
> > >    writel(cfg, host->regs + SD_EMMC_CFG);
> > > -
> > > - /* enable signal resampling w/o delay */
> > > - adj = ADJUST_ADJ_EN;
> > > - writel(adj, host->regs + host->data->adjust);
> > >   }
> > > 
> > >   static int meson_mmc_card_busy(struct mmc_host *mmc)



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
