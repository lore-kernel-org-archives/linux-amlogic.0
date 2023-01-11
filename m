Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9558CC46467
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54RfUn1W0o0vKNzShy5s2m0O4aoagkfn758iYxrnKfA=; b=NQUdjsSGCcrY9k
	8FfaDv+t4JFX02PCSDjtdbmqpUyrwsEH/YOewhRCH8jBhXwc5//5MahE7rW4QI6b+ggCWio35Et0U
	x1VfdCUiVBlxxhsT4YqtUP27/lA2h5XaHtb8iwvHWa8BGJQ0aXqSb4Yxwsr3glTDtZPH38cWfMj3p
	36ySITdgxVOf03e5/gXqAcjwHmilD0EFCuL7vGyM9t0oTmfAVkwfEZ7s3qVH8Cnhm1SwG6GBqVWws
	pf2mXHxMumYKjpZD+qRWoVRlWAWpT0P3XDzDw3558+UbQO/tdDKk3Kne9tVcud9HABLyxq89bsxXu
	QPjE0WEdlWXFVbRJDGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiRV-00CwTx-Gt; Wed, 11 Jan 2023 21:15:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQL-00CvsH-C2; Wed, 11 Jan 2023 21:14:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id c17so24198663edj.13;
        Wed, 11 Jan 2023 13:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISTjL+MLwJomeihw08czSYx5hsUEMJAxuuEa4KDRa1Y=;
        b=ocAZu4xoMxdobhuiCpQoSIr/gD1/HIHfk2rcVdWQM/5QeIeb6CmfF4Rtq2KG5xWaYP
         yKP8Meq1QSBIaSa6R6Z+CnlRE20/+NGVYI92dHaQjTQmmwO8IM2VRhsjl1KDF7b0jZ3F
         jRP8SI56R/ANvnzlp7w8ZSHP6DbII9g4euaM5gdMjXS71OcWL9QpQoUo4rEheYFypvop
         57gY9ot9QmtpS6TPazn2BCYyTP11fLCCuYDma46SvEEdINVZeECaz9vPEuArENmHKs+A
         X0ZCnOb/ujOaS3yhGS1IEqFu91bNlVz9SXgVahbsRFD8AE8iWu1QM88Q3VAvuhefJwPi
         zWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISTjL+MLwJomeihw08czSYx5hsUEMJAxuuEa4KDRa1Y=;
        b=OfRl4KK0Fd6FgseApmrBjtcTgIKoku3cAVV7kgEujL4F8dW4k6SK5XRlFN3zBCaTdb
         eFHQPjnaXrIV0t6I/t5ZbmgjZKNDYK1dvdV1TqShGCsASR6kg24cAho4xbIw8QC6n1AQ
         PLwDMP6knT+ZyqwJPlPzAAh4Q2J8n7044YmN4m2Kmuib6k9vRiZz9yYpvdfCNh7Hpv2y
         qrL3/Vpg6qNZ42vGvP1RxFvZAg7bximVF/xWDzyiYGoQRO8DuRjOZWtkrPKhRBnfpL5j
         WsFnX0b1T2locOinIMIkyXtWCLhzvrl39c+Ywy+ZzBC2TomO5H45HQ2czDE+2BtyNQI1
         rrCA==
X-Gm-Message-State: AFqh2kpfeCP951s5Swnv5zroCtJ3sxnbiUdvXrxgWgMHb1Sx8yWxej1n
	uZqTgh8j7P4bJm6SkIR7Palus8rfGag=
X-Google-Smtp-Source: AMrXdXsk+tY19l2gg4OvLge5PiHulqA8S7U0UUF9w1BRvkKpIBaw4TMP15TXQySHp5Lcq3CEIlrrsQ==
X-Received: by 2002:aa7:c307:0:b0:499:b4ce:b26e with SMTP id l7-20020aa7c307000000b00499b4ceb26emr13590384edq.40.1673471655966;
        Wed, 11 Jan 2023 13:14:15 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:15 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address
Date: Wed, 11 Jan 2023 22:13:50 +0100
Message-Id: <20230111211350.1461860-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131417_454915_A500280C 
X-CRM114-Status: GOOD (  13.08  )
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

Node names should be generic and use hyphens instead of underscores to
not cause warnings. Also nodes without a reg property should not have a
unit-address. Change the scpi_dvfs node to use clock-controller as node
name without a unit address (since it does not have a reg property).

Fixes: 70db166a2baa ("ARM64: dts: meson-gxbb: Add SCPI with cpufreq & sensors Nodes")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes from v1 -> v2:
- new patch

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index f8b115cd6775..a79a35e84281 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -250,7 +250,7 @@ scpi {
 		scpi_clocks: clocks {
 			compatible = "arm,scpi-clocks";
 
-			scpi_dvfs: scpi_clocks@0 {
+			scpi_dvfs: clock-controller {
 				compatible = "arm,scpi-dvfs-clocks";
 				#clock-cells = <1>;
 				clock-indices = <0>;
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
