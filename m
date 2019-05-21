Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39EFC04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:20:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91282173E
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GkLtP9RB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m4gDvS+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C91282173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcqb/ZqFdUTfWUsF4GmA/pBio5HCvXobj5o+WgbAlRY=; b=GkLtP9RBb6eemU
	xHvWWNtui7TSXTZ8ykw+LJlmtZ1eQbkJMoyrADiHq0A8quSvDPNgJUeXtSqJzbzNQt7Lelx3J3KQw
	VRmfIafBSEbXpuIZvumOZL0ngzUmwOY7n0bj+Y/U6RaUZNnZmlHPCfJ2qWsBuEfF7Y040DCM3I+2n
	I6rpZbU/lVbQemQ+aC6zKRDuAgVYPNKHcFFn8EV2UaV3gVPRSeR8pSlDLNi4pgv/EHEPZ0h1RSq1g
	xxugAR79We/Xqs7USVCf5yL4aP8j+sqzjj/CYqi9W+zVqozcZqeAemJ9jwRlu1WR08dBaX21tmKBx
	cPyWfYLWAJ+1OEkaBZLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT6Z1-0007CE-L1; Tue, 21 May 2019 15:20:27 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT6YY-0005RC-QG
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 15:20:00 +0000
Received: by mail-wm1-x341.google.com with SMTP id c77so3414506wmd.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 08:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UEmu+PQTJMEzkzxShtce1PUS0kwGjqD32xVaKXEq8k=;
 b=m4gDvS+OKNfl4tPhdhYIPSGwDI5QUMCD0qa2ChEKnlS1dVhLQFGx+t+skeULPeKIKK
 va6KX7ohP5NII4ATmVhU8vtjZUELDtjDNotPuBJ3nHzves6U656GVJdsKOkZd0eHJorR
 Jj/RLpv3ksfacmK2rjHOhbG4J/ioBy0yNuvKQh8d0JZQGO6D2cRj7SMUmGfa4AnOHEAf
 swr/rdaEmrXl6s+NHLTg1RMS48bUJOD8eSBGFyQ/gAuF08dEdG9ns6/8nsTW/BH3GFq3
 Bqs9KuArvqeZRBuCVhg9axNdwF6RNS94r1Mz1Ha2E+EJl5HqB+a/ovi7zDRdOTsma/Pe
 EkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2UEmu+PQTJMEzkzxShtce1PUS0kwGjqD32xVaKXEq8k=;
 b=RPs7Bzlbg8s5gWc8VPvUtk+v99kaBf+zTsJjL43CdD4BJPnqGtr3NgXnwHh4Y45zEG
 j1Ve61foQ7QQiktDCX0BEXgyxzF6eFFzYWaLyy9T0znOJlhaPOmfRfmBAnKP0BBHmCnp
 FLX9IM75YQhh5Qpzcxzi6cYDsXG2jzJbrKSuLRD5LKgZDUW7+NO+QC+VTD54zupVWJSA
 LqF6sN8dUJatu7E6nE6VGz6Yx5hdstFC0DlLL943+2B092MJvP2JbGu7UmUVluTAcBac
 zWo9o5hp4fDO2UcyArSKgQOVWrl+IM5Vvv5s0HAJAR72ho422xkpZDcm2j72+ScSTC+t
 9ZOQ==
X-Gm-Message-State: APjAAAW94a9n18m6OqRTXc46AKU5aJ6NoQzqKhs/G2E1YvuIv+4SnY1P
 LaptGbF5Be2RUbWnnDG10tdGTA==
X-Google-Smtp-Source: APXvYqwk2IBY1kdDxl8FarpdDrMnx6sRXqje8GLIZs5Bg3e9TU58EJrEreRIcvDw7cnoTqyedCYF8A==
X-Received: by 2002:a1c:ba87:: with SMTP id k129mr3900600wmf.132.1558451996629; 
 Tue, 21 May 2019 08:19:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p17sm3945677wrq.95.2019.05.21.08.19.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 May 2019 08:19:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Odroid-N2 binding
Date: Tue, 21 May 2019 17:19:51 +0200
Message-Id: <20190521151952.2779-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521151952.2779-1-narmstrong@baylibre.com>
References: <20190521151952.2779-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_081958_850616_9E16AC33 
X-CRM114-Status: UNSURE (   9.00  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
from HardKernel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Rob, Martin,

I converted the patch you acked in yaml, I kept the Reviewed-by,
is it ok for you ?

Neil
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 28115dd49f96..f75df4471c0a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -139,6 +139,8 @@ properties:
 
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
+          - enum:
+              - hardkernel,odroid-n2
           - const: amlogic,g12b
 
 ...
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
