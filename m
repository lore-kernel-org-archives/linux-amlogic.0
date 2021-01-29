Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B233CC433DB
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F4864DD9
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F4864DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvuEJYxbAcU5ynqqPqoCwUWF+18UFyZl4FVrq2Rh4dM=; b=t8xRgqd7tb/kBUEkxT6ajfE7Vq
	oWiCb6s2dJ2tXWco1xZW5w5VSBTI47W76rnuMlwWHZSuFGfTPrV2Qy2BMf36VxD8b7h2Ix5J4rO+X
	1xR0BIrpOqtbzWLNrWxfmZy6RG0Zz/G+0WwPq3vAMm0kKmt7EqJW6rYFaU/CHmkxGvTPLCctxQ9Hz
	Lj4Y4SM9Rk/3+UDgJB0CHqdQb11v8Svq7cw9dVnfPinGF3reWM2EvRK80OkxW8b+RmeavdqBAv4vI
	cmCeva+iyGVPWv+SZiIGAJH5nh9saCmbpCtRPxi7nVKrA97CeTKRm+x1Tj9DUL9FIiuwQDppBryKA
	xaXmxoRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5NdT-0005hs-7I; Fri, 29 Jan 2021 06:52:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NdD-0005ci-KY; Fri, 29 Jan 2021 06:51:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id g10so7738925wrx.1;
 Thu, 28 Jan 2021 22:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=slrEcS4a9ViM3/EhojYQnDYLHNridO9O3Av2lfzzgZk=;
 b=MWqBJ4L8ME/baSgjmqjvV2y7ks1cjglqfwf3iP3eOEuCR+kBuOBSR3PthXYZD5Nrev
 34wvNGLlza4nocai6q26PNT1Tu759jrYdmuVprLow5Cjg/UFwuSc3SOmDDb3KZY1efS+
 Ex9KOi4v62ZWkE6XFYEuWDDwnJHqxNwTUiNcbNEn+B/9Xn8sYSCbp12fREPsNu593FE0
 z28Zyt/RJqHLFZJ0BZyrAYP0WPTe2T3mteE+5mUFalMh4wGBkNAsIkW0TNnWWJOWNccg
 z1PS+wMTjzI7W9ygpAjK1xSOzXv7dy+vHd/wahduCm+Ke2TmJPbZtBCKnBT2zHi7mlHH
 gM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=slrEcS4a9ViM3/EhojYQnDYLHNridO9O3Av2lfzzgZk=;
 b=oSomRd7+pNX6ZYG8UTUKVcMQfrnPK0b+0K7Y7b1xWzLaVBDBTpkUH70XCzUswMV2i7
 +mtvlFvM0kxnEeXGxkMdJ1A9mB+DarizGGsLwWPc+wI3AvEkHWEov6IzbqNNpaajkMnV
 D0biSouUKg9qo9+M3RdJO5gCtcXRwSJs7j7Idv+CPKJM5wF0Ii5wbsTTkeGU2Yxlm0OD
 FUHmqnn5pMOYNymL20GUmJ/8OMqoXUPPbXYaSCrvnBuLFJUrvMy4rV6/qCmzP/2/8wUk
 ihAK3P7bLmAS8SQoTyCQerjkkK4u8zzsxmmPqI2LxskY963Z/YWwi6kTeCmPJSYtDYN5
 oirQ==
X-Gm-Message-State: AOAM530rxeVpD/yheGa2kFSLyTz9OHM49N9iIvX+DSYataMPWqBL9Okc
 6+Jp9MqkplBSaqYz1ISTYx3FJl8E89g=
X-Google-Smtp-Source: ABdhPJwkqX6JTwQ/Vh7ywI/tR4QczyXk9/dyQD1TALk/eWfPvmSPu75LpDOtsf3f2QN0XetHz7z/jg==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr2783563wru.372.1611903104739; 
 Thu, 28 Jan 2021 22:51:44 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b7sm11501236wrs.50.2021.01.28.22.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 22:51:44 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: amlogic: sort SM1 bindings
Date: Fri, 29 Jan 2021 06:51:33 +0000
Message-Id: <20210129065137.5473-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129065137.5473-1-christianshewitt@gmail.com>
References: <20210129065137.5473-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_015147_724396_3D2D5F7F 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sort the bindings before adding new SM1 devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6bef60ddda64..b21ba8ba23dd 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,9 +164,9 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
-              - seirobotics,sei610
-              - khadas,vim3l
               - hardkernel,odroid-c4
+              - khadas,vim3l
+              - seirobotics,sei610
           - const: amlogic,sm1
 
       - description: Boards with the Amlogic Meson A1 A113L SoC
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
