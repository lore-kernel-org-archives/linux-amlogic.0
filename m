Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4078C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 17:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B1E206C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 17:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o9wCCcSq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XrfO9sOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B1E206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1HP+XGqUpSoxpicXeS8hUZs+YDsvDoQLp/ahfaI2dFc=; b=o9wCCcSqxH4MSy
	wkOk4BG8wGmu5pbg5NfqexPi6IYizwabGeAoLnJOY8e9ATQezEUoOYbUiLL4G4Tdm/1PMaaZ/OTxE
	jBVpHtYg0IHf6sLCN4Sf2RKR5hrUO4gSBtaFRzUMbfoqQ31RARhxT8l6fDgbIf3ANX47AM9eU2Dpf
	487iMxjSVFiH2G3yz+pYPMrLIO52WwUYFPK0JQDD+qDvnJOhwqjOT3tDsQmTqvoehlhXsjJtslQc4
	/HUqgaQomgTeEv2yRhJTInxfuHQfn7givKUMnI2t0SiEKc3NwOrG4OMVqahCsCFJdvvyHGlzPxo1f
	RnxH+L7SJWo10kBZTU8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjpTG-0004Xc-OJ; Wed, 16 Jan 2019 17:59:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjpTD-0004XE-RB
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 17:59:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id p4so7982085wrt.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 09:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGHM2N2WtdqsIqm1wuBaVDYD4GGJqThFPI7IpSINGlI=;
 b=XrfO9sOP4jXmsMPFHS7rLSI+6aZpeYXOHQOv9L3ndVzRqSbsm0hxPavwGKMENkZPgf
 6t9n9adC4KJFHnTAWDeZ36Wdaxkz2wB4TDOqedsX3gxndXWWReM4z8Mzdfrvc7Ry+rus
 w5857yiT7rpwUWwQ50yKd0482KeoZ3uDTw+hxDpnv4LBDNFg+Khrn9Oa/8B0Iuzfdq1A
 Pi9ofF+Zjmv1sf/u3OHD+HW3DLZpajrWf4lws5X3f0hXj9RGY6BG7unpda4ZAGui6FlZ
 Y7sHs6ykksXhmT6JGR5Wo82JmNEzzP2SSH99FYTgNb0R0rKc3l0qUkA5QsSLXRDDKfp6
 QPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGHM2N2WtdqsIqm1wuBaVDYD4GGJqThFPI7IpSINGlI=;
 b=q1v56uhd+kfGVLPrvHdikMH2tiSNHpunh/MjAKBMBMeg6kqP0oghKxIWm4vRagC7nD
 95Xm1c0FD8zODJzYCAHyRbCqvVgNele0G5Q5T3ERdxgxFGvcBmng5JDA9FYGxBwQ0MYh
 IeDpJPwpMDMm1SUANp4A0VQGxecudCt34lZXl/coHfFXgOITtuJZvihjdMqbfXo0Bx5b
 xHKmDzE175gmjyYfN8Nf/cRJSDZ2ejiTweY2pC2SvXIzYVM4MN9czNmrgx5Fv0X2aHe7
 DJet180s/sXotSXU9+EAVtN5EKGDAQb3a6wzy3iZaPwWeBrqnLr4U+8r5T5bEhBsHvDA
 8CmQ==
X-Gm-Message-State: AJcUukf73/VCabU5CASNmzjnGpNZgdexBalGpObTOHeQ9HAxof7VQFFa
 0z35HmdWtJcLcR8NLIdV2L6yRw==
X-Google-Smtp-Source: ALg8bN55WY6SihpB6uxj+w141K80WQwdVgvXOa91M41k3U38zXCRRcwq425myaNWmHuDi47kpOjbtg==
X-Received: by 2002:adf:8228:: with SMTP id 37mr8367659wrb.160.1547661558331; 
 Wed, 16 Jan 2019 09:59:18 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 3sm42867315wmw.46.2019.01.16.09.59.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 09:59:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: s400: enable sdr104 on sdio
Date: Wed, 16 Jan 2019 18:59:13 +0100
Message-Id: <20190116175913.5907-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_095919_882935_C15ED433 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The bcm wifi/bt device on SDIO support SDR104 and it seems to work
well following the recent mmc driver update, so enable this
ultra high speed mode

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 2e1dcf1c26bf..0c98ca78c8b8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -464,7 +464,8 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
