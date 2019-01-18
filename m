Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB3CC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48BC820855
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snDYfORT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYGZ2N6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48BC820855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLVgk7no6g3VWUMYU4scO2GcgHS3fQGaJxlW9Xv/lmY=; b=snDYfORTMHuEQ8
	szDTjjVQXK7p8KIKeAoCF8oVlzZGj65yC8z5PHkmMaoHXI0aScRdtAh+rpuKO8mJX8zZlXKYKU2t/
	omneaL68d6qCFwbljiMMM7hyfJMr0QIb1j0hzF4g8Mw57KkVgtXhan01KxLm5mwISwDWFgimD29aJ
	d/7aRL12J/iOOaTovem3x8RoohmjPBR0Aqu9zk4J9ibc9Ii8vFCZLSRAWJHHZdfznV1sl2scvChF6
	SfjvYm0ZjRSxl4FU3piRqxrgreqrnxPt9Ch4DF4Wic6lTODDd2bW+Gehr8NwLkngBLW4qAs5RCDvS
	qSbe5fPaVIyZNM+gva0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkR2N-0006Un-L5; Fri, 18 Jan 2019 10:06:07 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkR2J-0006UG-Sq
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:06:05 +0000
Received: by mail-ot1-x329.google.com with SMTP id t5so8853736otk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QpOjmXyyyT66cs7u7Zhd/0TezetfKEhZpcSbBcNja9w=;
 b=gYGZ2N6oXni9REfflNsTdmyvVKjk804Bjur7RHzkljoaK4xgg/Y8wJP2Wng4bC6NcY
 q9l0+3g2mt0iNjUTjdcawN203CpjXn0rMh/R0GkbQwQmLQAFsYTjOFHy62n9z7vDnnWs
 3huQbubFjrotWEYCZUS/Gp2i4JhpM/7QqGwvlfB4NJnUW7Vu1lzeQNtvpXEvyBrqbHat
 YoIZL3Z++wVB33E161r9s5EEKcn/2ufYmkD6J1rkdOTwg3eiiCac1nPcfqJVvzJ2nJlR
 Pg2lUEe8SZwkdUe8a89YTSMrFOOpH1fNNj36ly4s44zkyykYU2MEkm15fSXKSwNszDhf
 Xavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QpOjmXyyyT66cs7u7Zhd/0TezetfKEhZpcSbBcNja9w=;
 b=NSeYKPp1OfiN97KLLhkmZFHOhmAxYtBBq3caYZTq9DKqUZ2MZ/rZxXiwFBcJlDLB/f
 oyeX7yI+SGSbibyAXwSiSytOmWYuQTKZc1WrLGGDeFdndXz6wNBxMdpsi8vTtp6t2R0M
 R7HbwObpj0tGhn9xXu9gjhuB1TeS9KDfnBhhAoJtMGkKRkxY8bkEHmw0bwpBFfVjOH9K
 vVdsX1znSt1DAZgEQM+EXy1/Qm/PTq7W43kUlVe8T/+4BNudojc2ujGxQKJvEyMKTUYX
 H5JKk/CpefAzpCLPFDTkAOZbDADOiA7qArrzRgqtvzNaX2Eype4VyuSRdTQbSFMSB/iK
 TsBw==
X-Gm-Message-State: AJcUukcilAmGFTTPyyE6Hbjo0mgopsO22O9UzWJ1zUvbBGIy43BpR2ra
 9LZg1/e1AJm+IbyAuqMr0ZYxkL92Lc3ei8e9jgg=
X-Google-Smtp-Source: ALg8bN7xdrXlfCPC4nMkeVOSE5dA+S6+6UVCCTrVvz2fzTdCrCI8Bs4DMFJaE+M+JbatVKXpZX8Z5QLrwYdEcpbbhPk=
X-Received: by 2002:a9d:beb:: with SMTP id 98mr11870681oth.284.1547805962757; 
 Fri, 18 Jan 2019 02:06:02 -0800 (PST)
MIME-Version: 1.0
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
 <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
 <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
 <150bb9f497ba4a2bee055f49557b4dd8216bfa22.camel@baylibre.com>
 <CALtMJEAp0DJmNYsDWe9WJGH0zeZ2sVyFKe909ehzv87ita4ehw@mail.gmail.com>
 <c0ab226f363d22f31e13db5ae0af85ea7f7b451e.camel@baylibre.com>
In-Reply-To: <c0ab226f363d22f31e13db5ae0af85ea7f7b451e.camel@baylibre.com>
From: Andreas Fenkart <afenkart@gmail.com>
Date: Fri, 18 Jan 2019 11:05:51 +0100
Message-ID: <CALtMJEC=MUp-rigViGP3LkAwBpqooVfhq1zHu7VrLZmmM6+qQA@mail.gmail.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_020603_940747_A700114E 
X-CRM114-Status: GOOD (  21.93  )
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

From 7ea0b63ddfc841251cbcc33c8ed0151e52e372f2 Mon Sep 17 00:00:00 2001
From: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 15:39:52 +0100
Subject: [PATCH] mmc: meson-gx: enable signal re-sampling together with tuning

card detection fails on "BeeLink Mini M8 SII" if enabled too early
mmc1: error -110 whilst initialising MMC card

