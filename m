Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF6CC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxWL+kRw4JubSmuk17ChY/zcn4KSmi4Ujg4WqCVvyTM=; b=O5VoabNhrWf5G4
	LLBcvcrgvTvmNt5cHSLOR6XmN21QzBxvOKFx1G3MZG41yOOpvylRKSuKFfi3n0eqqyCS2c20I3VVU
	25Jx9o6OgMlVmpFvcwYQYVcmHqksMvSA6TmeOy1tk3dylwlMqjWQolmJvvGC048gRiz0+I5FUsRsH
	xHG1f6OZzvhP/t3Sbsex8IUoGWX5DlCdJB54wKf9bZo64OzwYkqSugw6QKxv5X4v73NsAu8IX5NOL
	g657zjt7hqjQce8HCtSaBH31nkUY+B9cJtiVGKtAco4yrpcSYA6V2ljdHaPrbrQuvEyNFtstXfETG
	pMGQghewVfleXno5yeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHkG-003VqR-N2; Tue, 24 Jan 2023 11:45:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdH-003974-Rn
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l8so11065373wms.3
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgP0cw5fx/i+2eK9QIjVGPdzg1sK0wxXwC3QQeMgW+4=;
        b=gYuWo5AV7I67iDn889BBqUGZq3cacMS4y2uWUsiSTm1YBoaqp+7ie0uZQOXE5yMTct
         haSTlh6HKBd4ZxU5ytkotToybZnPBuLxcpkpIb+kWZVOkmXoGKwX65R3djcD0qiGyph6
         hrKfZB/EKLbhFevt/VDakLTe4l7QOBV4ofUdTf1VYuyfbdmu8RXTMs2HLb9vX4XPEHR7
         +rZf52FAFCTUIEX5lWLLu7Hh5LvRADnloJCdJlOsw47+81CTlX7l/G81uRrqvuAePh+G
         GdNIKr9BJYU13oGTqN+XqUrvsqVzycyrGfP5WdZ19pRYe3fGVxW/x7bLqRuMFrNnpF3d
         9d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgP0cw5fx/i+2eK9QIjVGPdzg1sK0wxXwC3QQeMgW+4=;
        b=E3y5DpAHGO30m/zPEzAjdx89p0pxbcKpp0YkBRpYqj2lDKWOiySBdLiIdJAWQN+GeX
         uGYjLn44IBUuvjpic6l8BVhz14cTFtYz0g2lc8cVeuZdt/9j+tLLx7VGpZGoa+ar3VhW
         ESbw6FXOYd+nro4pGTdsB8HLgH5zOH6Ur7c+sYQ692Rh4cb9+GEpaykbLpTZ2sGuq0hl
         pCSNmTu6c+Vmj6+nwDTbjvhKOdsUJ5s34HrtMFYmidxJSRrN+UI78tNXFiZW2Oqc1RZ8
         oEghCoSmw7yE7HT7EDH4646OdddEBeP0W9pQh9LauDMD0Yn/2djFIvpkHgtqSCfSkCff
         9O6Q==
X-Gm-Message-State: AFqh2ko3/9OuwrHeQbAXwI6FIsTIjklRyuLk9sPAdpnbo7QnDABfgAeo
	1nCbg311s+6rf5M86NAs5OmRkQ==
X-Google-Smtp-Source: AMrXdXvC5sKP/orS0sFdGP+jXhVFRAlaxxJEH33JUUod6+5y/LerkdNqkh7Ez4SoOsCCmaHh3E42Kg==
X-Received: by 2002:a05:600c:3c92:b0:3d3:4007:9c88 with SMTP id bg18-20020a05600c3c9200b003d340079c88mr27615743wmb.18.1674556465674;
        Tue, 24 Jan 2023 02:34:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:22 +0100
Subject: [PATCH 01/14] arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs
 node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-1-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023427_908576_9D926298 
X-CRM114-Status: GOOD (  10.49  )
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

Fixes:
scpi: clocks: 'clock-controller' does not match any of the regexes: '^clocks-[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index a79a35e84281..11f3b3a4df97 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -250,7 +250,7 @@ scpi {
 		scpi_clocks: clocks {
 			compatible = "arm,scpi-clocks";
 
-			scpi_dvfs: clock-controller {
+			scpi_dvfs: clocks-0 {
 				compatible = "arm,scpi-dvfs-clocks";
 				#clock-cells = <1>;
 				clock-indices = <0>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
