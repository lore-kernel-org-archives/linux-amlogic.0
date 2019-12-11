Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533DEC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 08:42:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2142D2077B
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 08:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4gLk3Vn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sypZYZzi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2142D2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRilUgmf6X4zTPTSxsIIpzwvETlkYQrVWU+5nHYFfCU=; b=O4gLk3VnOoPZx2
	vStafjN2JUYEFlkar/L8bjpAdcfZUHT2xmdCTsyfQ+/uMDmRRmhFkSvNLd221H9IW+/iOn5XsSXMZ
	J6FQ10xGZMoHubSl6MMWOIs9Y9UHXtQiJDBC8dNitXmiXKVz5zlMrgdNmzCExqz1W7QGSqOnFPzyQ
	pbOnQ2l5HnxRdCkIsulCrGsgBZI8Qqs/hNSADaanrZ4XSOEtoXB1jwt0UjXaKLUzeCo7eyqs7+/Vt
	mjX5xb+EWNuspBvtUcwV/zmoqXnn1h93cNJzDCEx/cPS5KmMH1qG6NlAgezdfIfp+nGiiKpLpVlwq
	kbUhB+o8XYh7QRoSAfHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iexZY-0005JC-Vs; Wed, 11 Dec 2019 08:42:17 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iexZ6-0004rd-8C; Wed, 11 Dec 2019 08:41:49 +0000
Received: by mail-pg1-x541.google.com with SMTP id x7so10412139pgl.11;
 Wed, 11 Dec 2019 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wSnofsroC3q0Bz8ZT6LbzRALYay3vg5tkKr0icagGfk=;
 b=sypZYZziLS/YcWob4MchGqcycarvQZxMn1mSMGNavUXnuWQI15mU3JGLc0COr8rNfa
 S+x47EZAWcs5BUYfMPqdssiYJVBOrvSDUCVXCTBPRXVATsss+XcCggIYD5ExhI6C23sP
 IpjDo8WjUaAVIwOkJsbOzF323dESHRNZanM0WrgrlnnkT0EaG9InnfNmbuJHMwiXZPHd
 DajBDlkcloEhOJdhq1l/qHuRKBvS2gtLH2+IkvgUTugKnpUwUq2sCFG6/o8J4B0wX5/M
 QII848BqsJJfF5pRqejJVwKftsk7ZCosaHKbVD7MWdFn5qOH9ahs+DEYPluSnUFViw5P
 KuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wSnofsroC3q0Bz8ZT6LbzRALYay3vg5tkKr0icagGfk=;
 b=nYQh0CMtl480XLeDzfp3h85X1HIhMfTBMjIvqh45cmo4kS1ZEHccIDCF3U62r1oZfk
 UtTy6/VR38XHYk7EKhrEJd9hFX9NNM/CIFSvZc+f1E9ANTViC5eDUAyjyD5ewNYLYMsT
 5gJtRNCt5CrhIyVAbbc+3hS/xx4Q5yT8NXnrgq/pOCHIyidNS9LoMIhJUHuoevQzLY0n
 +z8hT4RpGxjQoMRCiVO1YkFLx/5NTDEDaRNjLvA5Si5x/pwqDcTffDrXN6spSON1dQqp
 sTkkHIa06GWCUdAWINaBd3I/d+vCYZCTnIpULUbagiG2BZhtA4ot5iCM0220TRdZuXEF
 ij7Q==
X-Gm-Message-State: APjAAAW6jV3P0yTDgqJr9jgtOuS1x0BHSlzD33TLQiztlMTb+VcHmhbG
 YV+BGZv4LcLhytmHDIied+Lf8Clj
X-Google-Smtp-Source: APXvYqxLtckOJJeAP+OJm1gWfjjRej8ZWHqTmg1NF79cWSx/7GSvheeLLtEy9ENMm0+iJkCsWsKRfQ==
X-Received: by 2002:a62:ee0c:: with SMTP id e12mr2595374pfi.38.1576053707552; 
 Wed, 11 Dec 2019 00:41:47 -0800 (PST)
Received: from localhost.localdomain ([103.51.73.137])
 by smtp.gmail.com with ESMTPSA id e16sm1806233pgk.77.2019.12.11.00.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 00:41:47 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Corentin Labbe <clabbe@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>
Subject: [PATCHv1 2/3] dt-bindings: crypto: Add compatible string for amlogic
 GXBB SoC
Date: Wed, 11 Dec 2019 08:41:11 +0000
Message-Id: <20191211084112.971-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211084112.971-1-linux.amoon@gmail.com>
References: <20191211084112.971-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_004148_291763_B9F419C6 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a compatible string to support cryto controller for Amlogic GXBB SoC.

Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 5becc60a0e28..be0c3f73a9cd 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     items:
+    - const: amlogic,gxbb-crypto
     - const: amlogic,gxl-crypto
 
   reg:
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
