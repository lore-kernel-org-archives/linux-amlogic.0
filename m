Return-Path: <SRS0=7NJC=PF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAACC43613
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD1920879
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVOZ++V8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yZdVqtTY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD1920879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2t7UbCgaGhQX4u4ZShGKJWkZojYiFv2AAIwwDEopYKs=; b=EVOZ++V8DzrP8xx93Fbmr/Q7GJ
	VFduMWDxpuPKwsXfRH7L5IZ1VVqR+3/yn4iEGUnzqnLmznHgXPFaCYc0usdS26+dOehbcWRO57a61
	c96FOYOZHrQExij93yikYlJQPtTQxggM83aIY7cMkfWDOc1As6BrwDMS9fHxPHMM7RshU46CrSKyJ
	4LEG/jaiwFg0W+XpzIk49KVfZguAAqDKxQzaYMl7wFJeM8/LZYaCHATXIAAHJGk/yBUZrmd8+eNnD
	hazOyUyIjPFbVzLyW7ESvp6Rj2+UfDMAVerDHRAjZEq/c/wrb62sjFVuweJliK0Hl2KmRynufZhSD
	dELac7cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcpjo-0001xD-B2; Fri, 28 Dec 2018 10:51:32 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcpjk-0001sG-JH
 for linux-amlogic@lists.infradead.org; Fri, 28 Dec 2018 10:51:30 +0000
Received: by mail-ed1-x541.google.com with SMTP id d39so17213361edb.12
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Dec 2018 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R7MS0Uj6TV3IGRKuWXxgSYM6zp8WuEpgDa+p4giEhME=;
 b=yZdVqtTY4hdZe8hkiWJ/OnLpqWTsMeOY81l02Veg7pb8pTkRRNxSllQmrLi27gS29v
 KS1pa+U4IuZK3PlGmOrms/cxlyJuEXrEI0wQX5Zz5Rk9pkKP1HLIerb/2HphlYATFHeb
 TxpehEIX06Ki39IRnOiHgWkeMnldKz69VDYjv0xKUdi9yJyRjf+dXAu9catVnVOZbWVW
 zUmulG9Pc2/9WSqSNTKfMfBMoZoFZoWCCDbInX4g4ArbP/7ErQ8i6jLt3ZKtkdlUkXD9
 BmgwGYWS/ZP8FKkSEKxM2bRI7OQmJdvC1jlYuWirVrjn5i5s1jMEknMshiICXb2gES02
 b37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R7MS0Uj6TV3IGRKuWXxgSYM6zp8WuEpgDa+p4giEhME=;
 b=f1gtSrKFjTQsVX5GchkkvfvLwNuEpaIoDUezEW0d49T+MADBMPTBnwsGPXU5ivhrUe
 zTM9wwmtlenR2vP3AVqUgOUWGMFEKxUOldeO8VneU64os240kMtXWltgyWQDu8xMLTTb
 qT5iPiCCBFRKq5EtIeV6fXQF2m9QORaennx+qYJR6TJmoYNzdJaet9GA35EwlvJ5knoh
 4UQQWNffVAwfPTyKfe+NRC6k3mvMykHxwP2WPHT9VUMM/BB1y/3iWufvJGJIDr4a36GE
 p5c5gM9EEKjfkM5OX+Jvdlz2KZ74gZ/JZBBqUrYM49ZOuDYQ8oNg8bwFK3/tZhXgB5Tq
 vVtg==
X-Gm-Message-State: AA+aEWZlwbTKxbSZGpYSzOgceznruEA4RcOtfiRm1rcyNeBi1vY4Mets
 ldgfOdonaJn6eTcpS942NrsBgg==
X-Google-Smtp-Source: AFSGD/WkcjQjw5oTUruL7JeZA3mZvu0230sCi2ShPckzaEfx8suGNY1wnf1tdaDpB7CBxiFGzh4alA==
X-Received: by 2002:a17:906:51d4:: with SMTP id
 v20-v6mr18411872ejk.184.1545994276866; 
 Fri, 28 Dec 2018 02:51:16 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.home
 (anice-157-1-157-17.w83-201.abo.wanadoo.fr. [83.201.132.17])
 by smtp.googlemail.com with ESMTPSA id b45sm12919494eda.34.2018.12.28.02.51.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Dec 2018 02:51:16 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/4] dt-bindings: Add vendor prefix for "GlobalTop Technology,
 Inc."
Date: Fri, 28 Dec 2018 11:50:32 +0100
Message-Id: <1545994235-8309-2-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181228_025128_894098_EF3920D4 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add globaltop vendor definition.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8fcc16..a9214767afa8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -153,6 +153,7 @@ goodix	Shenzhen Huiding Technology Co., Ltd.
 google	Google, Inc.
 grinn	Grinn
 grmn	Garmin Limited
+globaltop	GlobalTop Technology, Inc.
 gumstix	Gumstix, Inc.
 gw	Gateworks Corporation
 hannstar	HannStar Display Corporation
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
