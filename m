Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1EAC32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4DA2083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqOdg8s7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Eb7EDaqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4DA2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PST6786/H0t05dGCUA+/cZGGeHPp/bME6Idka8V8KrQ=; b=IqOdg8s7hwZAbt
	dqP4ddjXy2xL9UF8DjIk/Jsc4hF3/sCbygpF+Ril3Ru56p1CJLkrvW2FcNzEDuYw5sSvKIaqw9hHl
	xhQcGlMeSHrY09T868DQlQkgd0RVZ6IAoDKRKWedl6TLSp1TfC9grhJ56Tm4ZiiJkjQ9wE3cjNgGa
	IJ30Y5lmz2yQzn4ffD/YBV4HRxXRbq7EBN8xVCeUvmMo0pfiGxyC0pNQFFLB0jm3pCq0UhZd1pwwp
	CzfGNvP+nlrZFGVlg/XKH7du1tvGioM+7Na54OwD9sA574bR6OtZ9NdE5IxCC9f97Y6HCwd5GXlR9
	BU+ukEl5mcg7KYF4tY2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuKe-0007KM-JQ; Wed, 14 Aug 2019 14:32:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHP-0002i1-1q
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id y8so5354826wrn.10
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pwx9hW1o2Gq2PergB5v8yAwMnz0OCKYudbljjiRvXYk=;
 b=Eb7EDaqtXhqzBiYSbdt5nj7cUJOesBGZQXjQGx8P5z8JqtF3ycxq2N+m6+TbPXN7RY
 Fng0SarDUOEMF1v7x00LxuTin02vm50+HH0qQ67TsSGiIxIG1Dk2AJIVWDz7aFG4XmgN
 horDmB4Ho4CRvX6FQGvnLZ2D2jm0i+BNfOSGRs2M6UkLZUyaiPmzVQaNQ0ezskEWjNbE
 rk0zBi5o3XmLPtWH6R06MFqjvCvlXV8yFY+g5HN7pGBi+dTSaCR+7qZDhoNpaRR6zEcA
 vs+Ib0qH8ApzA+VamZxKkLT6qh0yr03mhaVTq8EKLaKTN0X9wz13zPbobRvSF0yvN0Kb
 1rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pwx9hW1o2Gq2PergB5v8yAwMnz0OCKYudbljjiRvXYk=;
 b=l4qJfFjwRkv6iHtvAB7CR88pKuoFykrGLihQbkYfAskVYn2CkgLSvWTkrjs6Jt4sXV
 YzOiHHo/V+/5G5/l7XX9Jw9oTKG8k7n6p/1lVNd2ISFv+7PyMRPBtyq5N0TfbWXeRtbM
 Y9uaPBZMvPMnRbiSuFYQFajqzQBy+FcvWglMcUeg+7744QPVi62Vxil+15KgLQmEa9NY
 hssWFpc7zrnnH/L7/fjgOlwODl65RlnVjzx/ockFnm8fWtcWyRyxGkbyOLTOMxi6CeOd
 iONtH5zch5PkCWXbkwoOUp8JYJcH8z5UQPTtzcVQQMaLuRFN/hGx8/CojrnLzZ+HjX/S
 Su1w==
X-Gm-Message-State: APjAAAWrBqyz3Pra7YLfaayxxP1Xse+ZW+6k3h0fli3TzdLCdfchTXLz
 QgDvyLuIDriYzJwkO/xWWWBHGw==
X-Google-Smtp-Source: APXvYqwFlZqG2iV08FiE4OCohyI3fIgKZcqD8f1isbMX17aYIR7vsElvrXVqtTUDDib5F7ms/LyrVg==
X-Received: by 2002:a5d:4b83:: with SMTP id b3mr48215449wrt.104.1565792973471; 
 Wed, 14 Aug 2019 07:29:33 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 10/14] arm64: dts: meson-g12a: fix reset controller compatible
Date: Wed, 14 Aug 2019 16:29:14 +0200
Message-Id: <20190814142918.11636-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072935_257865_606B141E 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-g12a-u200.dt.yaml: reset-controller@1004: compatible:0: 'amlogic,meson-g12a-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']
meson-g12a-sei510.dt.yaml: reset-controller@1004: compatible:0: 'amlogic,meson-g12a-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 465106d37289..74c587411306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -2215,8 +2215,7 @@
 			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
 
 			reset: reset-controller@1004 {
-				compatible = "amlogic,meson-g12a-reset",
-					     "amlogic,meson-axg-reset";
+				compatible = "amlogic,meson-axg-reset";
 				reg = <0x0 0x1004 0x0 0x9c>;
 				#reset-cells = <1>;
 			};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
