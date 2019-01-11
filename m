Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EB5C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E262173B
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlLhUSJK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hgrOev/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04E262173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jd6h75iHtJt9/vpBrRoKjZ8LXlxi6oL9jTSlq5ncmyg=; b=TlLhUSJKTQGzZk
	LXq09fkxO1VV0nC8NdXPzmcnQlDJwvf8gA8L47OCax/IxEvhLLbCl2jmbEC6wKMqjI1IAIUH9BI1W
	PvQzTT5TUHGZ5fvtD2BtQyK9g2BkklGQOa6HeFGj7S8kZ3XhgUEzqpndVh0LrKq++/gSeknoAHCBD
	bUv68gr4CX2H4d0s+Yvl0Oyeao9l1PfpIYKviEK8I9hZANvhVggOaJ+zo0BHMZRBH+vqREQLtLGej
	20SFZPr89pnePoCgCjXGMkAisrF90hji6ycGMp7QFT4b3Dyvwo9EtqoXaqV3SzKHBmH1i6SAXvuJA
	iW2k3sU3iM1HKLlLT89w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghkpQ-0007Wb-Hi; Fri, 11 Jan 2019 00:37:40 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghkpC-0007HA-SW
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 00:37:34 +0000
Received: by mail-pg1-x544.google.com with SMTP id t13so5526218pgr.11
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=tArBfX2/yWTLPAN6WGgGaPqHLNX3JSZr3+h2fOti0lQ=;
 b=hgrOev/AEn0v0YbfqI/buSHdETAPA0YE2mVEthVtuL5d9OOlMaebfPCSRubZ46m9sz
 1k4Ygnp4f8xIWh8SMdjpp0AqPWb5bSEF40iXR1/V660S40VZjGnC7HQbEm596g9C2ozU
 pqTmRIrjkmPYqqHxZXHDCwyM4p3tJfIrr40Ov84pTrJQ2ZRP7CejJ2yKFxlO+2L2+6qE
 f6bfhAYPJJG7TM9zGNN7+lwXrVFXvOs3xwcbHZZ04mL/RAKizYD5l3aFbYMY/1Z4d1Qd
 VcKNjKznuPPTe4QRbVWMtvHhspv7oJ6HTiUA1ffGhplSGy1hQHiN3pUddr0Q9Z+4sisG
 uP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=tArBfX2/yWTLPAN6WGgGaPqHLNX3JSZr3+h2fOti0lQ=;
 b=qKna03O2LPa6gCOH0CQL9PW2U/k0lCUSJOuV6CfCtPhycBIcJs9AEK17id8vkU1ylX
 X8qmqnif3tWSGnG0MySNGdrWYMRnA0PaBy4BbnGot0X+DWA63hKJKyQf5wFSAcSRSslY
 FyN4XPHKyXxrccGVIUXfa/+dVWlcj3mPQc9y/QS7IB0gahj+0zSbItrbwo1H2FsOerln
 SitRSDtWasu+3/P4WpIauLrbV5NUJ+1jsb1nWPLUKBlGiQp2jr4pSMg3wnBZ/eZil9kC
 1HtP2nrW4+U4y6BO1YgMT5Q1xT2Ss/4tEgXasHMLLlGCxL9t++0wSWveM/oIIeqkCtbi
 ctbQ==
X-Gm-Message-State: AJcUukcEhoC/lJR7sn7Z8ElW1L1B2CEGVDn7axzavIxnHammBhZcMYwR
 UKnlg74FZ8yfKSPf+bEzlOPgVg==
X-Google-Smtp-Source: ALg8bN7qW+ukQwCDcs13BbWmyGw9xMYTBXwn/X0ez5v/Yn2fH/2jOfGSLy4PDp62AyCkvcUHSPZcvg==
X-Received: by 2002:a63:1b58:: with SMTP id b24mr11203008pgm.247.1547167045786; 
 Thu, 10 Jan 2019 16:37:25 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id f32sm93544454pgf.80.2019.01.10.16.37.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 16:37:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jbrunet@baylibre.com, robh+dt@kernel.org
