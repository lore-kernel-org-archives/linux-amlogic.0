Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6913C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A012166E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h7/iWQTq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HFev9yVy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A012166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tblogVAa/ujqpgQ28/Sh7Dbi57EDQu7sDxDe2tCyozM=; b=h7/iWQTqIXLoq6
	uS+l8KVj2p2eMQHCiADdhCsU2hctC+wupmiw8h9KWCKMtyMs1Z2WsrmNbdmf0tSr3qiHM/J0oLO7X
	yWwrEu0Qh0jxXKGJ21rb1fqGngP4Irh9onR3cZNmlzAhEoRauyooHJn7DRnR3eloKZ1f6uZ+ll/wg
	gSidBgFKk1KQWEnQ9aMwWmQHv1GQhDDydPDrp/TkPq4i5XMfnxESiqgPoo3hIwdbnyvVpT8cmSyNV
	cIUbTCZJ7hllslG0iIujJLgmt7OxuXrWEolZId0Owq6o1F1hl4W8E7tSGQB8ZzOmr9uG9CUDJ5YBr
	mfLNqDARMXa0/BupP3IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MJo-0000yJ-KI; Thu, 29 Aug 2019 15:26:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH5-0007Pz-OT
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id s18so3901729wrn.1
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dFPZ/6qLWwta/X/6TBZX224XPskUwC06RARQpEaapE=;
 b=HFev9yVyH4RcQrIUMgcPOCZRRrOPtTPk886G+NQd/p75QFtiPvnYzKXH9WBeDguB/k
 TImrqzMA+RWJAZIrYN7TfXgu/cRXgpKS4NPg3G/DatkmmE1BghBtfCS6qlPFBA4u3AOj
 UX0YqPUTyLiXLYbI1iVCzz5UfuxJWkrl5ggLJEeiJB4+LqZrRni2gHQxRgbhugQxU6Xr
 G6RGOfOFTBgkvw2dJQsGJRDprMx/tWVWR/KEuehgIEhg1l3VauJw/NtT9Yb5za7LjBlN
 1ALgAtX+uWojoxCzBVhxZIt0KliLtqsMambZAo3730iq+yX8ZEsLmi+N5ArlLL9i+RFR
 1YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dFPZ/6qLWwta/X/6TBZX224XPskUwC06RARQpEaapE=;
 b=qCXsBJx0YVLfp42ZHtKaJ/m3K1F0LuOCyWIwBTntEbwH6iqJJpnBZWOsMMb6PLF21v
 /g2nO7XJk67tQ9hQtXEjEEiwwqAWNuFCcWPvc0YFk8t5bSNKMrD06VUqJV7fcCiyFHuA
 jqT2mAFpcvXR68ytXTRjXVXTzE1RAVhXFCa8d6mGHhtsWcGRj0Izj1J3a61SeQ57DPkm
 EFMmN7EwuF2aEedDoiCw3L1jWbT1ORWNsokTofCUMLwABzcgi/MXEJP85MeA7t1fkddv
 qUomumfhQtn8Vz7ALYJRuML3DR2iPSjr1r5l1tryX6bXSpsUkgnFET+/j04Lj94qql3J
 LOJg==
X-Gm-Message-State: APjAAAXfK0wC7MucpDZGUEGlc21ipVCn6WCwln/OXaINGAonwORIJmtD
 bfDPejbguSt1K2mUPjIhVGRSWXmU+X7ZNg==
X-Google-Smtp-Source: APXvYqzll1J2sQmKjhlmvdflWUHVD07LklB6ktBI4HmwvZDmM228SATXANUgTUtpg6hjSwl8myph9g==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr6553995wrr.178.1567092225155; 
 Thu, 29 Aug 2019 08:23:45 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 00/15] arm64: dts: meson: add keep-power-in-suspend property
 in boards SDIO nodes
Date: Thu, 29 Aug 2019 17:23:27 +0200
Message-Id: <20190829152342.27794-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082348_519970_3E636517 
X-CRM114-Status: UNSURE (   5.36  )
X-CRM114-Notice: Please train this message.
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi SDIO firmwares requires power to be kept while entering a system
wide suspend state to keep current connection state and eventually wake up
on packet reception/new AP connection, thus add the keep-power-in-suspend in
each boards enabling SDIO.

For the record, drivers requires it are :
- brcmfmac: drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c line 1125
- mwifiex: drivers/net/wireless/marvell/mwifiex/sdio.c line 426
- libertas: drivers/net/wireless/marvell/libertas/if_sdio.c line 1327
- wl1271: drivers/net/wireless/ti/wlcore/sdio.c line 411
and bcmdhd out-of-tree driver.

Neil Armstrong (15):
  arm64: dts: meson-g12a-sei510: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-g12a-x96-max: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-g12b-khadas-vim3: add keep-power-in-suspend property
    in SDIO node
  arm64: dts: meson-gx-p23x-q20x: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-gxbb-nanopi-k2: add keep-power-in-suspend property
    in SDIO node
  arm64: dts: meson-gxbb-nexbox-a95x: add keep-power-in-suspend property
    in SDIO node
  arm64: dts: meson-gxbb-p20x: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-gxbb-vega-s95: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-gxbb-wetek: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-gxl-s805x-p241: add keep-power-in-suspend property
    in SDIO node
  arm64: dts: meson-gxl-s905x-nexbox-a95x: add keep-power-in-suspend
    property in SDIO node
  arm64: dts: meson-gxl-s905x-p212: add keep-power-in-suspend property
    in SDIO node
  arm64: dts: meson-gxm-khadas-vim2: add keep-power-in-suspend property
    in SDIO node
  arm64: dts: meson-gxm-rbox-pro: add keep-power-in-suspend property in
    SDIO node
  arm64: dts: meson-sm1-sei610: add keep-power-in-suspend property in
    SDIO node

 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts           | 3 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts          | 3 +++
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi     | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi         | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts        | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts      | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi            | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi        | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi           | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts        | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi       | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts       | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts          | 3 +++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts            | 3 +++
 15 files changed, 45 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
