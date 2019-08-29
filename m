Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03664C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C212073F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fqcCL4Rf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xdD1rGlC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C212073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIgSQ7snjkPIXXV7daij2ftNCfyjATxkHmv0ooCbEho=; b=fqcCL4RfM1GK40
	SIhgEz1ykpvmGRIrVCZPMMURQHSBHGzi9l6AcY1bn9idhJ7abNVNwO72/BXMRxOPlftM3Xzu/nKOd
	cmp6Blqvo5+ayasR/QrAcigVkOSAq8ZCE7LiTtrS4K+myAP+RZH6iYkRufvHthCSAF4URPL2lZX33
	hV+nVWZ2QwEH1SAIataVr7ChUOuawIztjFJX6G+j9VBwZv56PthPMMZYoqAasZWszBUnithP1nc86
	AoKlhXladruWPZkonh0O2HKfKztQh2G2BNh8yh7mRr8d5UBIWoucM5jSCctAwciRFcZ68xmlGVoDL
	iSwQ3tOJJkh3BUM+ckWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MO3-0002uV-7x; Thu, 29 Aug 2019 15:30:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MHD-0007Ug-Eq
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id o184so4292128wme.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNct68VLdvOJio/5Gf7jYfAx8Jm9CSApcCCK+DehTpM=;
 b=xdD1rGlCDppR2G3tq2+Afor02L9Lnru3XcK4gyu03zLYhux3tnOdWcFA9uaXQG1WnU
 6Q4JYSRjbgvCJBFE0gGwUjt7zre9uwnqq6x6fhFiPZmRYjPVZM6iKe1zQR1VN1nFM4Z6
 K/Re2HoM/+UDeEl7dWjG/IBG7hBzvQSIl4pHaNAVkoSThZyrK4OOMpL3Lq/Ovu/DqUUx
 U+juR23BbNDF4W3Wtib+cjCxGvo1/0iBqroAuCbSnklMvi5vUfAZful9aqjUHt3Pb+Sz
 hYj9u0IRN4AURaJohbzU3iKogFKWMHH8GTjPDe/Yem4auNrMmWnPSELLHfn/IC6oIYcj
 DB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNct68VLdvOJio/5Gf7jYfAx8Jm9CSApcCCK+DehTpM=;
 b=eoPYYhghyfT0W3wJdvTzPUs0UM3aN8fhcu01PfIaR4+AUDzTXAvyzvZH0atJPXXT/n
 2Y8dHzGStZU/VygJcygeUU+CDR2G/CsIaZXLmyzo881x4/ytc3+I1z+yWrcAxp+ayOmA
 3OXuk6KnLUz1LE8xyKGQOxIvwQCR9QJj5QrWE8g1VPOX0snz50cFJDCkLZcHF+RPtnUz
 zsJi69a24iR2y3IQu6YQb5aF1FMoO5/Q4c202LtqekjBNjP+nuURNHs5whrGYdGyl8E0
 yFVCNMH3ABZgxVb6jzgTSvDmlzwVnsuZMnzExc4MxwpN7x5Sf34rGXDb3t4w9OVPD+sl
 A2bg==
X-Gm-Message-State: APjAAAU6tVyff2KTYyAMZPyLclbjZAwSJH4TjoBBkgvJ2iGII7r4VbeV
 laKBIUkTv5f9G2YBG2w42f/d8Q==
X-Google-Smtp-Source: APXvYqyxkniha6um+qP2owGsl3mhEShJhy9rrrm7n8jV9cz/FPjsOQkUroI676R6AzEmgachU49oDQ==
X-Received: by 2002:a7b:cd0f:: with SMTP id f15mr12604588wmj.86.1567092234111; 
 Thu, 29 Aug 2019 08:23:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 14/15] arm64: dts: meson-gxm-rbox-pro: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:41 +0200
Message-Id: <20190829152342.27794-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082356_351977_F3E6428C 
X-CRM114-Status: UNSURE (   8.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 5cd4d35006d0..420a88e9a195 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -148,6 +148,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
