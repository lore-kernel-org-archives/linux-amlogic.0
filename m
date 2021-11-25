Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B6C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Nov 2021 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJ+vpLQ+03I6ARTUOjxTNYHvOcvgkswSmSAJqThoq1g=; b=nVi50H65CNkKG8
	wiPYdCe0pE3+NG5l0U72646uIcT2hFv6T0rrk/psg2gM6OPuVg5uRL15FgCyIj6f9S9nJgJAvtN3N
	d6dHtZDFiipQXf7Y1xNCo1ZYxRnYv1bL2YSfHaBHDsV8VFjCIvqRvWgydIdXwxKk0/5mC31TiN6ch
	M5QYFAxzwHwOS4FyOKIcmHBQ30BMf1CksoZqnBFYLIxnopkvmOojaY1Xh6M8o657u2n4rL11UOk3K
	xGE7xN5aPjRU1jHX4FPGS6NtamqrAtVI9voTtJRErXpTB7Ho4ZFu1GeJRDnEU9nRpDD3ih03dredw
	gvky4opbOi13llplBzQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqEPW-007aby-8V; Thu, 25 Nov 2021 13:03:34 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqEPQ-007aXG-Lm; Thu, 25 Nov 2021 13:03:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98D771CE5AD; Thu, 25 Nov 2021 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1637845404; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ksOo59b9zPzpZ/xtZN+pj91AfwpAwnF4ANOJtE5pGEc=;
 b=dwrUmbn1Ixk2Vut8EyDfPQt9tAmwsWCglOQUnFO9yuIRuJoRE9HtFw2UF/ayDTKvQo2hTS
 qel1lcuDRCZUlwrIJcV/2gsUue3hAcb2q+BQ4SiD8OOj6dnyJ7IXjEyYu13makJdDN7Qge
 VH41IviIJ5JyJa47h3Adjgr+KYo0822PHWV4TSibUZRsrUzrxoAQgaPjtK4xhH11Yf8q8r
 EuxHzEZ1ff7ar4kzZLc84P7z+mj8RSA9OoxsHXQz+ICTata0I7RxpKueqVGCB+vFVASLJE
 20h40vdpvjYqffE3X1AaFWUEw6MdehZVG/2tMd8egFqw0QR4h5I9e0Bh1Cseag==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: meson: fix dts for JetHub D1
Date: Thu, 25 Nov 2021 16:02:47 +0300
Message-Id: <20211125130246.1086627-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_050329_077610_1DD8DD7C 
X-CRM114-Status: UNSURE (   7.10  )
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

Fix misplace of cpu_cooling_maps for JetHub D1, move it to right place.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 .../amlogic/meson-axg-jethome-jethub-j100.dts | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
index 52ebe371df26..561eec21b4de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
@@ -134,23 +134,23 @@ cpu_critical: cpu-critical {
 					type = "critical";
 				};
 			};
-		};
 
-		cpu_cooling_maps: cooling-maps {
-			map0 {
-				trip = <&cpu_passive>;
-				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-			};
+			cpu_cooling_maps: cooling-maps {
+				map0 {
+					trip = <&cpu_passive>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
 
-			map1 {
-				trip = <&cpu_hot>;
-				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				map1 {
+					trip = <&cpu_hot>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
 			};
 		};
 	};
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
