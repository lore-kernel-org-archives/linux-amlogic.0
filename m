Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A711C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6063B22CF7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGmj4kXB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tXU3kWHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6063B22CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLKfJ7MF3qn6mHkGWQSqVGaJD7odvPCg8Iz0AwIhHkU=; b=kGmj4kXB2Ytr+c
	R71qvNY7JQAjr8fBjLhJ1SBK4sroi1uctzWPMiaGcBhmBGbAIHVU575j7rGCCKQmRLRaRfbUfUt/U
	mPhoGsB8vrxuNHDd1DAtKyPXW4Ockx5Eo2p7oh5zHX1bgXCDYiR3iegtG+dOTbzxhNt8fcDklWUmF
	jVJhPbuUrIieFtcswubzdnUcodDwvAIwLzsAxqqBoOSVO7IqnCMN2DVeVFcxTLg09Q/uuD1/u3e6D
	7dmI92CbLqYO+OF4z1y3gLvAGkhrA9FZjv59u+QtFuPo4FgFmBL0tHOkw1Y2G102m31f68Z43Z8wA
	+CYAI0QDywX4yIADbwlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13sA-0004RA-Oc; Fri, 23 Aug 2019 07:20:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bB-00014o-7H
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id m125so8011711wmm.3
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azywW4aY+7wwgpNcGjCphBBHWjJRM460WoYJzBT0wYk=;
 b=tXU3kWHD6fL1kUtu493aPKmgU35PK0cJBZuXho29b/UAUO5IUdGJ5s0YwYZIcxbkJx
 rsS5aJ63ewGloC4FDFkDeYWx90taKRGxx9PuHTEs01ZDvDkwOtkjqJDiV87WTrvQ/TgO
 C/mhppXl3Fog2EO/Tlbb1Ee3g+pIuD4BQx6Im1Zi1pxM3pxbCygGcmiirKntjhzSUaRG
 qo6ip9/J7rTm8kBLIOPXLLuTOZNKJK0j+nRi6MHdtTJTXLDM/LdbCOSRBMrCqBAHyMzp
 3fTNWdADY/M3BLnld/6bdQGC8X6weIZnE1Dq2ph83G1BevN5OQmhFr1L8MlrpBZbTQPV
 e8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azywW4aY+7wwgpNcGjCphBBHWjJRM460WoYJzBT0wYk=;
 b=HhQKD+5i3Vb4nI99t12L/t0wedzMNzgVBDaHun2U1AKCdbAvItnNtA96yUNYnHZCWr
 Ey6CWgR+TCTRgf+zYAf7b2x3Z1MuN4ypM7Vqk3EF0JvCObTqybF5BdHlw96W8Vu5giPy
 JYiwd0vFs2+RDG/1ZUwBHqoL4GuPInsLxAY2mK8rrT7x43iWpO5EVv8gxUcNZyePDRBz
 xUwgmI2HzgWmIZr5AuFn3bWsnhvVVyNly5F8GfoANKibdjjg2i8RBpseHrv1EvLkLSDC
 NV7kaBSiRKfZ5GhzH8mAEJ9t5EBaiodW/vttIVgwXJ450GRzekDhf7Jlm92anGTOlyrS
 yHmQ==
X-Gm-Message-State: APjAAAUb77Fbz8s3L9aE+Z1UXTPnU+KjONVKL8RzQj4yjIfWy4VnOGB6
 WJ7DTJPIwbZvUaPFiO3Tw10LOg==
X-Google-Smtp-Source: APXvYqypWTGY1OgUHLWikf1dmECp2VpbfjrWpKD1mRPlCd6Udkbv7ND2F33HHWtG2cvD70GipoVAYA==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr3277166wme.29.1566543779798; 
 Fri, 23 Aug 2019 00:02:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:02:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 06/14] arm64: dts: meson-gx: fix mhu compatible
Date: Fri, 23 Aug 2019 09:02:40 +0200
Message-Id: <20190823070248.25832-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_000302_267613_442403DD 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: mailbox@404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']
meson-gxl-s805x-libretech-ac.dt.yaml: mailbox@404: compatible:0: 'amlogic,meson-gx-mhu' is not one of ['amlogic,meson-gxbb-mhu']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index b3fe3268af3e..74a2cdff0563 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -490,7 +490,7 @@
 			};
 
 			mailbox: mailbox@404 {
-				compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
+				compatible = "amlogic,meson-gxbb-mhu";
 				reg = <0 0x404 0 0x4c>;
 				interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
 					     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
