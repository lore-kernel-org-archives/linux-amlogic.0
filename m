Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAE9C10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5812147A
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cd06pMBK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HJ/Kh2VD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5812147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xo8jyzBdFduvMlOhqBB+PeFfOWD5WCuidUOJBrHihMQ=; b=Cd06pMBKRhU44Q
	Rpa0kFtkOB+Ox6Wjh5CdR6r7tGtD6ZO+cHiNmdJOHTqYNBNpT5ug75tlazs5Nka0S6khnW3ARd1q2
	oWIa1/uZiURQRAN/VQ+kJlGTXR2yb4Al36EOV3kAWyo7CBIRABCph0puY2d9aDHXproP5LCvQ1J4n
	fMf2Rgkv/upsrcR1hm1LZkDBWnVWf17G00OVEORzN2BRt30+fotjkOy/IFlHnW8FZWpCTF9rgoiPf
	LDHbB43ibhPXopynfVEXHlajvuWvOomc+vsVfDArm1v6kAXpD22k9Nt9CL1e8jj75XyL31O7f/KRD
	/bwg4ypXfT7DOyN2Q5nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFMGF-0000Yl-26; Sat, 13 Apr 2019 17:16:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFMFq-0008S2-Hj; Sat, 13 Apr 2019 17:15:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id z24so14732938wmi.5;
 Sat, 13 Apr 2019 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hh4yQhBPQBAdSO+xFdJJMR708sMAiI2dTB3FREcZ1hY=;
 b=HJ/Kh2VDa75prfApuD4ohFKbR59qt3c33FjtOX9Syf/JVbkhZspLRmb5DIIt+lheAs
 nWrn4rqtDiPcVFtE2lH2and3RpljIQ1OykU9DeRuGXzG9/Wf4wHIYq99mkrDVwp4duis
 XNGCFuIydP3UluqgcMxDdIzaB3o+O86RXSipzq4iSca5wRStLlkZl3LOyplX8jRpImyl
 ix8KcTtLR07fCoBGp0+QS3bdx2e7EgcDFu0NLPullRshvvU3nbDFBHxfytIfDjw7sVPv
 1VY5kzV5PNgtLr3Sgj4ICzys3q+0uMHolqGNadM/7CCaMcxa2PlUuDNa4XWVK7eAZh/c
 uTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hh4yQhBPQBAdSO+xFdJJMR708sMAiI2dTB3FREcZ1hY=;
 b=L/J4m04PeFxQxTasZOQ2+nav3XvC0zWuLDrd6E6vKEjvHBk6xnXzOPz1ObqUy5VM/5
 fhjiMGXdtJFPm88YKGkcNLyRm7TVYxneFeLu4f6fUwzd+Vn43JYozoHcLIwkyxyB8KWh
 wSmjZr+kBtfRkUt9wGesZIgAKLX+q4B6ZxoBs+yT+RlkzceQ3nZgdrr1lkgEjPkPQ6re
 XjDLK0y9jH+r8qKQO4aTYb3kZvDfuxpH0YfFFd2895A/zeb/82SLA0RFHb1ixtDtMbGw
 PuJIoUxzYadaee3lk5Wyr8p+HXC91Xm1uk8Y4CnDR10BLwFFEK2buGBzehsDfbETupTS
 /sdQ==
X-Gm-Message-State: APjAAAXetT9iGYBK1HiQnA4TF78+unY3Hxecasoam58p9r4DI/f6+6wf
 gh3qbW+vZOuGU8r9jhEHqJXIqPiM
X-Google-Smtp-Source: APXvYqwGOIyVec7OvKYIPCbs4ICpJgtfXHVwGRFw1T99hR9Eoj+/h4tXMYu24BOuFeGlD7h6IVpfIA==
X-Received: by 2002:a1c:e188:: with SMTP id y130mr15041584wmg.83.1555175748947; 
 Sat, 13 Apr 2019 10:15:48 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0010B8127C043607D1.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:10b8:127c:436:7d1])
 by smtp.googlemail.com with ESMTPSA id h84sm16745965wmf.15.2019.04.13.10.15.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 10:15:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8b: add the canvas module
Date: Sat, 13 Apr 2019 19:15:32 +0200
Message-Id: <20190413171532.25967-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
References: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_101550_851353_FE0081FB 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: mjourdan@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the canvas module to Meson8b because it's required for the VPU
(video output) and video decoders.

The canvas module is located inside the "DMC bus" (where also some of
the memory controller registers are located). The "DMC bus" itself is
part of the so-called "MMC bus".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 800cd65fc50a..f4e832638e9c 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -205,6 +205,27 @@
 		};
 	};
 
+	mmcbus: bus@c8000000 {
+		compatible = "simple-bus";
+		reg = <0xc8000000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xc8000000 0x8000>;
+
+		dmcbus: bus@6000 {
+			compatible = "simple-bus";
+			reg = <0x6000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x6000 0x400>;
+
+			canvas: video-lut@48 {
+				compatible = "amlogic,canvas";
+				reg = <0x48 0x14>;
+			};
+		};
+	};
+
 	apb: bus@d0000000 {
 		compatible = "simple-bus";
 		reg = <0xd0000000 0x200000>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
