Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C59FC282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9E0208E3
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+Z06c6E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qvEN2oRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B9E0208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AA4mm9m4uSJEQMF+5I+UsICZiirPZrxUWV8EKFqFak=; b=K+Z06c6EgGBfGr
	3U/IQirzB8rNBhlWgYX5WBvSU01RbzPAF2eW5ukGf4SwvDXC/51JQFnA1NyVn3JMEAxh/9dt2UZ99
	ZNiXvFl4Dnzk2S9ekCUeyeBtEBzcFzyvECHAaZxRA02hCZzlqSCa6AnH/FGE0RR7X5GH5uQctn5Du
	YO2kHCk4SZyoX5djsKDt3qls3MJ/FFyfV+Qa4iHIv/AeEmPQwje03izUGRgKY2+axZEZAPy/4eJbU
	/OB037M8Gk9H4Iv9W+h5jSOeV2PCU2oRxrIvR0rSaR+u2TOdhChdAJU9e/vMandfDw/8k9QXSnvBm
	sMJukosf8xXrtSf5JhJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQVu-0003is-Gl; Mon, 08 Apr 2019 09:24:26 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQVa-0003QM-Aq
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:24:15 +0000
Received: by mail-wm1-f68.google.com with SMTP id n25so13873610wmk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPCsPseQBMIVb8GXk16egJLLB0THHe+Jag2FwI16saY=;
 b=qvEN2oRQgComG5lR//4SvQh1FjsGSWFitCflprTZKiZh+VDlvJXWKvMHXNVcdlupc6
 bDD0t7ZHFhSwB8AIaOsdJSHaesz2bxWsj59L/4BnbMoJ2vQdFD/XC0ShuboPLkRmYbew
 2MLexCvte3WZWoOLEUxHyruM64+t+7shcRjcLvBHeVesRWCshPVaL8e6dMTNuajbfbVB
 tCkPFStH4K2rV0tN172ntcgvMEaAxBmF05/PPO1Tj+61xofFP13PZF5+0Ej3WR9206/K
 8uNqxZVZpBFFRXELOUBVkCBSgb3vXNV6ykzQFBzjEGS4Dh/XSo77ymBqhKc2enPdG/36
 HkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPCsPseQBMIVb8GXk16egJLLB0THHe+Jag2FwI16saY=;
 b=I0n9w5MUeTkN9oAP6fNwNSbkuWrisZdIbHboAOaz3mmu9gEUgIvixxbgglrIPlTQ0R
 Mqt+eKRsvnn1JzB46/6nhl9ATRaOMSz8k9sFmL6Qo2T3Hpaa+yCJfyF29JZDNmPQwdz6
 WiNR08kJiR/WXxZd8p/53CVdn8S1+Cu/O7BhtvUAWOJFKCQ7K1WAZ+bQojNsS5Rnr5+M
 d4NpxOAt98nOuVge1WFcVkBD0la9/SNoxkjAiDQ/nzsjOmwv8xZ4zFMLalHz0jJBjmeD
 8P+Lf6T/MoUbvp6gy8jQJ7+3ip4RYR0nhGFiSRPsldOqz8bo/jdHoPTmMFD43PRYyS/2
 NXTA==
X-Gm-Message-State: APjAAAUF+RlR6q6hLznCem90JgFzWWG6xQTwoeh7ml7BchPDxEkjpRhf
 MgHP9T8rCDTUc4YUCcw56I3MrQ==
X-Google-Smtp-Source: APXvYqyh+RjyNILu+ZNXnY+tI1tgWVBIV0m+jMHwWvqy9ryRmkLHkBY4lLRACJ87KlQqIMsdTDGKOA==
X-Received: by 2002:a1c:480b:: with SMTP id v11mr16590842wma.25.1554715444219; 
 Mon, 08 Apr 2019 02:24:04 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j3sm70528221wre.51.2019.04.08.02.24.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:24:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
Date: Mon,  8 Apr 2019 11:23:56 +0200
Message-Id: <20190408092358.25894-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408092358.25894-1-narmstrong@baylibre.com>
References: <20190408092358.25894-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_022406_380541_A27DE429 
X-CRM114-Status: GOOD (  11.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
the other one is AO-CEC-A described by the current bindings.

The register interface is very close but the internal architecture
is totally different.

The other difference is the clock source, the AO-CEC-B takes the
"oscin", the Always-On Oscillator clock, as input and embeds a
dual-divider clock divider to provide the precise 32768Hz base
clock for CEC communication.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/meson-ao-cec.txt      | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
index 8671bdb08080..c67fc41d4aa2 100644
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
@@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
 to handle communication between HDMI connected devices over the CEC bus.
 
 Required properties:
-  - compatible : value should be following
+  - compatible : value should be following depending on the SoC :
+	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
 	"amlogic,meson-gx-ao-cec"
+	For G12A (AO_CEC_B module) :
+	"amlogic,meson-g12a-ao-cec"
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
 
   - interrupts : AO-CEC interrupt number to the CPU.
   - clocks : from common clock binding: handle to AO-CEC clock.
-  - clock-names : from common clock binding: must contain "core",
-		  corresponding to entry in the clocks property.
+  - clock-names : from common clock binding, must contain :
+		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+		- "core"
+		For G12A (AO_CEC_B module) :
+		- "oscin"
+		corresponding to entry in the clocks property.
   - hdmi-phandle: phandle to the HDMI controller
 
 Example:
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
