Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BB7C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 14:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0053B20652
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 14:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUkQmn+Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JED1ZbAq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0053B20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N/se4h8ahEXzxqaIZirLEf35EXtE/Ea5hif2J85UDA=; b=BUkQmn+Yq25Wwc
	lztpxfrK5uwRCbA1PXhQsGG3od1KdSQB5126jzmsASqL7J1oMaHpZHWMRrwKNcbx6Ysxw6wjtFkJ6
	bc+0W1iQYad0z97Ja+c1tdvcutYe7IWQwS+lYp5MXhrYbehyJU8fy3UJdwrJg3u8w2mOkcorxWmfC
	32YDycKOvdiTs0f8AfXA58cKhUgf8se5RSDR4jhMUQ3VOO79+tLiUIRBGfdtFAUHwkdIHFFbOWMs5
	V3eZBq2/FQgcSQ5U/xOx5EPYyFd7ZWikFtQkt8ro8oEXOAqNVm7tSxFtYS7KzB2m6OLUjqDZgtR9R
	LkN0/+fzmcV+QBz2PyMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk8ww-0000XZ-CA; Thu, 17 Jan 2019 14:47:18 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk8wt-0000X0-DI
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 14:47:17 +0000
Received: by mail-ot1-x329.google.com with SMTP id k98so11325877otk.3
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 06:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vq2/EG/6QB+Sm2B2HrHa/w3Xhb3K0LJX1Y7sGIupJLM=;
 b=JED1ZbAqvQbn177vpw8x3qL/A/yXySpI2OxvjRlrDLQGBZAy7vPr/gjV4+rGJCxMXD
 OGCJWx7AEJe6X0I6DlOxzE69l08D3tBWLZpEQuFRnhmKF5Vb/nZp2ccdck77z3YGPBDV
 92T27+NNxPStz1eVQDhPAi7zwE7Yko3u4qRzV5+82xTI/wpz0j49JfeJJBTbiUoaDI2Q
 aT1OKYZ241kT18ircrnwwu+1DBx2wrxNsbcoKRon5H9mQvJn55oEfJWGisG+pZ9uSEjL
 pBdrjWw1n+V+lzKC8g6RKwzwbIX3euovYjUT2MFV1rz78ir329M/X1Md7x9aDU+m6QAq
 wxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vq2/EG/6QB+Sm2B2HrHa/w3Xhb3K0LJX1Y7sGIupJLM=;
 b=gpVWmrkqrty+5DQDpwtvtiZ94GRP+efNxQXMBO/1Mi+zXYdvY6TWl9l4FiyY19rHuu
 CD7KIMdGgSH/1vwqJyOs7Lg3lN5LZdJNs/Pa3YBjhsh0Tmgs9IWNAKjDSDPIyTJ+ll5m
 J9RyyJIT3B4Zgp37M0bl2i1XH5MIbjTsadGsDDxjFyOs4NnW+xk11qQrGgcYZAcYg6kn
 6GplyXa0vYBvsmKQ/2UPsGgJkkzdnPjTdHtA6OkOXUS8Ubn6f7OLuMsh2Da/hAjdvs8O
 IIQGRbwCYCpB2H77CIUcjYd6cUtUKoRtGybzFlfyKP8eD0zG+0RjPVpOMJH5Xsq8jGQr
 MCvQ==
X-Gm-Message-State: AJcUukenNYDjMbPg84cPyLHW/gjbGKI59a0x7M357X5qSiU1/86dowVy
 8O605iLa2Ll418xSp5NzfB66Dc0rGXSsn/ZRqoU=
X-Google-Smtp-Source: ALg8bN7ScNd4oBcLm8t75q0eqAty4MeyFKjFQlsGki8L9nmkZFOmzkN/D0VvaS20Hc5UqDxkttaUIyOSLftXUjJi42U=
X-Received: by 2002:a9d:beb:: with SMTP id 98mr9381610oth.284.1547736433981;
 Thu, 17 Jan 2019 06:47:13 -0800 (PST)
MIME-Version: 1.0
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
 <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
 <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
 <150bb9f497ba4a2bee055f49557b4dd8216bfa22.camel@baylibre.com>
