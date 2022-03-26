Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA89C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJEmucmO1z6GnpA9jsPagsnGac1j4roZjSGaMBUS+5c=; b=r1WD6tytowmSmT
	D105u/m7WQtBFP9EzJmrYhPZz1bHl++B7wkPss2AzxtqPxBNindohXtQLDofZO2R/yh/RG0p2VbU3
	vRj/tCdW++fnEQBvmBpBK7thAh16Z9ogYgKsXWN5t4a1Uqg1Ap+9+ROA+D16afYh1jTYvbxx+GJIe
	d0gHTLs+P0r2KNtDZiUrbVbUPW+atJaFUQZIxhtXqS2d9TrKHLWBcwclbjqxFvfkeX1laIDJjR9F4
	Ac9r/4h9zccfZ56uwl0B27f8jaI01C9iwAMimn9r9YDuEe7GMtPIKenIO99xauAN9j0Ks92XsGgep
	OVS5qyA1Q+bdS6xCmGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1DG-003wET-Hx; Sat, 26 Mar 2022 07:51:54 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Cl-003w2F-HI; Sat, 26 Mar 2022 07:51:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A4D4B33E47; Sat, 26 Mar 2022 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648281082; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=nuCjbgkU9FFpQwTWnRL3j5RAJbuDiSRCb5bADP8wamo=;
 b=Uyzw46ZaXuX2GlvUkyn5RWpWLU/TQ8AOYG5L3ufiVVi14LOIZwxQAwQLt+xVlZfL6XzBo0
 haRhz3LBv1Cbw5p3EI/6u1CQlu4eSMgAslOj8griWdCNGQCQYyS+/vItqwTelU3BOyoK9+
 WG+3mHDccZA2QV5WsvhCyd6b7zMbGcB4iN32KBZYfiwT1MgJSCMO2CgKRPSAWKVwsMNcra
 N3GHbllUqbE7bcHFx/26WvorwIWMLKvj+/p5N2mie1IIH8/ttO7O+1EelavxFb1QOhnSSB
 0rng3zxgojYJqDo4sCIzOV+oM29DZZnarzCpeMdj260Iu8pHmuTitFM2wJpK7g==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: meson: update WiFi SDIO in dts for JetHub D1
Date: Sat, 26 Mar 2022 10:51:10 +0300
Message-Id: <20220326075110.1462301-5-adeep@lexina.in>
In-Reply-To: <20220326075110.1462301-1-adeep@lexina.in>
References: <20220326075110.1462301-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_005127_929926_5A7C89C5 
X-CRM114-Status: UNSURE (   7.34  )
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

Fix the dts to match board's reference design:
- update the maximum SDIO frequency to match 3.3v regulator (Wi-Fi SDIO module)

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
index e52abffdf8cf..9d6d6dcb562c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
@@ -257,8 +257,7 @@ &sd_emmc_b {
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr104;
-	max-frequency = <200000000>;
+	max-frequency = <50000000>;
 	non-removable;
 	disable-wp;
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
