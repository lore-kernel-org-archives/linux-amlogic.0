Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD97C10F0C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A74F2147C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/6zh3N7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="orUATwCh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A74F2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvVn+8tcKee5GILRh10+PGqSsF5uC9HIz9CShf0u7KI=; b=X/6zh3N7dxAb7V
	nfnerWM4UeCfUkACzozN1h9kDrykkuV5T1UOMk6UFDpmRfZAOL65MtRsk4LnjhyF3WvvsGBlo9A5P
	oFYB3G2lLMMKalRAJUbvpMKimYngZGFAaQt/AOhfVbuL6x1thXG24BKL2k3JqOzyWZlrYBWxQV2T3
	Z47ipkxAT2+0OqW9W2AUJNfhXU0ng7psNTsu6F7BeiCeoxHoXVKO3w3tfIAslxJafWm7nASMa7t3S
	kQ0UDa+nSKLUbv544p7RTGPdL/VjXfhTtav9RDdVYGlabHSEe13NS1Zfah3bLQy2y9l6sUAv5M/cA
	mNB/JRNkaaAzcTtHLTQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3x5-00029y-4y; Thu, 04 Apr 2019 15:06:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3wA-0000oC-4w
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 15:06:13 +0000
Received: by mail-wm1-x344.google.com with SMTP id z24so3836232wmi.5
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Af+jmp4TxV/QvWrI8cMBNBX8b92F7d39H2RU/VUPuWE=;
 b=orUATwChTASPdHYfwTB7I0LB+HwbbvmzOPE5mGVbekd7ZK180nKS4YYUFiGPYz9aJw
 14gf3J+dsx/J7iZagdSXdiSovF2dbuQme+GdTMM2BEI1DtSlUBrx4C0lSCCgVMEBCQ6m
 LHxMhcGkd2YDYLoxi129toCuz7GHtMpx/OWsVIhO1ZaRtlmgYH9P4J7E1N5pu7hnP/8R
 pa1Ogo6zQF+fwDIzFTulg1H5J/PKlW/LJIwb/Ojm+c4fwJ0KSh3uW6tMkAAAttCwNFLE
 5Z1Lku13gC6r6RO/Xi9gbetV9vIH54P5AQzvBbuNFmbXf89CCNF57sIb6Zxyk+hu/9F4
 IVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Af+jmp4TxV/QvWrI8cMBNBX8b92F7d39H2RU/VUPuWE=;
 b=m9NPkGiqw+meV44iOPNVfbMVMLySs2mA/a0fb36fUuhcaUOt877kz+ELXUEl9lVK72
 c1lU7bsiM7vpKMP8PUBo7MUUc1aRuHhTLOyrArWXe2GrgWfK9lP7GP2aheqU6qJiXavW
 kmrdXteJmWpEWtcqW7Tg+oCPZMe0M/iQFD46ta4/6eOvE08JoEmuI/m+pBZzkcGrv0Eb
 iG3nnE+BzbpwmKcFIiapXMgkh86Bcf7sx6IviduxmWMEsZD3Yad+LVBBQHNNcmSV35L4
 LqpsxdW8Wlblnw7YRvKs07qHHBxz2CjYpQ6Z/XLPUHRM21h2UKrWUh1bBDyrmWUvdN+Q
 wgvw==
X-Gm-Message-State: APjAAAWEpsG+u52OR2zaAEMwOKhZwijTWaVrkFL8bG7ALG3DRusIA4Ti
 rFypY+ljEuEEV1UbtTdj1/iCyw==
X-Google-Smtp-Source: APXvYqwxXqanvZ8gCr13G4rHzWLM8JaM55lN2GWp22sMBFDs785fPY1/LNLPsCXZiNAJGmLqRtwysQ==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr4764633wma.2.1554390352542; 
 Thu, 04 Apr 2019 08:05:52 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id z23sm9880981wma.0.2019.04.04.08.05.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Apr 2019 08:05:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH 5/6] dt-bindings: arm: amlogic: add Odroid-N2 binding
Date: Thu,  4 Apr 2019 17:05:17 +0200
Message-Id: <20190404150518.30337-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404150518.30337-1-narmstrong@baylibre.com>
References: <20190404150518.30337-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_080554_598094_6BAE36CE 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
from HardKernel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 94bbcc646e10..eff41128268e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -116,6 +116,8 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amediatech,x96-max" (Meson g12a s905x2)
   - "seirobotics,sei510" (Meson g12a s905x2)
 
+  - "hardkernel,odroid-n2" (Meson g12b s922x)
+
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
