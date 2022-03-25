Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD4C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3ZY4z+MvQK3z6YlirxuvlFOq0WGBfE86dH1d76QkFo=; b=bBJwUNTEaAaifx
	C7m4tWpZndZKJtQpNhK39LUP1ZNOzO2TqDw08n82C1vRkVTJygAE25XCEemYNGnPgIrDWsj6ix8FM
	rpGDTfP8i64wHvcYkrAbrkSAl5Reil2KEhub4KzLgKNvEviH8FYmZqnNvz17MLxF/A4pD96h+Xn84
	EwFVgd8G70Qg111/lv4C80q9f0bo02K6sons2IdXsPbRE2p+3dhr2NNj30RQZ3t2hd3lhDiSoJBup
	f5EOO8RyK2BhfKjyfe5EOstXtZCSxOKL1MQqUXJxK+vijwiDpcgFgctpdApnEJ4R44pE/iYN3lBLw
	bZyI4n0PFyxA6m5RBLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnDx-002eVN-Cy; Fri, 25 Mar 2022 16:55:41 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnDX-002eJS-68; Fri, 25 Mar 2022 16:55:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5476331FD3; Fri, 25 Mar 2022 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648227311; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=pLpMNG0SWs3st76DKfa6QZLTGIHjt4Fvns+4D2L2hMw=;
 b=r1ZBTNPeJLBy8SpxNSlEfzInb3Rjq3A9BQ9dT3qaId6QqvRhng9ZY5u2PC3Sj7DOukqopi
 uH6TELRf1gFq7s3TK8tsVIdyDoYT+Urfo7dslnVKkCKDYj+iPhMhG3b/iKOO5nTF9oDjQq
 VpshXKcwEH+ELdVZNE/kBrJkWQJ3iCnfuMvtRdTTJFv2LAnMH3PSp+zujEQmu1SsjFirQH
 QeQ/1B00oweIV7g+MQb8c18P3pmeSRBBhOF10aeKRZWxjhqEdxyVLCuLCX61rEBEAzN8bt
 fKBCPR47OewDAh+LRHQh/ZHkWgLpQcONnROyMAY0QxMDXNc3bpyirlAWONMCBw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Vyacheslav Bocharov <devel@lexina.in>
Subject: [PATCH 1/3] arm64: meson: add dts bluetooth node for JetHub H1
Date: Fri, 25 Mar 2022 19:54:59 +0300
Message-Id: <20220325165501.81551-2-adeep@lexina.in>
In-Reply-To: <20220325165501.81551-1-adeep@lexina.in>
References: <20220325165501.81551-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_095515_431101_FC2E3379 
X-CRM114-Status: UNSURE (   7.15  )
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

From: Vyacheslav Bocharov <devel@lexina.in>

Add bluetooth node for RTL8822CS uart to JetHub H1 dts file.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index 6eafb908695f..a5ee7ed17efa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -213,6 +213,11 @@ &uart_A {
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
 	uart-has-rtscts;
+	bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
+       };
 };
 
 &uart_C {
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
