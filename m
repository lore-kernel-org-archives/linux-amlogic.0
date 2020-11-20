Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54882C63777
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C923424073
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q7fbwNwm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QjmC/vYN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C923424073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VdESFw4c09Zp2bgdAPe/MduQxFPXF0rEsq23Dc9pRXo=; b=Q7fbwNwm6pf1mb9ZmaznVs0BT
	wqJToxpUiyc7LpcEGrWRKpaP8uspaJ9FzMRLzwFxb4mpouWjBcduYlCzwew17pdODrswOWEnmlNL4
	+H07FMNHBWSLQj1udkpp2Up9WXi0fWQqRJAeuj5oGCg4EI2P+fUpu5cQG2DEFNEv28l6JMx3Q9h0x
	1ekfRR5jBf6jNtCabQP9KZIPNu0wIGe3ZriiYT0nUoyV9BSQU/9w98EtzdeHaGx+7SpdtpeuMmMYp
	fhaNLTNe9/mY6rUXm/sbcI+Fs7UdE0mz/a5BsnMpgCZjlDpbYNRgOFWPx7WNUGgLJkIumVg0uE8f2
	bh6sIgsnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8PW-0007u8-BM; Fri, 20 Nov 2020 15:33:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8Ow-0007hE-Bq
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:32:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id u12so10500424wrt.0
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWLpASMBxVE+IPMT5Mp6WJ1oEGYYgS3ffEicpvS60qU=;
 b=QjmC/vYNDPg97/NVYbQCCrN7sYdOdulM4zrGr3bvsj+fbGazH/ZLGUdgcFoaNPY0Vi
 d2/Y+QFt3d81B4v/cPkFSDD1W4T5kNxoa8CLHgHUoEmg6yqKHyQ7NDTGZhzuPAwNWxIa
 Y5FeMVifvZVhHvJOabAw4d9IgwwfU2cqe5xJBTENkRMSUj25hdoe+BO1fXXaeRHTCkRg
 aVDA2s5MwCbvFnIk2yz5m6vURc4oQ4K7cC0bZhggJuw9Yz/g1DPiQX6LNbWYCAe65+NS
 ocKVWrMgSsP4uHPgAS7tX3vLpDu9/Ubr2LJIzKPRkc9uynwwCgJbVK/kBP1+PmDr1C3Q
 oj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWLpASMBxVE+IPMT5Mp6WJ1oEGYYgS3ffEicpvS60qU=;
 b=LSBqmxFyDPn26ekVWNenYrgSPVm5AV3cwR15cSeIQTBuShUAkd5r6bpApuz1zVcDSy
 68MdOKF24lqJ4LVB2tLz4eyMoE/9pSjUVDKj3rc1cOhrG+KGlNAvpRNASLI4oehJgFON
 aR/qlU/3DtFUeL9ws81cFJN40z6lA4+J1/+ISY+Ngjsc0AB3ktiF85Ry7CZXo1QTP4X5
 n1QhUDq5XzvPjc3+CO6g+h1ohqgtsjOSsknDcOZ0mHW80FPppgjJbkYVyvcVSZYHd/6i
 zFvnstSdVhjZDI3Zmy+CA3Eb/UXYeA3JAd0mVn7gfGtWViOPiy71pn2CkvfSBixcvrOf
 C89Q==
X-Gm-Message-State: AOAM533VdRGu0Kqr2sT3pmfU7/KnDw1tM+cqJxneoAAi50Wjjb82JHvO
 0CY0QiAqy6y7MSQLTI+bYRVYZbm4tpNRq//b
X-Google-Smtp-Source: ABdhPJwpfwqS6yqXt9ilELkqNOY6AP9nT2FadVetjhTu1xFeukbk2Kt3NtiX3Lv87W5ZuPBwVcRsQg==
X-Received: by 2002:adf:a551:: with SMTP id j17mr18250041wrb.217.1605886360646; 
 Fri, 20 Nov 2020 07:32:40 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id i16sm5398180wru.92.2020.11.20.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:32:39 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/4] arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots
Date: Fri, 20 Nov 2020 16:32:29 +0100
Message-Id: <20201120153229.3920123-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120153229.3920123-1-narmstrong@baylibre.com>
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103242_456666_3C904E25 
X-CRM114-Status: GOOD (  11.06  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 7740f97c240f..359589d1dfa9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -441,6 +441,16 @@ &pdm {
 	status = "okay";
 };
 
+&pcieA {
+	reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcieB {
+	reset-gpios = <&gpio GPIOZ_10 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
