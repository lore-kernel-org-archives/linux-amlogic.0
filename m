Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E261061B07
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LfpB8KEunjzq0mqRiKnEzAmkx/Spo0AkB2GsMpRePG4=; b=zBx5pWvRgGk+Vn
	Pz3mQzhnIo/X+p416uZh9kVG/cuC2fuISKdmqyPgpBvgh0eUxkszW/vTkp8E/4iIap84bjnF3PEni
	XClJ9OCsL2hWlxkwBKvEXUaw/TO3ZyfOQe5hHYFCONMtkBXLmDJ2JwZsvcJaXbMtwUlckHs9YX0+s
	hs9kV12CdteaxVinJ6hiI5ya1hntGULNIUy++esvpsSEYp+auJhnATutC/9BZlL3IpnrWjAPaVhus
	QvmzFE+s5LEa87pQfCWN4KDxICdytdzbex1uWBRHRlLzgAgjlYr5y158ecdWp3MZePbx+Hd9CUdNX
	bjQK0P1c/LCIgbLyew3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dzi-0000000BWBN-1bNN;
	Mon, 30 Mar 2026 14:53:34 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dze-0000000BWAP-35Aa
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 14:53:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3155333a91.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774882409; x=1775487209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=;
        b=QGuC8WKmEjGack4Do02Z5CywKtHXDsBn7MNeikPhjOSRcXU16wa6+6HuPIvDrSyC0N
         EaWlLi+bTb1/G9L5pNLWjmX8VEkT+0XjdG+9ghstn/Tc2ay48TsseWt8MVnOnOJchFew
         pYDCHdF8dRS0wyCL5mHKK4zZE/EihZ/bCGEN0H5SCTtYqJottoxsA6dgWoUuJ38JCkzn
         Lnu6bOkhk3q7ZrRmz0mWddNe6lf94I57DN06Qv1gpCvQliv85Wq3oI0Hrx1eQ9AWg4H3
         K6CnyG2sr/bm8sR6SGvjYh+LczJPQ5ZtQXwwPWsvxeXNg6fTfLmfHcskmZO+zekCqwEj
         bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882409; x=1775487209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=;
        b=R/MauaHpu8Cu5wC+ywYKXylzAukn5txtxJ+hXOYDuPUgH3yevWwgx5LGqZ4qKvbmjz
         H1AyaoPpMeRbbS1QpRcdbjFXESjM0ArwpiJVQ8FpEwERCLmJVgIDDl0uPoB4Uu3bzDyN
         DKLW9B9roE7Un8fInAfFQqf9HUqP9U1ybdj6hU4bzdbf/MHQzO9S7AbX/Kio2F5az6UD
         cmPeY5QeDXxYOp1ZbuBYRxwXmnLX3t8uf3t8aMTs+nIqXghZeX27qqZyIRi7nVxlvStd
         zEV5hqyO4Y8vL65jxK0Oqf7wXC99JuaFxVf9s293Ub5FjXDkzZr7GAMDE97sKcZxwhO3
         IOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Pu9EBcV90NtonSkhJDK4Q5XNXNe9CXlfQFENDYFrTDfW99tQFA60+PuH6Fo+/T9kHKk+x5xfudVer7Pa@lists.infradead.org
X-Gm-Message-State: AOJu0YwTHWKs+SsLLD0hc01fUbxpV1GhNxv5J+6VtFEEce93dR69pm7+
	5G4titYqg4oQJ+NTYpy74o1UDIJ85QWdzSmm6+XG/PTgXJJMrnukfXSr
X-Gm-Gg: ATEYQzwaKihj+3f21TVagtm+oRNCGjmBeAAEIFkgqIVK3dVBuO+nsbyI1dBmmGTn0Tz
	xoyz+6EQoTyo59PQcNUAckDwjJeE0IZR5kAgOfxPjWvgBq3RMrYQo+uLxvQWUCgOugKAN27O6wD
	vyUww721UqMC2lle3XdDwr3SSkEi5ATwCv94l6x0bZwGlYv2cKvjZuVpJlPHusVwEqEKvtHIycJ
	LGrK6ZXO9sRDGNXexE95fkf414XnKgK9ybiEZWAVK/qAqzwJKqVfderJkXOTL9d/zPEVELk+QTB
	k1whkSWVQ2x8m0y+JSzyJTcXQAR0c4J4lSsH0S1FhqH8bdsdeHQ+F2khDl4EHSI3wIG7RJ5UwTB
	IKgD0gcsQFPcIfzOaGxlvy2ZTQTLZZfGutraOHeiKj+i8tJsxmWl3aHbC9d156olaD0Me97SDEW
	cMvlbHadvJ3yCXJ1KGFMM4d56ThR1chVjbIA5Asmet3TlysJk5pqMirSKfYJRi6ctJ3jmqTTwxG
	WUOs5jOUvIGoRjN9CA=
X-Received: by 2002:a17:90b:4cc6:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35c3011512cmr10970363a91.28.1774882409439;
        Mon, 30 Mar 2026 07:53:29 -0700 (PDT)
Received: from arch.localdomain (n058152025253.netvigator.com. [58.152.25.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c92dsm13218247a91.9.2026.03.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:53:28 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
Date: Mon, 30 Mar 2026 22:51:11 +0800
Message-ID: <20260330145111.115318-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075330_768948_02140183 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Correct the interrupt number assigned to the Realtek PHY in the p230

following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
interrupt improvements [1].

[1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumenstingl@googlemail.com/

Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on some platforms")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 7dffeb5931c9..701de57ff0f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -84,7 +84,8 @@ external_phy: ethernet-phy@0 {
 		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 
 		interrupt-parent = <&gpio_intc>;
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 		eee-broken-1000t;
 	};
 };
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
