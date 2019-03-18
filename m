Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C794C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9A92070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GszQIDo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LehSVoC1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9A92070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xViNa0CIE8pMbbhaG9e9JEuFNAtS8JiZxRa5mILiVo=; b=GszQIDo8iZXOP8
	i+RTciauKev7LV/+409nmK2eQPyc5345VeVLZmk0GFvebGDSZJKJjcn1J604XRZ4lLILwc4vMD6l4
	cahaFgXFZEq/YS4hQYkji19Dd56EI2+8ZmyOjrGOmC+KIHoTtiAYoLHmBn2aESF0z2PHPHustQ4h5
	zGrDtMqD3DOMh00/gSyHViKjotKEqULQwdeotmZc3l9tTcvPtlVsnG4LbfK0iuzmP5j5SafeeflaC
	jM0BAtqdtw484LoE0TkIR1LwkcRHi6T+qVmFDtyXOKyS7XHqjiIMhdwuFJ9yWEv4843OTrNEmZQ+X
	IPgJtQyrps/F8O0nQCFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p46-0006Dx-Cy; Mon, 18 Mar 2019 10:00:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2p-0003Yn-RE
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id e74so12262470wmg.3
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2hCudhASw8wxsHkqG+RXtSVr+MYVBar9SgnbE9VlWc=;
 b=LehSVoC1cbIXe0Guk+p7qfvtOhPZ5JYvkaolJ8F14KBrq4civ5pHQJWtVI/+cDPuVg
 PeXrjR1K74DmMhI8NN2i8zDzsL/f4BwUUWHNzqwmna9KmLCZQuNaUX7rdNurDAcFZDcg
 A2RfWJW4EohlZEwvoT5Z+D4kGYp8YPm5F3Iy+YpAJWY47LATi+3QZ/uP7H9/FhYSG+7e
 yAOy7Xa9i4DykBYGKFwOYVGQexZrvJnK5Oy08njjg9gzDxlqMTg6JGVIMQ2NTgS4UzKV
 B9byFcNkIBKoFPJEwVP/DDodSQFe/khSt+4CIsDzCyWb+hTFr8CGdc3ehje06FM7PTqo
 y2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2hCudhASw8wxsHkqG+RXtSVr+MYVBar9SgnbE9VlWc=;
 b=R8o4LaI6519x15ma3I4j6CUA0VQ66swdcg9ol2z4Eaq3YS0fhUrBk0RhbGl6zgoP1g
 1UOaFqAZ9s6B1exDw6/ASRfGUdBKYYYcctWHGf3cwidLmEFq2uwcFPH+PCYTSutmafaD
 vAiHFaXQILZ50yHPHPjCJZClMd8eZCLxXnde8L1IiAjnyFoMXyWXTDVeRTK87ANhSOLl
 j7wP3j+TFPillLjYTwMTGWOAinRB69Vt0f7Gp9z6IUdg5BTPlrfKhMiNHoVjSIUs6Qqo
 XJqkddFTcYAkll1xgP9NIonAdKnKdlBk6G1f8lcqxth5KbCI3VoJ00M8JwN6FLFrHYS+
 OuYA==
X-Gm-Message-State: APjAAAXx9Sz2lTewvLJ98UCUZVXra2qyxatkiXFm3SqR6bMtkWUcY45G
 nm4nHQLeM7Z8t8NahxzOvQZ6jJEM44L0gw==
X-Google-Smtp-Source: APXvYqx6g/IvMnCBJz+Nq2uI6KU+gcFL9xBk3shoRMPKYs5GBkh+tXyLowXIKixDOavBuKxE8HSakw==
X-Received: by 2002:a7b:cc18:: with SMTP id f24mr11128724wmh.42.1552903138367; 
 Mon, 18 Mar 2019 02:58:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 4/8] arm64: dts: meson: g12a: add reset controller
Date: Mon, 18 Mar 2019 10:58:47 +0100
Message-Id: <20190318095851.4062-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025900_270777_5D889B04 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add the reset controller device of g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 7023c1c0f23c..cefd6e27c7a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -247,6 +247,13 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
 
+			reset: reset-controller@1004 {
+				compatible = "amlogic,meson-g12a-reset",
+					     "amlogic,meson-axg-reset";
+				reg = <0x0 0x1004 0x0 0x9c>;
+				#reset-cells = <1>;
+			};
+
 			clk_msr: clock-measure@18000 {
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
