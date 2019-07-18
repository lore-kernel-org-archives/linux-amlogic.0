Return-Path: <SRS0=T9/u=VP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7055C76195
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2019 09:36:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEEC20693
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2019 09:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jb98/FYq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XIc39DhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBEEC20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=13DAQLRjU8vdQ+YxrkUzORzSem35W1PIrvmolF4/aYo=; b=Jb98/FYqPiYx30
	gj/pySec3NAq9JEgOLXwDgtsREbi2wQcxqcDRszuXjUjFXdmgB5/s5c1gpp2X5zIufROJ4KYx3kU1
	wmPADWK5vb0BUl2NflUdRS8euc6Zc2tsuwkD273QE2Z6BagEPwMhLSYUIG8ExTHunHUXNl93EQZVE
	xodA5pg6w8KLoAcj1cdf0+LcR8lb6Pi3irJMfGDue5sylShgXKpm56SQgNrRHV/a8++adIY2oa21L
	HvHjv7y0tXKL3rsXDPdC53OdXL5VmMwvHB91Yl1kAQBlwuBXn+vEuliXorvDkyY9tVHMXW0/C6O3b
	ziw24mPQvglmRn8dVDTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ho2py-0006Er-Jk; Thu, 18 Jul 2019 09:36:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho2pv-0006EY-D7
 for linux-amlogic@lists.infradead.org; Thu, 18 Jul 2019 09:36:29 +0000
Received: by mail-wm1-x343.google.com with SMTP id v19so24948937wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2019 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rcydOW70nVBt2WhrQ5MEx1NUU78KyQhLgGrKfsLYnKE=;
 b=XIc39DhVV6wP9pHG9VdjrepeAIErmxbaSyrZIDZWBwL2cz/IkGTEpnmmzos7L58uon
 S0C1WwcM2PDrmVrjm05LUQqZ/53FWr5txzGmzl/Euuxd/vHpJeD5Z2K3tQlgfJGG96Ew
 RMGf/MvvYrS9hLAbChxZYRxtDFcoQlcb9nnAX20CT5fznZMTzpfDhJyx/R0RoJf0+nOH
 uZWVYazu+ITWtlRdHFKbrl4l1dwjkpA4VPmoxdEqc1actQGG++eYRT9HktMSDf59Y8zq
 IEu3BwAcpvvH9pH/jZADQim8AynqAbPZ/8NF+//UdFPN+jjWw4+B2NYzFV8rLzM2O/B7
 2/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rcydOW70nVBt2WhrQ5MEx1NUU78KyQhLgGrKfsLYnKE=;
 b=GPXKcUYEBAJ7vZ1c3LHLrsStZ2NUVnxK/ewhXSOqohERIJL1VZUPCbukKDJbrsugXp
 JXd96O7pyr2ewnJFW+YaWtVJp36yKe3FVzKpO6cSGsqyRgI14thB1i4++OVltNrPf4pc
 npvZzQOCxgU9Z4+ddIzv686Um5t/PYUxZjL+dznx+p+80iHcNkazbv8olJiMvFve+H0B
 rU1KkdroEISyT41bwfSbdDOhuuC09Ihh8SS3owwBXud3RO9tw+1JM5+7o7n2z/gGFtrA
 WMV3nPp2aaaWCItBpFw+cw5/HXXCrcsNJAwAss+rf5A7Guh5YcOoGCpzLPBMow4we7ho
 ZXFw==
X-Gm-Message-State: APjAAAWM8qFLCQMzTSGTahJH9MffYs1ZMqvswJ3acnGTNXWQ0TD2/Pgw
 1oOWlo4Ym/+loDoD813Ngh+A/g==
X-Google-Smtp-Source: APXvYqxi617JdD5W+kC67+u9HU0QK3FbZtBaYU7SVdRiq0lXyfDfYn7ExO0wqjFAymUs/5beoqERcQ==
X-Received: by 2002:a7b:c106:: with SMTP id w6mr43693379wmi.80.1563442585757; 
 Thu, 18 Jul 2019 02:36:25 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id u13sm31569350wrq.62.2019.07.18.02.36.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 02:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ARM: dts: meson8b: add ethernet fifo sizes
Date: Thu, 18 Jul 2019 11:36:23 +0200
Message-Id: <20190718093623.23598-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_023627_449078_593C290D 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If unspecified in DT, the fifo sizes are not automatically detected by
the dwmac1000 dma driver and the reported fifo sizes default to 0.
Because of this, flow control will be turned off on the device.

Add the fifo sizes provided by the datasheet in the SoC in DT so
flow control may be enabled if necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fba2c70c2fda..b044ad78b475 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -410,6 +410,8 @@
 		 <&clkc CLKID_MPLL2>,
 		 <&clkc CLKID_MPLL2>;
 	clock-names = "stmmaceth", "clkin0", "clkin1";
+	rx-fifo-depth = <4096>;
+	tx-fifo-depth = <2048>;
 
 	resets = <&reset RESET_ETHERNET>;
 	reset-names = "stmmaceth";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
