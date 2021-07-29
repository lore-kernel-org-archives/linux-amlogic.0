Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D0CC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:11:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B0F60F0F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36B0F60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwqpV+hXwl5H2d+xrVPA5lVRxUWnDF71dikE1H3i0/A=; b=JlbWRztYcqicfN
	c0Kl2etGbTj3pIyOIsIY2UZyQCcsq5R8wABNu3bSgVTXKwjckt3y6UPPAWjkkDZl+PFU2vfI26Tbi
	r5RFRb84fzPZGRZ0RfemHc8eObK9I9rwa/FMt2EE+FxWfap1vlmt0fbnymf6VTygMkl5yksPWsJix
	FY7FLGgsb41+Le27qj3t2fYlSKTPh1S4+kM7XY4yP0+ZAd8I6SnVw+lK74N1t6zaeyQF8Qi0bTe+r
	Mp/iWUCJfgSiPuSV75JSWAss0X/w61YE4eRNgdlAepydmsCiHlTkjgncCi7okjGwErJi60JEy3kiZ
	YV3/7sWIMpDFZG8xVRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9CNN-005njg-6I; Thu, 29 Jul 2021 20:11:29 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9CN8-005ngB-Vh; Thu, 29 Jul 2021 20:11:16 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so11321178pjd.0; 
 Thu, 29 Jul 2021 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SFY+mAXfPYLLK9cW7HzO6u98/FnYWTRchgWW3VXCzJY=;
 b=CZRZWcBHZ3gsBtAsaaCXtu4WXrBPcFPXBjErtIBPrg3LCfGvZKMvnvfzxOpuB8yNuS
 b7hhyG7Ydp7eXWqF8NZvY4Lk1EBHnBK1p9DWUGTAWBOWxqGVTxU/8wFyMteNvkDgQsu/
 /D4PUp0w1T3efUYYyJrY/whFdocsigxCWbSaSOONiVqCG1LMGxL/6XSduRWAMFT4NY/0
 3wGuS5uxtRvB+kGK/10DuuJNLa57PUIf04hkTgiN/AhzEhd5/8FmI3+ezlTqRSIMW9fY
 /8FKk7lN/0ho69zNfQ/k9avzfqLVlDOOiDcavnkKkuof89/k0Ite+rQ1I6n4ghc6uEWo
 VU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SFY+mAXfPYLLK9cW7HzO6u98/FnYWTRchgWW3VXCzJY=;
 b=pmVAQDU3VMcJOzr2ZOB0Dniw2MsUeqG3VLvheqU7HVz/Fg/OspWNodRKJaak0GWRmV
 57hLKAhQzEHyQA3iqcV6fPCQNVOCHaCyfSu870TqC4XWjwswtZkZGEH6/9giat/oOL2h
 OTNrfZrcr5vZ+V9Ep4FZ+21JSXL7OTpYQG5eVGr0iR/UIifJ1a2FKE6M8p6oHG6g8zL8
 WLalcASwxKTWHLv6GcRYHgsBRsBUrC3FDMQdCKmUuwY4p8wfMfCmOcyUa9aZTqDlwP/X
 6eswtBSNRRtb1V5flxEVJbAntTgYyEMM/FLHFS+LTEGEA6pCikaOsdb+/a5ffQO/tB2u
 Zu6Q==
X-Gm-Message-State: AOAM533Iykp0pJw6DVGffZJZGTyEuoWtt90odjY52LczUXybDO/yXMx0
 XhHtLIkWR6+xvvsUrP6KkuM=
X-Google-Smtp-Source: ABdhPJyLfmsnUTsywkKEatkPj6U8cyNcuBN/igDBOIZHeLE0gMDlmQgZxQF2YmSyYSFXYKsLiD5tZA==
X-Received: by 2002:a17:902:f68d:b029:12c:4619:c63a with SMTP id
 l13-20020a170902f68db029012c4619c63amr6316218plg.66.1627589473174; 
 Thu, 29 Jul 2021 13:11:13 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:12 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: [PATCHv1 0/3] Add Reset controller to Ethernet PHY
Date: Fri, 30 Jul 2021 01:40:49 +0530
Message-Id: <20210729201100.3994-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_131115_078220_8B1D26E1 
X-CRM114-Status: GOOD (  11.34  )
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

It is being observed some time the Ethernet interface
will not send / recive any packet after reboot.

Earlier I had submitted Ethernet reset ID patch
but it did not resolve it issue much, Adding new 
reset controller of the Ethernet PHY for Amlogic SoC
could help resolve the issue.

Thanks
-Anand

Anand Moon (3):
  arm64: dts: amlogic: add missing ethernet reset ID
  ARM: dts: meson: Use new reset id for reset controller
  net: stmmac: dwmac-meson8b: Add reset controller for ethernet phy

 arch/arm/boot/dts/meson8b.dtsi                |  2 +-
 arch/arm/boot/dts/meson8m2.dtsi               |  2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  2 ++
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  3 +++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 20 +++++++++++++++++++
 6 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
