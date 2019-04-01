Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CD9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF3E2086C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGXTx3Y+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dRpTY7tL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF3E2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMp/Dyt4rs9ZpayZZM4WMyERqSRGP/aZ3IEgiscrY3o=; b=MGXTx3Y+dCXlr8
	+GXqsZpkE67qgnb7pOdX5KSgjIeIbOctkj2f2Oo/A1EBkkQ0dXA0kE1jwpBVnIUXxn2B/cf8IUpTM
	k8OjqOgTthPSOVniiea/xrMWHQdaRXB2iu2imG2JDcDbATzFY+9+4ewgyPfUuGfIwUfTmChLgmgs0
	cHjOw/tpWQq7G5iJobEeTPF4weorjBzHYuzK8qeEHFV08g8L9mMTjdWlzOi2uZ+Dhwx35BWX8YUdc
	WqypKsOVcpIRSeeEoqjlL4rdG76hHFKKtfYLmNwtsadUmh4fhdjdxdDTjpy4Q8qsaRAy6AKHz/t5O
	v45UQHXTxS5VUMFqyTLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsUb-0003KL-Of; Mon, 01 Apr 2019 08:40:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsUY-0003II-5a
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 08:40:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id q1so10825848wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=a6Pz+a4CrehPUESoevuJ9/2TnfPF2w/JEefGMGx65p0=;
 b=dRpTY7tLZ2cjxOKz6NCZaaCLNCIOjg5IeckqDGCnoj7CKd2niqCMYz1Kfd4myYLD+U
 BP1iFnsjCie+/pv200U7z9c5FmbhwYEPhPelAfv92vCG4SuAT+a882ZlJDwIopcPXJNV
 N4oDStJPpVKi3w07X8NbDy5T5pEpJ2qtn3c52us7BREeV8OcKCmDvsSUXjQGe337HCaW
 vJPMUTEI9AoPPlKLqTNUKXb/xK2y+r+EzdmwFleNH23F6CwCgQCQLsyYTNy3V945ZUcY
 kYCOQ8bhqnSht1rn+Rg4/jhwe1PR+GtGq6dQyI2FAW5nBJzsJlagCYqgGElvCnHYqE2T
 BHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=a6Pz+a4CrehPUESoevuJ9/2TnfPF2w/JEefGMGx65p0=;
 b=bShdhLZYE0anQg90oOzy4f/Zp3K5eLGpaMRPzKCV/8YbmBBZ7IyDe6FIRZ2/WQY7F/
 ap4uSMrcnbFH9lHZzmACic3UxgbzqKYeKLfESvEi3y7tuqC10lK1/MmFTkWbDJM1R7vM
 +XqGAMysOAiqveHHGSQeVL9P+pt2rtPG6JOwRZ94Iprig4Ck/yuCJwUcybke75xNVxQ4
 l5jj2XLsSaPzZ+1tFk0yKYbf0EvgS9O6UM+4dpvtij29cszYLxihe4Ux+0fyDZKuY73O
 xm8cgF208xqkHjkx+vQhSmTqipluyypl5q8tJ9SrtyUdtpts8D1n6I9umN8IolSP4/+O
 8Rvw==
X-Gm-Message-State: APjAAAU1nFNRzF5xjLb2XT9ijDtIVGItOc5MqYL1z4zGhzBTIBR02BaU
 2zi+N3LvAseMPJU7M16zr46U1g==
X-Google-Smtp-Source: APXvYqz7cYz0Oi9E4zKeh6gVNHKD9M+hGJ7K/pttWe34kXBVRyjpM+OFwc/y3zkv3fMatPtR20melw==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr1453490wrx.76.1554108028832; 
 Mon, 01 Apr 2019 01:40:28 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 d14sm13706835wro.79.2019.04.01.01.40.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Apr 2019 01:40:28 -0700 (PDT)
Message-ID: <e9a3a5327712d61390b671729ada1ff3b3a1b7eb.camel@baylibre.com>
Subject: Re: [PATCH 0/3] clk: meson: fix mpll jitter
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 01 Apr 2019 10:40:26 +0200
In-Reply-To: <CAFBinCCSoJYnSt5L07aK4+wmU54soFxRODuHbxaAqcJpmOL+fg@mail.gmail.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
 <CAFBinCCSoJYnSt5L07aK4+wmU54soFxRODuHbxaAqcJpmOL+fg@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_014030_213502_D156AC8F 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2019-03-30 at 16:58 +0100, Martin Blumenstingl wrote:
> On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > As reported on this [0] mpll series, We are observing a lot of jitter
> > on the MPLL outputs of the g12a. No such jitter is seen on gx family.
> > On the axg family, only MPLL2 seems affected.
> > 
> > The jitter can be as high as +/- 4%.
> > 
> > This is a problem for audio application. This may cause distortion on
> > i2s and completely break SPDIF.
> > 
> > After exchanging with Amlogic, it seems he have activated (by mistake)
> > the 'spread spectrum' feature.
> > 
> > This patchset properly set the bit responsible for the spread spectrum
> > in the mpll driver and add the required correction in the related clock
> > controllers.
> > 
> > Jerome Brunet (3):
> >   clk: meson: mpll: properly handle spread spectrum
> this depends on a patch from your other series "clk: meson: fixup g12a
> mpll": [0]
> personally I would base the other series on this one because this one
> contains a "Fixes" that (meaning that the patch will get backported
> and that's easier if there aren't any conflicts)

1) The other series [0] had been submitted before we knew about the fix which
is why this one is based on it.
2) Considering the amount of work that went through since the fixed commit, I
doubt it makes much of a difference.

I might do it if both series require a resend.

> 
> 
> Regards
> Martin
> 
> 
> [0] https://patchwork.kernel.org/patch/10868837/



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
