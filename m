Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4544EC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D03E214DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="je94yFhF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="N5FPiGcD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D03E214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/qhuWrJTvTPqvdgsvweUTzBduMqpCqTlUv+OV0/YtY=; b=je94yFhFqOxWuu
	JFKRVtNGCFN/CgqKrt8Y1Ct4ako7XxQ1pfBsugzidlJHIGQXm9wGWA6zqHV3tfwoedjNrL+3fBD15
	yvGIccwFYBc0AEh9DJ4vH57WZ797s9DcD6jmKX++TZkbNbDZtq0DX+AZ+Jqh22+rihNiY9rKBFkNc
	wW8vTvCfFdG4sp0n8IV6gylV2XuS038EPoG5ZcI+Q8bdkeHY2lVidIVeT/pY2QUDuH9+ZMvVl8SKk
	FTVSu7jq3HXpqPrEnIriJ+fpEEp35+aDQSauacStSVM1P58E6rYegBukOEER6LpQwHmJQAOG+A/1T
	4NtSVnUp4GvG5jwUrUzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHE2q-00079I-Iq; Thu, 18 Apr 2019 20:54:08 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHE2n-00078M-DA
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 20:54:06 +0000
Received: by mail-oi1-x241.google.com with SMTP id j132so2682925oib.2
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R5oCZP96kysA4+CsYMa2NY+MrmDfUa/rZvfN/Hagbfo=;
 b=N5FPiGcDBEonviaNIvKsKqkTigq0VeXh8fjdqzHgHXYWf3do5a3dopc0kTk58fpvkU
 X1pvrIB6V3w3P6lRHr6MsOv4s5rPInmXl8GTXx/ma0uE6adLgKSzq26WpiBYpZCPNF1e
 Y4ZTw4S11lA6uO2hP3UFjsxUw4a/8WkdHoArJxVwSJwNGsgYy5dam+nOl+FPxGJq8gZo
 Wg0hIHqr2bRoN0WAT+cdXJeTCmc9cteAoW0rHuPHYsF6MFs0RsQLU4/GZUOW1wyK+unt
 ImGFBnM2fWyFXD5idvMujwzqp2nEMbXhSxdbHs0hqcCJ1BnvUkopSmN563RK9xlsS8ar
 1+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R5oCZP96kysA4+CsYMa2NY+MrmDfUa/rZvfN/Hagbfo=;
 b=AzKdos17YdyBjdoSSQfkjmjN9gW1ma+cOYqHIJgky+IGOvvO7guENd2HiVkrFphuVn
 JYGjxz1KbPL3PbPzxWkC16jMb+9VI8ABY7+aOlggT2u1f2KbIJ1wzUKLUbprtwH6bFn4
 Jj2QQFsIBno/DF9utyxkicSYK2azrWWTleTR5qDXZL6KVMUSeHvtHvO4wLbcJT8hPTEP
 4vW3jyMuOjssnsuXErcrMuu3x7kShlnAYR2gjnpIcSb73xAxtLGbiLsfGpMdd66B6kEW
 +02FA/asbJ4VwApgT1gm9/kgK3NI7k17kcMHnr49XigxmHejoSkXt9h8lYH35sefgPzz
 2MDw==
X-Gm-Message-State: APjAAAXd/GEUjxP2cyXPu41mgANVWj7g/Fiw3E6DFHq/JvZXttDNFNuf
 ZUm0VECeEb078k3BkLeohgVlN6bjoEQHJyIhCOk=
X-Google-Smtp-Source: APXvYqzZi065lzAyGg2kjLFhqeyVvmKBOY1v0x0QdLN6L7njzHzkaT+W3GtjBPv8bHYI4mXR7fPAxubHuPiU1s0DV20=
X-Received: by 2002:aca:ecd1:: with SMTP id k200mr3288928oih.15.1555620844042; 
 Thu, 18 Apr 2019 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-6-jbrunet@baylibre.com>
 <CAFBinCCAbMpWYY6-W+909Q=jLpweC2F6ED6CVf6zVGrRiA1hxg@mail.gmail.com>
 <8316d7875bf0479e91cc11ce5fbf3b2e21f92a2c.camel@baylibre.com>
In-Reply-To: <8316d7875bf0479e91cc11ce5fbf3b2e21f92a2c.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 22:53:53 +0200
Message-ID: <CAFBinCBQPSsqwDSd6nQMLqOuApiESwHXn4wQbOp49WLpXfBk=Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] mmc: meson-gx: avoid clock glitch when switching to
 DDR modes
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_135405_495239_77B9B159 
X-CRM114-Status: GOOD (  16.73  )
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

Hi Jerome,

On Thu, Apr 18, 2019 at 10:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Thu, 2019-04-18 at 22:16 +0200, Martin Blumenstingl wrote:
> > Hi Jerome,
> >
> > On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > Activating DDR in the Amlogic mmc controller, among other things, will
> > > divide the output clock by 2. So by activating it with clock on, we are
> > > creating a glitch on the output.
> > >
> > > Instead, let's deal with DDR when the clock output is off, when setting
> > > the clock.
> > >
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > it seems that this patch breaks SD card on my Khadas VIM and Khadas VIM2.
>
> The error I see in your logs is with eMMC and hs200, not SD card.
sorry, I should have been more clear that there are two errors:
eMMC, this is what I have been seeing for a while on my Khadas VIM2
(it's probably not related to this patch):
  mmc1: mmc_select_hs200 failed, error -84
  mmc1: error -84 whilst initialising MMC card

however, then there's this other error:
  print_req_error: I/O error, dev mmcblk0, sector 0 flags 0
  Buffer I/O error on dev mmcblk0, logical block 0, async page read
as result of this the partition table cannot be read and my kernel
cannot find the rootfs.

> Either way, There is something I don't really get. eMMC should not go through
> any DDR mode to reach HS200 (which is an SDR mode), neither should SD to reach
> HS.
>
> All this does is flipping the DDR bit (when necessary) when clock if off for
> the mmc device, avoiding a glitch on clk line.
>
> This patch should not make any difference for SDR only setup, Maybe I missed
> something, but I don't see how it could make anything different for SDR only.
>
> I (repeatedly) tested both vim1 and vim2, without seeing this issue, so I can't
> debug this. I'll need more detail to progress, something does not make sense here.
please let me know from which part of the driver do you want debug logs


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
