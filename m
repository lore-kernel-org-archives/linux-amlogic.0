Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A15C37120
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 20:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3302320861
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 20:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pz0O/jik";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="i+M98hlX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3302320861
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmF1eV/q8kKopw/9hHWGIz6FRqdFNzc5DJYzJWYfnow=; b=Pz0O/jikt1XDP0
	I4FS77lhUwcSpzV9M6fPlly0VM24pmIPx1W5I4UaY9V9S3WUg7YBwpt/nF2Ehe2BbrpSKvWV8Q/Og
	THmsYWg+xdGiCYhmEYAexFRNkcOjqMozi5JHe9Bz3uZqEufw7NLzDCP+xhUMCUYYlteOBTee23J9d
	FteAjmZJBtiMeMG8kEH+R06Y+0mMycdXIPnYeBueYbJq1CbU4QNn4VQrFs9DFFdtx72RyizKbEk+g
	LwdcqSNMAZyT6DTJ68Puo2JrZobkAg1vopsaCP5GcnWdEZy+kiML1Y4DVuyk0INr00lT9E4QEBWNy
	LL71Er/ZI6LP3A0sDK8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glgby-0002Uh-Vv; Mon, 21 Jan 2019 20:56:02 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glgbw-0002UM-7g
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 20:56:01 +0000
Received: by mail-oi1-x242.google.com with SMTP id r62so15674659oie.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OKBB/nbJ0k8tun2GicnRPygSL370rUx/qPCIojnYS0w=;
 b=i+M98hlX6664mZd9+nua5s9g6bLxv0FGNXsz3McPTtf/FwqdnjsxGesCDOxtWv3b8k
 EMOqYulUZbIz2lLdzeMG8zMkRUgNOAyd0L32iG6TOGq8jZqo1RP7xG+8G6SPv7dBIZpQ
 1IuBlAoiTp8fJFPhhEQJHrnKI7bGZbJoO8k7uhtDAExivTGAqO1bNqZBUY0kTNEIFiV2
 zzAjdq7/FSEeR3LZsHhnn8BxeNl4P1dXj61mwAKAUsrYWvypCKd61W3UUnWf1jZZnKkJ
 +uSJrrBp1Q1Kj9db9BnnDIr0w+bkypMmexcOmZlYTpR1aSq/uXlEQA2Ahh0UCY4kgLRX
 9asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKBB/nbJ0k8tun2GicnRPygSL370rUx/qPCIojnYS0w=;
 b=s/qPUQ6DO0fBtyF5Ui1O+7REWZ0q1a3LnwtQHXswXjB5+svpOX8P+YfSGefs7TP2f7
 1grWGdFcgM3WG7MX89Potn928HoG8/DL+K8q8/qbiRUQ/RgeLlCtjSbj+X5oP9K0wi/v
 MqINi3Xm9y1hlx/HsMdoUm2xVqQZ+4XH91tmzYd/L4LWqoPG7oTWuTePHE6+BrEJ58Pg
 K3SQ17zoT6WrmpQwOUnn3BuKgOY8YbMcVB+TNcADNZk7u4qBKshl0JayRuFGSbWXEb9k
 wwc6WAZ3J9XVZ+GuKNMQcql8xSqRGzvqNs2k8Mg2izOqlpSi+guqEYXlzo570vQRIXJ/
 Vwyw==
X-Gm-Message-State: AJcUukc90HBiv+LBUq3ME7Ju6blM9PuN1pFAcRweJxTNfYkM6dKee/4H
 YUtwaGDf9OIEYra6xVPnWiGf/KpHvzPWZF5S6Iw=
X-Google-Smtp-Source: ALg8bN4X1zBlAOtMn3AK2UnD6WwjYDQBNQMWLd6229NDPn97fNAKJngoaxEUjD8Ikm67FEJxdtNL0qtx0r4PzhWdrhQ=
X-Received: by 2002:aca:5b43:: with SMTP id p64mr6309612oib.41.1548104158237; 
 Mon, 21 Jan 2019 12:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
 <20190121191816.GH12679@sirena.org.uk>
In-Reply-To: <20190121191816.GH12679@sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 21 Jan 2019 21:55:47 +0100
Message-ID: <CAFBinCDK92yZZFzkoZriCSObm+jf1=RQ99K4uAGSCKSnTXhURA@mail.gmail.com>
Subject: Re: [PATCH 0/1] pwm-regulator: reduce noise on EPROBE_DEFER
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_125600_292501_17522E01 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 boris.brezillon@free-electrons.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Mon, Jan 21, 2019 at 8:18 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jan 21, 2019 at 07:37:22PM +0100, Martin Blumenstingl wrote:
> > pwm-regulator can be a bit noisy during boot.
> >
> > One example are the 32-bit Amlogic SoCs when using
> > multi_v7_defconfig (which has CONFIG_REGULATOR_PWM=y and
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.
noted - sorry for the noise.

the patch description already contains all relevant information, so I
won't re-send the patch.
only the KernelCI link is not included because I'm not sure how long
it's valid (instead the description includes all relevant information
which also can be seen in the KernelCI link)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
