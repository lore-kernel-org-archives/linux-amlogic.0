Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3591FC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 07:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJKVHeOVsZ4h3Y42NNUtA44iMBMhVyq+AyDR8geU+js=; b=N44i9/U75YJ9lq
	xekw40jzNMWLuJLT/OZvWdsC8AV6ZOXiWK/KvANwe7qDmeO72YsfcDEE0kP0kL3ZBn1h7hS6ZuEDJ
	KwTx9FeGr7zSB4biq9djdT4QD/Go/n2xq9xinlsTxGX28+PNVPC2rV3m/uIOfqWKlyyKqg29Ti75h
	Iay+9eQU0qMBNShg3F2EYToWbRKDdkaeHN3oS3Kr06w0kgs5hvaJmyXvunbc2c9nCh1KHKsH18wrV
	8ny/6XgUaYj3lJJJ6OzgveCuxsHpgruX2D1T9xZiNPVuwOAWuldMPAWoZPIza3n0jKAiuEpqEZu+9
	UU6Ef3eXtkpqkSB+6knQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1Cs-003w4C-RI; Sat, 26 Mar 2022 07:51:30 +0000
Received: from mx.msync.work ([51.91.38.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Ck-003w2D-7s; Sat, 26 Mar 2022 07:51:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0AAA733E46; Sat, 26 Mar 2022 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648281080; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=lMkPsT9wmYQRWVhCSgEyUxO6l9DD/Z5L18efF0PKVNA=;
 b=kpVE8K/GUTEr29vPglh/NXLZr1GTnRwE0ju4MrsUyJyWE2jDnjtYEm6O7UP3I7zVNzajby
 bd7oUCvhof40NcyGIbyH+f2U1d1xcOR3X6FOiuRQaHM7xjm+um6ffxnI5jmPJkLVi5mnGs
 Bf4YEDqO2TsmjpFD+a+stv8z1Us5RSag1vLuERF5CAyU+FS2nw4ybmNRBHqxM2BStTXbBK
 dduZhRQDd20Zb9Pc1gcFg5ZRzWjIx7KlZohzdI9txEFuTqJjsdUXtTgxx8kOxufbPbYkn5
 +pbN39yl4vRT3A80X8o5CPFpJ8G8u6b0pe+oMu+7nTTetTEtUavklIRwE8aErg==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: meson: dts: update serial alias in dts for
 JetHub D1
Date: Sat, 26 Mar 2022 10:51:08 +0300
Message-Id: <20220326075110.1462301-3-adeep@lexina.in>
In-Reply-To: <20220326075110.1462301-1-adeep@lexina.in>
References: <20220326075110.1462301-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_005127_917445_B1A79DA8 
X-CRM114-Status: UNSURE (   8.76  )
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

Change zigbee serial port alias to ttyAML2 for backward compatibility.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
index 52ebe371df26..66c1eeba8f48 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
@@ -18,7 +18,7 @@ / {
 	model = "JetHome JetHub J100";
 	aliases {
 		serial0 = &uart_AO;   /* Console */
-		serial1 = &uart_AO_B; /* External UART (Wireless Module) */
+		serial2 = &uart_AO_B; /* External UART (Wireless Module) */
 		ethernet0 = &ethmac;
 	};
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
