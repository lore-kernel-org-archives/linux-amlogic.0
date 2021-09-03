Return-Path: <SRS0=UeA4=NZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACA6C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 06:01:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F8160FE6
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 06:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89F8160FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWYOXb+9zFREzzXufG28pPRCXbI+MR552aKpKq2VnDk=; b=rQ/mKe9SgdbS+E
	qdWKfQD+Q+zWMsOnRsJlL+XUPg7V7zk2cIBgeqY7BCggRTmSoUfgtXlAUPl3Z3n2H3F13y1WfA2Bi
	O0Ks6a/gm0xNl4v50VSXs1gJlDbqPmrgnnYfv0Xu02tcM5BUL1ZM3bq0KghfPI7PtlugjyYmOrEN7
	fACb/rIWeevwztT/Z/7zwzRI1t5dqCXz7zJ7jQMSCzWIR1f2sAwnaf8Gtd6UlNpRWVymI/UCzZLfc
	Jmxabf4Kz67fqMp26nGkMlvQm304OJJ/Y+8A8ssUuRDIxC9/VdmOtKYe4aqPCnUu8jhi0O25pDvYM
	omcpL8Q6Ju20Fby53gnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM2Gf-00B1Mv-Ob; Fri, 03 Sep 2021 06:01:37 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM2G6-00B1Em-Ib; Fri, 03 Sep 2021 06:01:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94355D50BB; Fri,  3 Sep 2021 06:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630648860; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5AST0dnrP28CYScPQA4dGXy3BMvm9dDouxDZK1j+8X0=;
 b=mN35dW+WJK6S5KKcJlfha2zR0C5XGlC+DBtq8skAFT2hpCibROZK1+MjBR0XyPIlStIznI
 bq8CDzGZ89FL3uyT1KSwPXKMtWDYVyCW3gTEKgeBejXLyJ81upEFjsacsqb44HOy5Id+x1
 rowaE6yoU6fl/Ad0+sft8c4qlHW4ubtONphEwh3Cs4mwOVdji8JPJxLnSwzVaglKNO+2/2
 dzVM9IGdqa1VCCpyYNS8vU9+jnCH99I3Hp2Zu+YggLueZUWTM66IbyAVXWAAvsksH9TDOr
 pe0IXr8fL4sqVHXAM9lddmSdviSQg4NNCGCMpiLf1cDFhvWyndluUjykMiGnyQ==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: arm: amlogic: add bindings for Jethub
 D1/H1
Date: Fri,  3 Sep 2021 09:00:33 +0300
Message-Id: <20210903060035.844758-2-adeep@lexina.in>
In-Reply-To: <20210903060035.844758-1-adeep@lexina.in>
References: <20210903060035.844758-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_230105_340076_11E4AA98 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add bindings for JetHome JetHub D1/H1

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6423377710ee..b223d7829c3d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -86,6 +86,7 @@ properties:
           - enum:
               - amlogic,p281
               - oranth,tx3-mini
+              - jethome,jethub-j80
           - const: amlogic,s905w
           - const: amlogic,meson-gxl
 
@@ -133,6 +134,7 @@ properties:
         items:
           - enum:
               - amlogic,s400
+              - jethome,jethub-j100
           - const: amlogic,a113d
           - const: amlogic,meson-axg
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
