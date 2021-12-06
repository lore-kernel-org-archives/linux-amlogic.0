Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE59C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIkg+po1giaDhBV+gQOcCv3y8UKn4eeRLnr+BuoADe0=; b=qY/Mbfn7QEEgES
	uovRRy11LiMYwCW0TkzLG128+Nou/2gMnjy0VN83ttdweoJQSNazKcGASXnBM5m2iOZm0VtMA+yhv
	rbxzAsehw12f7o7/BqAL6xx4bzIu+M/7uU2VRos86vnYBO7TkM4Pds2460m2WyZduZC4nec2ATZ22
	A2Fa18NJJFz1iWfqi2sYrMATg4TPKvBPuY8J/8JeZkZytTT+E+bKQdnLInIYweOYtRcozS1vJk4+b
	KYlmdHX253SvKbFHK8FoHhvDNUfTj4MtGTwOb1mRZpf5/JlnaxhPv2kR9+WeeesgmNA6dqr8oW81x
	CZl/rDd0DPooh6KVxFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muINj-005DPu-Ud; Mon, 06 Dec 2021 18:06:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muINJ-005DEU-Ok
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 18:06:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id u17so16870216wrt.3
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9Eu38/3+9tGaMWfLccEWOU7ckpzNuZ1dJmEA2K5P3hE=;
 b=ksxUHhx7E++eESp3gUhlMdMaGTidNIZ352BtBhdadLYt7T5/NJK57OHZyxUZjAyGaP
 mCIstqO91Jc0+TZf7n2sSnOR1/qLlpXGg7MQcCOdJgU8mWeieClu/MgYD8XB33Jjx86M
 Xmsl0gsbKeFA7bwQ9zQXt34+COopKchDvJsJXl/3LnWCTyntVAUZkrT/N2mV6yLMER3S
 4grd6yjDMd69uTF/3Pg8v+aokAPb4MZexwleNiJkZT6LZpC6ygAtPb4lRv9D1T3ayecX
 51/inhYFnSq08l0J4cvpcyMUaRD0AlBdkGKiePhv1JNgMC8/W4yOIar/8o4pTCyhCZJ9
 WJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9Eu38/3+9tGaMWfLccEWOU7ckpzNuZ1dJmEA2K5P3hE=;
 b=loUfa0l7x1yyS7+1dlCSrwHIuuPzj5UasKMWlZmU03kjEUGCOzrPNefwMJ5aN9vCEw
 jNMEOG3brzpnu82p1l9pOZPH30q1hF7bsa7oBKmSJRZtIRfd8zUuhDJ0RPvarqFQ+g0r
 1iF2JxcF2uFa//dMcUk8FoPXPZQhQ/5S28Mkxff/qYk2PXRWYJ55/aKaiXMCtoA4rklk
 riyKPmqJ2Mw5ps6rAcVxtSRkNV4JrlxtgGuK3hw7L+R+Ku9tgLTa7hPV1YsNgrv0Z900
 lAWkrHMbyGDfggjCz4io+ddSGxf5WJpusUjLQwQ/R79Yr6dxPJlp7/Fxunt/HgFEPOXe
 9amQ==
X-Gm-Message-State: AOAM533DMJQIFhZzzUdMkTer6N9ztsVIK7HHqPFjoka2aFs4ulI6ULVx
 cZlUP4lz/S3T+2KEJ3fmR9hrDw==
X-Google-Smtp-Source: ABdhPJyeP9mmGnfPC2VzFGb6kW3kaXKtwf/c9ade3X5hh72uFYdGSbs1CnzHMgnUQ5bQquvSyJDstg==
X-Received: by 2002:adf:f001:: with SMTP id j1mr44911077wro.351.1638813963287; 
 Mon, 06 Dec 2021 10:06:03 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 9sm15728052wry.0.2021.12.06.10.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 10:06:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>, Benoit Masson
 <yahoo@perenite.com>
Subject: Re: [RFC PATCH 0/9] arm64: dts: meson: add support for aac2xx devices
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
Date: Mon, 06 Dec 2021 19:06:02 +0100
Message-ID: <7hilw14nhx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_100605_879410_C3977911 
X-CRM114-Status: GOOD (  11.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> This series adds support for several popular Amlogic S905X3 (SM1) Android
> Set-Top Box devices. Like most Android box devices, they ship in variants
> with multiple RAM, eMMC, WiFi and BT configurations. RAM and eMMC are not
> something we need to consider to get a working boot, but we do need to get
> the correct connectivity spec.

The reason we don't need to care about RAM differences is because u-boot
takes care of that, and updates the DT nodes accordingly.

In general, I'm not a fan of leaving these decisions up to u-boot,
but...  as an option...

I'm pondering if we should do the same for the connectivity settings?  A
properly configured u-boot already knows if it's an internal/external
PHY, Mbit vs Gbit etc. so in a similar way could enable/disable the
right nodes.

We could have a single DTS for each of these board families which
has some reasonable defaults, then u-boot would enable/disable nodes
accordingly.

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
