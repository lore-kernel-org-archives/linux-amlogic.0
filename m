Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B394EC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84BE520828
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dd7H0P4Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Yzff3i2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84BE520828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8w/TOTQnstcEWucJMb0+WAiNy68fxHnTZEwyRd8XFI=; b=Dd7H0P4ZyU/7RE
	/XhieX0tbaUrtNq6Rfrxb3owz9NAVZ81mKNt6nICgwgZiCcNZ81XXWjyECrtMSa9mtf9tNGg6cjh1
	bQv6C21x93zzesZY6mE454tRLtmKCPMjZdaPWC1CPzJWBB3sGQqaKCkims/jP6lqJfDi/o8xLvGtB
	3KpsZhkL+wOJZzYwL7aM6aX+ciYeFgyynFEV2QfOsXZ0AJHByZp2kWpKlooixV8APF81tu7hRsEi3
	8IumCgPk4vwYf0y69k1RJaleVyysHP7xIKDTmqCUbXeBifUNvMNEmfYLQt+trHE73cXuZxNfGOtBa
	yIZR179Z1Boh1k6sVWVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Bj3-00087C-Q2; Tue, 19 Mar 2019 10:12:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Biq-0007vO-KQ
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:11:57 +0000
Received: by mail-wm1-x344.google.com with SMTP id z11so7494303wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
 b=Yzff3i2PZkBeTqGtwPOqQ3j+XCInyjGqJpt75KA6x3Wi4/yB/Agb2kr+MuD1TBLdpU
 YgYXNPHo4dHtLViLE7GuWBZwPpDE5einCa9RiFhgib2LgmXwV0KDHuNVYZAwuEq/XXry
 d57tSGALrwsnHn8NT+XJrEd9jXhlB5+CDXHZLoJqhZMMSgmpJrKtejHaiOOTJ3BuG8/Q
 /UXCYgyxcTpuIUGzWZ9QtlqEDCm7hmc2SskCXsyY2qpaY6F2CKKUjwXUBG2yjEPHsSK0
 BqynV/Fv1O6R42iwoiW3gHU/pELm8A9wB68+A0Uk/7ezW8pBrL3cGNsC6rUB+PLDZpOc
 rtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
 b=Kith1MKUfLoJvE4HYxpciXFHtdTgifhDx86EtPiV+BE+GvVHWvYKC2NP75xpEsf+MT
 Rcz5pqnOD5NU5ArG6tE/KY7jc6jeiRPOMEQARKTQk8QlTH4CACPEfzxGC/DwJM/O5XgG
 O/34E73RcKTPnuOnKSnsKjdjryWdHfMH1TEY/4Ez8u86Q0IasfPOho8twybkS/N3zLRh
 FUlLLsnOMJ7Gl/KFShhK0zfarDNvgoNEV+/Irqmv+dnT2NdLqDFUsa4IOHoeCrurzAQ/
 6a9PaVx7x4ZxevJlMSgR3emDZmwJqwAXIjPOiDwDNvBJ6ZY3RJsLYYdGsddCt8Amg+Zb
 30Vw==
X-Gm-Message-State: APjAAAVFnzOtWLD+y5QZ5eJTFvaPrmDGu/emcqVjECTw8A7A4QGN4itl
 fO70gki3fyH8s7ugZArWBgyi5A==
X-Google-Smtp-Source: APXvYqwpFmH36r17EpnbWypN9BNTp/txPpd62YnFCcbyy5KtOAXjRmASH8ayjcpFinwMcEVSZ1VEPw==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr2941028wmi.50.1552990310936; 
 Tue, 19 Mar 2019 03:11:50 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id h10sm3911245wmf.2.2019.03.19.03.11.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 03:11:49 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add VDEC clock IDs
Date: Tue, 19 Mar 2019 11:11:37 +0100
Message-Id: <20190319101138.27520-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319101138.27520-1-mjourdan@baylibre.com>
References: <20190319101138.27520-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_031154_680461_BD827BD1 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Expose the three clocks related to the video decoder.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..82c9e0c020b2 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,8 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_VDEC_1				204
+#define CLKID_VDEC_HEVC				207
+#define CLKID_VDEC_HEVCF			210
 
 #endif /* __G12A_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
