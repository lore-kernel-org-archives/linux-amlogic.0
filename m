Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17518C10F0F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC9C2075E
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uoRRwkFy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nvNerVUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCC9C2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qpkdbew9bVJ7RpP5/PRy83y9HxxdMgBZAs+aU/+qNIQ=; b=uoRRwkFySbFYyz
	nxt8TwLz+1solDWwi8bBelpveydVfkpX+I4xwwkXgXex2uxGsBW18wm3QcbiL5Ba8y3i9GTReQq00
	dxNImxeb4LApK1+d2Z5CDPoO2uE8rkyuoTdt/WGs7pyfd7EV6yeWDxBfi1kL0kz2g1A7Mu1WfTjxD
	lQDpxoUQoYhTl2LfFvZ4sX2CXIWPyDjk2k5VSl/SiOdQd+Q21HPyiApUaSyDHIhhkxi66yl7/o/Si
	PCQe3uXVFivwnNCwq3wIXW7UcHhsGVQ6i6C8jk1li4rMMtYIegcsuzX9BhiJLpwdt6+QWaJ/LdqhV
	ZcnRmbb5AotEJ5HUMwwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC29y-0001Qq-Nz; Thu, 04 Apr 2019 13:12:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC29u-0001O2-K1
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 13:12:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id t17so3675222wrw.13
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zne7rL8o2Uhetbx8eDzdGegTuzVC77WKOG0iaHnJIq8=;
 b=nvNerVUQk6qAziZ0+scnbRC6OEhk9WP597+AozOM+ROTKSDR7u7MpLdKgt5EvID+2Z
 lmgFy0qShO6OKuCJJolP7cuWRaWzv5PZyJS46Z+yS/5uAyknWF0dy6j1pHqnSdpcn6ca
 uu7VptMH5W0JUtW/2phaiCLTKce/qERAzO8Xvdt0Ty0U3K29i87mZ8OszKRNq0TvcBju
 WuePUCXTskOqFG3vyDX02w3C0z+NHvI3vcGm39Q7sxavIHJE+DNUL4vnwVn6CCxMRskQ
 vlfkc7ob8oB2iNHsaanrLZTm6YPyTyngAfr+y/m49pQrQSAX947ENAyvRgakPAuH6EZC
 VVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zne7rL8o2Uhetbx8eDzdGegTuzVC77WKOG0iaHnJIq8=;
 b=o3c3hyX29Oy094+VBBH7/jkElmFGTZjAgvAi3A22ZA5whfMmf/7F9hmew0/6bsszYC
 LV7d5te9A9yTxGmGVRbEKGXDjFmPdHr9jO1sfhgmiddYcX5jGbG2pKWsj/YDq/Ch3Ptk
 uBcD+msEIGjHrcTm4DllkrngNBdVLuBqidiLrsaxoFL/pHGSNW5j2qaEGTHL8teAvYif
 NpX6K3xuq1aH6XbBGO8maJB99gJiSqUUygL8cjsXX3Tmm3wMT4zBHrIaJTVxC1vqY8LM
 y29etKakowsBr8zgUPe1mxk1TMZ/j0A3V160JD8DplfYupkkyzaDM4USvEH12MU02NqO
 yb2w==
X-Gm-Message-State: APjAAAU2PPHXaALN/E0uvYWbLYreCmO6UdLADmjF0J6HFqWNC8q8QjM0
 juFC/eQRjGzdyD+EoqWUzy1r/g==
X-Google-Smtp-Source: APXvYqypwdXWJe5AkkYqY+DHm1GPpZPJOHhhVcQYDZOVACiPzLus4L85LxAgzq7fAFI7fvo0013deQ==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr4207420wro.189.1554383515894; 
 Thu, 04 Apr 2019 06:11:55 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y133sm21984923wmd.2.2019.04.04.06.11.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 06:11:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v3 0/4] net: phy: add Amlogic g12a support
Date: Thu,  4 Apr 2019 15:11:43 +0200
Message-Id: <20190404131147.31156-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_061158_802324_8B0EA267 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the necessary bits to support network on the Amlogic
g12a SoC family.

Only the internal PHY and related MDIO mux needed to be addressed.
The GMAC remains compatible with axg SoC family

This series has been tested on the u200 (S905D2) with both the internal
and external (Realtek) PHYs.

Change since v2 [1]:
* Change 'clk part' Reviewed-by as suggested
* Remove default callback from phy drivers
* Use exact match PHY macros
* Default MDIO g12a as module if ARCH_MESON is enabled
* Don't print error on probe defer in the g12a mdio mux

Change since v1 [0]:
* drop '_' from function name unrelated to locking
* fix peripheral clock disable on error
* fix variable declaration reverse Xmas trees
* fix Kconfig dependency on CCF
  (Actually needed for 'struct clk_hw', Thx Andrew !)
* Minor fix in the DT exemple as reported by Rob

[0] https://lkml.kernel.org/r/20190314140135.19184-1-jbrunet@baylibre.com
[1] https://lkml.kernel.org/r/20190329141512.29867-1-jbrunet@baylibre.com

Jerome Brunet (4):
  dt-bindings: net: phy: add g12a mdio mux documentation
  net: phy: add amlogic g12a mdio mux support
  net: phy: meson-gxl: add g12a support
  net: phy: meson-gxl: clean-up gxl variant driver

 .../bindings/net/mdio-mux-meson-g12a.txt      |  48 +++
 drivers/net/phy/Kconfig                       |  11 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-mux-meson-g12a.c         | 380 ++++++++++++++++++
 drivers/net/phy/meson-gxl.c                   |  17 +-
 5 files changed, 453 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
 create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
