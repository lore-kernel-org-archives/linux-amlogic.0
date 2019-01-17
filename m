Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB21C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 15:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F331620851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 15:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjHHY+Oa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pyO5hqlV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F331620851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+sxaRhyhce1VeH1y7rVmeMwGrFvaUkWaE7lnPH34Tc=; b=UjHHY+OaL261LP
	5/Kc931sK2uoBGfQB32Qjmwh66C4Eg/iGfrWN5RyxHP7AK1yRLxtTBHW58HRrWsqptdHuwwfSEi0R
	jGxXYdpk7T0RJeZIc3TeXAKq1ssnZ/pao/l8JQg6hFAPoVxE+ivBZZOJXVNamumy3uhZO1D7QHhQb
	soRmkC0xPzrDKazLbsVvmB3tS0xnwwWLclpmmVmmbZXnbi2VtX0j9ptSXbYgy5DC+7hWKuV11eja8
	FSANcqt6RK2ySoMUFbImQ6G74Uy96naaf0KSY+u0Dcbc2Q1vqwfjSmUejxlt1RiaK9t7mFSMyI9io
	Iz4X5vVfQsO9uPpOyYpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk9HX-0000nN-QU; Thu, 17 Jan 2019 15:08:35 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk9HV-0000mZ-0z
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 15:08:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id t200so1444310wmt.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=5hripb28BY3Qh8YuOiuKirtpdnew7yU46CUIrI+mo4s=;
 b=pyO5hqlVEgz5qqzasoQ3H+fuzxihoze7ov0gMFG90X8VvO4a+4Sbc2/0xPW5iZeGf8
 /QP5V1UML8QRrtoaGG07h45YYKkAxF+j5RxD9ndhF84ecsmrEgxDtGFfpBNrsd22RTQG
 S2gjdXFJKbypXzR8ZSiGmz0iuFWi71KpX/RR2m5iY6EiWNde0NYWMltGcOfNUB6oMtGh
 QltEw7vqLSIQryTUfTa+5zp4J+o78qcQaa7TMgNyWd41vIws6g+IkGLUavUdh5hgLyVJ
 G/8xjGoDlRdhHS162JBrGN0vZ6upuXKODDfL01n1ym01plCWPGSe7iYVK849Nj7fyy53
 5P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=5hripb28BY3Qh8YuOiuKirtpdnew7yU46CUIrI+mo4s=;
 b=KpZj2QprC4LLr2ydY0qPxIgXN0oOc/wtnJI7W9bR1JEFnXUHBLdmos3bHhpHMjTfyZ
 yxuyoQ66xfST+p1iQS6O1ndwxxAsNEWltFVXam7hVxFYVedJsEuQcAcKsioFE4gs2Dmg
 gWVGm7TVunigGIzpJ7SSYKQw/ZIKXaThUBiynN5DMAMoSYTn+VqSR2aQXbdrbC3+wVX1
 qrbIoQ2qPJu8R+UAPupvtyoRrbaChZLAD0XGwoxG3S/1ucwj5AGSYpx4S7eeLO/dmiiZ
 JAGlTtgiOp2TFSsf/PdZEUrsyehUDFZlKq+JFbZ+NBNY3hefoUmkMG6H+ER+QND+Znpg
 MEJA==
X-Gm-Message-State: AJcUukeDcGi8AIdW/XYCgsWSAQSIxl6eviW/b8zIDyuykPbsGSfr8A1C
 7Han3ntll0P5Dq9j0J/MIvK4gg==
X-Google-Smtp-Source: ALg8bN7kR5GDFGXCx9uZgVcNbhnp+VW1tLkrCj/86b7EsY8iARlDxrsIeNbenRk+ompF/SOuxFAY2Q==
X-Received: by 2002:a1c:2b86:: with SMTP id
 r128mr12867046wmr.100.1547737711200; 
 Thu, 17 Jan 2019 07:08:31 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 j8sm98856953wmd.0.2019.01.17.07.08.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 07:08:30 -0800 (PST)
Message-ID: <c0ab226f363d22f31e13db5ae0af85ea7f7b451e.camel@baylibre.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 16:08:28 +0100
In-Reply-To: <CALtMJEAp0DJmNYsDWe9WJGH0zeZ2sVyFKe909ehzv87ita4ehw@mail.gmail.com>
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
 <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
 <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
 <150bb9f497ba4a2bee055f49557b4dd8216bfa22.camel@baylibre.com>
 <CALtMJEAp0DJmNYsDWe9WJGH0zeZ2sVyFKe909ehzv87ita4ehw@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_070833_063666_1FCEA510 
X-CRM114-Status: GOOD (  15.29  )
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

On Thu, 2019-01-17 at 15:47 +0100, Andreas Fenkart wrote:
> From: Andreas Fenkart <afenkart@gmail.com>
> Date: Thu, 17 Jan 2019 15:39:52 +0100
> Subject: [PATCH] mmc: meson-gx: enable signal re-sampling together with
> tuning
> 
> card detection fails on some p212 derived boards if enabled too early

Please clearly mention what board you are using, this is too vague.

> mmc1: error -110 whilst initialising MMC card
> 

missing the 'Fixes' tag here

> Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-
> mmc.c
> index c2690c1a50ff..b65ec4bea980 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -709,7 +709,8 @@ static int meson_mmc_find_tuning_point(unsigned long
> *test)
>  static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
>         struct clk *clk)
>  {
> - int point, ret;
> + struct meson_host *host = mmc_priv(mmc);
> + int point, ret, adj = 0;
>   DECLARE_BITMAP(test, CLK_PHASE_POINT_NUM);
> 
>   dev_dbg(mmc_dev(mmc), "%s phase/delay tunning...\n",
> @@ -729,6 +730,10 @@ static int meson_mmc_clk_phase_tuning(struct
> mmc_host *mmc, u32 opcode,
>   if (point < 0)
>   return point; /* tuning failed */
> 
> + /* enable signal resampling w/o delay */
> + adj = ADJUST_ADJ_EN;
> + writel(adj, host->regs + host->data->adjust);
> +

That's really what I meant.

Here, you are enabling the signal resampling after the tuning.
Several boards won't tune without signal resampling.

This should be done at the very beginning of the function at least.
I would prefer if it was done in meson_mmc_execute_tuning() before calling
meson_mmc_clk_phase_tuning()

Signal resampling should not be dealt with in the unrelated phase tuning
function

>   clk_set_phase(clk, point * CLK_PHASE_STEP);
>   dev_dbg(mmc_dev(mmc), "success with phase: %d\n",
>   clk_get_phase(clk));
> @@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host
> *mmc, struct mmc_ios *ios)
>   if (!IS_ERR(mmc->supply.vmmc))
>   mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
> 
> + /* disable signal resampling w/o delay */

nitpick : 'disable signal resampling' is enough.
when disabled, the delay does not matter. 

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



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
