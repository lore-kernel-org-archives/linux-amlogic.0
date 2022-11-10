Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE961C43217
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Nov 2022 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ljoImq5QjdTyIwQUMkJOmSKwBz7yEdiCi8uU7OJw2s=; b=cXLHgdU4ZQ/jxC
	j/A0Hy2Y2hksAaoIOF+5VkdYbB3J7YEH71xZACA1zWxMGg2pibDgoTvrFnJxPE2aiDFiGM3CrLlMH
	OfvVYAUGfhZ5BHRdgN/Iz/3lkVpUYJwS+1PtfbABcXr4NNch4Oh66rxfjuq4+BfM2mJlgINIRw/FT
	WU28NVeVEM7l6f4ynfbbKhqSR1Ave+AEghxAY79kSnek3PX6y5PY7BLJCXzeqUGWYkYcyElYTvEbj
	1eGsahdjlTMWzQoVQiZmWUcoVu8hgsgtrPKzW80Ap9Cepo/YFGZ9a/lEh0fzDHHbjAOKuAMT5MH46
	/oATXqr3q7Ec7Thms+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93k-006Z7A-Fv; Thu, 10 Nov 2022 15:01:40 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93P-006Yw6-0X; Thu, 10 Nov 2022 15:01:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34BBB123168;
	Thu, 10 Nov 2022 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1668092468; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jf+vZoPV0FHlsn9qxpwdS7gnzfJHE2b58/441SOarFU=;
	b=VQY69PSkBelUIGvZKCjlAd2YccpcG8fqZekly+G0yFZrF8r0ErEJ487D4XUuI9kD3H+VO9
	J82upNxvAUq56+os5JMz3NM3WuXqVOWrzz5dX4r4I573Pe7/6oJ3UA5iLvp84r4ZdGBcTM
	0DlTZViQHgjFDQDg1L00+K1BERqUT6ZuyrSVcLolrQ9xNxojOasoMMFJ+g0mpblzpqSt6X
	1LuqhbRCsvk8d3k29GhcXCzzyx87FUJOykY8UwR2WkuSw+21iA8Yx9JF8Mom5u+s1ibnww
	NPKlSy5JVdAL2JSt+aPxbmx3q+eMV42QBMU4J/GY4SlnXC2yff8Qm2Y/baufhw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: amlogic: dts: meson: update meson-axg device-tree for new core, tx, rx phase clock settings.
Date: Thu, 10 Nov 2022 18:00:34 +0300
Message-Id: <20221110150035.2824580-4-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-1-adeep@lexina.in>
References: <20221110150035.2824580-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070119_259121_09FFF7A7 
X-CRM114-Status: UNSURE (   5.90  )
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

Use phase 270 for core MMC clock on axg meson boards.
Tested on JetHub J100/110 devices.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 04f797b5a012..0af4784d84c7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
 #include <dt-bindings/power/meson-axg-power.h>
+#include <dt-bindings/mmc/meson-gx-mmc.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -1891,6 +1892,7 @@ sd_emmc_b: sd@5000 {
 					<&clkc CLKID_SD_EMMC_B_CLK0>,
 					<&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
+				amlogic,mmc-phase = <CLK_PHASE_270 CLK_PHASE_0 CLK_PHASE_0>;
 				resets = <&reset RESET_SD_EMMC_B>;
 			};
 
@@ -1904,6 +1906,7 @@ sd_emmc_c: mmc@7000 {
 					<&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "clkin0", "clkin1";
 				resets = <&reset RESET_SD_EMMC_C>;
+				amlogic,mmc-phase = <CLK_PHASE_270 CLK_PHASE_0 CLK_PHASE_0>;
 			};
 
 			usb2_phy1: phy@9020 {
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
