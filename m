Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73DBC43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F3D20835
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uG61kAb3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2Lf2s0Wd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F3D20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28Y+zsJFfZadLvCyamKexmI+r+B1mSJAA8v+DG0ZC/0=; b=uG61kAb3rEAycX
	d9J9da0vJfRWHdGUSSSC4oYb3UedUxSrQ45qaoY4391sym95LtScRj32cjrl82VparSBeh87GgwCK
	meDkrB/Pt5u+i/lwhsBVkBbcETaR/xO0O81tZtl0Kw8VH1Y9/4JemflPjYw67XXsLZfT2bnhuCXPn
	6Yztsh6xGqhiTQpE6/rfPbEJNsNnP16Sme9CCxxUWFNhmG3aJ6+6ExILb7doNNYpGkHJ3fTGEJz1R
	JfhZ8q7L7iGtsk/uId4gsMywY270543NqrdApy/V+vKncBcaArXT+Uxkoh3uecgicBx3oJ/ueAPYi
	48Iw2gGdJqorVtCvXONQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1to2-0002jm-4H; Thu, 07 Mar 2019 14:15:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tnZ-00010Q-3J
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:15:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id f3so9484716wmj.4
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/H1m/oJJRpi+iUidODU0Wo3KnSYRlpFqEdDR4058GA=;
 b=2Lf2s0WdH4Vcf3P+AGKP/GoFJaNPDBMQ6sxEyFlx63ctQnfrHnpCNy2R89iKtOMIJW
 q3y2QxTgeauw40XweFaxUeTGAUyjonx4KEVB2Z5TP2LUWoaUKH7IcYGjS7EDSrb+GIVG
 ejVKMef+wDDTKTuBHJXnHCCGt+69X18+YIDN+joa7jV0A7AtMDb+RJsqJ/hpW6FsSwgs
 pL9fmwNx89cF0fyMnY5Nu1GtxxUF4VJ28j6ZnxD/ZauRmDQsChtfUD5/sQiiV0f51djC
 uXugehi9UZ5I59CWLYtPRM0X4qACR7SmcjibNkO467npR5GHEVY8KlWSzaTACufTq/EH
 oUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/H1m/oJJRpi+iUidODU0Wo3KnSYRlpFqEdDR4058GA=;
 b=r/6HJnWVvbIUMIUdun/N7h1DfxOF9JAJNuUxSIiu9bs9WGMApaH+FQPAERp/jTtR1x
 ElJumWs7cH7wG8Ks50y6SN1pZ/QKyinI5trJyqt8V2LTA1VFzUVmS5DTNubbR+I93eDr
 JAUH2ylLlSSoddegB9GrCmpHLbGO2UZHSsjai7cQWRmKLahq7dBbaCauclqEK68lvcmD
 mzRd+ftEtkL3e+aF3AC3T/nWlY2DMy0kRnr7f+eGU1wtwK0tbGQiI3TPUv4hYzH72nub
 +j1jhKXgKNz3ka9rzJlCz2avWKFJ/8Eq0L0FfEzkLHo+YhuHFFL6AjphLdFMRiNhvpdN
 nxTQ==
X-Gm-Message-State: APjAAAXNi53/Sb9VcR9IcIxBFecl5O/giUJXR4M2CgyhRWp3+TLUTEkQ
 U0tLGcFDbITnhGmDqKRahn0H4QezUeyVrQ==
X-Google-Smtp-Source: APXvYqxs79hnv1rLJa4FV8yq2ms2ggAnLXAuSTztruFO50CAdMSNGTNjR2F3Lgoq5rTRbrY7+MpaGA==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr5880513wmf.65.1551968099501;
 Thu, 07 Mar 2019 06:14:59 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm9679304wrv.11.2019.03.07.06.14.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:14:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
Date: Thu,  7 Mar 2019 15:14:54 +0100
Message-Id: <20190307141455.23879-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307141455.23879-1-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_061501_141225_F8808D86 
X-CRM114-Status: GOOD (  10.25  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a clock ID for the reference clock feeding the USB3+PCIe Combo PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index d7bf0830c87d..30303728fe09 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -132,5 +132,6 @@
 #define CLKID_MALI				175
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
+#define CLKID_PCIE_PLL				201
 
 #endif /* __G12A_CLKC_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
