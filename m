Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E6CC433E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 14:11:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10AA22B4E
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 14:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1l7JQTZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp1f9xNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10AA22B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta4wGGh7qvueSmKusz42VqMrGNpBaAN+77+YWu0yQCM=; b=N1l7JQTZnoLE7lLQMz1b6Mshsu
	icuTu0Acs4Ekhb+ZI4VIzzYB+ly/ko2wWwCw3qNCmgU6OBnU648ZKFSo5pXBThtMqsm01UXK2B0e9
	QwPypAcO0EP8fQV8UldbdvlAKi8LnjMyIKG5kxR5i/B3t75VvUKnAR1MV2tP+qEKU5qfc8PmAuHaW
	AlAgPDsb4zOmYJGZZL0Xpq/dgDlnCuYtvX/bgc1jmvn/Y+cPuIqA1WliyuxmdZ5vqFLi8N8h8ufjF
	Qq6YFhOxSRkTrpH2b31DAXVBSS62bAyWVMJxxOZJkI/od6K+TrtqBWtIIwYpLn5EKCQlWQMDJ8iZy
	1zfulJkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxA1l-0002VH-9E; Sun, 19 Jul 2020 14:10:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxA1c-0002TU-C1; Sun, 19 Jul 2020 14:10:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id f139so22708600wmf.5;
 Sun, 19 Jul 2020 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6+i6RY9LWPM0oMc6IkXi+EqQQ0KYWnUH3ATLz37JIGc=;
 b=dp1f9xNnBRiEwNcHBq0meBXNOsWJkgt3Uoi0BWGbQ6VsOIq7LmcH3kzOo2MJn9tUfa
 Bv+4UhVMJkwHxzHg4zfV5e3Mlita+S766uE5+2hdW25VhrNfVPXw6IIQIHCjsbK/P+P+
 pkL59RXE7DiJ/d8qXcO9tEjnYIymZ0lKAnqv7Yu0/7FTLM2v6EgVarGMLMK0uNT4Qw8X
 pqWntsnWCzFsk2yBiJfD0tIE3rGRb3wVAvfNjh2gQlWqRgDBV4tWgu9zXdCoE6VTc7mO
 6QsBhyNRmSLhCOGleBw36/s9cHigai5vbUqdRgGohvxwv4eNbz+3J+z8UEHoAJBiSP5J
 QmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6+i6RY9LWPM0oMc6IkXi+EqQQ0KYWnUH3ATLz37JIGc=;
 b=POO8zkXx4hDcIvXtZz1AY02AhMiJI3nspVnR0C4wpdyw8J6HgjhX+7HyhlVviEJ5Gs
 nZHQ227D571XvhJrdJYmuI7sY4a/E2DOrgXn17Dt/9YUA3uCA2s9t3766eH46WAqBqao
 h5p2aqeYM7q8b5pRqW9sn2BBPUuzjUyGVGcyCoTo8FD27aPbQRRGCXvdnCrBFuPqE5xa
 AZ1n5Dyf78p1C5aHMazVS6nIS25uqr1M/0k4AMnXW/8m6Il5rRFJSHj81/VtqmjP06NG
 turHN+BQq+y3YlKAbsMQ/CuF7nDJHg7ah0hmLIROSOrD1GqOBTDTKvLvPkYVT+k+FjKU
 yWcg==
X-Gm-Message-State: AOAM533AuEwVzVMSYhbZa1R1kg5/cX4FCJs6+UMxQWzEGu9kpY+6uIFf
 tSzn70DEmra40srEOeMVqNE=
X-Google-Smtp-Source: ABdhPJzq4GQqvr8i9zhthgq+iMBYiRgjINWCxSMC2J6MWU6I+sNtickMI/hOp9jSKWuJ5bcybWdaYg==
X-Received: by 2002:a1c:2e57:: with SMTP id u84mr18708737wmu.52.1595167843592; 
 Sun, 19 Jul 2020 07:10:43 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y11sm9215554wrs.80.2020.07.19.07.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 07:10:43 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: add support for the ODROID-N2+
Date: Sun, 19 Jul 2020 14:10:33 +0000
Message-Id: <20200719141034.8403-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200719141034.8403-1-christianshewitt@gmail.com>
References: <20200719141034.8403-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_101044_501354_90AD81EE 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Dongjin Kim <tobetter@hardkernel.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

HardKernel ODROID-N2+ uses a revised Amlogic S922X v2 chip that supports
higher cpu clock speeds than the original ODROID-N2.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 378229fa8310..595bb1d089f7 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -152,6 +152,7 @@ properties:
               - azw,gtking
               - azw,gtking-pro
               - hardkernel,odroid-n2
+              - hardkernel,odroid-n2-plus
               - khadas,vim3
               - ugoos,am6
           - const: amlogic,s922x
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
