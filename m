Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F14C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 12:17:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6A2246AE
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 12:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NudQL5SS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsBF+G4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6A2246AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3ktS6DYNCe1Um0b0tgFL1U7T+1j9iBw0t68jTtLKj9k=; b=NudQL5SS+lJR/m3pMQDSWyNlmd
	NoEYwjhwN6ZGsbb+K8Uaue7+mZR2z3cp358M60poCFXGWEHgIPu8uFQQaGc22X69GHqb/kHbeNsiW
	Evf1agbP9sZXI7DrDy3zjS2uDXXKCYYGEe8MrQAY8AwMvCwbv+LUccm87IJ6ZX3/wR7oq/EKYxoMU
	TJ7F5nRm4+ZBNDUbTgY/cdXTS7g13sk/ZXCY4FHKSbB89YFiaQf6VVA+o7luNMpSza9KBO4yYrQ8I
	soz4owTsofTjR/wvLmXoDFp+VsaGYj74eV4Gv285aehq5LbSzEQjMnTBQDNdbeNSoI0SDr0eYlKIa
	sNSCUHrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8142-0005mm-QQ; Sat, 29 Feb 2020 12:17:50 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j813E-00054T-42; Sat, 29 Feb 2020 12:17:01 +0000
Received: by mail-lj1-x234.google.com with SMTP id w1so6383452ljh.5;
 Sat, 29 Feb 2020 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NmeW9ngS8eifN3sjrGPI1hv1F6A8Nf5uvazYyp+BS9k=;
 b=fsBF+G4rrEavnF+deIdP/ZIXTHhFb3889bXztI6LtHsY8wWGlxctMe+BkXmv3Ob2H2
 3yvmUfXu5eevF8q9+7pUZJl+2HysP2echSLEFErLmDwQ4tybS+6SAQ+kkIjCMt1EiIyL
 uqZLIeln4glcBLnvAbjmTIDzAvClK4mCiLpOEMcZ1pipEK1yiWQYM4wmcgxDzzx76dRx
 z5x0x0afGREgGohTSF0X7dUK1m7Hng6MuYGXLbLPPi3hjMhOKq2gdftxc1AwlI0G6lUM
 XkKsljviErQv5OfynUOeaZ6Q5ii6imWqtiSClUrcGyN9Wn3xr5ZDH3M08mPZ5IOupEB/
 cKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NmeW9ngS8eifN3sjrGPI1hv1F6A8Nf5uvazYyp+BS9k=;
 b=IeGO/5REN4B0+IDxgsDw/ckZ8jxOVViJSaUA5Y1cgIFThp9o4gV/0+AczqIZ5WvUJL
 UE/EHNK+j2gtpCXVhF7FgVafhMBVdiljTC+8+WaPphG6agmNf67GX3SOkIEoSXaf1ADR
 v8ZoB/wOC4Evnb/T9Lo5mfHz5ZBssFmtvZItT52uJb18aUb/Z///Yta4ktv2Aikq05I+
 I9+0Ac0sqj2LArxOr9995Lu8CyZ6eB7a7lhf1EPmE+24aHUs5LdoJSHsD+W9xEv2D+OY
 CmAD4gDQZ4M7dutBKbJhvtC5G9R2NycGoib/uAiMVVJ8JGp98BlF975AxDkr+fVWI4TY
 Qi0w==
X-Gm-Message-State: ANhLgQ1JRoKx/BrolTf/q4/GoqjFb7K++d4FrqR1CWrJe8gmGQgJ0Jlg
 Tds6duQVmCEDfsqOGWNbP3Q=
X-Google-Smtp-Source: ADFU+vvZe2Fm5iD/DxxWhWMNcaKeu1vbIPgY+k5XIhBFqHSSJoUbfekOeo/upkJ/GuljLDMmof05/g==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr5935430ljj.97.1582978618295;
 Sat, 29 Feb 2020 04:16:58 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x1sm6270232lfq.46.2020.02.29.04.16.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 04:16:57 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: add vendor prefix for SmartLabs LLC
Date: Sat, 29 Feb 2020 16:16:02 +0400
Message-Id: <1582978564-81491-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582978564-81491-1-git-send-email-christianshewitt@gmail.com>
References: <1582978564-81491-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_041700_173464_AB60C247 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 =?UTF-8?q?Jer=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SmartLabs LLC are a professional integrator of Interactive TV solutions
and IPTV/VOD devices [1].

[1] https://www.smartlabs.tv/en/about/

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944..a34ed82 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -901,6 +901,8 @@ patternProperties:
     description: Sitronix Technology Corporation
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartlabs,.*":
+    description: SmartLabs LLC
   "^smsc,.*":
     description: Standard Microsystems Corporation
   "^snps,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
