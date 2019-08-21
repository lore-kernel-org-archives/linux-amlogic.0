Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E23C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A8B22D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XNdXSSU2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kxZeVK3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A8B22D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuvKNcLxk2xnM4Y4EgEn+Vapicg3sQCv9TDKzx/aaNU=; b=XNdXSSU2TmpLZN
	fKQze5Y/+UdwMI3Q4mhBWz7iEwVkbaxqtC1R9cVk+C4Lpd4C0ADY/kcto4mpSrlrZ3v6lti4JeA/m
	TvumInZwGagx8P3Iau51uzkW+Q7MkDgs1h9MlXoePt57wn2vq14zn2pg6EeR+xyoFhF4j1qwLjQWA
	K+0t3OyAU16bYdQdOW8KX+5NNETPdfhAdmqMhgfgPpWxvfdRPdWIx/iKC7x/cZmwX5XL/i5fFCtP/
	xPlRyyS9x3f7bze+wy9JbTWSE5jA28dLluj/pCOxcW1cPqcX2HgQc8T1TylULG67delqJt9zXXc2L
	vYZ45cEu0UPL8/vNbq0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RWB-0000l3-PS; Wed, 21 Aug 2019 14:23:19 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RTz-0006nO-Hg
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:21:07 +0000
Received: by mail-wr1-x442.google.com with SMTP id j16so2220891wrr.8
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VoiyEoznGsebSQriKSg2X1Svm8xxDWhM6W5MAaVlZfM=;
 b=kxZeVK3IMsEJNXIkE1onD8r59IVoLEsMEFhCHM77efUT/dMgzNRiqJozIBArFi+2+i
 3e6vE9PB3bzlqrDinHivdpyfO3ztJdbCINwQIHsXFnVv/z3ohELjBSr4XoMcs8UkgfNU
 fkYsYWfkv2jhYTPZCOKsRZwZ6D4kSe5y4p9vsuZ1iXJ3jCZCr5v8RUMEPmMY8/xCUeo0
 kV74c4MDt0J4MdKaXQ6VqPlndlNyreStd0mMLlKS12j2ElwiG5vOgJ/DuWnJX36gUae/
 9T/Jlziczx8QIzIeGtxsxH7a6Ybxtob9fmA4il5Y10TicFejw4bibo7u0uGPYNdD32x0
 LUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VoiyEoznGsebSQriKSg2X1Svm8xxDWhM6W5MAaVlZfM=;
 b=nLUa3oxiLvfCkLfQKtSE6/aYQCGx92OUuacDJYz4USA5sSKpoJa/mnJdpBulk+1tkl
 OXGbsWsv/XCu5yNT4KPgfh1Q09/VAiqMmx9jHQQJbFxQPICpVeLzWuH26sKul4d+sfVm
 xIjDZG3QoTRxk1YA6BJfNixQISPDFTavaQVKq4QHZWFEq/Gl1qkXNkhm1gBax23dx8qa
 BdN1i47+hkqyODLFli+cZgkD7jPRiDYwO90+SwdDsPH4jOJ672gCEPaO+aHJszek7dqA
 v7licEwbmCHhmJp4vnEwkZhTlMxsp1LmgjEDha67rjDRWriV4qylLw0Qb44JVU9URLH8
 +eiQ==
X-Gm-Message-State: APjAAAUFZxg0R5HnpyCuDq9h4qSZv01l4ChR1YF3XdxQEo2iANPfHnAa
 lUWOl967cLtzOub8wj8wJ2EymA==
X-Google-Smtp-Source: APXvYqxFlWXpWGYx7Skr2k4dM6gUG8fIPs5pjfvI7AKdcs4MotQyTUuCI6H5yyjL+seAB1jiCBbh3Q==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr40802954wrx.122.1566397261813; 
 Wed, 21 Aug 2019 07:21:01 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:21:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 08/14] arm64: dts: meson-gxl: fix internal phy compatible
Date: Wed, 21 Aug 2019 16:20:37 +0200
Message-Id: <20190821142043.14649-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072103_660478_28870869 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxl-s805x-libretech-ac.dt.yaml: ethernet-phy@8: compatible: ['ethernet-phy-id0181.4400', 'ethernet-phy-ieee802.3-c22'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ee1ecdbcc958..43eb158bee24 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -709,7 +709,7 @@
 			#size-cells = <0>;
 
 			internal_phy: ethernet-phy@8 {
-				compatible = "ethernet-phy-id0181.4400", "ethernet-phy-ieee802.3-c22";
+				compatible = "ethernet-phy-id0181.4400";
 				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <8>;
 				max-speed = <100>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
