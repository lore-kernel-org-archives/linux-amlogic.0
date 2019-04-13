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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686BFC10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389132147A
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4uNKa/2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GO3cnXo9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389132147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3hG9UaZz2I4yTW9YxzDsit0B50Kh5sFUR4mgerhbhs=; b=q4uNKa/2Fdn6iA
	8TwRQIQYtGWUakMgjfQzRrEbchMmMzzDxVwWJvwTI++PrbfOxYkJC4UXtofuRV0Voruw8Dm8S+lUT
	iQ/N6BVL+irBKrIdRB80AQPDXFA0tuTgnKzNaDpXzX6tfl8u1abvpequDDJhS1S51VIn/g2+PKa0m
	q14H6p1f9PF78iehQBUJeS+uvWkLwXMASq8qmQgqXn+yBazlY5k3h4qWOMASa5iXKm4Cr4LdTrwHQ
	nje1dIpoI4yFmkuxOK7ejjZuVAIk6gn/dqH5m7O6mz1O0OY2mCN9gc4NmRU0KIwedqSjdevLUPamE
	qb9x0HLDdjoMW2z69AnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFMGA-0000Rb-HN; Sat, 13 Apr 2019 17:16:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFMFp-0008RO-En; Sat, 13 Apr 2019 17:15:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id h18so14643956wml.1;
 Sat, 13 Apr 2019 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9E4DqO8/055EQu/UGPx4DBiSsBA4UG4QMItls5PqPKk=;
 b=GO3cnXo9kZsGfjtyf+gzqQgQqYKamzRbp9AIl30FP6zlcfwC6HZWxb+96HyFGCl/tC
 tAaExNm6/xiVgu+fE0uxop2J60+7hva51T4Kz+rJedJWFAIKwHSvizMYADo5Fm/fekLg
 jIHpKhjdNb+dJeBIfImWiMXlo16mtyhB9LDCbBMVND+Pmw4LvaPq0TTrARRdhObm6FFN
 i6mp7QEGRi9atbWrsbtLBSz3HMKg/U1BVMXua6Xh9Dl9urx07XSgUAC6ZRplI6xbJw4q
 9BNbwvf4A75wQKN9ZsIRW1yDgi7RKvJTcrMJvfrHU3Xv4tn6ywh/Q+TgH1RrXRbz8LfQ
 Xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9E4DqO8/055EQu/UGPx4DBiSsBA4UG4QMItls5PqPKk=;
 b=QcIKc1lPSvLoiT3K/i3wZi3oQKtjBYVfKcjBnwKey+iZXUqgjjWKqZ1kpir4KvBSIG
 D8B7MaJSj6Ta7BXvJctLzaXooctWHvnHT0prghG9BrCisBkQcC6RdZnXs3MRo4hhvIYR
 3nNYdpocJ+KEtCCXhP49a7pr1eyUX/VC+/5VkLiGWPXF/G/A7ufFZ6twHbhZkSx3h5wG
 iOaeFzXTAhhKMNAynOdsya2U5G78R7ixftjKe4nF8bggT5PNdggTnagfkYM3g6Wj3PMP
 6fB++fnHjRipQ2n83oAu24NCBRXrU9CayQF7wEcYiLGcz9lmmL0EgMNVRSagKJQOWkKD
 wJjQ==
X-Gm-Message-State: APjAAAWG94Tu4+P5S27wClDNiB1R6oqzF3ZZpOfhDUcHQKcHAOy9n9G3
 ++m+C6IdWWGYsQ4DvpQ6oprB3H+D
X-Google-Smtp-Source: APXvYqwqulVeTNBwX8bThrfS/jug+deJWy/IZW1GcRXa1i2SC13VSB4fi9ZufadnQs3W+sINIixmXQ==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr15272538wmm.88.1555175747733; 
 Sat, 13 Apr 2019 10:15:47 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0010B8127C043607D1.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:10b8:127c:436:7d1])
 by smtp.googlemail.com with ESMTPSA id h84sm16745965wmf.15.2019.04.13.10.15.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 10:15:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/3] ARM: dts: meson8m2: update the offset of the canvas module
Date: Sat, 13 Apr 2019 19:15:31 +0200
Message-Id: <20190413171532.25967-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
References: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_101549_501067_FC6F46E5 
X-CRM114-Status: GOOD (  11.83  )
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

With the Meson8m2 SoC the canvas module was moved from offset 0x20
(Meson8) to offset 0x48 (same as on Meson8b). The offsets inside the
canvas module are identical.

Correct the offset so the driver uses the correct registers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index bb87b251e16d..e88c36d47e5c 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -14,6 +14,16 @@
 	compatible = "amlogic,meson8m2-clkc", "amlogic,meson8-clkc";
 };
 
+&dmcbus {
+	/* the offset of the canvas registers has changed compared to Meson8 */
+	/delete-node/ video-lut@20;
+
+	canvas: video-lut@48 {
+		compatible = "amlogic,canvas";
+		reg = <0x48 0x14>;
+	};
+};
+
 &ethmac {
 	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
 	reg = <0xc9410000 0x10000
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
