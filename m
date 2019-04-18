Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880D5C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CFF2183F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBL4K0Bw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hOoLMfpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55CFF2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vo+LY3HOaM82UrMljxIvgdjCZjEL90QprPkDHpN8Ra4=; b=DBL4K0Bw75lr8M4QNFhOMvlmcQ
	wODY5+MBhww4KRPSvC5nA0ZJnhoNOmudK/X//bCUIRKWF7NUS7/nXJKIEZNUKROj1tNM4n5OGUjA1
	gSFyBf/6/7qwdgB+0toiw4dNQW4W/UXq8y0s69UyzPJ7qmBcFOgFYAw9CuiIa8VNFDnMdmwlK++Qm
	cZg5FjDS+PR7OYXhlBGiUnRC6TnVtpc7Ue+AZFL2jluyr/5Ne6lhuP6qAY7oTFvqLgoaKKb6+iksd
	FtjZgOf8pueXtqUfWcqdMW1wuwEcoQ9+0KAXCwLRDGzw9DFpH959urjqxpOaLSx7Df6q8nwPuW6ez
	G3YAuXZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6SU-0004NY-JA; Thu, 18 Apr 2019 12:48:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6SR-0004Ls-FK
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:48:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id f14so2247989wrj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hZGFnloPIH8uy+TOBn2bOgOK6HgyyxeBU1/SBUWxaZc=;
 b=hOoLMfpx0yeg1FfPGBfiYewmRrfWJidgOoNqRCHRADoA6GtzmZS48XTLqZj2QAPGC7
 TymJQMT7ulXf8zK58pGU5lQVzdR8OmuOZ85/NVzReIBUswOswL7WSxyAl10bbyzB8jDM
 c7BZcbPjIW5BONtfSFJtfBiwD5VCpEsx08ABmvpuqSQNq3gMP2KAKBth1Fy2Nq92EKlN
 SgLKs+DsNUtSSo1W7vfSKdreNR7Xbm57uIxafhmdxrJ0NhyCzg52yO6c+fRXyr7amEIF
 g3NmXx51eirV0dnZsDl2fmghb0Oh+ZFMq0IE0yt3hB1NMzT+hxxbpz2UcNys4FC96sHH
 s6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hZGFnloPIH8uy+TOBn2bOgOK6HgyyxeBU1/SBUWxaZc=;
 b=q/q4FZzhQT1VFf53geQv/ODSZWO4ewu3cl1ByrDj07C1e9PChszeK7Lqp7ateOEOMz
 JrPRIhGj99aTUN1O6sqLO1fzHqmEkRpEmX3FK1KzCQtvnLgyIKl2sNyIwga2xvAiT+pj
 FkhYnOZw4eoOWuHCck7mhODiEe9AYuF7HkIcbmusNV4SpTs6AnOmF7yrVgFYbFCmp6SB
 BAjke7hzJPT2qxO+BY5xLTi+GWm7YcSXBvJ+G9bAVSGrCELAuEJYFRHDr71MwpDKGs4b
 06+5R2BRGWd526nAV5kz2lYWzeepgaTOnBghyTRIxctT/GPr6519+qV2L5IbE3UhN4xL
 2u8w==
X-Gm-Message-State: APjAAAVtBc3TuPmXv4p8kfepBK2WngyJzeIyK8iH34fXZ7NDBrkjtMEd
 37D/GEHtx9c2m+Kv88blbI5bCQ==
X-Google-Smtp-Source: APXvYqxGUCY08Z6Tc1/uCiTaylzocswOa9Lvzn8FINRBhnCIAIdqJ42re1mtEpGC+kNREKbbLt+GXg==
X-Received: by 2002:adf:e449:: with SMTP id t9mr59193645wrm.204.1555591682108; 
 Thu, 18 Apr 2019 05:48:02 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q17sm1256823wrw.70.2019.04.18.05.48.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 05:48:01 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: add a 'drive-strength-uA'
 property
Date: Thu, 18 Apr 2019 14:47:55 +0200
Message-Id: <20190418124758.24022-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418124758.24022-1-glaroque@baylibre.com>
References: <20190418124758.24022-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_054803_509459_4229A88F 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This property allow drive-strength parameter in uA instead of mA.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index cef2b5855d60..fc7018459aa2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
 drive-open-drain	- drive with open drain
 drive-open-source	- drive with open source
 drive-strength		- sink or source at most X mA
+drive-strength-uA	- sink or source at most X uA
 input-enable		- enable input on pin (no effect on output, such as
 			  enabling an input buffer)
 input-disable		- disable input on pin (no effect on output, such as
@@ -326,6 +327,8 @@ arguments are described below.
 
 - drive-strength takes as argument the target strength in mA.
 
+- drive-strength-uA takes as argument the target strength in uA.
+
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
