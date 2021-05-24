Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7DEC04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 16:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1E8610FC
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 16:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C1E8610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w+EhLr9j69I6S8NYLXzIVxt/twp1+IG1LYmTmDS3vNA=; b=vckrkXoI90J17y
	kU8JIjA0Q+5wSzx1yLT158+7FQZyfnhiUciII1Q9b+B0FFZD8m+Eb1njoKqcVnVod+sFIuwEsETkf
	kIkwbqyAWIemzWzJoEim+pxALNjiLD+OJKcKDwsoMa0A2krzzWGpGweccV76hVtdK8iz9gTnlS0bg
	A2xTejuFhyQyM5RcbvOAXYUnuI2akZ89X/IQZw/23XOooXZVCu66Wsr0EgWh1p+toqYJHJVZNnjfm
	3/YbobDThUurVZ8/v9zH5bvPL7ih5U6ZdM1cukCLMGZaj0dtpw8A23PG1zwqDpnPL5EfyftmKMf4m
	RnxiqU/vM7TNPrc+fskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDcb-0018kx-C8; Mon, 24 May 2021 16:40:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll6zM-000o37-HO
 for linux-amlogic@lists.infradead.org; Mon, 24 May 2021 09:35:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so7982408wmq.0
 for <linux-amlogic@lists.infradead.org>; Mon, 24 May 2021 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62PaeGm/tBJ//uGzYHNPfzzgrMdbT7h0TiIpVr9Cdhw=;
 b=oQTQ2EZXiqyQF23C+25JhSVHZpnMy1UlC/iAjYjDU735seJre1JC5UDfqK3Fphitf2
 LPpLz98GFdYTpeyVUHrCPkQHSQORehwA8nzL57nF56H/13kWRsF8F2Qij7/3LMbZ+XSV
 TPLUkOr73fIjwcGwCmmtcQf4XlAjAUjkWppdeJsdqG7QzqcuDvgl4KLAeYRKZTST5BLs
 uUzvxmewHR3agPx27h0hVMcAenRJeFAn2UqT38E7VPTwCTzI9j+ifDlU6g0IqrJDgLBr
 a6rPKGXu9TueSWkFkZMs/kI7TucgAe786TbD+uYsJoe3KHwH6KwWPe4BfpFpfCovJCQw
 6Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62PaeGm/tBJ//uGzYHNPfzzgrMdbT7h0TiIpVr9Cdhw=;
 b=nZiS8JpP1z7sTCaVpnNLtJM5f8aJtXRKjtMZJ9mRvg1MO+aH9TvY9OxLSbyBLJhu/L
 pFd5nENYaF14cCdWXOyu7SRBNkEH6x691C7HvjyI7RQ8deZPpH3mg9R4/LvkmGUshckA
 lIb5psFLzFcJxjosO9M0D+LtdcyIpak2TVdQlFOSMDhlYkxOU4AHadLW05cmbmjnrale
 hkTDbVOHO2yVWNJKPx8R9kHCh2i2SVG8vugQTt684pE5nZzuu4W7ymy0cSdzQyIozv9t
 jbnHyMwT4RZov81ACCcc2a5Uta4AzXXIJbtyBIdxe4QlsyFlH/Cvqf3HP/sfqJHJ+zFN
 lXhg==
X-Gm-Message-State: AOAM530NE184Ob7yLLfddG4mZm9Ind/cwPwNewOArLBYRfD2HN0VGCtP
 ZLDJ7tVoPwjZKsfE8cCGOq8xJQ==
X-Google-Smtp-Source: ABdhPJxHI5iSFZNJeQGs9c4fFwSfr366nLRLlKUkhGpSdqZSTLuYpYtZnagbzMC1XSzVri4QPcPqFQ==
X-Received: by 2002:a05:600c:35cc:: with SMTP id
 r12mr18373680wmq.157.1621848903248; 
 Mon, 24 May 2021 02:35:03 -0700 (PDT)
Received: from jackdaw.baylibre.com (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id p6sm7317267wma.4.2021.05.24.02.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 02:35:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH] ASoC: meson: gx-card: fix sound-dai dt schema
Date: Mon, 24 May 2021 11:34:48 +0200
Message-Id: <20210524093448.357140-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_023508_596480_8CEB28F8 
X-CRM114-Status: GOOD (  10.69  )
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

There is a fair amount of warnings when running 'make dtbs_check' with
amlogic,gx-sound-card.yaml.

Ex:
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0: [66, 0, 0] is too long

The reason is that the sound-dai phandle provided has cells, and in such
case the schema should use 'phandle-array' instead of 'phandle'.

Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index db61f0731a20..2e35aeaa8781 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -57,7 +57,7 @@ patternProperties:
           rate
 
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description: phandle of the CPU DAI
 
     patternProperties:
@@ -71,7 +71,7 @@ patternProperties:
 
         properties:
           sound-dai:
-            $ref: /schemas/types.yaml#/definitions/phandle
+            $ref: /schemas/types.yaml#/definitions/phandle-array
             description: phandle of the codec DAI
 
         required:
-- 
2.32.0.rc0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
