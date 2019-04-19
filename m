Return-Path: <SRS0=yuw1=SV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4467C282DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2019 08:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62458217FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2019 08:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u73ViqsX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LEcQUq/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62458217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffHq6CuZGbY6UAWfAeuRALREHvbSuRycT9YTsQa9kb8=; b=u73ViqsXQruBKJ
	X6H9nsiV9eButM+PwgPHZPbEkLW9TT7TBSAWsFyPudEN0MczjyquCCurpjaAe966GecIZ4liM9mDh
	589JgLtbnK8jnZd1sPa1IgNLFzlWkJg6I84XC4R1GjupYfh4KzFEQfiSay7Tf20OCpKaSr7p8mhiB
	//kNHiVdmOSnNXtzejS4/8bxPL1CpDuEPKVWu7Lf2SXTAnzmUI3iq8iIASbvxWfTuOAWOwJU0Va1B
	VDG4uMdfQpRmAMtBIHqhMa+8lyJX+l/am+1qMz1Ul28HxYUuAYySizF7GIirSUbkR0tXhv9joccpY
	FK7MA3AQRRAKx4hTed3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHPGu-0004sQ-TT; Fri, 19 Apr 2019 08:53:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHPGr-0004s5-QG
 for linux-amlogic@lists.infradead.org; Fri, 19 Apr 2019 08:53:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id k1so4982615wrw.0
 for <linux-amlogic@lists.infradead.org>; Fri, 19 Apr 2019 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=QKlGpXMb0tH6sXLUBD9ZIQCBRut+xvYk+uAsWH/Xqdo=;
 b=LEcQUq/8YocoNv2HI/cxUg2aA407+INpeeYIdnSNzo8djaGCCV6r5gB5a9gddpJ+Ie
 w00jw1O4XooxXbu3erMZ3Dl31r0tIRAPII82oHCglkB/yAYFv5/vmUhpBQ2D9mt3iY0I
 H3ZRfMh9Q9EkAV1HOy22ISb8sezHHDws2QTmOmt1vsLAlYwncEiOlG6xCbCg41W8Bgx1
 z7TioaSIfkhRJ/J4xHKoPVYxxlX+ecjtHTvrYfIrxRBbjmzyIpsdzu9SY6oDB42SCh0q
 NZaFxxwkU+b0rZ96gyzHnMow9WMoPiXDaMlyg20o9hK8dOWflLcOWib7chyBQn+NzoQd
 /mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=QKlGpXMb0tH6sXLUBD9ZIQCBRut+xvYk+uAsWH/Xqdo=;
 b=lVUUwLm0UgzccnrHnRiZgHb0nhSPPTtX0O4v4yWcRJhD6+LBFh45FZo0DGSYoTSJVi
 vTarV1rJ1YBe7F+HXJj51HCDcoe5zB42acdsmSjXvOn2AIgZJ+oIus2mm8blbAFBltKs
 cql7o37zlAB2Mzi7nBGBcZlUC3feJuUZwl9/ba9ryw1fbO9SvgwCOHfkUQ6bEAZcSLGg
 R6ycdck0rGzLGsLoeuPYjyYeJ1y7lMKgTXRsxmh5Z0veVcq/zDA00WVmp9mI+38D/NJm
 1X5VJCKoPcwXbAOX8azobomSmENYWaSy0eDZGVi0Gc2Ek+3rNSEh6PjCwQ4eKlZBG2eF
 0teg==
X-Gm-Message-State: APjAAAXRbowXTVe/bkTvidFnYLwhbn+v2eEGxBubXzF0fGO9QKX66BwD
 4jq/G1+TC6EQpohJDcdm6FgTow==
X-Google-Smtp-Source: APXvYqyaMpH0BzYdCVCZB2jCvkbbbSwap7n2VjNC7yF7/Uq0OJB6wZFnoH4/mW9fZvVyV1jala0oTA==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr2043072wro.232.1555663999874; 
 Fri, 19 Apr 2019 01:53:19 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z7sm3203946wml.40.2019.04.19.01.53.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Apr 2019 01:53:19 -0700 (PDT)
Message-ID: <5d65cc12e18f9a4b86c097fbade0cef91b3b5d9b.camel@baylibre.com>
Subject: Re: [PATCH 5/7] mmc: meson-gx: avoid clock glitch when switching to
 DDR modes
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 19 Apr 2019 10:53:18 +0200
In-Reply-To: <5b19d32be23fbe630339fd48f93b16e9301385d1.camel@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-6-jbrunet@baylibre.com>
 <CAFBinCCAbMpWYY6-W+909Q=jLpweC2F6ED6CVf6zVGrRiA1hxg@mail.gmail.com>
 <8316d7875bf0479e91cc11ce5fbf3b2e21f92a2c.camel@baylibre.com>
 <CAFBinCBQPSsqwDSd6nQMLqOuApiESwHXn4wQbOp49WLpXfBk=Q@mail.gmail.com>
 <5b19d32be23fbe630339fd48f93b16e9301385d1.camel@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_015321_910425_4B16AB62 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-04-18 at 23:15 +0200, Jerome Brunet wrote:
> On Thu, 2019-04-18 at 22:53 +0200, Martin Blumenstingl wrote:
> > Hi Jerome,
> > 
> > On Thu, Apr 18, 2019 at 10:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > On Thu, 2019-04-18 at 22:16 +0200, Martin Blumenstingl wrote:
> > > > Hi Jerome,
> > > > 
> > > > On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > > Activating DDR in the Amlogic mmc controller, among other things, will
> > > > > divide the output clock by 2. So by activating it with clock on, we are
> > > > > creating a glitch on the output.
> > > > > 
> > > > > Instead, let's deal with DDR when the clock output is off, when setting
> > > > > the clock.
> > > > > 
> > > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > it seems that this patch breaks SD card on my Khadas VIM and Khadas VIM2.
> > > 
> > > The error I see in your logs is with eMMC and hs200, not SD card.
> > sorry, I should have been more clear that there are two errors:
> > eMMC, this is what I have been seeing for a while on my Khadas VIM2
> > (it's probably not related to this patch):
> >    mmc1: mmc_select_hs200 failed, error -84
> >    mmc1: error -84 whilst initialising MMC card
> 
> Following patches were also supposed to help the vim2. 
> ... something I tested numerous time on this particular board.
> 
> > however, then there's this other error:
> >    print_req_error: I/O error, dev mmcblk0, sector 0 flags 0
> >    Buffer I/O error on dev mmcblk0, logical block 0, async page read
> > as result of this the partition table cannot be read and my kernel
> > cannot find the rootfs.
> 
> I don't know what the problem is (probably some CRC error - you can check the log
> in interrupt for this) but I'm pretty sure it is not related to this patch.
> 
> I see in the log SD is indeed in HS mode, so not in any DDR mode.
> I also see that the SDIO fails as well. There something really weird, which can't
> be explained by this patch alone AFAICT.

Ok, I think I got it. It is indeed not linked to DDR, but a more trivial mistake.
It looks like a writel went AWOL during the final rebase (and after the test campaign).

in meson_mmc_set_ios, after:
val |= FIELD_PREP(CFG_BUS_WIDTH_MASK, bus_width);

Could you try adding
writel(val, host->regs + SD_EMMC_CFG);

Without this, the bus width is not changed, which explains why eMMC, SD and SDIO fail
on init.

Let me know if this helps.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
