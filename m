Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C09C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5FE020657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hL31eIkh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uJO3zkH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5FE020657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0jUFkZQFZpT9eRGu0t0owtg5FLN4z+P5GMcgC8KSow=; b=hL31eIkhLK7vtc
	6eZmF9wXevkzWi0Q/x3RzqGpmMF/vIBYMajLQ12gCNv+wLhX6cOOchbqdQGl2/Gd6JmmE31y/yVkn
	sYv4ncHvZ38rCXyBag1Tt1ZLvX7W9EFNDkVd30rYKXH6fFd5njryM2KvJ66hMYEQ8GBuZJAk8XKO+
	XjE7BI+zmg7sIvWZlc/e3hvC2dKkN6fy71MWgPqOYkF/N4PSdvsBsdNOznWmoE3O4TrltI8m5m61P
	Ixu96S9yinWEecuLrSMRI83pS/W+nLMr661tQpT6D+NgesYXbh2N2mNVY6dpski6I4O1/JKlP66sH
	FNo8lKIGasgYvh/y1Smw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQ1-0007Hy-64; Tue, 15 Jan 2019 16:18:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPp-00075g-Jz
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id m22so3830262wml.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zS6abusEd1tbCFfrAeGVN17TpPkvvXIFwMbgr/8YcuI=;
 b=uJO3zkH4huosUvqjZYZdADs6mycFDjNcB4fPvVs+gx/FGvRrb32imPm8c9QRwOIplj
 vH4fABtzXK0UWF+0M12Nzpj3cnlk9RdoHs6HYi8CvL/YhpCJNl5uiIXiOKP2ZjUYMZWB
 HmFbkyOtWkyyc1SIxrJRYhlkd+5TXywxd1Na3+2MRwUKHEcBsmUwuKgy4/zAq3JX3VJS
 qpWiLvnueCPXiMXKxcPTkyIDoRiOGfedjbS9FswLMem0Trt/yUjxUAt/yZyEsune/qRO
 Ig1+i6s2zHitn/LHf5t9ae4fo6PdBXI1FG51GN675BQDxcnVwO9aqsqDShMo56TtbM8n
 zTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zS6abusEd1tbCFfrAeGVN17TpPkvvXIFwMbgr/8YcuI=;
 b=izaVbdzoz/kYxPRBu2fVOj1F4d6eGmSEoJJSBtzVMwzSYFr/cYnxHi+SbyktSC3LG6
 Pqc9SGAgN/UagrTIY2NgzcnNPC6FtQ3Jtd2huwVNELnAb7Q++SXXQdHCARy1Blu3HBg1
 CC4SmZo4BH2BPU20VGzbI7mOmLhEI5vCL5IsUMvfaYAKAdjjmjAxpyQBN/kN9aFxHZNr
 P74UQL/W7FDfXecGV/zF47koIXHw9ls9rOo8uyASY4T/mStHz0M2m/jW3JLLqC7nu6wj
 lU/qBFmuBjwvSV894XuvBO5zo5R6nZAvTiqMhfiDbglgfeHFtM1t8gJCH1WmAqd/tIsY
 QpeQ==
X-Gm-Message-State: AJcUukcB3nghn5XR0wayfSxpJXic2MN783Mzuva86fFDHgmQR1o0nats
 8MzUuOrF+C1I0ROM1+i0/GD7nw==
X-Google-Smtp-Source: ALg8bN7HioH7ubJnQNU3jBmIsXLmC/EvuwfVS/DatoivpTZZ7KApLolpx8yVTP6kKlbs+C89dRm3fg==
X-Received: by 2002:a1c:8acf:: with SMTP id m198mr4210959wmd.143.1547569091941; 
 Tue, 15 Jan 2019 08:18:11 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:11 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 07/11] arm64: dts: meson-gx: add hhi reg entry to
 hdmi_tx
Date: Tue, 15 Jan 2019 17:17:55 +0100
Message-Id: <20190115161759.1657-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081814_024211_7BB6DA16 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

There's no reliable way to reuse the hhi entry from the vpu as is done
in the linux kernel, so we duplicate it here.

We will be able to sync against kernel DTS in the future when the VPU
gets based on the clock framework rather than the HHI reg.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/meson-gx-u-boot.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/dts/meson-gx-u-boot.dtsi b/arch/arm/dts/meson-gx-u-boot.dtsi
index 868a573e2a..b84e5edba4 100644
--- a/arch/arm/dts/meson-gx-u-boot.dtsi
+++ b/arch/arm/dts/meson-gx-u-boot.dtsi
@@ -13,3 +13,9 @@
 &vpu {
 	u-boot,dm-pre-reloc;
 };
+
+&hdmi_tx {
+	reg = <0x0 0xc883a000 0x0 0x1c>,
+	      <0x0 0xc883c000 0x0 0x1000>;
+	reg-names = "hdmitx", "hhi";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
