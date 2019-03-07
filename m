Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31939C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB242081B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JeFbq6wJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TnjgW8Ri"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB242081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyP+PevKW7YUTjH1jAEsvQXEFuOzqPA5jocEh7hRTis=; b=JeFbq6wJevxWFI
	RyQxrbUAsrsmvqr4J9joOvwvVXaJsRvxAbIW2Mnh6qLrXsuMNhOocXBJo3e5mZqIuV77Qu4xya+UA
	0s7PyMdmR+9fjnwxgBUA/rq4zcxv3r8ihlxXp/XcrrT/CUR9p9zo893b0PZIaDANZRyse4pg5g37q
	oNjwiQnmhCROad3tpAwXWajMXM1PXLHvxPVDObIQUIh/RtLR1Ozd891aw3i9GW88HSfJ3Mw7W/yyQ
	BiHURRfYK/V6kRHixzvRz4GY8GzFQzfuOaNE4a6WCWx7uKHyruDBeTwvtiatryjfKBaTTlkDKj9PZ
	GELqR1ESo7bmpPqofkOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1tbg-0005v4-U6; Thu, 07 Mar 2019 14:02:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tat-0004jd-9P
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:02:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id x10so9287750wmg.2
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1TMWMcZ2gju9aWPi4sVcpM5P0Y4XnnG91Swh/yLEoM=;
 b=TnjgW8RibsO5fE6FaPH/e1Q5cPheNQETFNEUQRgcrmVzxEHAXXNxUWdutFr3lOlg25
 nO1/k5C9wMKvgqPcgenMK2XzM+uTlcbw79wPjNi2vkNB6Zzvfil2vRNFKkOyxhy9QWqT
 K5zIzZ9r/WrLBGEPIZgr1TG+q+VvQF1CbnEaOpuvxcpSIPrqPVkoipY5hKQbLUXF5H7W
 OHg9eFK0aDZuOJJErP6tZOH8YYS39ZSZW/PYKQ6IiW2wF06c0tvGi5Mr7vXBMLcO8494
 h1rOe0zW095znRsASSJWgVLe+qpUbzRqPUksg+zT6JVK8oAkCEmItmOKgONUUylgbQPE
 ZlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1TMWMcZ2gju9aWPi4sVcpM5P0Y4XnnG91Swh/yLEoM=;
 b=Fx0dkJJMUk+nZSAC4tWqEWgg18D1zzaygTElmglVr97bzlF8TFuoHYB8rY0nPPu9eC
 tVVQAX1D6PoLWmIwECGTdygrNBZ1Blbml7m3Aa9ruwJuf8v+SAqe9mvfCNIk6siPcEnA
 mZnchElLYL7B410D/8KeDTaTl/QsNh5aihCoOkJAqzfXwprxMuAIKBttuI1/Ii68N73i
 gFVS9vnZ/SjkRogr2DKFqjdW893rhcdK5wrt45lMLpgvmYIPIoztt7pBU79Cf1cMRJqC
 iWOd5TauE6ks+GsNuUI429VXrU6VzTYycJvubqdhwgDdg+9dH9ETmkp1yK4BsBAO8EFb
 61ag==
X-Gm-Message-State: APjAAAV9LCKEZym9TDtnBnoxyR09IYx5r4yHhnTAkuUYNBVD/Egx4BAa
 YNi1IwYJZe4OQ4Qjqg3k79m6hQ==
X-Google-Smtp-Source: APXvYqx/9WiONgfX7WxSX0zmZGGa6JptIQyZwOtRi/y+0BqYrz58K0KS478PyRtq6KUlq4uM/Dj6kA==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr5775206wmh.122.1551967313763; 
 Thu, 07 Mar 2019 06:01:53 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h137sm9892098wmg.41.2019.03.07.06.01.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:01:53 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 3/3] arm64: dts: meson-g12a: Add AO Secure node
Date: Thu,  7 Mar 2019 15:01:47 +0100
Message-Id: <20190307140147.22047-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307140147.22047-1-narmstrong@baylibre.com>
References: <20190307140147.22047-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_060155_399300_986CCA39 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the Always-On ao-secure system control registers node,
which is used by the meson-gx-socinfo driver to detect the SoC IDs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 191d31db9853..30aa618dce49 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -122,6 +122,12 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
 
+			sec_AO: ao-secure@140 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x140 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
