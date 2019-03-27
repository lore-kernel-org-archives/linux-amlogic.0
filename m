Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC7AC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11242075C
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kxu48ETh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zlONF8A3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11242075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vbAeZizw7JTquLq20j3HpIWdZv4pZWQNhkjLZfKxi3Y=; b=Kxu48EThxvc6Rg
	aOJtejAO8RNYDBrEHHaR32PYaSOdUQIsHsL0guFht3Qhzf8fwI9VosR0Sid/OHZRVOnbTr5CCAOdI
	kXnAl6ApiJo4GIodWnBYRHYHb9j5aQ4LcgwSmwfktbOwIo0h99bN5ClMgkrX6XJvzFhrdtPeDzSni
	kcydcyqb0z9vo7VxEIALtDD4XUdy1lwd6AIRnhZVIx3/C8FKFxUnju5OuGisLzuctVDxh24eLAJH/
	Rgh1eyOvjsYKuIeUFTw7hqyIcYm747cnudA4Wbj+OJi0FPkZ0kqoLJhPSMLPi1cCRI6GdehFP3+tv
	U6XmwqVlQY1jFBUXRRbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95s6-0007sP-MM; Wed, 27 Mar 2019 10:33:26 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95rt-0007em-8Z
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:33:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id a184so15583718wma.2
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o137uva63juW93zS7C+0X9Xktfg/ljv44fOwKD1OTCM=;
 b=zlONF8A3Nt8bDK5P9VU0SFMt96DS+Y3By+98O1lbKJN0YDlsMnXavpm++5/mMToNKa
 JTQGB4RvIMzqYSX4qdHDuKRTlmbj9AeAoH6R1vn5bqkLyxDhuh/Ifgx5OfUl0KUPOUj7
 l7ytOEH9wcuzgNDJqfFOZmMs+b8HJ1ZhSlcdNQBPQrRe7L0PDWGkR5lzhRU2yMuAD5NK
 0eP1Zrc85PIUYRyFJDhcVY92+J7dFhU32sz56xVT82E/BN5toIp1PhUVRXsLb+pjJPdo
 V3xB6vg1m4xTmDSkZV4qrDvuOn2pgL+gtX0F1WpxIfT1A2waUnKjvk42UQFMvnbLoU/a
 08tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o137uva63juW93zS7C+0X9Xktfg/ljv44fOwKD1OTCM=;
 b=IyhzMfFHQOuGiYFppnBEgqWWVTyCti0tGooocSzgJGE3CQNfmsdBy2VT3f1SUpKzT1
 mSlKlGFe15izdt33ptigM4kJFgNFLdQpixnXgIf1t2I/85tZo/RCgfUkpGWndoLgs0Xp
 K+qcKp86Sr2U8aYVFTZ0PNjtFdf3LgSrotO7fF5OCF+44PDmaZOlXi9iN+wjB2Ti84aa
 JmjCrZ0OBXxr4na5hFUUjwz3M2GNcmAtNiwXTq6AvKtfsDTZbiFaTY7xjORR2iWniWFT
 cw7xHFjV6q3UNl/xJc4i/lJzzCWLzvjXfJBB8C8v8XzkhdeMquUzxXCviYHQg3ZHZYMJ
 l87A==
X-Gm-Message-State: APjAAAUL3cX6ZpgdmoZATkK65QNUZefzeNl0vVkpG44G76lB8YqbuKdW
 mIsM3OukCeG4G6XG+bU4fDVQFw==
X-Google-Smtp-Source: APXvYqxBjvjVbbq2HrJnePVNzZsvZDvrKjzkQS4V25pQD2mdZxL4dsYp9YbkWpTCjPon63XiuOUFcQ==
X-Received: by 2002:a1c:9c0e:: with SMTP id f14mr18752585wme.78.1553682790182; 
 Wed, 27 Mar 2019 03:33:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a20sm27017513wmb.17.2019.03.27.03.33.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 03:33:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH RFC 0/6] arm64: Add initial support for Odroid-N2
Date: Wed, 27 Mar 2019 11:33:02 +0100
Message-Id: <20190327103308.25058-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_033313_304868_525B6555 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds basic support for :
- Amlogic G12B, which is very similar to G12A
- The HardKernel Odroid-N2 based on the S922X SoC

The Amlogic G12B SoC is very similar with the G12A SoC, sharing
most of the features and architecture, but with these differences :
- The first CPU cluster only has 2xCortex-A53 instead of 4
- G12B has a second cluster of 4xCortex-A73
- Both cluster can achieve 2GHz instead of 1,8GHz for G12A
- CPU Clock architecture is difference, thus needing a different
  compatible to handle this slight difference
- Supports a MIPI CSI input
- Embeds a Mali-G52 instead of a Mali-G31, but integration is the same

Actual support is done in the same way as for the GXM support, including
the G12A dtsi and redefining the CPU clusters.
Unlike GXM, the first cluster is different, thus needing to remove
the last 2 cpu nodes of the first cluster.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Neil Armstrong (6):
  dt-bindings: clk: meson: add g12b periph clock controller bindings
  clk: meson: g12a: Add support for G12B CPUB clocks
  clk: meson: g12a: mark fclk_div3 as critical
  dt-bindings: arm: amlogic: add G12B bindings
  dt-bindings: arm: amlogic: add Odroid-N2 binding
  arm64: dts: meson: Add minimal support for Odroid-N2

 .../devicetree/bindings/arm/amlogic.txt       |   6 +
 .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 178 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  82 +++
 drivers/clk/meson/g12a.c                      | 466 ++++++++++++++++++
 drivers/clk/meson/g12a.h                      |  20 +-
 7 files changed, 753 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
