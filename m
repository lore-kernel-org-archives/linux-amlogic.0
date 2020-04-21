Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DD7C2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B216E2071C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHBL2BxQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2P4upNIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B216E2071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLbhSBh0JLLie4NGY3kjYuSqmB9r0UE9pu5zdMtkN2k=; b=PHBL2BxQtd491c
	GJEShq4yNTv+Q8OZIyUmelRzL1C8KeFEB2/RDUQGLxZLxG6yV+os/y1i/5SKpaSBrQM9XDU7RtJwz
	sky2NWrRU9DGTgHZoKk76cAxbeHAGulU62DQoY4EO3uLr8VMTCqO4AjEcGQdIkwqEtLg5LOzEX2EY
	0HGMObIUmz5W7NVlyA57X0EWtT4eonDb1jRRv+96fx8Qbz/mfanZN63/CHeJ8JG6WXMNGhbSPo90g
	xr1eDjg15dcm9cGIYZn23PlERFpNcT0OvJKyGrWqPyztuEmjjkedAtVWddmGFmcl0ykxQPyP8KhMs
	Axcmij+YOQZD9r2+QutA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnsw-0003ut-DD; Tue, 21 Apr 2020 08:04:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnqK-0001HN-J2
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:01:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id j1so9907519wrt.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itZ8nYpO9rVwAB+XOSiZ1Zaz+WlUMeN8KYJbRrgai8w=;
 b=2P4upNIcIwgvXsINcNwMKuLoNxfbr7DA+Jnu8ANYIWyy5/smGGvO2txOPebp357SyM
 9xtX+ZfPGfwrIPzvc5j36V2tN3+T1D+q3dwpBGFE7VWJMfZzVUcqeB+umjUadUUjSCq4
 dATQNiLI4T751oM+fcu4U/Y5XgsSygl4fgAYRVtuCQrFEXrvrVqsI9pgHO4pzjVa1d2T
 x/g46FT49QfIbn30BHst4ECbSzYAcH8x1/3QHciYWeaJJLSUi9kpiF14nf+kIFgFYPdr
 z7RlPTlHlYTEHzsbmqAs+tXOYt5s2M3tLDtDiyBpBUbkaQQNjDkzXMclSxyyLuFi0kbu
 iiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itZ8nYpO9rVwAB+XOSiZ1Zaz+WlUMeN8KYJbRrgai8w=;
 b=W5h8SgAWvI1bLjDLEE/puV5MynzsdXuUuzzD7RPGIG6PPINdP68CImFOWLqT/QwWG9
 UI55QBXG32U96gSmFRekT+1oyVByy3AaGlev7EDbCMKbSaJCxUK3YTPSL7TAYBJU2kCm
 VnzpMQvGdvhl8LxjGgbKwoqupkb61EvydCsGY1I54Ejoyn7cdc2ps0pI5zDS4u80Y0iw
 6cur5DvxY1p741kEQHNGdWUYsIE/a/tHy2kArXn69LYHMFFIT98K1djzdlh1TpAxK5Bx
 ixwMGDzKCJG9Ay4lZcDEvQ/H/tlyH8RZxioomnoDvlsA4paiLVo0wEyRtYdg1OxKSLTp
 7csQ==
X-Gm-Message-State: AGi0PubHmpv/V1kPyU5r4aQuEQO+JYzOc5BFHEkZy5QKHx/ePR/oC24v
 wz3gUToBHr9TattnyW2jpWmH9Q==
X-Google-Smtp-Source: APiQypJ7I94NWf5qVdER06WU1+s/LCyUTU03msM+BLEEdT8t06/AWQHMkHiC71sCWlgXL4pKvRiNdw==
X-Received: by 2002:adf:db41:: with SMTP id f1mr21790458wrj.13.1587456078705; 
 Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 x132sm2561552wmg.33.2020.04.21.01.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RFC 8/8] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
Date: Tue, 21 Apr 2020 10:01:02 +0200
Message-Id: <20200421080102.22796-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_010120_701098_FD8A6B16 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: linux-hwmon@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Khadas MCU node with active FAN thermal nodes for all the
Khadas VIM3 variants.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 094ecf2222bb..3325e54ea690 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -183,6 +183,23 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <80000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu_active>;
+			cooling-device = <&khadas_mcu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
@@ -222,6 +239,12 @@
 	pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
 	pinctrl-names = "default";
 
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu";
+		reg = <0x18>;
+		#cooling-cells = <2>;
+	};
+
 	gpio_expander: gpio-controller@20 {
 		compatible = "ti,tca6408";
 		reg = <0x20>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
