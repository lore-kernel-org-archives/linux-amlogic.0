Return-Path: <SRS0=38m5=BZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC69C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 18:22:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4914A23B84
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Aug 2020 18:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+mO6zGR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pGQqnjKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4914A23B84
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YZdUUbmnCxeI6pIjzkAfReIjVT29jlcMJ3tPmo7edmI=; b=G+mO6zGR0t5OKISf33nrZYTnmQ
	i2b1USsHu/Ed28y6IGk1+JgjxkuyaxkZmrso3WjmAm2nK2IuNxVgS3KsvKckqnAu4jzNiCwkVPfHw
	UWJxGfJq9HiFogs43+hcXTZw8EVW54X7X+gC/31rhKBj6phCotRsadpgkLpwRYeQGjAdraDzN9T5t
	L06gRCPYs3zb9O20IMJNP/TAXcq8FSn9MjDSbsJshzaODvNp64mj683XTN3HgWqj/ccRjeOj6WBfr
	IzRJ1zoZhJ1PAsJ7Ugxeoo59Vy8BPFpDYF2X3Yl5T5YYqvM4AjA0L7pMX0ug7jMtpSBsWJesyyIsK
	9HOZuevg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k70p9-0005ly-Ff; Sat, 15 Aug 2020 18:22:35 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k70p6-0005lW-Ms; Sat, 15 Aug 2020 18:22:33 +0000
Received: by mail-ed1-x542.google.com with SMTP id w17so9187310edt.8;
 Sat, 15 Aug 2020 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNxAFacUKwWdwrWwNRjQPm6eA7rqMeHXHFvMy8PGQeI=;
 b=pGQqnjKDUeENaCliXue2wmuceXZNuYF8DEHJrz9maxDr/PFQ5ZkiYIf+/fXkjKfN4A
 wb4Kv3lcZhReksZEZcK0rgs47nt9RQKQbyver3PwXutkO2nuF6ECZtPhTPZ/V4bEylEZ
 oaZyuXY/lpSlqqWOmkbH1Bh25UelOEZpXu9R0Ml6yFbYNqRZUf8uWvwagOFN+UPjcMA+
 abwgGxBpuUpfsCRQ/gBrGPYO/RFRSHsfhuOdfX5nXChpyn4FxztqpmbSPa81MSU5LlzR
 2azBralq0rQmKZ54C/fuCwXlVsEeqQcOwW6aytszPg4zDSibKhQdcZj0NaioNr7R6jJ1
 EZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNxAFacUKwWdwrWwNRjQPm6eA7rqMeHXHFvMy8PGQeI=;
 b=FoEpuKMZO4wJvS7lCxWPaZN6GKfbM04+ms1FL3cgkHmvSl13rZbtW9iLGto5McvuPu
 ylvDjAla6oPRKkx4s3sP/8ctMaTWq0vXaZARE0b8UqepapSdnY6G7faQnE0z0WAmotat
 ozI0ttTVkxqYqIUe5YmCUCdI6SoAg5P/EZmyyZQsquRXQdYUlmKTF8wtJma4I7W5tOHv
 Pq7GMEnQ3k/EJ16cor4Ozhpid2z9zqpm+/ZqRGh2fiM77qXeGPUGQ5+0dGd4QgyGEJ4I
 hOZY5oCEvQSWox/4l/M1IotgUK7mXy/w5FYKqXLokviEixM+NByM7kcR+3gVi1JGFW2N
 rx0g==
X-Gm-Message-State: AOAM531V4QOLvTo3je7ksuIPgMziLNT7yOuGkZ+MZlPj76fdu98ltYep
 JP3TJ7HV84a6BfI6JnnJcI3ShP0b724=
X-Google-Smtp-Source: ABdhPJxwzz/gHG95f9PJXIE1eG3PSPWP8hHe6tLSqR8DRPmaZ2QWc94IJddf1E8cfnkvCLYQS5wAKQ==
X-Received: by 2002:aa7:ce98:: with SMTP id y24mr7870004edv.76.1597515751399; 
 Sat, 15 Aug 2020 11:22:31 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371a97000000000000000fcc.dip0.t-ipconnect.de.
 [2003:f1:371a:9700::fcc])
 by smtp.googlemail.com with ESMTPSA id 1sm10265758ejn.50.2020.08.15.11.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 11:22:30 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH] ARM: dts: meson: move the L2 cache-controller inside the SoC
 node
Date: Sat, 15 Aug 2020 20:22:23 +0200
Message-Id: <20200815182223.408965-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_142232_758019_9D29A71E 
X-CRM114-Status: GOOD (  11.23  )
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

All IO mapped SoC peripherals should be within the "soc" node. Move the
L2 cache-controller there as well since it's the only one not following
this pattern.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index eadb0832bcfc..7649dd1e0b9e 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -11,13 +11,6 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	L2: cache-controller@c4200000 {
-		compatible = "arm,pl310-cache";
-		reg = <0xc4200000 0x1000>;
-		cache-unified;
-		cache-level = <2>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -172,6 +165,13 @@ timer_abcde: timer@9940 {
 			};
 		};
 
+		L2: cache-controller@c4200000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xc4200000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+		};
+
 		periph: bus@c4300000 {
 			compatible = "simple-bus";
 			reg = <0xc4300000 0x10000>;
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
