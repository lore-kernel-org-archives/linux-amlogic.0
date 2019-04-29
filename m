Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036FEC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 08:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A922087B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 08:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKUvfkZ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R/Wms0Jo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A922087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wAp2+5YNk+fgL32Ac6dHAA/MpfiTqhlZnqGdvQ59+A=; b=XKUvfkZ7TH0cYW
	3hQ0NULnMZbpsDyiKrT8V8C5gFX8Cn3sWcdKRUDFj71MHKQ1nVRu7nYEyVa17b8G4ri1P6fIJlKDP
	nEfw4vUp6WL21qExBsZ7og93NnNsEa+rU02VNyp091NudR4d4nYWITitumZfaOKrkw2kVGFUPV64b
	k8Yqqz3iy9FlLLHafh+opWCCs6h/aaQwV7L5CZ0VSoGq3e4FD7RhEGb+HOv+RLv2vTmXBlsddGvyl
	9r0wrJpfAfDSO59wE1m4jejAG4JVScp8r87SPVjr5SHr/W8FRy6iYecBYkEToom00/vvKrkiJUhMx
	IqDdrk4285QPBpNDMoDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL1fA-0006Nt-AI; Mon, 29 Apr 2019 08:29:24 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL1f7-0006N7-GF
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 08:29:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id w15so14409841wmc.3
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=jw6rquaiXD+oPh3858jmCUg9XPcrdzfEXx4OPrYN3Q8=;
 b=R/Wms0JoD8IoeFcmOJnm9UB09mChGCsPo8NNrKbZfdRBNrC9ik0zxgm6JauyvfUIfK
 rPOOPn+rqs4G7NZuBGQPHTJHqzvMp57hnp8bfXPoSbUtiMPjGoT3pzrrJNgDk0xDovmX
 aLpdNclAhgssdblq1jqppfSjHxV5VDeYH61spcJu5gZSlyDMmt77c4qM3bONO6UTRidl
 vaFy1O/BvjolxQpfAZridh1pcQNeeX+P9UXmUx2sAu2x2rpyCjlKZOvEPU2ZcsaWDDH6
 9x+zalMxtbqIQvBrBHZg8ztLqj5jAQp8oueRXSfgLBWvKxLFVDoxtpsV+jpJzKKSwavI
 cJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=jw6rquaiXD+oPh3858jmCUg9XPcrdzfEXx4OPrYN3Q8=;
 b=JdVNWbjqM6JsASyj7bNbDMRmlQhO9GT3Ny6wivHYA+Q3s5Yir0afbg0EoeS/nTxMFP
 b0+HB8fKOTSr9Z5VSUOg0+/rqbS7NSTe8Y6kdjcc8twVhsl1CcaqLFxMQ6rekAnMHi2P
 dCz2ED7EZdFuM8XT0E3ffzKm4KBP7akxDLDV3clYynrcU4SltXFcbZZvnWRERPkrRmcw
 55eV9Q95XApY36t14G9oiOL9kgvEqA6vjQBJXl7J4Tj1y2I5PbvG/xoffm1YvQraCTni
 y8NGqlfTFathk0FMsI2fdwkbt4PisiGeOzhS4Mx0b5o/gxxwuu0K9vmkOO3t+97xx9tP
 Schw==
X-Gm-Message-State: APjAAAVnC8Fxuszd6c3bLEe6hiRjWve5XNQ7ODdmcs5lvpYrAC4x3AhG
 UWuK/HEFGdJhTtlv8J6SBjXy/A==
X-Google-Smtp-Source: APXvYqya6tb4Yh9pwT2EePu4q5DD2g0/f2f6f30qBcWSB/2NSo2+Uj8ScWvRry4bETRvL+CCwUqYTQ==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr16665108wmq.144.1556526559500; 
 Mon, 29 Apr 2019 01:29:19 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 10sm30904939wmd.23.2019.04.29.01.29.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Apr 2019 01:29:18 -0700 (PDT)
Message-ID: <17c5978419c8778eb1f2c2a6e2aee66e864ac53d.camel@baylibre.com>
Subject: Re: [PATCH v2 4/7] mmc: meson-gx: disable HS400
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 Apr 2019 10:29:17 +0200
In-Reply-To: <CAFBinCCf8fkBPR5aoPMensjhYKpan_UzG+HCEB5yNaYs+mB8OA@mail.gmail.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-5-jbrunet@baylibre.com>
 <CAFBinCCf8fkBPR5aoPMensjhYKpan_UzG+HCEB5yNaYs+mB8OA@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_012921_536037_3BD52009 
X-CRM114-Status: GOOD (  17.06  )
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

On Sat, 2019-04-27 at 22:02 +0200, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Tue, Apr 23, 2019 at 11:03 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > At the moment, all our attempts to enable HS400 on Amlogic chipsets have
> > been unsuccessful or unreliable. Until we can figure out how to enable this
> > mode safely and reliably, let's force it off.
> last year I have seen issues with HS400 on my Khadas VIM2: [0]
> have you tested all other patches from this series and HS400 is still
> not working for you?

Because HS400 was never really stable to begin with.
It was a mistake to enable it on the VIM2

> 
> I'm curious because this patch is early in the series and all the
> tuning fixes and improvements are after this patch.

There are several reasons why this new tuning won't solve the HS400 problem:
- Signal resampling tuning granularity gets worse when rate rises. The resampling 
is done using the input frequency. We can basically resample up to the value of 
internal divider.

In HS200 - Fin is 1GHz, Fout is 200MHz (1/5) so the resample range is [0, 4]
In HS400 - Fin should be fdiv5 (400MHZ) and in such case, no resampling is
           possible (internal div = 1)
           Even if we keep 1GHz, then out is 333MHz max giving a range of [0, 2]
           that's not enough to tune

Going further, tuning the Rx path does not make much sense in HS400 since we
should be using the data strobe signal to account for the round trip delay of
the clock and correctly sample Rx. AFAICT, If there is a tuning to be done for
HS400, it is most likely linked to the data strobe.

> 
> 
> Martin
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006251.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
