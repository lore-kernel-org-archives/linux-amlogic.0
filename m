Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE5BC54EBC
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2mDdmV86swa4O9zbilxq1XdwlO0mps5MsGpl3skKDc=; b=Ap9eGoLsGItedv
	4bICng8dLUsyI459ZhyeYsZy7l+OwpjMScFSXFrhUit1o00zPJDbi5AngQ2kX/5l4D44XH6qK1/7C
	JNAaaavUatqX6bc3GbKo53DxJsVAWYKSlcCKf0F4rJjvGafrNuAyWUf8y2wHtaa2N5EJ0fSII92dk
	VMCnFlVR4px5QhBVlndpTHfe30D28atXnwggC/VnH0dH5cFwGJMegDgUl42udBvriY8FfnbBfZgEb
	9Y2iZG9FUuv/g3lfqD2wPWazISGbb/cBFXICgOtCOyeww0JzesuOAwMxhhFFTU3Dr9xFZcgTsMIMz
	Df1sOkYxJjPx13zInGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQf-00Cw0V-NI; Wed, 11 Jan 2023 21:14:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQJ-00Cvqf-Lr; Wed, 11 Jan 2023 21:14:17 +0000
Received: by mail-ed1-x52b.google.com with SMTP id v6so24189793edd.6;
        Wed, 11 Jan 2023 13:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL00hmmnIkXIymS1Ty0/SvvkA4Jz47U0CjYmB92ey+Q=;
        b=DlkVNyEqyj6QxN8CxFvrAg3tusxratd0TR1bt3MrLfA2eYuQBOyNXykAcO0ttshqEl
         9Okj6ejtX9esNbQiiBvh5iDPtlFRuZtjSUqekAWQHQXtRVKpz+YV/R2qfJe93KcyIob8
         EgvlNtAPn8jdd/jmauF0AR5msZM2ttQk8I0zarlOiQhkyP+JmWb1RRRonSavqQOdVJTC
         bb1dhGoVkE+79ho20BZ7xfwooNJa4Q45icUgLj/4iNmCnlJa9NNt2SlhPipamPBXIYIr
         +0LRaC0Ek+nC7VajiGmiylG4Pv0yUUwKjB2R7kbqD21W47d8v/50lzE/R2UPybg6rWIa
         wP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IL00hmmnIkXIymS1Ty0/SvvkA4Jz47U0CjYmB92ey+Q=;
        b=OJJ0nIhrZ6wpbTPiit9TeQ/kTIyAI7WYbA6dy8XVZ5BYUKMkaBwF9phb/u7JX59zL5
         Ho+NibxAe5zNaWl74L8wP+a7BgAOSSySe4KaMQjuEMQcuOnn1Q/0d8OTzcjg929qDcrc
         cprAtZor327hDbCvVtDg9rCbECpV9lLWSStfAMhFbN8IGOlepbaSBry6HcWHQB7vDuJr
         FqzXwbuZ2SCgjAl4O9WgG3lsSd/gRE86GJzNTifwnFbk0atT04r7HMLun5dHxVbI6+XK
         jJ9L0XI2V6jYqp1VJIC71waOIr8h+boReJAUJvifh158uE/pqKytKQKp9sQOjwRHfszv
         MVcw==
X-Gm-Message-State: AFqh2kpltKtBx9CDBhK/efM0gu37nRoY6+xImr2Jjm/u4sPw6+UMNNTH
	TsUXvMf2S7mx1zqMnGyCRpUxDZCA17Y=
X-Google-Smtp-Source: AMrXdXsJFOnm30KGiGJ6cPDB9D1WoJASTQhB189GSWfrw92fNmmSMTdLYHGTu0MqzEgUMeVZjAJiIw==
X-Received: by 2002:a05:6402:2907:b0:497:1787:13af with SMTP id ee7-20020a056402290700b00497178713afmr15870109edb.32.1673471652474;
        Wed, 11 Jan 2023 13:14:12 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:12 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/6] arm64: dts: meson-axg: jethub-j1xx: Fix MAC address node names
Date: Wed, 11 Jan 2023 22:13:47 +0100
Message-Id: <20230111211350.1461860-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131415_731957_372EC65B 
X-CRM114-Status: GOOD (  11.57  )
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

Node names should use hyphens instead of underscores to not cause
warnings.

Fixes: 59ec069d5055 ("arm64: dts: meson-axg: add support for JetHub D1p (j110)")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes from v1 -> v2:
- new patch

 .../boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
index 5836b0030931..22fd43b5fd73 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
@@ -168,15 +168,15 @@ sn: sn@32 {
 		reg = <0x32 0x20>;
 	};
 
-	eth_mac: eth_mac@0 {
+	eth_mac: eth-mac@0 {
 		reg = <0x0 0x6>;
 	};
 
-	bt_mac: bt_mac@6 {
+	bt_mac: bt-mac@6 {
 		reg = <0x6 0x6>;
 	};
 
-	wifi_mac: wifi_mac@c {
+	wifi_mac: wifi-mac@c {
 		reg = <0xc 0x6>;
 	};
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
