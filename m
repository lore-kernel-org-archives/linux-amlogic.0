Return-Path: <SRS0=/Yv9=RP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52672C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 08:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F35214AF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 08:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tF5b6TwL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3I4+3iP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F35214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KwWMYJECLr4dE+K2ZTozRHCPsXKFr/qatRMqKXTlEvc=; b=tF5b6TwLQG5cPp
	HAkLOhMRTpVAbSMN81VU7zuRHHDfxqoKDLaXEW4kJ0SFOAqkttt7AZJvygRrGpDnmAs6AyTnStFU5
	Urr4HFCS7A1+GAd8FuWzbZVMCbF8dAjYAqFQb9XzkU+t7TYPzYGVYcPVWRyPGBp9FvO7AudOSCY8U
	+wCtZ6m7bju/Tyo0zGeGECJMgxi690LypOYqqVjDLhUWavK6yZuoFR2abtwu2FhS2HjdVtMqbxT8/
	65tOlUHvIZXBXcfZZ3zSBghu8LXvlSW2ubFMQQ3KzXE3tT7lel3dljM1//yDKe1C9O7hdP52mLc++
	Fru2hdzVvZcnEhVE0EuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3crO-0003vD-EE; Tue, 12 Mar 2019 08:34:06 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3crL-0003uJ-EV
 for linux-amlogic@lists.infradead.org; Tue, 12 Mar 2019 08:34:04 +0000
Received: by mail-pg1-x542.google.com with SMTP id v12so1289026pgq.1
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Mar 2019 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YaS6aHe0kRTPL5Iqbsoq/7uixJilo8Mg28xKFsRpmY0=;
 b=h3I4+3iP0oUEuI++w5E6dcBVUOPlYPWOt0W2F5/k+Is/p/g2MPcAL858+xgOxv1mZN
 5EZ+FGjafrQ9VX36lbM5WP+qMMb6UMHHm2EbiYcAhIBz4j+jj7KwxVpcXSXXpcxtPqS1
 dOukY1YaD3czqtwNcXZmX+3+g0iZO6E3uvsB/A6JG5vPbXF+1YlHoq7oFfBNfVgfTtqy
 /kpVfkHVvNAmIMdTUdZM5kUURIGs3qJVgFz+zpVxmhuYxIzsFLwI2EyRQXeBRrU34GRg
 MaAToQX5zcKFR4UTRCTfMyJrIoG+31he5uNQ3Bj87Hrxi9bl7FPQHxBo/XbsHv1nm3lb
 xAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YaS6aHe0kRTPL5Iqbsoq/7uixJilo8Mg28xKFsRpmY0=;
 b=bCwfeEW8uH3PG0sF3L/kaS4CnFDsAJQvtY41IE/CKLLaHhQLBdSujVZzQPxiDvs9PW
 bSyA8FqDb2CDk5l9YRag9O7KAbaW1lN66803E50cfXsNNFj4H87RL//AwKD7I/q2LMRK
 amj6MAKoRU+hnDxCUh6voZQPD9YKbBaQXxclFac8HmBvHR6y2wKw3S98eQHzUqSF+92X
 jW+mCAb8ASaUuc21hd1n5CrO/8MbfLRZUrHbSgrUTNwUjZjeFQrQUWDFzF9NpWRQ49h5
 rTC7QtklgYg4A8oRQvBkWrPN+pSuGLnEEe6BH+FuHuCYUrVXboI6IoP626jYMrW6CR0U
 sBHA==
X-Gm-Message-State: APjAAAW540MrVCb6dRkeHXszelS1XY8+QIbNSNUBH3dLLZ3TOZ9bknqv
 qw6Ygjj4cEGnWJBPRnflvEM=
X-Google-Smtp-Source: APXvYqyZhZFrYKrnAY5RjwZZj7tRDVck34+l46DWwBI7q5YeV2e0Rgp+wv/t49m58PL5O0JGP7QKmg==
X-Received: by 2002:a65:63c1:: with SMTP id n1mr33652298pgv.339.1552379642272; 
 Tue, 12 Mar 2019 01:34:02 -0700 (PDT)
Received: from GuoGuo-OMEN.lan ([107.151.139.128])
 by smtp.gmail.com with ESMTPSA id v22sm15605576pfa.49.2019.03.12.01.33.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 01:34:01 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
Date: Tue, 12 Mar 2019 16:33:26 +0800
Message-Id: <20190312083326.18029-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_013403_511172_CC3C9F9D 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There is a white LED on the front panel behind the logo and the
manufacturer uses that LED to indicate network and USB drive status.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index 9a8a8a7e4b53..b5667f1fb2c8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -14,6 +14,16 @@
 	cvbs-connector {
 		status = "disabled";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		status {
+			label = "n1:white:status";
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
 };
 
 &cvbs_vdac_port {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
