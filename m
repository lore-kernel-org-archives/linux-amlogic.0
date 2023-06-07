Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE60C7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3p0ELQI+d/9JQZ3zgovPsn9JTuLl/RvEMh87lDA0CKs=; b=GCWtxrOwvryNAr
	cpkhn0t/BOENc47lDkEB3qTSP/BKqOWYJh9VgzazKBYDKDqjbfavqNViakGgGwlsAM48rA4Xm5+Oi
	HxZ0MnII1R/j9tB2jAbRMjLvKzg0o4FbdlqfWMHpJotfayFrwAsevxujTY8UEkyQTYvXFZ1f+blWH
	Uhl/S3yDr7PicRyKlHMKjG3WsFNr16ug/i/dQ7+ROpdbUXB8jpuYNL73O9lZmditl/Yo17J4fsoPt
	vZ0lEkKQ3tfZ71ZdkcACp+VtAD+m/S46K5cXbV7D2ccUm+78BCMyVhLQTqOXFhlDycTxDNJZS4A+Z
	A2XdpucMQ8VDmSxY0oMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zak-00754y-1J;
	Wed, 07 Jun 2023 20:17:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zac-0074yp-21;
	Wed, 07 Jun 2023 20:17:07 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 41FBB5FD72;
	Wed,  7 Jun 2023 23:16:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686169015;
	bh=VVBMghSaus7SwxMO0wG80S4bhkxc+XRBu1rkfi7iaek=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JQWIpvSKAFcRo6IIvAjvdO8J7/Ya+0jKxIgsqQg9Uc/du+xHwEowEhFWpdQOD+HEo
	 rSyLukb8CnrPavC81nW184oBvm31UDuIVyrNj3FBUtE7StbzXfsBBGurN5HAGfKYQn
	 JWsSPEquJ6U80ZlBiHOn5QG05gatTbRwbMbCZIfOHYo61sdxlwcWlFoSJusfNNWjzS
	 VFONoP7hQRFLNfTSNZTxLUReT3rvpyqSSRkLWj8FQyfCZYmFCOwP5bbOzrAkwQy48Y
	 8tTSVaJuZS6Rk1/as5nUJS6biROPJJ5fkiHA2AAApHFmXn/abtbJb3+w5Hn/dAdnFP
	 JQutt8zKfos3g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 23:16:55 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Oleg
 Lyovin <ovlevin@sberdevices.ru>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 5/6] arm64: dts: meson: a1: introduce UART_AO mux definitions
Date: Wed, 7 Jun 2023 23:16:40 +0300
Message-ID: <20230607201641.20982-6-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_131706_849894_3A22FA67 
X-CRM114-Status: GOOD (  10.03  )
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

From: Oleg Lyovin <ovlevin@sberdevices.ru>

The Amlogic A1 has a UART_AO port, which can be used, for example, for
BT HCI H4 connection.

This patch adds mux definitions for it.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 0efd922ca7e1..3eb6aa9c00e0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -118,6 +118,22 @@ gpio: bank@400 {
 					gpio-ranges = <&periphs_pinctrl 0 0 62>;
 				};
 
+				uart_a_pins: uart_a {
+					mux {
+						groups = "uart_a_tx",
+							 "uart_a_rx";
+						function = "uart_a";
+					};
+				};
+
+				uart_a_cts_rts_pins: uart_a_cts_rts {
+					mux {
+						groups = "uart_a_cts",
+							 "uart_a_rts";
+						function = "uart_a";
+						bias-pull-down;
+					};
+				};
 			};
 
 			uart_AO: serial@1c00 {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
