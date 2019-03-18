Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604E0C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4FA20880
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rV+cABaE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B80Z/X2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A4FA20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UdNw8FxE//qENuZ1oWSrPCqChW4c5D9nAmI3rNbtIpg=; b=rV+cABaEAd9p8j
	SnA1l07nMbbDcYK2LJG0k4Wlr00LbIGKVU3/1OaPO0+4tJEjrOUSb3YNcCUlP72ZyTJxonqHkYOI+
	Wmcx9jKfCYmGOOh45zmkaSXjeOIATBg3/7mJjvk7FDH9yRyEEg0qeTP+pAw/slAcRsWeP5T5SYngt
	AEICsRwRf5+8ccMN5ZUDF/w3Gcxv0RNKeXwYaWDW42YbPtq/oy8qHGVhDwdqkRCht1/+JsAaC4gzL
	R9xMeMEB0BaYd+V9SxauEyj/qtAzXcx1MoB/M9NvjGJ9nViBxQBl5+wuwHNELWrz6I2XREoWUeQEx
	tdJhKUyRAw2YBwDg/ZpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p8k-0008Re-1x; Mon, 18 Mar 2019 10:05:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8g-0007xK-E7
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id t124so12028604wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27Y5ngsXY+lsihk1ETnQLar+63BvZaw0mFMpXeArpvY=;
 b=B80Z/X2/OhJGEyQiwM93Sixm3fzLtf9aVez/If5suy/AeZlmgRz3knTeVHKZ0hmifn
 uFIeq3SpRdzAWnksCGLKxgQVVYuYxePJAqPow2lTnK7VBSYGYMq68Vp/xMqQZEyIC0BD
 EmGRlG+rZ+oZ2vmJ8YLCY8pMec0ZlEvpAHllrC9X5a1c2u4h3UOv8JjtSVauyqCPoQqc
 ekMBE58sXe6rHBiPLckORiVPiyjYJXq6/PXkd71O6HVynJW1qW8/D7L7IE5P2wHwaBOj
 eeDANqFtwTNwpr1a0h5X9/lfC0ZV4PaKlkpSS49dfTX6eM1rWg/b4zGmjwZuPoP3n8Q3
 64sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27Y5ngsXY+lsihk1ETnQLar+63BvZaw0mFMpXeArpvY=;
 b=VjL7MDE5nJZULWkzw0fAGZhEImd5o6q8TVJZng9RjLTFfVbwMoKo+65B8KS/mgVuMF
 p68q9hx9Mcnobd3/mhN1wCKcV0aMf6fx5/1WnEpS/PsNU+XppxPvgfcbySngsX9OJGR8
 f5d2NsFEm0LDDyHoW888ok4ZOGMfFIgx6hRwuD7gGnkN/UHT8lcDBD141pruGlPtKb/0
 vkgE31B/kiTuj2XZvQcVQuHgPwKZ9Vt3ElDy4IODpoeJTcfHt5EFOkB/3FhagBryepNO
 DJ3G7rLGzxbyHKmO2xS6Mu+edjoczZFmGk6dbVwaucI5vUI+50yGH6JcxoggK/rqW8I1
 0pig==
X-Gm-Message-State: APjAAAX/xyt2AnQfI51naoai9lqV4v0+wVJE1RmwavHVH8BvVxfVUxrC
 FYokmsMqSsdJZ91krxznlpIFFQ==
X-Google-Smtp-Source: APXvYqzlHNXFXd50DVNlShkPbZ6b+x68br8sgfnANKXJQv42B03K77AU3wruNW/4oPs1893XjXbaBA==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr11173953wmn.143.1552903500107; 
 Mon, 18 Mar 2019 03:05:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.04.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:04:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 00/11] arm64: dts: g12a: Add boards peripherals
Date: Mon, 18 Mar 2019 11:04:47 +0100
Message-Id: <20190318100458.5619-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030502_553395_8A6C3697 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Following [1], add regulators, bluetooth, UART and ADC keys on :
- meson-g12a-x96-max
- meson-g12a-u200
- meson-g12a-sei510

Changes since v1:
- Collected martin's reviewed-bys
- Added missing regulators in commit logs
- fixed x96 dc_in regulator
- fixed includes overall
- removed dwc2 enable floowing disabled remove in [1]

[1] https://lkml.kernel.org/r/20190318095851.4062-1-narmstrong@baylibre.com

Guillaume La Roque (1):
  arm64: dts: meson-g12a-x96-max: add regulators

Jerome Brunet (2):
  arm64: dts: meson-g12a-u200: add regulators
  arm64: dts: meson-g12a-sei510: add regulators

Neil Armstrong (8):
  arm64: dts: meson-g12a-u200: add uart_AO pinctrl
  arm64: dts: meson-g12a-sei510: add uart_AO pinctrl
  arm64: dts: meson-g12a-x96-max: add uart_AO pinctrl
  arm64: dts: meson-g12a-x96-max: Enable BT Module
  arm64: dts: meson-g12a-sei510: Add ADC Key and BT support
  arm64: dts: meson-g12a-sei510: Enable USB
  arm64: dts: meson-g12a-u200: Enable USB
  arm64: dts: meson-g12a-x96-max: Enable USB

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 94 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 93 ++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 86 +++++++++++++++++
 3 files changed, 273 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
