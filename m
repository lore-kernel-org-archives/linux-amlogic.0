Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FCFC47420
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82ABA2176B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9/SMQZD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBhuusYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82ABA2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z6hClFbeAxLqnHJDaGE949eo/t+eL99RpVl8zE30GTw=; b=Y9/SMQZDarrkMO8OZq1102rh3
	BfSQtvQQqnxaix0uUed93m1aIPX1TJIX5fD7K/7YphY3nnunUc5lV5S+8z6ScwYD8ET1Z0Ucm/IJw
	v69JT0vkAM/XxeoRY3BHkPv/mFWkHv4XGgqvaCs9rfGEWENfFhF8qPQWRi6P0XTz98g4+HEI6Tu+p
	51hAUG1N0SqRiJZjAggCS6eROhrj6Y1YIWl6t/H0x0nGeCm5aDMX9/lCY/YO6xXyW2KfDrC7HXg33
	ODvJMNp0+kydS5GtcD42z+lJLnkSZ/RileXr7rV4Lw0NDml7taXXFMtSQ4NLiSEYOAmPApgfAgM9u
	kk5CPK7jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeRo-0000Hh-V5; Fri, 25 Sep 2020 03:31:01 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeRh-0000FL-LX; Fri, 25 Sep 2020 03:30:54 +0000
Received: by mail-pf1-x441.google.com with SMTP id z18so1865472pfg.0;
 Thu, 24 Sep 2020 20:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TxfWggxlCNiPgOT3zzYw/A1cG478tHhARlp7JZfrg1c=;
 b=IBhuusYfYUggClU+tuE/hbihGaGSJrO+908pYJNnm+U4YyDjQn64WactETvGH8aV5Y
 DOyUZQnOvMNRRcqyvbAOAnjflehDH61mo3x3TZRyn/AnfOI2A9Ex5ccIbQu4br9oxJD7
 /CT3uWzzFCVNhDJP8BH2Y+NbCtQ2ZMAIYjj6Wz7ivPCZs372uasVqIIBoTjkP2mjqDOB
 JsVJf/+p0OGFfb/avWfBOW/HwsDFNobAfKBs38+pNF1iluzNZnlGxHRfNcfWBPbPbFhJ
 FZ6mRakMO3/WNp5DFlblnXgbeibVzDDRwri+A8c5cbhFaYs1ulPW4/BpNNrwarvhBckv
 CEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TxfWggxlCNiPgOT3zzYw/A1cG478tHhARlp7JZfrg1c=;
 b=Cwi58B6Z30Y9jSu8axAEIW+3H917Kyiy1YJKSwMxByJw8VqUIhc/jaevGeD+dNmWSu
 CZpz2qKOTkub+0rTU1AWYqEbrHb4dcUmEzHKPhoVzjszBhhel4h5LatBwvhUZeL/u7My
 tWztyeDOxWio0KTsAzy7S+71uJw61upu9HZYvC3zEbiivE/g9pQjNAYkjiVzml8yhoX8
 eXEXCU3845RWgRDF+2PIxekzH1rmMTuHdlTqMZHji3Yawmnk5baqLUJ1C5fBLQrLNf5z
 edCOL0JoFunDhLlvEgyL2cdkBduxyDzqBkH/+ZGKfBTH3hkT8ZETGdOx9ybNgpQFtOQ9
 xQLQ==
X-Gm-Message-State: AOAM530Wa2kWo2sYtRh1BX4FbHcx8FJQS7MkXRwe+GYP1aik/npQxgR2
 boNkjEBQPxRviBTk7pSQsDQ=
X-Google-Smtp-Source: ABdhPJzZiw2VY3TseQ9QC6u++rycdtznfY0tG3gFg40eaOSkTX49BURQwQMVZIJ5wECgvbgIQrntRw==
X-Received: by 2002:a17:902:6bc9:b029:d0:cb2d:f272 with SMTP id
 m9-20020a1709026bc9b02900d0cb2df272mr2242820plt.11.1601004651562; 
 Thu, 24 Sep 2020 20:30:51 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:30:51 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 1/8] arm64: dts: meson: update spifc node on Khadas VIM2
 meson-gxm-khadas-vim2
Date: Fri, 25 Sep 2020 11:30:10 +0800
Message-Id: <20200925033017.1790973-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233053_749074_23D5895A 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

1) The VIM2 Boards use w25q128 spi chip only not w25q32 or w25q16
   it's not really seriously becouse have 'jedec,spi-nor' which
   have auto chips identifications

2) max-frequency is 104Mhz

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c7..a6baf865aa2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -336,12 +336,12 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	w25q32: spi-flash@0 {
+	w25q128: spi-flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "winbond,w25q16", "jedec,spi-nor";
+		compatible = "winbond,w25q128fw", "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <3000000>;
+		spi-max-frequency = <104000000>;
 	};
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