Subject: Re: [PATCH 0/5] Meson (32-bit): add support for the Mali GPU
In-Reply-To: <13bd9d3a-3cbe-3952-03bb-ef5da6eec401@baylibre.com>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
 <13bd9d3a-3cbe-3952-03bb-ef5da6eec401@baylibre.com>
Date: Thu, 10 Jan 2019 16:37:24 -0800
Message-ID: <7hef9kqbaz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_163727_621382_2F071295 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 08/12/2018 18:12, Martin Blumenstingl wrote:
>> This series adds support for the Mali-450 GPU on Meson8 and Meson8b.
>> Meson6 uses a Mali-400 GPU but since we don't have a clock driver (and
>> I don't have a device for testing) Meson6 is left out in this series.
>> 
>> Meson8 uses a Mali-450 MP6 with six pixel processors. Meson8b (as
>> cost-reduced SoC) uses a Mali-450 MP2 with two pixel processors.
>> I tested both using the open source lima driver and a patched mesa
>> from the lima project as well. Since we don't have display support
>> on the 32-bit SoCs I used off-screen rendering as described in [0].
>> The result is (for example): [1]
>> 
>> The bootloader (at least on my boards) leaves the Mali clock disabled
>> by default. The board crashes when trying to access the Mali registers
>> with the "core" clock disabled.
>> Thus this series also implements the required clock driver changes. The
>> Mali clock tree on Meson8b and Meson8m2 is almost identical to the one
>> on GXBB (see the description of patch #3 for more details). Only Meson8
>> is slightly different as it doesn't have a glitch-free mux. Patch #2
>> prepares the meson8b clock driver so we can have different clocks per
>> SoC.
>> 
>> Dependencies:
>> - the .dts changes depend on my other series "ARM: dts: meson: add the
>>   APB/APB2 busses" from [2]
>> - the .dts changes from this series have no compile-time dependency on
>>   the clock driver changes because CLKID_MALI was defined in the
>>   dt-bindings since the first version of the clock driver (but it was
>>   not used until now).
>> - the .dts changes from this series have a runtime dependency on the
>>   clock driver changes (also from this series) if you have a kernel
>>   patched with the lima driver (without the lima driver there's no
>>   runtime dependency)
>> 
>> Other notes:
>> By default the GPU runs off the XTAL clock (24MHz). The lima driver
>> currently does not update the GPU clock rate. Different frequencies
>> have to be requested by adding the following properties to the Mali
>> GPU node (to run it at 510MHz for example):
>>   assigned-clocks = <&clkc CLKID_MALI>;
>>   assigned-clock-rates = <510000000>;
>> 
>> 
>> [0] https://gitlab.freedesktop.org/lima/web/wikis/home
>> [1] https://abload.de/img/dump0myic0.png
>> [2] https://patchwork.kernel.org/cover/10719445/
>> 
>> 
>> Martin Blumenstingl (5):
>>   dt-bindings: gpu: mali-utgard: add Amlogic Meson8 and Meson8b
>>     compatible
>>   clk: meson: meson8b: use a separate clock table for Meson8
>>   clk: meson: meson8b: add the GPU clock tree
>>   ARM: dts: meson8: add the Mali-450 MP6 GPU
>>   ARM: dts: meson8b: add the Mali-450 MP2 GPU
>> 
>>  .../bindings/gpu/arm,mali-utgard.txt          |   6 +
>>  arch/arm/boot/dts/meson8.dtsi                 |  58 +++
>>  arch/arm/boot/dts/meson8b.dtsi                |  46 +++
>>  drivers/clk/meson/meson8b.c                   | 349 +++++++++++++++++-
>>  drivers/clk/meson/meson8b.h                   |   9 +-
>>  5 files changed, 461 insertions(+), 7 deletions(-)
>> 
>
> Applied patches 2 & 3 to next/drivers for Linux 5.1
>
> Kevin, have fun with the other patches !

Fun was had.

Patches 1, 4, 5 queued for v5.1 (branch: v5.1/dt)

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
