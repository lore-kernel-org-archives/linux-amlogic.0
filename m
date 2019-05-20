Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C1DC04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31371206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lVYjqddU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bsJhe6lu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31371206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CG7mA0v/wic4FZaOo9yNVQWDI3qPRf7kRzBW6OsSy6o=; b=lVYjqddUhTG0rn
	4/+29gNps8MCOxF0Oqe+JO484GpXB+WK/ToKJlBfgfqw73nsrzq6o8c2C3X0laUq7DUsSWoi7nthU
	ys1WXL6/roD5MbnHCE1xfY5J8X/lIMQugrbVus1N4zdGcJIxtnzIGU0neYCGhUEGEXTEGzEyRmvkj
	O/FqGK8GF6kajFeuckCjSbrpCMBrUEp0t1Ir2uLhT6Kl7YUyHog/9RS0tUxA7Ah27Inn4WOWn0gJL
	EGXgsblxzqYXdW6WwzCmLwdQUOOTgWMYThtEh1Fk5A8NVGq/mCSy7rzo5wdRkLpPCAXzl/WCoze0f
	qhOxuzKUOdA1LioIzKWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoCn-0000xf-9J; Mon, 20 May 2019 19:44:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoCc-0000l8-UB; Mon, 20 May 2019 19:44:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id w8so15930793wrl.6;
 Mon, 20 May 2019 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfGgUjPbd31Ss7/rk7zFjMjprcKV+dr6vtdFkBjPbQI=;
 b=bsJhe6lu0EYb7AiOJA9l8BMIFOl5jNy5IyVsIaknO+hu31Fe1Yr1nLSe9QxcSJxC2u
 rbbVXuvcvGdG65k0e82429secn1zvnv8zSjZTTahAInSylnGl0lnvn85EMHzmtQ93xZ1
 kMgmt/n0dWO8zPRN8qheK0OFFgpAn3AJRCqrCObu/5q7zvy8PTkvL5iLx7FGqupIafQV
 TiNq0sowj6PB4ZtsCUgCjg97m80pePy4uZQGnhCeZJXykq41/p/iVD9ntAMw3f9PR4+d
 iJTMgj/Xzrn4YCkUyqPfjrY//r7vpw1z3X0eBjUSqoOv7bAEFlMDGUjkE/0JmiL/3b0/
 0R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tfGgUjPbd31Ss7/rk7zFjMjprcKV+dr6vtdFkBjPbQI=;
 b=d4bT1Xpv8qHDSkBUugqw7Sfd6sdhbsV7ITZuDOrU7/6W7Fy0ewawn/b/56aFitYGNJ
 tbTXzd5qSyL0mV1WOCKBgUBDdMJQ4xmDOB8ofq7NEh4q851Gz23M1YQp6PfJZm4F2zm5
 nDLhajQov7REQw4gZnMGUEfIQpZ4T2MemG5M2gBZIlfzeMAc9AL8qUxtd6Um4QDFYcdJ
 P4lZkx0+PbSX80zzZEyp5cwv4ipicNf9TsMJ6pE0Ga6aX6Q0QonkWjTEwgotdXyXxoqX
 IzvlK/DD0pAZ9esQ8Mp4XODHdFahMqPpYufMlcNe96y1G+gFWYlwtryYAdUvGbCXI2rQ
 TZBw==
X-Gm-Message-State: APjAAAW1gTigJ8zceevRsKPPZgkRtcYJ8uHq1VhPFCh3/jYAJp8YtSa4
 GUbjcbFuqazkpO81iJFh2BYMdH26
X-Google-Smtp-Source: APXvYqwx3+Y8miEK9uW+Hm0SSs+kVKPlWxA+6K/QvYcvrofGjMRU2+ZOFUp1ani97eRcr6KdL3GYOA==
X-Received: by 2002:adf:8385:: with SMTP id 5mr31213005wre.194.1558381444916; 
 Mon, 20 May 2019 12:44:04 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id p8sm9135352wro.0.2019.05.20.12.44.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 12:44:04 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: soc: amlogic: canvas: document support
 for Meson8/8b/8m2
Date: Mon, 20 May 2019 21:43:49 +0200
Message-Id: <20190520194353.24445-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_124406_968764_CFDDF746 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The canvas IP on Meson8, Meson8b and Meson8m2 is similar to the one
found on GXBB and newer. The only known difference is that the older
SoCs cannot configure the "endianness".

Add a compatible string for each of the older SoCs to make sure we won't
be using unsupported features on these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,canvas.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
index 436d2106e80d..e876f3ce54f6 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
@@ -2,8 +2,8 @@ Amlogic Canvas
 ================================
 
 A canvas is a collection of metadata that describes a pixel buffer.
-Those metadata include: width, height, phyaddr, wrapping, block mode
-and endianness.
+Those metadata include: width, height, phyaddr, wrapping and block mode.
+Starting with GXBB the endianness can also be described.
 
 Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
 rather than use the phy addresses directly. For instance, this is the case for
@@ -18,7 +18,11 @@ Video Lookup Table
 --------------------------
 
 Required properties:
-- compatible: "amlogic,canvas"
+- compatible: has to be one of:
+		- "amlogic,meson8-canvas", "amlogic,canvas" on Meson8
+		- "amlogic,meson8b-canvas", "amlogic,canvas" on Meson8b
+		- "amlogic,meson8m2-canvas", "amlogic,canvas" on Meson8m2
+		- "amlogic,canvas" on GXBB and newer
 - reg: Base physical address and size of the canvas registers.
 
 Example:
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
