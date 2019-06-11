Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA05C43218
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4265720673
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iQst4gF8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="phjikhGj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4265720673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLsuqDCh910R73eEu05eJiPvcsvfxh4oU055O/q4ezc=; b=iQst4gF8/7vaBR
	Tj9uu7NVsi3KUVnwHL19MoRLGaHACtKN71pOQu7MU7ykm6Ijt9BZb3jtavKF9P3VdTgOgVdeRIzFv
	BTDfC2EG6jiFPIgTT124DNwbCPn8YkBz7cgd+abX7nTH930AopxtGlZxyNo9C2nXF79xZJfL/YLKA
	M0/anbV0Ilbf66DtwkdNAKPxrv0BwlXlWmUOYwvtU/b4WZ5gMsaV+MGDwPk1PSanDdsFV+e5g0ncV
	hmzN0Ddl2dNsFT9p5QdgiyKbyd5jXTeGKzn0ApVLvzBnjIZbiA+9Q8WPLv/gKNVkpwwiw7Znn4/iy
	aA3QFyZNek1lAk85WRtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hafxu-0008Uj-6Y; Tue, 11 Jun 2019 12:33:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hafxd-0008Ic-0D
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 12:33:10 +0000
Received: by mail-wm1-x344.google.com with SMTP id h19so1849032wme.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=uTg/7JRU8sUAP9sX9B8uDa8ujHWb6WL/wVRCRAUyFS4=;
 b=phjikhGjKSi4pb2wHWUdw0OzLFiLWsxwJ/Sh2Wee9fPwhY3BtTzC6A9p3w6O20cWMh
 SGM8XSkFjeZmOGEhAJfgjEQikYS7VHtOP3QRqILl3Y+QQdCXqSPdNOzg1dh/rzzz7K2J
 CShcOxGi6/K3xTD6trwGA1HwXRukCQif9pi7gsxkMnP66bFM9FOEtaQS1CM8AxUKNn+2
 BugwkCJM2E5awXgKBqnZusf232XWe5RH2EgJqsUNKRNPwP5aYBC0FEasVPkYoQ7Uf0EO
 KslY2NHRsNu78ZdJ/P2Lo+5TrguVQE7xxGSg7ycI45TXJ7Zp1zKgWkl7+xJ0sD1D/sT3
 8oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uTg/7JRU8sUAP9sX9B8uDa8ujHWb6WL/wVRCRAUyFS4=;
 b=qRfob91kKRIAzjvfdkcN6BKsVMLmV4hCy1ovMU3k0eddnDreM+zeXZ4hMZEcyh6vSr
 KOO4xBysURPRxu80dck6oUt6DcZJA+Q07FBUy/rGYUB7dDTLSs8pSvOfWOX1HUuBmShN
 KzB1SzXkqT//zw6Bd8MIrjrayFqaf7GY/VIFKjltOjTACZy+LHwIbKyq0PPSr51zsvoO
 y4H45JAV+X2BRhNHaNVs9AlFIoFLwGMhJ76KkG7DJA7xU4BVhXoYrEgjWBYs2/GaILuO
 jJ+kyq4lbuz96+RX1c5ioXWEfd2VCsdoQU/8lfAYZiuqfUBmmqMenBbVjvG2Qm9qWqRQ
 khCw==
X-Gm-Message-State: APjAAAVUhJ67W6WYmEKFvWjW7OodcnBpgJMFK2dNgqBWIFJDpp6ib8s8
 TjvkcAMCb/+7iRvqGYJvsUqZpw==
X-Google-Smtp-Source: APXvYqxLwUw5CKKBFj9Ct1lKarfejnmIdjY4bbArmlPVwr1dFEDnfL4CAH4jWhGtSv1JsgGBR6OCIw==
X-Received: by 2002:a1c:9906:: with SMTP id b6mr17472433wme.117.1560256387633; 
 Tue, 11 Jun 2019 05:33:07 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n4sm2205520wmk.41.2019.06.11.05.33.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 05:33:07 -0700 (PDT)
Message-ID: <f19341ab80bcba29d25c3711647d6ff7c96628ee.camel@baylibre.com>
Subject: Re: [PATCH v2 0/3] clk: meson: add support for Amlogic G12B
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 11 Jun 2019 14:33:06 +0200
In-Reply-To: <20190528080758.17079-1-narmstrong@baylibre.com>
References: <20190528080758.17079-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_053309_052894_DC5C56CD 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-05-28 at 10:07 +0200, Neil Armstrong wrote:
> The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> most of the features and architecture.
> G12B clock tree is very close, the main differences are :
> - SYS_PLL is used for the second cluster (otherwise used fir the first on G12a)
> - SYS_PLL1 is used for the first cluster (instead of SYS_PLL on G12a)
> - A duplicate CPU tree is added for the second cluster
> - G12B has additional clocks like for CSI an other components, not handled yet
> 
> Dependencies :
> - Patch 1, 3 : None
> - Patch 2 : Depends on Guillaume's Temperature sensor Clock patches at [1]
> 
> This patchset is a spinoff of the v2 Odroid-N2 megapatchset at [2]
> 
> Changes since v1 at [3]:
> - Added the cpub_clk div2..8 and replaces the ahb/atb/axi/trace divs by muxes
> - Added the CLK_GATE_SET_TO_DISABLE flag to ahb/atb/axi/trace gates
> - Fixed all the G12A typos
> - Added martin's reviewed by on patch 1
> 
> Changes since original patchset :
> - Added missing sys1_pll div16, cpub div16 and cpub atb/axi/ahb/trace clocks
> - Rewrote "This patch .." in commit messages
> 
> [1] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com
> [2] https://lkml.kernel.org/r/20190423091503.10847-1-narmstrong@baylibre.com
> [3] https://lkml.kernel.org/r/20190521150130.31684-1-narmstrong@baylibre.com
> 
> Neil Armstrong (3):
>   dt-bindings: clk: meson: add g12b periph clock controller bindings
>   clk: meson: g12a: Add support for G12B CPUB clocks
>   clk: meson: g12a: mark fclk_div3 as critical
> 
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  drivers/clk/meson/g12a.c                      | 772 ++++++++++++++++++
>  drivers/clk/meson/g12a.h                      |  40 +-
>  3 files changed, 812 insertions(+), 1 deletion(-)
> 

Applied
Thx


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
