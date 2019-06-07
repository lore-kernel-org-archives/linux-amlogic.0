Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51441C2BCA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 19:43:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F1D20868
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 19:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WkSjEgfr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0oUCfe4A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F1D20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DiV8sojb8lCZGzCLiGkowHj3qz7H8pzf64gSd6FacAs=; b=WkSjEgfrvpKpiR
	ADTP1j+j2Wh9FuSZQq+3+bq7/ZUKJChqoVduJpODUudP4ssGD2cNN1FWVE39tLmc9lAEm0ukD29Bw
	76bThZNHODDybskXyzHa116mYrDFWZa+MQ+PUQEwpaJDO0eiX2D6BGVqNqXDaaVazLQgiv6eUxVZE
	BFzE8WNiE5x1MfOxGPDSpx/tWELonp2mFDXG3G7dEG7ld1x3/F1wKt13H02v634BwB7VlO6RyijY4
	BsMjkx6syeCFEZrnWQF53bi3tS/QZIP9AHJE5Wrac4wfwaoqLkEoxUBZbflnK3T7weMTb+7unY/iy
	xg4FsVKgvrTyuYnBXpEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZKmB-00007s-Ao; Fri, 07 Jun 2019 19:43:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZKm8-00006d-Dy; Fri, 07 Jun 2019 19:43:45 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACD9720868;
 Fri,  7 Jun 2019 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559936623;
 bh=tFAX1TrUh+zWhm4cmBHIYK3G5smuy2djcrTGV59Ksuw=;
 h=From:To:Cc:Subject:Date:From;
 b=0oUCfe4AFMgIqpLhsK2SHdwXSoWkt+P20/GrYCplr6QfJXa76J7i7SRSkPx2TloI3
 epYMnraxb41OXVZvSeBI71eWnQWkNU/VlY0qfL2tTCNmFOX2EkIT+SS6RFNmF7ui3p
 cbaYb85XTpJX3G1h3pDJN5LREahcfvbK12lP7dns=
From: Kevin Hilman <khilman@kernel.org>
To: linux-rtc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: rtc: new binding for Amlogic VRTC
Date: Fri,  7 Jun 2019 12:43:42 -0700
Message-Id: <20190607194343.18359-1-khilman@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_124344_492116_A98D31F6 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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
 .../devicetree/bindings/rtc/rtc-meson-vrtc.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
new file mode 100644
index 000000000000..f02886179788
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
@@ -0,0 +1,16 @@
+* Amlogic Virtual RTC (VRTC)
+
+This is a Linux interface to an RTC managed by firmware, hence it's
+virtual from a Linux perspective.  The interface is 1 register where
+an alarm time is to be written.
+
+Required properties:
+- compatible: should be "amlogic,meson-vrtc"
+- reg: physical address for the alarm register
+
+Example:
+
+	vrtc: rtc@0a8 {
+		compatible = "amlogic,meson-vrtc";
+		reg = <0x0 0x000a8 0x0 0x4>;
+	};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