In-Reply-To: <150bb9f497ba4a2bee055f49557b4dd8216bfa22.camel@baylibre.com>
From: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 15:47:02 +0100
Message-ID: <CALtMJEAp0DJmNYsDWe9WJGH0zeZ2sVyFKe909ehzv87ita4ehw@mail.gmail.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_064715_485776_8DCD5EDA 
X-CRM114-Status: GOOD (  19.67  )
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

From: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 15:39:52 +0100
Subject: [PATCH] mmc: meson-gx: enable signal re-sampling together with tuning

card detection fails on some p212 derived boards if enabled too early
mmc1: error -110 whilst initialising MMC card

Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c2690c1a50ff..b65ec4bea980 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -709,7 +709,8 @@ static int meson_mmc_find_tuning_point(unsigned long *test)
 static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
        struct clk *clk)
 {
- int point, ret;
+ struct meson_host *host = mmc_priv(mmc);
+ int point, ret, adj = 0;
  DECLARE_BITMAP(test, CLK_PHASE_POINT_NUM);

  dev_dbg(mmc_dev(mmc), "%s phase/delay tunning...\n",
@@ -729,6 +730,10 @@ static int meson_mmc_clk_phase_tuning(struct
mmc_host *mmc, u32 opcode,
  if (point < 0)
  return point; /* tuning failed */

+ /* enable signal resampling w/o delay */
+ adj = ADJUST_ADJ_EN;
+ writel(adj, host->regs + host->data->adjust);
+
  clk_set_phase(clk, point * CLK_PHASE_STEP);
  dev_dbg(mmc_dev(mmc), "success with phase: %d\n",
  clk_get_phase(clk));
@@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host
*mmc, struct mmc_ios *ios)
  if (!IS_ERR(mmc->supply.vmmc))
  mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);

+ /* disable signal resampling w/o delay */
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

Am Do., 17. Jan. 2019 um 15:11 Uhr schrieb Jerome Brunet <jbrunet@baylibre.com>:
>
> On Thu, 2019-01-17 at 14:56 +0100, Andreas Fenkart wrote:
> > Am Do., 17. Jan. 2019 um 13:35 Uhr schrieb Andreas Fenkart <
> > afenkart@gmail.com>:
> > > Hi Jerome
> > > > Here your eMMC timedout during init, so even before an attempt is made
> > > > to tune
> > > > which is odd. Could you try to enable signal resampling only when going
> > > > forhigh speed modes ?
> >
> > card is found with this patch:
> >
> > --- a/drivers/mmc/host/meson-gx-mmc.c
> > +++ b/drivers/mmc/host/meson-gx-mmc.c
> > @@ -432,12 +432,17 @@ static int meson_mmc_clk_set(struct meson_host
> > *host, struct mmc_ios *ios)
> >         struct mmc_host *mmc = host->mmc;
> >         unsigned long rate = ios->clock;
> >         int ret;
> > -       u32 cfg;
> > +       u32 cfg = 0, adj = 0;
> >
> >         /* DDR modes require higher module clock */
> >         if (meson_mmc_timing_is_ddr(ios))
> >                 rate <<= 1;
> >
> >         /* Same request - bail-out */
> >         if (host->req_rate == rate)
> >                 return 0;
> > @@ -475,6 +480,13 @@ static int meson_mmc_clk_set(struct meson_host
> > *host, struct mmc_ios *ios)
> >         if (ios->clock != mmc->actual_clock)
> >                 dev_dbg(host->dev, "requested rate was %u\n", ios->clock);
> >
> > +       if (rate >= 200000000) {
> > +               printk("enable signal resampling");
> > +               /* enable signal resampling w/o delay */
> > +               adj = ADJUST_ADJ_EN;
> > +               writel(adj, host->regs + host->data->adjust);
> > +       }
> > +
>
> 200Mhz is a bit arbitrary.
> I would prefer if you enabled resampling when starting a tuning
> And disable it on power up, in the set_ios() callaback.
>
> >         /* (re)start clock */
> >         meson_mmc_clk_ungate(host);
> >
> > /Andi
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
