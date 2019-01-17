Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D710C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 13:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF0BF20652
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 13:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVyV62rJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myScw/Hf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF0BF20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ufpp80+UfEprGNvM6bIXnrf5BkppBSDaKkfV1efhqM=; b=LVyV62rJ1RhWIv
	jDs411jFO9ZxaoQWUhwbqiA+umgKBooO4ZUmHPz/SAYrgYp05bj/6FtRYFeF0w8zb4mbxmSflQsKD
	xski0m2bQx/OKYQyfo62lv00N67A4SwYYCtlXku2R+whZNzbVLKuBdUvV54rA3/kuD5az/8yVTxIN
	zE1ED9GHzsOV4l0EQSgUcyZBv/JuIx42ewxcZ5altIWauuj/DHB1fuEdUlZujs+sgBMb7ahTQF0JR
	uy79B+7uZj25Ztf3oEF2fbyYjTsQg0Yn3EIZamcqsK3HDBV3kLLlAJw/EPA94MYuec2vgKoA+DIK/
	Tg1mJrYv5G7B/l7400Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk89g-0007h2-B0; Thu, 17 Jan 2019 13:56:24 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk89d-0007gW-6u
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 13:56:22 +0000
Received: by mail-oi1-x230.google.com with SMTP id y1so6159487oie.12
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1zCV5cMvW2G3kSPnws70aERmYn9aiFJhFsWpjEBF1WQ=;
 b=myScw/HfqzS/rPXdODU6kNGp8zOs50OJ0EgIs1s8XA/KcbX8DwlirrytaA7V3I2q7S
 SF+Z27ERl67lGndsiplGXRn2k16SsaRaABjO1P78ynYEWiiYeJh9X8CUxySZpm6gwwV0
 DWGuJ9U7iYWNvpzl178MELiauBY++sxWuG+NX0b72msag+hTAHKcNtgjZaNndDaVRROG
 /LkWrPvPH+0ZriYOfZXd63zy1Hi5GV8sj3GVWk9RO4tkhgfwZU1Xw99IxC5P16KJpROZ
 r+SqtiJWqpZekTZQo415Ipm/4snsYqCuwhnI7fx8OTM2/9VNzRhSY1I6uaibY9ybWzTe
 YMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1zCV5cMvW2G3kSPnws70aERmYn9aiFJhFsWpjEBF1WQ=;
 b=dO2+o5qRsTJE75VmvfO0HV+lr7MXFJDnbvKW6AyEGlPHoHhFGOUFPN71laYo/yZr+/
 o3br3dk9LFWEXEnWufaaPRdcjNFAKJPfj7Rvt+NxPabLf5PfTl/1qJRfD/qRFOzLH+AY
 6MsTUiVECWQcEHm/ziClNT7id+vGQ9fiDhHwT4l4+y5Ge8umwr1dvLzl+YlUKl1F9KLU
 kDDlI2REjKu3q6S3h4CwF9RCeSaMMO39HA8uR/JdPas9Ld3yyACiaSeLttw5zfv/7arH
 4G428iQwI62CaqOQ6rE9ymSwdLGxg5panHC8dZ0BbHqJs9WRjy4rVrVfcFXPX5X+9dPP
 Jm/A==
X-Gm-Message-State: AJcUukfG10hKXKnaXh6ZCOE9K7HUn0sObNCLlgnzDIge1khirso5EQg3
 LvR6NVyc9RTinly9l3Vbf3OGaxsrJmMfGnIteaA=
X-Google-Smtp-Source: ALg8bN6SQXcmsMCoVzWMWH2013/4rdg75/MUehrYRz3yeCR3Slmu3mhkT+Xm4wzNZRgWmr2V3tnwNmKwYLxQFdGOGUo=
X-Received: by 2002:aca:3a83:: with SMTP id h125mr7361156oia.308.1547733380211; 
 Thu, 17 Jan 2019 05:56:20 -0800 (PST)
MIME-Version: 1.0
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
 <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
In-Reply-To: <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
From: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 14:56:07 +0100
Message-ID: <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_055621_277876_867920FA 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

Am Do., 17. Jan. 2019 um 13:35 Uhr schrieb Andreas Fenkart <afenkart@gmail.com>:
>
> Hi Jerome

> > Here your eMMC timedout during init, so even before an attempt is made to tune
> > which is odd. Could you try to enable signal resampling only when going forhigh speed modes ?
>

card is found with this patch:

--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -432,12 +432,17 @@ static int meson_mmc_clk_set(struct meson_host
*host, struct mmc_ios *ios)
        struct mmc_host *mmc = host->mmc;
        unsigned long rate = ios->clock;
        int ret;
-       u32 cfg;
+       u32 cfg = 0, adj = 0;

        /* DDR modes require higher module clock */
        if (meson_mmc_timing_is_ddr(ios))
                rate <<= 1;

        /* Same request - bail-out */
        if (host->req_rate == rate)
                return 0;
@@ -475,6 +480,13 @@ static int meson_mmc_clk_set(struct meson_host
*host, struct mmc_ios *ios)
        if (ios->clock != mmc->actual_clock)
                dev_dbg(host->dev, "requested rate was %u\n", ios->clock);

+       if (rate >= 200000000) {
+               printk("enable signal resampling");
+               /* enable signal resampling w/o delay */
+               adj = ADJUST_ADJ_EN;
+               writel(adj, host->regs + host->data->adjust);
+       }
+
        /* (re)start clock */
        meson_mmc_clk_ungate(host);

/Andi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
