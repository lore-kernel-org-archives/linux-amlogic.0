Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B3AC32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C91F2083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:31:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tvvzXX0x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TDu0To1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C91F2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u674U5YCPqywXi8W17S++H8c5xLKNJZHffdSsdXo+k4=; b=tvvzXX0x1X8RI1
	5T2rgay07WvkonTjHSOrrMY8QSVfeaUaEsz0staAK3D8SeN2IEsMczMGaQ8nUj/ACdXSThWZ1rNhH
	ArH/RL2CNLVJ+5tCiCEV533jvNW1/LWWr1kFlJmp4a/X2joc4J4/ExutABE8mXLJPPz7CyRUgVRd5
	EZ5/laANJV/lL8w3xrLdzTs/+nkzJNkPd6U8vFom5NDFJZccVHo2dTtQIsUPYSYmLl8ZaigNJk6iA
	wwL5GCn7gvSsrpWDZpz/LfGUOZQik/ZjKpP/iYM1Tde+L4A8YAaTTzrEKqZJpe2izBxRZLQk2X9Bw
	gzrKXLNgBPlVGmpsfn7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuJ2-0005PP-46; Wed, 14 Aug 2019 14:31:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHK-0002Zm-5O
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id g67so4674418wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9DsqMA3qFAXn24pl05ljozym+J7gax0j6GjVntAiYOQ=;
 b=TDu0To1gCBZ+0AOKz7IpaNPzK0Nklzt+Do4HG6UBKz8GHnEaskp1xeIHtdmHB5EGwu
 HQ+THz3WwnyD7hPhYAFN+GWMKRL3iUd8f6j/31JnYDhinQr4mk8ffnerVi4mfd1iiW7b
 96z9WAMcmvYshPheRCk5Ri0HObVUdnQdgAYiantB/y4xjGpUSm803U1c6ifMGhar3U6l
 1ppMmmVTnxYkC433993KQzu5XxnSIJbVTQ7bLVphp22U5smc2iZkmmfwqoNZZC+eApgf
 3XCecNk8mgl6nFbPeeo1dshRnLdmhAT1PpkP32hKuxHyvrmDnRIEB9ONN6nnWnoX92W3
 JFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DsqMA3qFAXn24pl05ljozym+J7gax0j6GjVntAiYOQ=;
 b=E6t3Er2u1rfpMu1YZfslaXnub9EGQCTGT9WYMfJSgZBtB7yTiuxVnjDpJmaQ5lZ3r6
 NGO7OMh9wUOIZq+yBfi84F9kKK/3i2Rb+Ym9uaGNvahqUKeAby1MzDm39VID2bmgOIPd
 iX2VXT4wCosr6wQpy6bObTyCxOwwFMrUV+A0w740r4RicjpVXIOdzwBXbIZWfJJE0MuS
 le3UdAyI4L8eYbJ72F1Q1Q21yU7AzTVZE+STOLqNGYQZMzqSgyARD28OZQCys1NMZzG2
 RZ/N8G2r/zFva2kqVhWeR3i8uzritxzadBCLXIb+GNVINeo+klLv+4itrJQwsY9zfWXq
 oGOg==
X-Gm-Message-State: APjAAAWVDTvd8wftAh5mnZlSzB8GcrlQparITaV6mr5+J39RZWjOitId
 jvNoUeGHV5s5xdPV5YN4KbUk0Q==
X-Google-Smtp-Source: APXvYqxaYmczp3cYsY3AQw5hAaTzvtpY7hpeQlM/ZpQaPs9n0FItyfE0GfptHr27uq56N5g8qEPzQQ==
X-Received: by 2002:a1c:6c01:: with SMTP id h1mr8773247wmc.30.1565792966998;
 Wed, 14 Aug 2019 07:29:26 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 04/14] arm64: dts: meson-gx: fix spifc compatible
Date: Wed, 14 Aug 2019 16:29:08 +0200
Message-Id: <20190814142918.11636-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072930_265991_4B71BF9C 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxl-s805x-libretech-ac.dt.yaml: spi@8c80: compatible:0: 'amlogic,meson-gx-spifc' is not one of ['amlogic,meson6-spifc', 'amlogic,meson-gxbb-spifc']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
