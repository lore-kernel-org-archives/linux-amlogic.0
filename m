Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1008AC43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87AB214D8
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qz/XxyBz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BjpNSB0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87AB214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouCrIGMnVABntBDq+VHJx+2NCA3OJoDb2R9W9QU0F8E=; b=Qz/XxyBzjATs53
	p8ptMU3QzEb2ilGiR3iR1vIlI1IFwZMTs5LuCcZ6su7nsSu+simkAUfcxwVhlHoSIwg/DZgs/+smT
	jv+rvyjvCtMlLMmLhe2h3/pGwZRxBGZNWIRMzWB16wwUsVjb6+zNXTbe0cy7KsPVaPW93leNsYFKt
	Chr4FoX/VKzxl8wG+KPWkhD7SJSZ/Ydnt8EArpH9RiBjDBODKcu+1/+s0Pj0VnS/qVY82nWGsRppd
	GEccHY/uNCBGhzInxicROjZW43Fp2JIEzuUkaVcUZ0aLY6Xv+wWWTlaostC3+rlcXeK7AqidGwnGi
	sXleEXwhLHbI0Laj5JAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieKBW-0001yU-PD; Mon, 09 Dec 2019 14:38:50 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieKBQ-0001s6-7w
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 14:38:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id y17so16481146wrh.5
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 06:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
 b=BjpNSB0H6WS+od4I9bWu7mlwGn05HdzHiVd7EYabnNtot4Dn/na/nH45rPrdImid/J
 75FjSOBvibW/Luu/9AxWOHuAYSGJ0mzkLyq2sutVsVezSxgFykoCtVWT1k4vx7Mbpjhc
 UYXRNVyIgHzzQQzV6FwKEUyLKUW5nQqtkB8GXEwMA/MTqi+/VbX+32/61QajiVtZgcA4
 +qq11SKhrE8bKeFclgsiYG1X6Yr9xjGZ/VMDrXh1FWCEQ4Q1l7Ka+C96/rFXWcXyokdM
 MPxrmWqGTQVxo+GsiGX44ZXLAcFra5YNstiC4L/BKDs2+t2bIyHJj/nJnX0YJsicd4xy
 9J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
 b=mt2J1nRSCI2DnSWa1OXcAOEqGCsvji8d6qbU0v0rx+cCH6jmmXXZYRbunL9+Kn4axJ
 dtGj2KntQulVd2cAzqdfnI9LKRnDgbiOMn5fWR5w6AwUJvw8aX9YeNozazafSREpugoE
 r8yTEQfmQq6QOlbSMPtk7p0GtuJroHLwn0vLOpBkQdkQQzmqzdY8fDTY47a+ChTRc1yD
 Q1ub2BDTaj3Xw+6HVnOj45cQYO3pJXySw3b1uobDh3ISHAmXHmR8NZ+uNgxRavyEMGwP
 /5UkWL1taINkJKcoKsDtMY4gdhWLWDnMium4lKueTZJUk0Vh1bm8mbI6oH+B549uF6Xi
 kt/A==
X-Gm-Message-State: APjAAAUqdeGAbYWpc1HczoJqSuOjGF9Zra2Bk4hty73Be1gKin+/1GZE
 9pzJtqdL+UosaO18HO1AmvPFeQ==
X-Google-Smtp-Source: APXvYqxuKaXKo89bA2CEldplyJh5hTpjzijO2zBIg9wfzU3ZNPMf2FYGVCGr68YLEg/CiaQcsRPXzQ==
X-Received: by 2002:adf:f091:: with SMTP id n17mr2560209wro.387.1575902323022; 
 Mon, 09 Dec 2019 06:38:43 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a1sm1904165wrr.80.2019.12.09.06.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:38:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/4] dt-bindings: arm: amlogic: add libretech-pc bindings
Date: Mon,  9 Dec 2019 15:38:35 +0100
Message-Id: <20191209143836.825990-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_063844_310280_F03B64D1 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the libretech PC form factor

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index c6a443352ef8..2660ba3b129b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -104,6 +104,7 @@ properties:
           - enum:
               - amlogic,p230
               - amlogic,p231
+              - libretech,aml-s905d-pc
               - phicomm,n1
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
@@ -115,6 +116,7 @@ properties:
               - amlogic,q201
               - khadas,vim2
               - kingnovel,r-box-pro
+              - libretech,aml-s912-pc
               - nexbox,a1
               - tronsmart,vega-s96
           - const: amlogic,s912
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