Fixes: 71645e65729f ("mmc: meson-gx: add signal resampling")
Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c2690c1a50ff..dba499009d0c 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -738,6 +738,11 @@ static int meson_mmc_clk_phase_tuning(struct
mmc_host *mmc, u32 opcode,
 static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
  struct meson_host *host = mmc_priv(mmc);
+ int adj = 0;
+
+ /* enable signal resampling w/o delay */
+ adj = ADJUST_ADJ_EN;
+ writel(adj, host->regs + host->data->adjust);

  return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
 }
@@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host
*mmc, struct mmc_ios *ios)
  if (!IS_ERR(mmc->supply.vmmc))
  mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);

+ /* disable signal resampling */
+ writel(0, host->regs + host->data->adjust);
+
  /* Reset rx phase */
  clk_set_phase(host->rx_clk, 0);

@@ -1166,7 +1174,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)

 static void meson_mmc_cfg_init(struct meson_host *host)
 {
- u32 cfg = 0, adj = 0;
+ u32 cfg = 0;

  cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
    ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
@@ -1177,10 +1185,6 @@ static void meson_mmc_cfg_init(struct meson_host *host)
  cfg |= CFG_ERR_ABORT;

  writel(cfg, host->regs + SD_EMMC_CFG);
-
- /* enable signal resampling w/o delay */
- adj = ADJUST_ADJ_EN;
- writel(adj, host->regs + host->data->adjust);
 }

 static int meson_mmc_card_busy(struct mmc_host *mmc)
-- 
2.20.1

Am Do., 17. Jan. 2019 um 16:08 Uhr schrieb Jerome Brunet <jbrunet@baylibre.com>:
>
> On Thu, 2019-01-17 at 15:47 +0100, Andreas Fenkart wrote:
> > From: Andreas Fenkart <afenkart@gmail.com>
> > Date: Thu, 17 Jan 2019 15:39:52 +0100
> > Subject: [PATCH] mmc: meson-gx: enable signal re-sampling together with
> > tuning
> >
> > card detection fails on some p212 derived boards if enabled too early
>
> Please clearly mention what board you are using, this is too vague.
>
> > mmc1: error -110 whilst initialising MMC card
> >
>
> missing the 'Fixes' tag here
>
> > Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
> > ---
> >  drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-
> > mmc.c
> > index c2690c1a50ff..b65ec4bea980 100644
> > --- a/drivers/mmc/host/meson-gx-mmc.c
> > +++ b/drivers/mmc/host/meson-gx-mmc.c
> > @@ -709,7 +709,8 @@ static int meson_mmc_find_tuning_point(unsigned long
> > *test)
> >  static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
> >         struct clk *clk)
> >  {
> > - int point, ret;
> > + struct meson_host *host = mmc_priv(mmc);
> > + int point, ret, adj = 0;
> >   DECLARE_BITMAP(test, CLK_PHASE_POINT_NUM);
> >
> >   dev_dbg(mmc_dev(mmc), "%s phase/delay tunning...\n",
> > @@ -729,6 +730,10 @@ static int meson_mmc_clk_phase_tuning(struct
> > mmc_host *mmc, u32 opcode,
> >   if (point < 0)
> >   return point; /* tuning failed */
> >
> > + /* enable signal resampling w/o delay */
> > + adj = ADJUST_ADJ_EN;
> > + writel(adj, host->regs + host->data->adjust);
> > +
>
> That's really what I meant.
>
> Here, you are enabling the signal resampling after the tuning.
> Several boards won't tune without signal resampling.
>
> This should be done at the very beginning of the function at least.
> I would prefer if it was done in meson_mmc_execute_tuning() before calling
> meson_mmc_clk_phase_tuning()
>
> Signal resampling should not be dealt with in the unrelated phase tuning
> function
>
> >   clk_set_phase(clk, point * CLK_PHASE_STEP);
> >   dev_dbg(mmc_dev(mmc), "success with phase: %d\n",
> >   clk_get_phase(clk));
> > @@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host
> > *mmc, struct mmc_ios *ios)
> >   if (!IS_ERR(mmc->supply.vmmc))
> >   mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
> >
> > + /* disable signal resampling w/o delay */
>
> nitpick : 'disable signal resampling' is enough.
> when disabled, the delay does not matter.
>
> > + writel(0, host->regs + host->data->adjust);
> > +
> >   /* Reset rx phase */
> >   clk_set_phase(host->rx_clk, 0);
> >
> > @@ -1166,7 +1174,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
> >
> >  static void meson_mmc_cfg_init(struct meson_host *host)
> >  {
> > - u32 cfg = 0, adj = 0;
> > + u32 cfg = 0;
> >
> >   cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
> >     ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
> > @@ -1177,10 +1185,6 @@ static void meson_mmc_cfg_init(struct meson_host
> > *host)
> >   cfg |= CFG_ERR_ABORT;
> >
> >   writel(cfg, host->regs + SD_EMMC_CFG);
> > -
> > - /* enable signal resampling w/o delay */
> > - adj = ADJUST_ADJ_EN;
> > - writel(adj, host->regs + host->data->adjust);
> >  }
> >
> >  static int meson_mmc_card_busy(struct mmc_host *mmc)
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
