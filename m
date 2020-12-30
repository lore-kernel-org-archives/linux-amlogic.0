Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C70C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11AC420867
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11AC420867
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9n5UqQWyKG1EkfXZ+V1mnKqfwDR/CyxTWZcdqifrLA=; b=rY6POx3o5TaWu4dTx8WSM3T6d
	n7H/WTRrebHAOYX51H0uBMX3GXgdUpl7QzXSlwtmss18P7o2nTzGfOfzsSgCgTNxDyKXcZRy9/cj5
	J9zKH5dgTWKzUYvS1ZuTudRaU8z9Tlxs1v40KTFnceBbip91cFzBpmxj+QEYmH6RKWaRMFpsss81L
	o4j16m8y8XtfzjFIN/jqciibNfKbEL4WedJl+A920bIBwoqrsPNfyd+XsGJtXm5rSvhr3+JR7FrBd
	10NjDOIStBMzj00NCIfYwwqIBeO1bavio6G41lPlKCiKSdkpqrim3tNxk520dbIO0RwdTdzhNeR8Q
	PxmHIkBEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuQHE-0000lX-2v; Wed, 30 Dec 2020 01:27:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuQH9-0000j1-3q; Wed, 30 Dec 2020 01:27:43 +0000
Received: by mail-ed1-x534.google.com with SMTP id r5so14094698eda.12;
 Tue, 29 Dec 2020 17:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
 b=Rj8sOYCIS+E/MVa5ui7wQLxQvcV4br+unm0GXxfRMUVlGrsVmTT4tqm4go25pqIMYA
 IT21SXvZZKWQ5kM/Iwc6licAvzMedXfc5gp4V3kj75OR81MOjx3uuHrZ0Qm8Qn9kRXEX
 u5G4KjxywmTJUJlnXVgwlmTQg1z4QSCI00xqr+6ByMVtTOZPgJU5kurQG6KXYT5B6+Wz
 v64C2+wovgn3UKz4bBI2eyzur5JNRFBEPTlBPrUB2bsipAGEZ7giztyyh74d03B8pxNi
 kMhBmJeKCROWqvlcuRBZhaJ3Mzar3EhDxOziSZp/NptCb2b4scDHOTHlN+dNyBYo9IfN
 9U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
 b=ekw3TtToSuadU2RaBBUVwApQybn5+2Z5aZ0hHR10nBDvRSEEuJ2rUQ5BXhSl5Yqm7C
 IPW1Whk7l+/IlxQcn62NEOYhaBbCvRuI40OrMGnk/jKBMNTGd+b4TBxbcMZ2Mhj0YooJ
 sx900io/pPkybx91v772MK7KHv3mzCuJoObjg1YeiywnGJQ71oduT0wqJ1fJAusHqFrI
 o5ifa8ivRrig1xbC4kOIZiDW98KERPg04+2LuWZ2RZFhbqfyCrl18dP+5qE8a1li0DKF
 ofqxxnbfHLJUJw1Ahu/bqflDPWzNvLAyg0L7rSxGu3lSdSqJqmRmEp1nWOfw4Kbpc3cg
 ZANA==
X-Gm-Message-State: AOAM5313YjtiCH939uhbrwLzJmKvx+UEuc64FGT3vZqDhcdfSIqfB1w4
 1UmYcaN9F0LeIhmrKtubuvk=
X-Google-Smtp-Source: ABdhPJzydY6e89yCgNrlsCho+Eqw9nrvxV6BTll14imCz7x61V1dXkTAfpJW6o8YTwcmkpXnPnrcSQ==
X-Received: by 2002:aa7:d608:: with SMTP id c8mr47385390edr.260.1609291661976; 
 Tue, 29 Dec 2020 17:27:41 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:372a:4000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Dec 2020 17:27:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: sram: Add compatible strings for the Meson
 AO ARC SRAM
Date: Wed, 30 Dec 2020 02:27:20 +0100
Message-Id: <20201230012724.1326156-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_202743_182427_E5067C42 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4 core
typically used for managing system suspend. A section of the SoCs SRAM
is mapped as memory for this ARC core. Add new compatible strings for
the SRAM section for the ARC core memory.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 19d116ff9ddc..6d65771e979c 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -72,6 +72,8 @@ patternProperties:
             - allwinner,sun4i-a10-sram-d
             - allwinner,sun9i-a80-smp-sram
             - allwinner,sun50i-a64-sram-c
+            - amlogic,meson8-ao-arc-sram
+            - amlogic,meson8b-ao-arc-sram
             - amlogic,meson8-smp-sram
             - amlogic,meson8b-smp-sram
             - amlogic,meson-gxbb-scp-shmem
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
