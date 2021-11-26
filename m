Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475A5C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Nov 2021 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJ+vpLQ+03I6ARTUOjxTNYHvOcvgkswSmSAJqThoq1g=; b=w7xRUU0AGZYjpJ
	2QWXBfGnSX+s5S96P5wXQsS3EUpep3WbRXw8WrYBIY7tVyQtlfGSgMjlB2VH25ILwAmdWF8CN1lY9
	bwvkGY0n+l97DvrXEUV5fBIj9zRzjLyKqRMdcraR9YOY4a2Ps6m/kKKUg0/W7qpzcH+pbtarARZfI
	I+PUiw8CHutxN6DDQ3NzTsghTiXkngJKMgWZM2nPAr58LgvNnAFgD9VdmXq6goNqPC2HT0tjxE6A+
	08YzbG/w49n8a1DiHekQZu4Ub2LjoRbWccp6ff/XcEjEEhio/+YPYwTl9N6V5T4G2bhcVjPNfaQgW
	IdPeKdSJNSCb75JmiQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqUef-009IQW-5y; Fri, 26 Nov 2021 06:24:17 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqUec-009IQ6-4i; Fri, 26 Nov 2021 06:24:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CA701D1B97; Fri, 26 Nov 2021 06:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1637907849; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ksOo59b9zPzpZ/xtZN+pj91AfwpAwnF4ANOJtE5pGEc=;
 b=ghGJUQwM6wRg8zSTKAxvvcaivOFvayoBy6tPj44WSZZHRID9l5k0uA75isxt5YoFkffXEj
 jljmj1oBhjIYJ6SSpv6NA4PYz7PfjizXvFDF6J/3PhB2iB5RngvrgyCTAHPqUnIAItpdPw
 J21HnU2ZjttKWOQzngr8t1eGOskYE0vQWi9zt+Ab1cxcWSntbUC5Lni4ChTNJWhnENfgxB
 EGYdiHsZEsp7w43H1Mtmp7tXATXOREFO8J3kYvQCcAxT8bWFwbkh/n5X6AILyBQeoiVlHs
 Plq0Oo75OdCJr32j/3SIK5qnbW71GwYZo3CRag9lM55FmvbXlar2Y6dCN3y4Yw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org
Subject: [RESEND PATCH] arm64: meson: fix dts for JetHub D1
Date: Fri, 26 Nov 2021 09:21:28 +0300
Message-Id: <20211126062127.3084029-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_222414_555231_C675570E 
X-CRM114-Status: UNSURE (   6.58  )
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
