Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE174C48BE4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77E52084A
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QvGYVKzB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G+jGjIMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77E52084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emDsahoQAxvR1NTgxIXrOBGhwTpOMn47FVvsj8mG680=; b=QvGYVKzBoj7OMO
	ZN/9j02oK7fp8Fxi8x1MMSOdqjKyrSfsmfQ3ZQDZow+hsR8iXLZGsI9JnD2SjlWMa3nCvc/jTdtem
	zq9uPNFTdu3DQXt0q02cpmpoZzw3uDDkJOFQeD0v9sX6VLL1L940e+2+qLtcSwP5FHfnveajMMjWw
	j7ayQ4oyrTXOjzBrdn7Qh4VCRjXjyIDnpvqAY/bpfxP1eaYO53bAGLWwABWVfSOox53np6oLbfDFt
	TOBg3p9m0Q7W8DELBPZpRz3SdyW48rKgNe2KKzTc2+K4Z2sjoP1MOfbh9VZv71EewXL6Niqgjw+ER
	L3eEFHRPiUvOqPoqssTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdycE-0006SA-OC; Thu, 20 Jun 2019 15:04:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyYD-0003Hk-55
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id s3so3409576wms.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
 b=G+jGjIMvhLDlHlsS6ZUQa62iQPcD1g9joTMkE88tdYoN0qASnjniGNFYJPZU+MLSCX
 H7EPMSh7fkUYj/ww1ZZ4miAqZl1duvLB+21CLWFEY9BOKNgXt9caf9pxRR0j94gTykle
 oZzT0WdZTg3PVn2yUYMarDfak4tAp1QeolW/5s6jNYm8aZxbPu/oQRZCVsjn8zZDkjR3
 g9qrP/pXJWwTpDIiKG3L5k4I7FRfpiQ4v2MH31zO/f3/tgspZsezciharlR3DlUw9mXJ
 0aaBOLMZUcIGomlBEMSR0QE/fZONdiICEkN1HZ0hE/PFo6spyeh0+0S+2jraLAi9vYs1
 AMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
 b=TSSl6h8/sNG56grMQY2UX5temTEzJqmNAzcs4Lmq2xYo1M3eQ6p5jM8e6wf0XL+0O8
 INqXWEMMqO0XUPjQXXV9FeOREqYW+XYEzIDHWRWLpruEO/HWRIFQK1OlQhSeVWlXf3HF
 T1Vhy41+xmDHGYdQuVTD44tJAEpEQ48feQ5I4ZmakL3p8DdqcsYuu/cQTp2frSdDqEmW
 ou7Pz3bEhcNCwlzyRPyjVoMGWy1PMvQDJe6/5q6zQacdda9vZ5fi+PMEkwJd3mutP2B1
 F2dyrsIGhV8LPPf/c+FEJL7irzOey/h4KGDHWlVVwDaDt/RkveQ9OSzkNlhxW8vqEVLz
 FZdg==
X-Gm-Message-State: APjAAAUM/RKk0s7hDY5T6PvTME3XLaIqWlpuW2pU+srH88Ku91bQQEjb
 /PTl8frdjr67zoB2MzwzdrIHTg==
X-Google-Smtp-Source: APXvYqyB0M/8J7elbFZ7JqzPsyIKsmt8dD5yRCndjrBFTtmLDZMEgDCJQgbv0JCT6BR9I/9CVeq96w==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr56296wmf.154.1561042831759; 
 Thu, 20 Jun 2019 08:00:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 10/14] arm64: dts: meson-g12-common: add pwm_a on GPIOE_2
 pinmux
Date: Thu, 20 Jun 2019 17:00:09 +0200
Message-Id: <20190620150013.13462-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080033_212444_F3E288D1 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the ao_pinctrl subnode for the pwm_a function on GPIOE_2.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 2baa04303762..76484801478d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1984,6 +1984,14 @@
 						};
 					};
 
+					pwm_a_e_pins: pwm-a-e {
+						mux {
+							groups = "pwm_a_e";
+							function = "pwm_a_e";
+							bias-disable;
+						};
+					};
+
 					pwm_ao_a_pins: pwm-ao-a {
 						mux {
 							groups = "pwm_ao_a";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
