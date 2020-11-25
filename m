Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1100C56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 02:40:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77EF420872
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 02:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DeoqrSv8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrSzE+Tp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77EF420872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rq4gcyV3Upa3kWQJYis7KzDil9msG3pPBMyxe5sY/Gg=; b=DeoqrSv8pBiNLzw4N0yFYDDKo6
	0YjFQILil+lTm9swY3Qcm7PE1+sl3huHX+ZAkjL1dcEuKnph2eD4CGQHFKjjTSyjRKc2/P8+ZOAjw
	CF2Vi8PTifOCxPPb0v8+PbkN7HhFwDGLB2F2iEe1TUHy6fFCfLvJ8tBsF1dnGQeNwd9iq5ZAcrO8a
	ScUQI9+5nTIsNoReu0uL7LnT2DHwB28MdcjVfsOvYiLW8Bd70khpQ41SheQnvC/xL5YxzcecnTwa8
	hvdTCzaSJ1gPGrWSZRPYS7f/jX795lCsdd7VLnhZvI1Unki6k4XOM8uW7fbH3c92t/ZR0aX45hnSO
	Jo2NnskQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkj5-0004by-9e; Wed, 25 Nov 2020 02:40:11 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkj1-0004b3-06; Wed, 25 Nov 2020 02:40:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id e7so393806wrv.6;
 Tue, 24 Nov 2020 18:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2DCnZPa11FhjnY6LNsxv2jfgvHUVsLu9/gulnrkgaWA=;
 b=jrSzE+TpJrRF+iIv5NMouE2PfzpLpkKELPrmJ7Ky0zuruNumq/G6t8W/nffoxWE1+L
 aEQddZebyF9ggEs1Dqlzm4mMXI3KFusflAvb1BGrLWZojjM5Q6VJvEeamFdsknBonTWz
 lsOwzmvWbmUoab8A7F0cI4FjCu/hDe4rgUzcUpmP1/ykbB+GzNDJJ7AY0DYIFQZnLXFp
 tw6JCz7gWLUmqolTa4avG88vDvlipVdpSeSWmrAOuyt1vzofrFwWgH2xDvlLAVQ+1sTL
 BRyLklC6NeyYMBKuWMVDOr0Wm0fVKpQZg5+I7GAkUIvVhYl07uxRIHSPoh0305XsYeWI
 sZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2DCnZPa11FhjnY6LNsxv2jfgvHUVsLu9/gulnrkgaWA=;
 b=pZDe0s0U+nahbCopWlsr+vUuemeWb5wdHnM1+aGD9OfOY1ixGHvDg4VHHVrPa4P+Fh
 6cqmD/U/HnP86XDhRFIDfD3pqh/mKOuHLABiXYk5w87gE6jJF+V7VR6AHW5EGa7Syr5u
 jEn7GXddoLwsWPiQmBNWVdVmJy+2hXYqUd52AV9LVc+yTvLxcViLqpvvM33zuq/9blwB
 iZSrvrhI3uyCNDDVR8XoaedfwPZ10IJGfjIIbTx6sjex7KxLZwQMu+5hVBenpgh6b2zQ
 CTDOXg5XMbol5jRJqPLImejI+3Uy/qX4t7pPmMdy8i+Zq39SQiBFE5E1RW/km1vzS7BQ
 dlzg==
X-Gm-Message-State: AOAM53215MTqpk0QYKWvtLBD5NAHQiDalg59NAok8jaQbYsmztAQ6QpW
 e3Kgr7h3f+M5qs4rAnCgUTU=
X-Google-Smtp-Source: ABdhPJzdmzCm13OlX43VhOcew3MqUkCBjjePrJJij0TKd6+NPs2L2Lo1n24hFiH6A1TK66jNnn5P+w==
X-Received: by 2002:adf:e481:: with SMTP id i1mr1447426wrm.282.1606272005815; 
 Tue, 24 Nov 2020 18:40:05 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id q1sm1668653wrj.8.2020.11.24.18.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 18:40:05 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: fix spi-max-frequency on Khadas VIM2
Date: Wed, 25 Nov 2020 02:40:01 +0000
Message-Id: <20201125024001.19036-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_214007_109832_069B1D3A 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: Artem Lapkin <art@khadas.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Artem Lapkin <art@khadas.com>

The max frequency for the w25q32 (VIM v1.2) and w25q128 (VIM v1.4) spifc
chip should be 104Mhz not 30MHz.

Fixes: b8b74dda3908 ("ARM64: dts: meson-gxm: Add support for Khadas VIM2")
Signed-off-by: Artem Lapkin <art@khadas.com>
---
This change was previously submitted as [0] which has style issues and
remains unmerged. It is also part of a two patch series where the other
patch needs further work to convert to newer LED bindings.

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20200928092613.273998-3-art@khadas.com/

 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 39e6047056b2..079500ed5066 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -391,7 +391,7 @@
 		#size-cells = <1>;
 		compatible = "winbond,w25q16", "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <3000000>;
+		spi-max-frequency = <104000000>;
 	};
 };
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
