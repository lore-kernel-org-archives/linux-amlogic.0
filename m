Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2FAC4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 10:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6602E60E97
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 10:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6602E60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZnXoBz+Gj4cJ4wZq6GdwR86aTBuu/WoCC2jp9MJwYw=; b=vf018UAwqE2wo7
	cZbWWpHYI4a5DdpR73lzI572vrnmgWQkL6qNyggoQraMGqobXom22lkHPpskFc7J4hCRn+IY8MrgQ
	74sOIjvizTs+W0sdLSFRUnmpATzy7oTeajiAe4OvQS/Lt+W6pTg5cryl4np2jZl6mtnP6bIh/AVI9
	CiUfQ5qHr1tdLxrXCWnW4+odB/NNbFfvlsfZ+B+JZbfKTAhHSkPOFUdwAfPY+BTaVCfsGiyA4C9+4
	8krdDjXxlnESwJIbsudbqhpRKu8yWOVdtFA2ksNntg5KbODvqTO4+6USHWVSdT8KEp8eR6kpSBr94
	nzQjJx6ELnBVRIDm1d6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDOy8-003Vfl-CP; Tue, 10 Aug 2021 10:26:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDOxg-003VZF-UQ; Tue, 10 Aug 2021 10:26:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id b11so9405284wrx.6;
 Tue, 10 Aug 2021 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ail8+T+/FwVUA7gWn+lZm4pSQKQ3OOV0PrkoWmQeTKk=;
 b=o3oRVpQOYqzisi2aOnz1qHAh9uGBtJoDj7CFeBaTrYp7DgxeNI7n+VqiLVkG1qcVnj
 MmXJdUfUP3DtOx8c/95snq+oxF+kh+5vTy8WEP/PDXThjGrjZzhHs+75RhXzrND61xhI
 uumM5Re4/3hmwEErAyt3dtfEIzlOS+AFfd+xC68ajQSq9y9iXW28mNR4taTjeKyE1txg
 uryoTS0i7a9DQdK8clEVb1VFue/26S8eIhm5V49PeGWI00nWV7qNdySSqm1ddpEZ2ks7
 FXiqUfRW4ace2jXMW0OmvApHjaBVCNnQxPCBeadJRJGyVdPBCinmK4gyvhnHbLtujXbD
 sAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ail8+T+/FwVUA7gWn+lZm4pSQKQ3OOV0PrkoWmQeTKk=;
 b=s0tkWUHVFrSzQpZ+kA3XkM3DgqoYFKTAwg+TswzRWXHF4xyvDLksko/dwIPxctyYXZ
 f7VvLLF7a+X5NTvzvMlh7S+QXQwTN/XCPpQdRvt6ygxNut0eqi9E165cYgATlzB9Gygn
 vDTfN7LsMHS2W6nggY89UucWBr9beEIhp3CiJ7ealMV1oM8jFPPChHiBgJ54qo9VTKDo
 VX/KcljJ4hcwbfMBXfmoP8t5SUXF4cVnJMjO/wnF4XOB/JoBewdcD5a3C6bSogJTtMUh
 gZXIViRK5m4VkuuFKqoRHcwQELFs+ZsHT2nep7tLV7H7FOC7+9ir+cmVur8bSIZ0LPLa
 PRHg==
X-Gm-Message-State: AOAM533x6Sd8CL4QyvB2TKdgCOkoxENlIQ7MdhncxMh/KMzAKdOOlh+a
 ifPufgh0nKnwYxvrR1Og070=
X-Google-Smtp-Source: ABdhPJwNfCBobSymUcYfJpl1FqjQ2PAxFPjbwCpAu1CzE0LNqwQHqzD2SojSx7/cNv2BJIC6osYb/A==
X-Received: by 2002:adf:c549:: with SMTP id s9mr30205853wrf.344.1628591179291; 
 Tue, 10 Aug 2021 03:26:19 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j194sm1582998wmj.3.2021.08.10.03.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:26:18 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for Radxa Zero
Date: Tue, 10 Aug 2021 10:26:12 +0000
Message-Id: <20210810102613.25149-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810102613.25149-1-christianshewitt@gmail.com>
References: <20210810102613.25149-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_032621_002102_7C9AFF4D 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Radxa Zero is a small form-factor SBC with an Amlogic S905Y2 chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6423377710ee..67dccdd9a5a4 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -141,6 +141,7 @@ properties:
           - enum:
               - amediatech,x96-max
               - amlogic,u200
+              - radxa,zero
               - seirobotics,sei510
           - const: amlogic,g12a
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
