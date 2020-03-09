Return-Path: <SRS0=Mql2=42=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E8DC10F25
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 20:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5712464B
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 20:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bKCD12Xs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B5712464B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9C9JSpYemx9qPkhI12Dxj2ZDcxyzx+miMIUQqTFN8c=; b=bKCD12XsIblNtW
	+zxAxEyhjUyDZtOaA2eKnfw3axE9JMXyE7DxZ3cZKrG80nByFpX6GJPdCNBV34U5DNEBoKzz9ro94
	oT79FeO9RXlC8Ti3iPZod0C0h37uVB6lZRpMDn3AjWtbHxCGwCGw2twFO7FI72wsYmAEZg/4tJvYD
	phJjC0I9EtvnVoVrYMVYtKOQa5RqGA5G3wXm+ObfppcY8lvNxk0abBaP01M6bqvstM3XrYseDgcgL
	ZI8mWAr+elfQGcNkB5xp9UfRblFmoEFL1i87Y7gc5paFpdSB5BwXaXlYZJ2yjY3U2IdJxfMTLKNEn
	E5tdlwwl02rY6n9RYRoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBPPJ-0006YK-Rw; Mon, 09 Mar 2020 20:53:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBPPH-0006Xc-5M; Mon, 09 Mar 2020 20:53:48 +0000
X-Originating-IP: 82.66.179.123
Received: from localhost (unknown [82.66.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A0FC420007;
 Mon,  9 Mar 2020 20:53:34 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] clk: meson-axg: remove CLKID_MIPI_ENABLE
Date: Mon,  9 Mar 2020 22:01:57 +0100
Message-Id: <20200309210157.29860-3-repk@triplefau.lt>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200309210157.29860-1-repk@triplefau.lt>
References: <20200309210157.29860-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_135347_340037_B9DBED5B 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: linux-amlogic@lists.infradead.org, Remi Pommarel <repk@triplefau.lt>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CLKID_MIPI_ENABLE is not handled by the AXG clock driver anymore but by
the MIPI/PCIe PHY driver.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 include/dt-bindings/clock/axg-clkc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index fd1f938c38d1..ab04b3a94959 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -70,7 +70,6 @@
 #define CLKID_HIFI_PLL				69
 #define CLKID_PCIE_CML_EN0			79
 #define CLKID_PCIE_CML_EN1			80
-#define CLKID_MIPI_ENABLE			81
 #define CLKID_GEN_CLK				84
 
 #endif /* __AXG_CLKC_H */
-- 
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
