Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA63CC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Nov 2021 06:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ+vpLQ+03I6ARTUOjxTNYHvOcvgkswSmSAJqThoq1g=; b=zf8N4v2Oi71uKI
	Vkh8di7A/AVQ2slFm1oDgmpNJ2MhKCW2n0MPqnRkL4o2ZHG9h/2SLKuvPUWMEUq4+aGj7R916rcJg
	ir72H8BO7SlekmoUfMebwAAfDfO0tHvfCLISR2ZK0JDg41QTWkIQn2nNKE2YUJaJeC3p75JxkyOoZ
	a5yafjCVYEidoBLYMYP0kK3V6nmBvCZznLlp2AXu967iPCt3i/ZKBRwnKdp/daMDhJtL9+CD34EMJ
	V0HSU88PN1gsjIQPu1GYxY9Yuoq7zoSivTEvm2DMDqZLOhxeuMf6cr5NnFfby5ikJ2CgFQZrNhp3u
	R33Hh7iAvDYsOb8vfdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqUs2-009Jv4-0R; Fri, 26 Nov 2021 06:38:06 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqUrz-009JuI-DM; Fri, 26 Nov 2021 06:38:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E6211D1C44; Fri, 26 Nov 2021 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1637908680; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ksOo59b9zPzpZ/xtZN+pj91AfwpAwnF4ANOJtE5pGEc=;
 b=HSobVvMJAZr7JBT8DyMiQ7BC5My4Y2ZAFfVmWAQ6yRC04Vl+t+Q4cg/z0hy8SFqfgynYW5
 mo/n2f6Fn3C4HACT0QNY1RPxvjeTdgZJDwExOQYDWly9I9RaxB6drKL2Q4Cz902GTLiCUB
 wBZeLnCEYRi/4AlsOUQ2ZpV2beWB2blE2o2iRd2LsDZXM5PIbBPIi7TlIfrLwBWXJT1bFG
 HmbbQi3sxQh03SNB0mGrNa5H6eipvgGv2uTNyr7rd4hrsuNExGBNfa6vtNxL8o9NJWciOg
 x45mSZSgVh934S0NE6O1fOtOshMtwQmh3XmeupkVjJp6xntuKPuHeiJiuhXYgw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH] arm64: meson: fix dts for JetHub D1
Date: Fri, 26 Nov 2021 09:37:06 +0300
Message-Id: <20211126063705.3113458-1-adeep@lexina.in>
In-Reply-To: <20211126062127.3084029-1-adeep@lexina.in>
References: <20211126062127.3084029-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_223803_622910_7C320281 
X-CRM114-Status: UNSURE (   6.93  )
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
