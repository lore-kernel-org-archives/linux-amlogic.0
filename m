Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14760C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xXK4gG1necdGfOgQO8I/YnhrxzfhpGW9wcZ8wdGnQM=; b=QPHqicIRW7IIIw
	vBc+SPz3ut4icwvTLSeIWhjjDALTPbCCuDsZbDqsneS1PMe0qrjtVlkY/pNSTJO0pUOyikbNpCK7n
	G58TwCOHdzTEpeMv2+/hbEDZ8PyLv8AIwcp5DMHXBLYc2wYXXe3G//P9C6h8AGUgjiSM9+WshKWOg
	e0mcI21N6afXek9YxClFuZ5AMnmsGM3uoiJFDx7XsyGGALYZ8UoH5DfeUbID9vulcxNsUJ7yCwZEm
	vCFz2XE4gL5JSe0f1PEta3O92iGUh2RR4SpF9sUkw7AiAs9vbxgxwE+BAPxliP1Y80ybpn3EA9Tb9
	0Eizfi8Z8K3OWsWOei/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1Ct-003w4x-KL; Sat, 26 Mar 2022 07:51:31 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Cj-003w2C-2h; Sat, 26 Mar 2022 07:51:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D999D33EE8; Sat, 26 Mar 2022 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648281079; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+tJf8nuvvl/dWidepuoxkeSZGp/4QTaRXiz6nB50fKI=;
 b=D3PhJBVmrglUJCndiHebInOqkMMUQ/iUWFBhuGk/b7bYlp99g+WN7GzNgU/jgelSLqrBAB
 fpaGXDRqIym47zCqGrhirZUfNuwXzZD1M/h9u4jTfOfIdPGBG8AVamX7bpPLTTQFCsIEn0
 mm8KSfBrVdDsl71gwbfeFEE4Xh9P0phSxFBUkJUtoekxNBGBAP3FvuYTZ9ISJ0fVyhjdwN
 X+Dp7WE6kBFIB99nHbpa9EJqtYfzR1Z5vvJMKPfE09kZIxl7zPS5TGllBGeR2hG+PK7FsE
 FpAPN8Psxi2VL9WkiMc+wE00hFP7fLHHm4KTc4lD71A73o5pDXnQWB/QqZj1lQ==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: meson: add dts bluetooth node for JetHub H1
Date: Sat, 26 Mar 2022 10:51:07 +0300
Message-Id: <20220326075110.1462301-2-adeep@lexina.in>
In-Reply-To: <20220326075110.1462301-1-adeep@lexina.in>
References: <20220326075110.1462301-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_005127_946239_8C3F0C48 
X-CRM114-Status: UNSURE (   6.07  )
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

Add bluetooth node for RTL8822CS uart to JetHub H1 dts file.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index 6eafb908695f..fcb304c5a40f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -213,6 +213,12 @@ &uart_A {
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
 	uart-has-rtscts;
+
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
