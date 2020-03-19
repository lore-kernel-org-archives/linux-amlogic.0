Return-Path: <SRS0=2SAA=5E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9010EC4332E
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 20:35:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5D42072C
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Mar 2020 20:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BrYs9zbR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WuLvPS7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5D42072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPzNMC+pj4qGoe203t6RCc07JMyCzKrVrN3q1i33L3U=; b=BrYs9zbR83MU4u
	M99+LCTchG4IjiJxsXpAgz+WnCDtTeHRlIKgoeqF3nnEZJgK1XinYjvE68NHiVN+LNypBDb2HTdeJ
	yl8RSYaDlonnqVWvR9VbgCIa1pJirE5/Wx71IRDzPsD05cWmbkzyvqqg/JCABdJJLnFDB/UePctXU
	RyWEOzvPgRuIwYZXM1tz87X+oubXWjKivvRjksou9irfz+1cy3biin6FWwgw1iJSFVQKgzOCT/ASs
	YLEPgoPHAo/ON3pNWVTnFXFAwEtlEEonimyey/IJ58YGl7ogN/adMIXIUActpzUp+t+DwrrL6bOwi
	tG/u5h9DcgRS8iWvXuCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF1sj-0003S0-7P; Thu, 19 Mar 2020 20:35:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF1sd-0002dD-H9; Thu, 19 Mar 2020 20:35:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id 25so4201934wmk.3;
 Thu, 19 Mar 2020 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9RRhROApEcb204AeuCPMJcD4+LhyGPoAGUFvTjnDbJk=;
 b=WuLvPS7MO3JjnrTdyLixJJozVeO+g7q1Bn4vs++KlrdqcqvFbmcfIvQBAOmORNBXEN
 wTsrY+3Rltjd0CtCSmKo/JSpM8G/UiHa2FqYByMaBiNH27pT0aQDVlA/F38jZWBCLA6K
 cPh0AtXXzzN1uOb1RgNafI/aAn0mNdaFWPLu7CPMl1f4ergvhXPzcc0gUtUESz7xsV44
 mF44eDc9PFdb3XgU0fjvQUIP85tl00qiJ3sd8kGOYXnyzy72PiOrOE4qQSnhWFkp9aCh
 IvgNK8o2T12ufzW65jJ+3HzRLdXDrEc4D84ZGPqMMvpLy+o7AzkWskaGWokGAw9tgDlP
 Yvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RRhROApEcb204AeuCPMJcD4+LhyGPoAGUFvTjnDbJk=;
 b=AunqPWyWW/nMroPEwFSNtNOuiEvC63ZI015COXkzzrhInsoEe2Taq3peyiHzF9XQn2
 jEgfaORsPk+NQVtmKpsUBsHH91BC+5XjVcBlXyQWTXIF4UDa8GAjdxcunApgGeN4MhNx
 CgF9gh34bBg0u1uFtAv9HuH9LKEzc02McoyvyRoL5Xlv1P7SPHrKTU05m0uRSipU/2f7
 qIe+Ox9vTKkmIz2AgYeKDfnbcG+I48KDE237WzgJDtkxC/F/o2tZjrRXo9bK3f6nRPTN
 K8Kp13wDyP+/yZe5ac3e2b/Fxum6bcAcEZvxGq86uN+TgP9ZO6ulYb0ICCcicoqzf32T
 fknA==
X-Gm-Message-State: ANhLgQ2KDOxSz7HQO6xAf1/t+DnCFQVnrk6AL6spsuJokCypR34WJT62
 yThFDrjifwnECpAOsBadg9Cq5YeLpKg=
X-Google-Smtp-Source: ADFU+vvN87aV9h5DQk373Le1newa2fcLju+bTKeM04zZKybI27soSbkw0cX8T8TODsUPXqH4hqsCZA==
X-Received: by 2002:a1c:c907:: with SMTP id f7mr68703wmb.121.1584650101005;
 Thu, 19 Mar 2020 13:35:01 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r9sm4744968wma.47.2020.03.19.13.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:35:00 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] dt-bindings: gpu: mali-utgard: Add the #cooling-cells
 property
Date: Thu, 19 Mar 2020 21:34:26 +0100
Message-Id: <20200319203427.2259891-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_133503_572347_5640F17B 
X-CRM114-Status: UNSURE (   9.16  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GPU can be one of the big heat sources on a SoC. Allow the
"#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
overheating.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index afde81be3c29..33548ca2a759 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -107,6 +107,9 @@ properties:
 
   operating-points-v2: true
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -162,6 +165,7 @@ examples:
       clocks = <&ccu 1>, <&ccu 2>;
       clock-names = "bus", "core";
       resets = <&ccu 1>;
+      #cooling-cells = <2>;
     };
 
 ...
-- 
2.25.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
