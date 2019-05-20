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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1662AC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D6820863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHiUghCM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bqnP7lv6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5D6820863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKePB0gm6v7nT4i4XKj6JNpfcJWFWOdrc5n6J3QU42E=; b=QHiUghCM0Awt2R
	Ti8dnb7Fn2zx29ui0F4RvFKn/D6tAk3BAjKCAvc7VXOQo7cF/u9DZE5eXWiVJHG7q3jRaYJHZVqTD
	ByfK7ieiGaj07FHxmZu0w2QXzX1XWbCO/JUUsKJ5mku9yPu41zPn/H5QCJGXPkLDZFlY/RtGltJWn
	Nje4qFU7IrmEYPxEcp7GVTRw366HKNbHKY0hUaCj1Fi2ACxkgLDGLyRnHdB9hZUKZGoSqyZGZoN7b
	rGknliIP4wmdFER3vPgB+A+wUlWq20fBzoA7oM45YAHAYaSosT+iZuEDpPiLOCmftG4X8h/Dm5ejG
	IRuspv1C3HiQvyQTbJmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoD4-0001Mh-5J; Mon, 20 May 2019 19:44:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoCf-0000lh-1L; Mon, 20 May 2019 19:44:10 +0000
Received: by mail-wm1-x343.google.com with SMTP id c77so551958wmd.1;
 Mon, 20 May 2019 12:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbtcwLTT91//XKmC+nVPtkzszNKe+pk1U7NYT699Lrc=;
 b=bqnP7lv6jn4i1Q/jGxux0ThtCKwf8NtdpmWcAE95aDI+W14w8Kip28zRIk0UnNd8H9
 uLwKOByCpDXwwQznTYVX3bssmINT2gpSwsbYZ1rL2R1gmwUAPDUmWBsGQbVQzPcinQxB
 xNYMJxEfvY2sSqcqHpH7Vx/DfEpp8pH6kVd09RmaSHI7rfv11xyghvZOXzuUbOElDYC3
 PgPwRXIStRlsP7T2dy8TNs86gkFVpGW/dj2my/NPhPbqACLEN3aD6uFczsJj5+rKvnlZ
 J/DrwtS/iLZyhyS4arHTi3Zzq4tSQbZQxGNFynJz7SAhXAel9FsB2Id3VoiSsq0lQ39Q
 4q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbtcwLTT91//XKmC+nVPtkzszNKe+pk1U7NYT699Lrc=;
 b=lpejCvaDtghV+bQVvC8VJugl5tkINID1wndhyKNXg4P5SRjQw+ptM80lSaWF5ZTbhV
 EdQNvQGiHLvVK4ldvXNUouqZFzN//LfHsawWbZdz2mV0l7qDzu/JF5Ewcf0aGwPg5sPF
 J5g9RZOUwHQThv8vNZhn88vWFKIZTB7PNqXhdbdOj+pNLk0cxHgG3sLQvjoRhj8DCwnw
 /1anj0nNLsF2Yik0AQuD2KbfOi1LJB52cRKXl7pJEo071dtreoX9Hafsm0pMF33Xe5Eg
 MBDnqa/HyNkLwTxh3sUppxusUueykF1wW0bxKuFKeiBIt7tPb5j2HjeWluOmwaWmRXBR
 Ie3g==
X-Gm-Message-State: APjAAAWtMSdYyfbRvxjgN/iuK7nAHt8FUaa1LtDjWmSxD4YE2d4qeWE9
 iN29hRQ2R9PDfZ0sw5L6qNu4+9ib
X-Google-Smtp-Source: APXvYqxIvBEBsiGaewtDr53S3vSH0QaYQdhtkgZBbh05g6PE/3rwce7wCD+fDv/oMZdNDf13BNdexQ==
X-Received: by 2002:a1c:9d56:: with SMTP id g83mr614737wme.8.1558381446984;
 Mon, 20 May 2019 12:44:06 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id p8sm9135352wro.0.2019.05.20.12.44.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 12:44:06 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 3/5] ARM: dts: meson8: add the canvas module
Date: Mon, 20 May 2019 21:43:51 +0200
Message-Id: <20190520194353.24445-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_124409_074652_0A84F76B 
X-CRM114-Status: GOOD (  11.76  )
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

Add the canvas module to Meson8 because it's required for the VPU
(video output) and video decoders.

The canvas module is located inside thie "DMC bus" (where also some of
the memory controller registers are located). The "DMC bus" itself is
part of the so-called "MMC bus".

Amlogic's vendor kernel has an explicit #define for the "DMC" register
range on Meson8m2 while there's no such #define for Meson8. However, the
canvas and memory controller registers on Meson8 are all expressed as
"0x6000 + actual offset", while Meson8m2 uses "DMC + actual offset".
Thus it's safe to assume that the DMC bus exists on both SoCs even
though the registers inside are slightly different.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 40c11b6b217a..6a235275b01f 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -228,6 +228,28 @@
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
+			canvas: video-lut@20 {
+				compatible = "amlogic,meson8-canvas",
+					     "amlogic,canvas";
+				reg = <0x20 0x14>;
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
