Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72A3C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BE722D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AeoxEMk9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="06ddO7Cx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97BE722D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nvonLjjfP1DOS6Y4OUMwxx8+pwxzk/MZQ73+GZ9OhY=; b=AeoxEMk9DBX9GZ
	ltpQV5NcFUYNs0LPGJN6ftgt0tNSDcx7rKNZDDTjhmj3nwWvXaW3ZYyEERRoycIPvr9jZiDYab3ne
	sAL2Zv4Hd9Ib8tPJNNyfxwKUwDUaYSFaFJWv7tFXx+5Mk8dUmMPfnDU3HGE/zBfBmH0882jK+lakT
	KcPpwz9BVWtlWoa6RdAz4kJcNq7Whpnv0/sZxXlH8Gp7i3lxBYV1sPo4/uGqk+c/Ny0qXf2m4GZMw
	45Cj/tl4LmpiLhlagWZb4UaD1mlxGAQ7MFa1IUG2A62gsxbzCHtqtoELMkIon+2T+c6J5HulTP8iN
	jJUux2WnJtUy1aYnJk6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RVT-0008Mt-Bj; Wed, 21 Aug 2019 14:22:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RTu-0006hr-Hb
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:21:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id v15so2336430wml.0
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGF5jUzlLHUnpyLwcU0i8JE40DhyIcPvkvE+Vwkjv+o=;
 b=06ddO7CxS5O0YGXLovcrz6ShwhrUNh32lhm+fF4sdfT11snt54gRQTEkde2KNoHgW2
 VN+pbM/Ob/Yz8tb0A1vrQBmhDK9TgBzPRMMtuSJa2Cljse+5o87tcbUpdAy+V6t3dCDy
 uv3XaX7I9jSEobPiLPbDXqS57w0ULNezpjHDYWCiPvmES6DZDzpFUnJj2KwIB1p6+UX/
 GLusvZ1HQxwffMQgnNfhnH7ONfRDlrKvJHVlzn6WA1Ph2DE7S8IV/XD9aGRXt7RYpu9b
 Kn2P9n5OX+/ZMEAgA8pC0lLb+dlIfJINmbCK58erbgGo0LcL2uSsn1Ae61PN3XhfvS07
 Z6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGF5jUzlLHUnpyLwcU0i8JE40DhyIcPvkvE+Vwkjv+o=;
 b=hjqyNoPVbHu3mZq0xSYPK10e0vxkqBgShfurdaquo9RZTBwuLz8ujypxFwPkl7JMTp
 ZTw3BXGC2seXvu2rn0VIXhy50bNEDp1tnYWFIkitXdPaDVSURr0DoUwKPhgR/O9LaXXV
 Zj5pKTEOzIPOQla1eVTpnM2i4L/SFv36z0LtZ2chiCxqN5jbH8oms8o2QeGVJ32RkbZP
 Gwjmtgwc9ImnO0sYAksZ60BraGEZb1F9X24e1DH/TcW3kCq+DVhqBDMU504BtDDKqy9f
 /T3Yd/GVu1VkuUPVr5iAb0PbmCw1DGRLU1i2pfq0+rp1++tIalI2XwC4ONQc+ZGT9Rj5
 C68w==
X-Gm-Message-State: APjAAAUanlo6KMRRJT3ArXivytBFsTpG6nc7YPw8349yZdY8mILe32TI
 YRIrZdLShXIscrwUnxVZEuGwtQ==
X-Google-Smtp-Source: APXvYqxO0x8vMs0kU/VpvxdkH1TDg/46izp4XAK/663X31Vn4UFZsfKpt4KBDqQ1dNWeNPRLTcr4yw==
X-Received: by 2002:a7b:c241:: with SMTP id b1mr270320wmj.165.1566397257177;
 Wed, 21 Aug 2019 07:20:57 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:20:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 04/14] arm64: dts: meson-gx: fix spifc compatible
Date: Wed, 21 Aug 2019 16:20:33 +0200
Message-Id: <20190821142043.14649-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072058_609745_1A3E241D 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxl-s805x-libretech-ac.dt.yaml: spi@8c80: compatible:0: 'amlogic,meson-gx-spifc' is not one of ['amlogic,meson6-spifc', 'amlogic,meson-gxbb-spifc']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 5b3dfd03c3d3..e2cdc9fce21c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -317,7 +317,7 @@
 			};
 
 			spifc: spi@8c80 {
-				compatible = "amlogic,meson-gx-spifc", "amlogic,meson-gxbb-spifc";
+				compatible = "amlogic,meson-gxbb-spifc";
 				reg = <0x0 0x08c80 0x0 0x80>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
