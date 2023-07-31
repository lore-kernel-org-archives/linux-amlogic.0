Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C26C001DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLdCF7iBs8FFT6f94o2G7Xw1njtG5IYMhzMyA7goiWs=; b=QVyBAyASQaZx05
	NT44/9LOlEpQFZrTvcLASwKVO+E/5eUpg4LtCzdfCzMFQoK+9LVH8hN9U6Za2pP0f6jmzF6+MNfNa
	9JIdjbyjjzS03TeyKmPFcN8eaWxdeiKr45lapJP00nJOcZkuQkOxnCs47v1/MwhXHPqbDrS9GpRfw
	Izvi/9gBPUYXypu0UQhkTMDQDF3CXdR4J2OXZ+YrBOv8E2jBOOaE5OfLT3FkCOUut16iUjAvC6/NK
	9bmuugVlc+RoafZ93KX8PLhVJQ22zaUGy/FA3L4LYI4Az2cD0cwimd+58JHeZJHNZx+MwlLuXu6AW
	8pcyYa7EuemmK7ypkTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOpe-00Ei1l-39;
	Mon, 31 Jul 2023 09:04:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOpb-00Ehzl-2f
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:04:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9891c73e0fbso892577366b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690794285; x=1691399085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJO9NQ7vK7AJAcGCHk7QVU9AX/jwtIW+NQLwTCdqNqY=;
        b=r0EqoIqywadaqctz91y78LQA8JglGD9rAv8WsyzPSKs1RjGZXSnFPgyDBPMk7ZjoBw
         t1sYbzrLlTO7YAJdPkM2CTR/7ajs9eipcQxTWa9nvdk7IiyucaktyQKu6kbuBGcD+F9w
         fYVN2+BuXxbq80PXxkUYHbXaN2IclbY+YpVKwoQjQLVOSTyRdXDVbxaSKpSUgvZjTcUp
         NoFhc5frg+SAm/yTXJx5qphKgCmvg4wsS0pG1ZMbtLlMfKXPvh2+c07ee5wDiGRcA+IZ
         CXWaTAMZE6pxaujQo5pMIJfszyEFdmEgB+12CRm/j7dvCqkgSSrEVdGzONr4qLb9iPLm
         M+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690794285; x=1691399085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJO9NQ7vK7AJAcGCHk7QVU9AX/jwtIW+NQLwTCdqNqY=;
        b=cz+xydeaH5gaTqaMCCL67gwHwvPxjAVXtMEGqu6FOXZGPFcPgDODnRDHolW8hPLgRv
         WKXQbMpgVWKKY1uWQdXLANuGEWLbvONH9kbkK15BtoKtVRL/dPDwWSoriO0cY9j4O150
         vogvczy1GjQPERKoln5vHBqLKguHnKom8W1cMRjULL3JYfNvB46ePZ/9XPZnTmRyM9Ml
         CHHbl+XDUb5M5aPeIAxUV7fVdFqM3zdfkkIXnjCQzd26bis7/AlcSaTFWpnAITxhkBRw
         0ab+cHz00XvtaAhJ99Rukx3gNAEr550lVtDZNKWS9x8DAbT9DWXw+yAmNKarCAulUmq8
         vdkA==
X-Gm-Message-State: ABy/qLaQ+fqBqA2n62oHoy2HJHxZfPdc+G5VrF5MLFd6NOv4N0YbYqh/
	dANCXHD6ePfCMiGC8yPeG3+7Hg==
X-Google-Smtp-Source: APBJJlFkSpVPIStAe9Vl3YBvz9umydkAl6u8k+fmu5C4SIOfgsL/ZfGAkiz3E+homafZX+J1d2uqSw==
X-Received: by 2002:a17:906:5a45:b0:99b:cb59:79b3 with SMTP id my5-20020a1709065a4500b0099bcb5979b3mr7071426ejc.1.1690794285532;
        Mon, 31 Jul 2023 02:04:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090680cb00b009892cca8ae3sm5829049ejx.165.2023.07.31.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:04:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: drop redundant status=okay
Date: Mon, 31 Jul 2023 11:04:42 +0200
Message-Id: <20230731090442.100856-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_020447_858341_4A4D90E7 
X-CRM114-Status: UNSURE (   8.53  )
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

status=okay is by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 2fce44939f45..cdb80e0a7718 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -181,7 +181,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
