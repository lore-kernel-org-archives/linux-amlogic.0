Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B26C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 16:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJKVHeOVsZ4h3Y42NNUtA44iMBMhVyq+AyDR8geU+js=; b=2EpcWteY0aBl5A
	+xuZUEvVNlhYgQ1qtqACZn4TcG5qYlQ8ueIx1PL6wcB3P7RxPvSmZsMaJPgokGimNXS5iuEF00JUK
	ODnuYxRrgmd4pRQSyfFEAPTTux6QA2Eu+y4Tha2f892DyJ2p0++yKtmxv3jBFpG3PgY4s5aosnKJx
	0JuD4HTMFKzPWoMJ9o+qd2HhrPNpee5TK3GA4i6qRP3PNnBWGSrhjenSsi2ndYtX3nb5ETooBxuYu
	ud492Yy/xwZ0srDELAi1to5IL945TngcuRqgPsQ9wrYAfW2N8JqO0lwmklHHVYP0UcZJF06qQwlS5
	gV+llfEAO36QO1yqh5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnDj-002ePp-Qv; Fri, 25 Mar 2022 16:55:27 +0000
Received: from mx.msync.work ([51.91.38.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnDW-002eJX-T6; Fri, 25 Mar 2022 16:55:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 677A331FD6; Fri, 25 Mar 2022 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648227312; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=lMkPsT9wmYQRWVhCSgEyUxO6l9DD/Z5L18efF0PKVNA=;
 b=dcqdVUFBtvhsacFMgAMkygcIlC6DX6JtyTQiKOlNvVW7ItoUlu9jRvO7CUo1Gbkfjp9sR+
 +2UkQ+xtF2LXicdMdspMCR41L7L11So7fW/nWK/OAlb1Gs77cV0BanUY724A31VsZP71s8
 ja35hInBOhj27KWmH2lo2tHZVPMlQ4m8gq9JK41YmGes8oDLtqkOulzOqijnS0DGUn2T4t
 poP1Rwpevyx4Yoywn9daf3jHIIXwHaGxiNgTGHu5GDtuHVt4o7nPCNOOMtVn6kyKm8eweR
 D7a2OqQeW7BD+PSiJYa7AbgtToPw7MtbFLyLc0EEIAe/o+js273bkk7TboUyrw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: meson: dts: update serial alias in dts for JetHub
 D1
Date: Fri, 25 Mar 2022 19:55:00 +0300
Message-Id: <20220325165501.81551-3-adeep@lexina.in>
In-Reply-To: <20220325165501.81551-1-adeep@lexina.in>
References: <20220325165501.81551-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_095515_101651_F9549CD3 
X-CRM114-Status: UNSURE (   9.63  )
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
