Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4464EC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 19:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F3A20B1F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 19:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLqCgEuC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FSuabh2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14F3A20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzihybKfoXk9KcmAUOwgd6YslVfhgl8beu3Q1rkXqM0=; b=lLqCgEuC8qRCpR
	29+2OT4R/Y96zGUfiph2dKE7WPFy9E04wobYueQkQuKKZrDZEBk4TuWfRz4Nvr2p0lYXykst47oCy
	Om+SlPkUbXNnNYZh+9odm1bBW28l0SWfPUjeiycq69nYT4XmfVl+XZ+WeN/E6JMc1tlU0BbWyqdWW
	goo2rAuP2VOMgKXu5Z1KNdzd5KfBLBDMyRenlnF7EHYvEDSdUrdkcWmewyd/t1hQ4rf8EVNgVylwJ
	D5lwJyPcSCOUdthP400U4bUN9C6KVFF9VgRUbJc5KfGUbOODwwNiT7Ud2eZM6pgvhpkG4WnPXAxbk
	MEgPa5X0eFLId/D/esgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiL0-0007G7-40; Mon, 05 Aug 2019 19:08:06 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiKq-00076m-KB
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 19:07:58 +0000
Received: by mail-pl1-x643.google.com with SMTP id k8so36845835plt.3
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HLFGcSRnrtzTL1mjh7cGHzUe4MbVsR9BlQbuANglj5c=;
 b=FSuabh2v9pq/6MkamWwdgBgV20CYzeHQtJwzBdq7lzoSb5UkOWU5v/iQ3CiwBW0M5u
 H3kWwgCGfNz4QL5IDAlo6ew+6Pb7VP5vAABw3IyFnaJ/DD/KySLDoGNTTR2TVYugvhaL
 KFhohMBJuOG7aom24gh69NuS5torpA++ACe/cGHxKqij0bK9e+Jzp2HUGW8s7ukHfOj1
 BfRKy0AgSlw+k5qGL6pMeNDgv/ybVrI3OlwWrhtnA/EIggHvi3kim2vh7hbV5H5ZAMUp
 bDsozCfjfZItrJOTz1HMEXv0Hla71yyPRANQkegzPwDilCscsPTPL1HcF5gPrjJcO2yT
 qTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HLFGcSRnrtzTL1mjh7cGHzUe4MbVsR9BlQbuANglj5c=;
 b=JnmW3fatOPL8pQpgRnGnxDVfTGs/d3m+6t+EKCbHH8ewt5vpeSTw32Ge2MWHIKXlDm
 4RgbMABg+BAip6ciXopRLym6WN3EovjqiCtwHOfZ19vzGdsWZEsEUaK90dBCdNeSXk8n
 4ROnxTst2KF5MUavAwzzMnzI+b69cGQfQZ23qoB+Xi37mF34D1AkTbd14QftPBB2YGVB
 XzzkzAbA1Ub1RXHfBapynbdcMynNtLrUubpUma7t0A3GvfTTGUMbgTxuBBRHtF8Q8Akz
 uIIphOs61Y1K75InVWfJumRJA7lVAC+9/gaR1DQSNvm7LdAheXF/HuqGmjR09KdhfI2y
 EPDQ==
X-Gm-Message-State: APjAAAUoLPjzILWK/JNmsmLV826hIAgCCLJIRdy+BsxLwgrF2+oBHvHH
 njx9VCqpjHi8WbgrDuw7Dq1cVw==
X-Google-Smtp-Source: APXvYqx9d9VCzc9djqGE8vhbN6fzsNZNeX3ceeR7YwwNB9iSwkiHZpuA9cyWGIFzRIf8wafnMVSCdQ==
X-Received: by 2002:a17:902:2be8:: with SMTP id
 l95mr135702321plb.231.1565032075952; 
 Mon, 05 Aug 2019 12:07:55 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7483:80d6:7f67:2672])
 by smtp.googlemail.com with ESMTPSA id
 e189sm71404193pgc.15.2019.08.05.12.07.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 12:07:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: g12a: add support for DVFS
In-Reply-To: <20190729132622.7566-1-narmstrong@baylibre.com>
References: <20190729132622.7566-1-narmstrong@baylibre.com>
Date: Mon, 05 Aug 2019 12:07:54 -0700
Message-ID: <7hwofrh1md.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120756_668342_6E50D726 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The G12A & G12B SoCs has kernel controllable CPU clocks and PWMs for
> voltage regulators.
>
> This patchsets moves the meson-g12a.dtsi to meson-g12-common.dtsi to simplify
> handling the G12A & G12B differences in the meson-g12a.dtsi & meson-g12b.dtsi
> files, like the OPPs and CPU nodes.
>
> Then G12A & G12B OPP tables are added, followed by the CPU voltages regulators
> in each boards DT.
>
> It was voluntary chosen to enabled DVFS (CPU regulator and CPU clocks) only
> in boards, to make sure only tested boards has DVFS enabled.
>
> This patchset :
> - moves the G12A DT to a common g12a-common dtsi
> - adds the G12A and G12B OPPs
> - enables DVFS on all supported boards
>
> Dependencies:
> - None

Not quite.  The last patch to enable DVFS on odroid-n2 has a build-time
dependency on the clock series that adds the CPUB clock.

I'll apply the rest of the series to v5.4/dt64 until there's a stable
clock tag I can use for the clocks.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
