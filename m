Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F74C10F03
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1255C20840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVkNMyJ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ty2zUG67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1255C20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HRJlHnZRHwCImXa1+qvs6871pNYHeRmZ3zZykwRV3s=; b=aVkNMyJ7L3chfw
	v84hkJMFTbCK4rJVXjMDIbaR9+7dBDKKpfWm3dTrZyfzxjx3+uMKXVmI8LkMnR1P35ofRHmWxlMXn
	5JzU2KIOWpebMo0Lq/jCZu/SHcWZ5UhCHUAMgeC8TNoa6S5ghJo0Lp4HzfdjLeoffR/75QSXgkLh5
	zOGWQbiwS4sjexymRlCoLRKISFbiPHVV7LVGThHwVN9SAuGRAwkt3UoUvPowmXTlgwl/swl/Tigak
	mFRaHZRBuNOXMxArpQmBHsafjIMRRgG0H18g6TeVDzqLhSeeKD9YqHDVVxxSWoYso2KD0iXeEcToI
	8c8nrhPqZA8ChmYG1NgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uj2-0004FW-Je; Thu, 07 Mar 2019 15:14:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiQ-0003Q9-QA
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id i16so17834425wrs.13
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBFRZsUQw0bBZQL90PNVj3Jv0ULoLY5X2nGjMgBmdvc=;
 b=ty2zUG67x5jO05y7afpZl98SU7hXHheLhviOFxtAB/sADi7zTrPmb51U/ABPKRYMxW
 LlkYKH5qCtVHihrEFPYVGN5fvdAU0Sm5kb0rhkHDGj9cmL7zH3vonzwnAlYypcRCwOOr
 fm/yGvk51YFIH4tmYp5pylRnVKDgigPoGYYbQ4OjShrS/s0ZJxUyF0ie1wiw8O1VMB/n
 MWfIMPHT++rbzEGgBEinHuim9uXOiEjSTAv50GfzaHrQGo1Pr2QIzVvsVqCCRoRT2p+/
 xMGz0oFRvLpm9LXxmXfYaKZAHMK7KO/7+TST9/DA6kxjyKQ3dtfa3boLmZW+3JRD2ifE
 IBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBFRZsUQw0bBZQL90PNVj3Jv0ULoLY5X2nGjMgBmdvc=;
 b=sfPF8SaccCHONGMuGDIvnWLuZFv692yA2gaILCQ7dV48+2yhGyldoKFnbeYx4Ju2jU
 6iTURRlLbrl0ZsbMHRSpRiMbTxDuLvXdD7WaiJF97LWcXlsAeFOms7es6cDC6oDUhs39
 wLXAtlLlIAV6Dh4k5EsO941Y9lYNNH+oeRVcrJI7OJzPn0VPhLZ8l7I7JVcomUdmF5yM
 a3Otp7oiS04VqCnOxiNgUrt/va5pQyJ5w0wzlARjq+xcbQDEv2/KX9O9JXN28JAO9vkg
 87B+Yucmtc+Oof+z4LlxpbqgFcq+zo4kp9GkL5SWy6uFVUnw2mrFOoUxFY7N7MObSgdY
 2IDA==
X-Gm-Message-State: APjAAAUXDNPDxx59qsS14KFmj9ZP587B9sMvVztSFxrZf/j/jXJur02H
 iL6rZTPIctV41w0Xth2EJCbXXg==
X-Google-Smtp-Source: APXvYqw5tHzPpQjgs5Cg5xx7q1ecOXwNxUk3p6vmcrlDy60aFeZmfHWt8vu60kclREdd6stK40h3Gg==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr6941861wrn.80.1551971625386; 
 Thu, 07 Mar 2019 07:13:45 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/9] arm64: dts: meson: g12a: Add AO Secure node
Date: Thu,  7 Mar 2019 16:13:34 +0100
Message-Id: <20190307151342.7381-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071346_847381_48C63CE0 
X-CRM114-Status: GOOD (  10.23  )
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

This adds the Always-On ao-secure system control registers node,
which is used by the meson-gx-socinfo driver to detect the SoC IDs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 0eb5220da82c..f2fc0f654150 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -139,6 +139,12 @@
 				};
 			};
 
+			sec_AO: ao-secure@140 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x140 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
