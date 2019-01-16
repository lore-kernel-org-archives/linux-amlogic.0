Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DE5C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 13:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B1620651
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 13:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzE4Z6xJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XfexWVJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B1620651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOZBF1NRlP9NGPAAQ7VuGq2G81z+/ZWHnmo7LoX74Mg=; b=hzE4Z6xJ9Oi6Y9
	QPSWai3CMiUf/aRS0b6igcgCXPrBIzE8txm6OenZjhY1azunN4tkJuO0MTOvhXTHzVy47MetOK1+8
	0s3lKmgLtv/6f4r/sa3aORV9etBs5TufEIENZ375x5auvvqXwB8+4wRfIZTwZlnuSLRkjTiT9FZjT
	LMUe4lkGd2lA4DnzTbBq+m/OycyVbR7sOMRbHlUr50sIaoQ51SBUoGszcqFnNZemsLTZLishPVPOw
	UOyxdHvZK8JReAkrxEXx/ksi+0hXCU2QlcDLQq6e2rh+lsok2H2Fb2SA/GwC9Jih8UsSwe+MuYUYe
	3c7qhRSzwLfArq9sA3XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjl03-0004w0-G8; Wed, 16 Jan 2019 13:12:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjkzv-0004oC-TB
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 13:12:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id f188so1918657wmf.5
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 05:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=qcRY4/cxb5HseSHQsP6xRpavxrwzw5SoZ9PvkAyeBrY=;
 b=XfexWVJSpKWItKsalRjvLN/AGiZqgn3JZQe915Lae6K713z7/zTxmskcEVD0l3jYtM
 dktwAXA/ufaX+hFfpwtN407bBy98MFr7qRimT4zLoqkq4u00rfisy0I8+36KDfTcSUMs
 KMZNeMHqIkQG1/EyZPlxgP/j9HymEqn3ZQN9Ehkey7v7HVh5h8+2mlRjRPlsS5Rb320e
 faPqdO1LCJwqU6qDdH8LUJZMTyrmvfGhzTGJfR/LJl0Mpv7SPP83EquvwPfSSjq068hQ
 Ig37LJdkyujnihCoYMyv1jMq7StMA6f8kI2uMNuO3FyafHGWNfpnaF9xaI2v4UgVK2qj
 ivKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=qcRY4/cxb5HseSHQsP6xRpavxrwzw5SoZ9PvkAyeBrY=;
 b=FlLLRqsZaHTyp6hdXw8O7IFYDnuHn6U9KI16AKUNvOARMckqSpjiuZ/+XwlooupJ+a
 yq44bnrwctwe04OU8ipYXhWEJfv/4Uu+KAzKDJL20/mKaK7MQK03Hct7ntH7QErBUnK3
 GJG+jcmWx/8Txd1Anrcf+sS5NONBYZ+vdJsmS551VxMKxKUc3ZJf1cdlqemaIzmE5FDn
 eQnT03D9jCDMo+kp0Mm/SZl5MK7MbnhKiKx6RhPF2Mr4eU6BUT0ws1KiLjpzv6yPJ0um
 dx15rTaiVDVkXZCC0Vgq43C7N6t7G2gFGXVRz4tLYuPFqO2q/silN8MimJavMKmOdRIc
 1I3g==
X-Gm-Message-State: AJcUukdPLk8dMBGQstCsl+kP0VFBTM5B72XS8zcn9/sLI+JAG1y/ZCKy
 q9sfQ8gQXX/cqMjWmdT2OzY+Nw==
X-Google-Smtp-Source: ALg8bN6Gf8xHLTDvJdbwjohmlrUT2YXjWA6FOFuzu1KeFPysp/Tn18/GWarVGdtp9KtAw+g+g/ZebA==
X-Received: by 2002:a1c:bdc5:: with SMTP id n188mr7937854wmf.69.1547644365736; 
 Wed, 16 Jan 2019 05:12:45 -0800 (PST)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w80sm47432040wme.38.2019.01.16.05.12.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 05:12:44 -0800 (PST)
Message-ID: <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Andreas Fenkart <afenkart@gmail.com>
Date: Wed, 16 Jan 2019 14:12:43 +0100
In-Reply-To: <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_051248_333058_181469B7 
X-CRM114-Status: GOOD (  15.71  )
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
 linux-mmc <linux-mmc@vger.kernel.org>, krzysztof.michonski@digitalstrom.com,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-01-16 at 12:14 +0100, Ulf Hansson wrote:
> + Jerome, Kevin
> 
> On Wed, 16 Jan 2019 at 11:13, Andreas Fenkart <afenkart@gmail.com> wrote:
> > failed to initialize builtin emmc device:
> > "mmc1: error -110 whilst initialising MMC card"
> > 
> > amlogic/meson-gxl-s905x-p212.dtb
> > linux-5.0-rc2 / 1c7fc5cbc
> > 
> > I bisected the problem and after reverting the following patch, mmc is
> > found again:
> > 
> > commit 71645e65729f0c5aef8dccf961c97fa766835bd4 (tag: mmc_bad_resable)
> > Author: Jerome Brunet <jbrunet@baylibre.com>
> > Date:   Thu Dec 6 16:18:28 2018 +0100
> > 
> >     mmc: meson-gx: add signal resampling
> > 
> >     With some eMMC devices, there is still issues with the new phase
> >     settings. Enabling signal resampling seems to solve the problem
> >     for these.
> > 
> >     Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >     Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > 
> > /Andi
> 
> Andi, thanks for reporting and bisecting!
> 
> I have looped in Jerome and Kevin to see if they can have a look.
> Let's give them a few days before we consider the revert.

Hi Andi,

There an actual s905x p212 in kernelci which is not showing any issue, AFAIK.

https://kernelci.org/boot/meson-gxl-s905x-p212/

Have a look a this recent boot of mainline/arm64:
https://storage.kernelci.org/mainline/master/v5.0-rc2-36-gfe76fc6aaf53/arm64/defconfig/lab-baylibre-seattle/boot-meson-gxl-s905x-p212.txt

Has the p212 is ref design of the s905x, we often see the related DT used on
other device.

Is your board actually a p212 ?
If yes, could you tell us about any of the marking on PCB, such as the board
revision ?
If not, could you tell us more about your device ?

We proposing this series, I flagged that this patch and the other one (on
phase settings) needed broader testing. It could possibly cause regression for
tunning and high speed modes ... this typically show with error -5 (tunning
failed)

Here your eMMC timedout during init, so even before an attempt is made to tune
which is odd. Could you try to enable signal resampling only when going forhigh speed modes ? 

> 
> Kind regards
> Uffe



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
