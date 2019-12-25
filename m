Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7FDC2D0C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 01:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75EEF20679
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 01:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SqnfB4pk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nsIyRfJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75EEF20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mSeSSYcdPwwUsbBGmrR3vmD6V6+Dnag7jxlUHxWZX8=; b=SqnfB4pkT6uUF8
	R7WEYwrJUCxGc2dz8zxsqJwYVX0V46i+z/tQOw0wcF+ZXIlAeT0FFa5tZTXu0fbDm44RfBeLb9/b3
	kMLJfCaXQGEIqqoyLeZ4MzYMkCsHxczS8nqK9/lm3404bsVPpl2HHfXnbwBAl6SB36sut3ehy2gRz
	OjTPGnBIqIBWJ5WC0udzb5Zevx950ZFHHtCx6ubgx3vX6t5N97wqqJqZoM0mYV1+wKAF997wDDrYU
	Zs/RK/DqR3eGZvT/xBJVxQvS8ud2UDj4jsWVsQ/dG1ea+7/9ERdWXpvxiIRadOhzsOIVezSG49vPZ
	n2cZeSCalOR2uvn8JMcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijv8h-0001Nn-4H; Wed, 25 Dec 2019 01:07:03 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijv85-0000dD-2v; Wed, 25 Dec 2019 01:06:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id b19so3401036wmj.4;
 Tue, 24 Dec 2019 17:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Mty/FeKQ1wDgVa8w9Nr+2aawC0goo22XNed8kugKhM=;
 b=nsIyRfJeBDJmdHJW7QotBn8a3e4KqpfpPdrhMxitrdrEjPmQn1BokouaEDljANB+uA
 opRGU1cauaPWkweuiuT8vOtRcs2xf4cYnzJRW8SM8noie3rNoQhmqULNQ+YQ+yUZeszO
 +V+JRBXJWXFtxNpHcgrixH74Q75GI7pmz00QsxBeMau+1SBy946gjmsMc4v7VZhupoNz
 CNBByMQ5klAnkYFuGixbXAG77ctfE+VToqt2r2kvKHtZjYgtA4bktiPoVPaWPmDZRPLQ
 OCM+xY5JPtS8ee2SA+AVjndjqoDdccPHmPbAYibnU+0CgQ+2F4iEY0inxSprZAW9+RdB
 /DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Mty/FeKQ1wDgVa8w9Nr+2aawC0goo22XNed8kugKhM=;
 b=CmIlp5Taq5g3KdC9iMwPcukEBH3g2/oU92+sr3nktQRhCjN+7Lm1gDVjd4eJeTcqwe
 ouW03lI/SFBwEuCiZztoecj1B/aX2pO/+CDjudKhqtKT0fttwZ5dw5mmk8V07Hbi0br3
 YZUAiqnrLbei3w/GVo1z+p3e2AHqK5Hig0n0iIABvXtey5gxtVWNwIqRDqpTepflC9OJ
 xHfvETkvfSVGfCP7h6YV1oeBsjDCupZJfJEWdUPRuZL/WVfb7x/J0JY1A9YXY0pNOdVD
 mhnfiuCKJ2lkszfyl9hfgLwg8OxE+NDccpw5dHSxIjP+VXJdXCz801/eq9F2A4n9Wybq
 E9cw==
X-Gm-Message-State: APjAAAWGa1kqxp+ZlYNENdBb8EmvuDWYhCagGIBpuXJQAoiw2Pdo8/IL
 mjhO6pw/fuCjhxbkeYsV/lu0BIro
X-Google-Smtp-Source: APXvYqzl0orMCs0Tq92Fg5kOXV4XxPYq1w8bznh03vYxz3Kod5nZFWE6+Lls2gxHOsub3gUlCCjyVw==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr6802974wmc.20.1577235983449; 
 Tue, 24 Dec 2019 17:06:23 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x26sm4066127wmc.30.2019.12.24.17.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 17:06:22 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/3] ARM: dts: meson8: use the actual frequency for the GPU's
 182.1MHz OPP
Date: Wed, 25 Dec 2019 02:06:06 +0100
Message-Id: <20191225010607.1504239-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
References: <20191225010607.1504239-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_170625_124491_B654537D 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock setup on Meson8 cannot achieve a Mali frequency of exactly
182.15MHz. The vendor driver uses "FCLK_DIV7 / 2" for this frequency,
which translates to 2550MHz / 7 / 2 = 182142857Hz.
Update the GPU operating point to that specific frequency to not confuse
myself when comparing the frequency from the .dts with the actual clock
rate on the system.

Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index b35d7444c1f4..eedb92526968 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -130,8 +130,8 @@ opp-1992000000 {
 	gpu_opp_table: gpu-opp-table {
 		compatible = "operating-points-v2";
 
-		opp-182150000 {
-			opp-hz = /bits/ 64 <182150000>;
+		opp-182142857 {
+			opp-hz = /bits/ 64 <182142857>;
 			opp-microvolt = <1150000>;
 		};
 		opp-318750000 {
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
