Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09009C32754
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 04:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15E121874
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 04:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="edRK5nlS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tW2K1z6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15E121874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RawGhtmtfku+eux0/BNEAcRY3uHwhnJx3ULokoQXoCI=; b=edRK5nlS+C10ih
	OxwVucPnwXsZQUToLSQeuI6XMC4T1Mhy6jRe/1JilblDE7ra4aL384EtCGPJltKVDBddYWQFTc1lK
	Ymma+AS2N3ZQc8x7vWmj6NZFs0gBk+PXRYbpXK37iCvxm86UTFumk0zrnw+cuOKBxkRBsuKO5qP1M
	n/vB4Gw4Ccn7ndmrpL7OqI4rRaFQYnE9lSxIJbAQKc7S0csR88LBqeZnG5Ed/N+DDqj6ngUOP+1yL
	esofY509xcGGjkVGO4I69X++yjbQtbI8EdC03aujAjFAUMsitmILPZJ/ImwZPaS795QusNVHSHcfQ
	oNSgVF3+2VVAuWJEMJ7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvZy9-00061v-R5; Thu, 08 Aug 2019 04:24:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvZy6-00060l-Jo; Thu, 08 Aug 2019 04:24:04 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 453E221873;
 Thu,  8 Aug 2019 04:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565238242;
 bh=b/37VZhb7KhBpMC7Sb2HOSR7wSybN+U8MyNjuHCYizc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tW2K1z6aO7YUMZT5LD8LTxDb/BxTyr/IgsoeGLmXLt2MLg9qiMRBRnXp037Wy1PFU
 vulZN3s7bTj5JKnuTHzHPRnIUtX/pW8/64SKXu196q/r3lRH6v9882rfalDMc8uD3s
 w+NuthU+oUry9ReZ3y4MuCC6zclI59BITOxHXtq4=
From: Kevin Hilman <khilman@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: rtc: new binding for Amlogic VRTC
Date: Wed,  7 Aug 2019 21:23:56 -0700
Message-Id: <20190808042357.4663-2-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808042357.4663-1-khilman@kernel.org>
References: <20190808042357.4663-1-khilman@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_212402_669896_DC78CB14 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

Add binding fo the new VRTC driver for Amlogic SoCs.  The 64-bit
family of SoCs only has an RTC managed by firmware, and this VRTC
driver provides the simple, one-register firmware interface.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 .../bindings/rtc/rtc-meson-vrtc.txt           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
new file mode 100644
index 000000000000..c014f54a9853
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
@@ -0,0 +1,22 @@
+* Amlogic Virtual RTC (VRTC)
+
+This is a Linux interface to an RTC managed by firmware, hence it's
+virtual from a Linux perspective.  The interface is 1 register where
+an alarm time (in seconds) is to be written.
+
+Required properties:
+- compatible: should be "amlogic,meson-vrtc"
+- reg: physical address for the alarm register
+
+The alarm register is a simple scratch register shared between the
+application processors (AP) and the secure co-processor (SCP.)  When
+the AP suspends, the SCP will use the value of this register to
+program an always-on timer before going sleep. When the timer expires,
+the SCP will wake up and will then wake the AP.
+
+Example:
+
+	vrtc: rtc@0a8 {
+		compatible = "amlogic,meson-vrtc";
+		reg = <0x0 0x000a8 0x0 0x4>;
+	};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
