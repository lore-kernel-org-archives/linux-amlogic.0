Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBE1C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 18:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E302760E05
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 18:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E302760E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiexHTvLbZC+4gv3T5VsactSwmxSQPg9XTTikxbkuog=; b=oLI872oy3w3DDA
	6ku8W18IfJI73qkMIm0J/zY/46byIvoEpHHItgn0chZOdla5BPqNj2vidJ13mgS+EA6MNLNUrreoX
	3xnQj4WJzdFLwepIjotVnqT1YuPL9yW2ijADXiJZc0g25O1u7bvwV8prvJ3GDypc/TzsiBRhe8nya
	5x/SRZs6QOz063H6ZxAiYMXqFuRLw4CGfcBYQaKclmD+uN5R4BshZAZiJTBoW/bwxbp4kVbD9dqtQ
	mf+87Nx8TzzgYDfxe3BKgyFhQMGdLPmyov3pTqNJTMqeUdh+3+w8IjUvCEf340Ea8zA6Z9ypuwCTk
	lVg+JxMin+DJNBLdybYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfRC1-002lgR-NW; Tue, 26 Oct 2021 18:29:01 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfRBU-002lSR-Kf; Tue, 26 Oct 2021 18:28:30 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Hf0gt0hw9zQkHv;
 Tue, 26 Oct 2021 20:28:26 +0200 (CEST)
Authentication-Results: gerste.heinlein-support.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635272904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpucNbXGwmj3uHURNv9XmVHDWvKU0dptcGmh1ayTYB0=;
 b=S9NysY42+OKT3CoWf3frFXzTxs86o6+tb3Wa+gHTixGx4HZwASLheOkft5SAU26b3P5d/q
 bI5vhHJATQi/wiskypDS928uteYdaTg1TuDWQXJHkZ++afv8CMCsmPI5vIDAt2MwNQwqyd
 Z1tD+Igb0WspOKitYLyQyPQU25XcW5c8HZAhli1p1JGO81V6jfQqkwsuQ26iz0mC47U5o5
 vUKRjNQ7KND8O8U2lUQtgMRrUCtWIjvQrgNA4/QyUjpr8jiAqdMPXVzUZOM/0Yo1WhbE/y
 pvJBEN5Dz3LpX2KkFMqKbYB5kJJ7rF30Gn7sAiQbiLcm+xPO4OGwXaEpm60+5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1635272902; bh=H7JJLWTX3+pFtzG7/dTC5rzV8xdVlcsM8
 4g8x18AsWI=; b=FtkxtoJpZ+BJWpVgSJhjDiV3XuMMFtZ2DTUEDo4vB9tfqo5yX
 heZeHsG20msYRFee5g+67yucvtonrROKFn/EqyBP1WVIq4UbYHz5m7K5kqeszSb2
 m5e2LaEMn3414192BHs3FLcQBYO8Lt/NzoGwo8xUlpEoRAUFs9BxVsfYwuG6gw7d
 6CVdIRxZIc2t1PNGXLV/XAjk6it9TPSN7zebEVG409agd5wl10pENefC1cAabWG1
 GYAe27QUa9lv6lGSWWWW4XOLn5mFAOUbvdpZw+HiftK9Sm6WmLf66xHU5ZSeAjqp
 +m0T4yUtEF0bhtKgNSWg5yPCX86pzhzCQO2mg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: amlogic: Fix SPI NOR flash node name for
 ODROID N2/N2+
Date: Tue, 26 Oct 2021 20:28:13 +0200
Message-Id: <20211026182813.900775-3-alexander.stein@mailbox.org>
In-Reply-To: <20211026182813.900775-1-alexander.stein@mailbox.org>
References: <20211026182813.900775-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E27A0369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_112828_850782_F333069F 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the schema warning: "spi-flash@0: $nodename:0: 'spi-flash@0' does
 not match '^flash(@.*)?$'" from jedec,spi-nor.yaml

Fixes: a084eaf3096c ("arm64: dts: meson-g12b-odroid-n2: add SPIFC controller node")
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Changes in v2:
* Separated from DT bindings patch in v1 (PATCH 1/4)
* Added Reviewed-by: Neil Armstrong tag

 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 6e9ff5076b38..9c05c83453f5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -611,7 +611,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	mx25u64: spi-flash@0 {
+	mx25u64: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "mxicy,mx25u6435f", "jedec,spi-nor";
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
