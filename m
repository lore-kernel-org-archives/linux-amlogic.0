Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B437C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 23:46:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CD120771
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 23:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+pnuFLW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iRUVjpwz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CD120771
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/rqSBH0jyd/euXSoh01k+RLlgYYYCSVyjkk8dmG8n4=; b=d+pnuFLWOBsaXd
	EgJastcyNrgM+d6mfWlgKHydjByEeQ+SfKNoJDVPblv+8V09wx44jikYIMY/WvTrERo3FkffZg7CF
	SYyIbhjUFv0LA0oLg1T0Ish4PXiUAtQKTwzt6HpfH87P6E2hIG9chOcuPQI1NeE9vNpXfc8RrKmKF
	Bc/i+YSnGABYxD7oERobKDRrjJCelznhpjSKx8bTfEdYki4pHYC/GvlaDtRzxCBvBBX54pAC0p20w
	hc7SRVfbclRj9iNObrccvqyk/GAg4wHnyECkyNhl7H7R9mnlMZ9vOzRifOfPy7ykPBJIDcbv0gYJP
	AZLVYwb4ht804Dh68p2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ46b-0004gK-JA; Mon, 30 Mar 2020 23:46:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ46J-0004Qe-Aw; Mon, 30 Mar 2020 23:45:52 +0000
Received: by mail-wr1-x444.google.com with SMTP id h15so23731049wrx.9;
 Mon, 30 Mar 2020 16:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxK6o0d762Zl57HAnhWXL/U279uSuVK4xM7r8LkbtfU=;
 b=iRUVjpwzhUgZWdAu9OhKc2QrrebME/a6PvPbBtwpO/QXWfNUP1cSPkUM8V1DPCppIt
 Z0CsUnSr4EEZfJad+Btd6XHnDBMRP0GI8ZTpVMapuFzv5XRwEEIU8okXXnQAIoQdKHTN
 duUcuETE1GDEw9Nn502Kkhi6wH0qt1RwFhCwRHDtTc2gzJjwnJmkea/Da0961UmhzFgA
 y5f4Cf0DpkYBQ38YboNqsrC+1nAJHojyvjbzoPmKhCsSj+NICy/l0vSgyNMCc4jI/k1b
 UR59ucu7S1ftnBnyzj5iz64c7qaPFhta83VUfxkG3KsUDL1Qyot2jVqBY8ubtcm7/kwD
 yAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxK6o0d762Zl57HAnhWXL/U279uSuVK4xM7r8LkbtfU=;
 b=H3sNwU3NOAlvZcw7KljALVl62rKhUep6i70qA2escTiBJjnHZhZph6DZo0/lDSy+qQ
 XHGI9tg+K7NhS18vaJoWfAXSUhTd9flHkAe1JS0MNuPNiOf3KzrDEuxl+uCY4FxpEreL
 VLig5LCJVvs0uuwfGI59zn6k3um95Z9WRC55l9BPMXs6FFTwUyU4BVGR4hQwFaFOEoCA
 HrqtApdtFZgTHdh8G0Qt0x7iUcTo6RhAGDnN2FrJ2nWXznZIuwWC2CG+103Q/Ba7HPrC
 mI4LF7XPRAHb1rOegO+Ix7FHxSyv5gV/T6XGkC4Nve1GDYi4veeCjp2h1EDakVUCcZ45
 qmrw==
X-Gm-Message-State: ANhLgQ1fSfuP54p/OUiyqw7woZPX/pscQodAyF2Ci+lgLpUGGOHdSDSf
 ef8d3ByltUG/g3DBKAwIlQhs8SCf
X-Google-Smtp-Source: ADFU+vviGdVjMK+SeAP3YtjOZuI2rOV6Ly+eqgrfC2ttV2VBMynT39e3PrONu63IHkoumJXpawRGWA==
X-Received: by 2002:a5d:4d07:: with SMTP id z7mr17767249wrt.92.1585611948819; 
 Mon, 30 Mar 2020 16:45:48 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v186sm1392953wme.24.2020.03.30.16.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:45:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH 1/2] clk: meson8b: export the HDMI system clock
Date: Tue, 31 Mar 2020 01:45:34 +0200
Message-Id: <20200330234535.3327513-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
References: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_164551_372899_B580C682 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Export the HDMI system clock (used by the HDMI transmitter) so it can be
used in the dt-bindings.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.h              | 1 -
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index c889fbeec30f..94ce3ef0c1d5 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -146,7 +146,6 @@
 #define CLKID_CTS_VDAC0		171
 #define CLKID_HDMI_SYS_SEL	172
 #define CLKID_HDMI_SYS_DIV	173
-#define CLKID_HDMI_SYS		174
 #define CLKID_MALI_0_SEL	175
 #define CLKID_MALI_0_DIV	176
 #define CLKID_MALI_0		177
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 68862aaf977e..4c5965ae1df4 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -107,6 +107,7 @@
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
+#define CLKID_HDMI_SYS		174
 #define CLKID_VPU		190
 #define CLKID_VDEC_1		196
 #define CLKID_VDEC_HCODEC	199
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
