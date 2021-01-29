Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B55C433E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E7364DFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E7364DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pYvUT3CQjUPH+MrsnQ8lVocOOwvcijcPqP38UQaGtw=; b=N6cO7Xgdg2YPJ5pS0ciyg5/5BY
	55z4iuzyjVG2ST5+TZGj2vxHcfbxRCVcqt0VVHdJkzaSL4wBjW1ffSwNAQBSXFGrGjTGxTlMzYfa1
	ToMslMGztwAhOpSCvSWznHY8jSfe68ixC8QZ3dSkRis5QvmpJpo0h5dtG7qcIPt2xCg4xVr/pjUzE
	51thKj/XrGyyGvkN+IIrQ+iRHtgBgX1GBksvg2ZM7fqV2YTsWFPD+Ssy5CLr/R8QlwRXbcjwMtHYa
	pDrHGoF3aNklsgDGyLSNcaqGoqg+W3xI96FQxzxyXjovGWmoN5ChD2zduaoSR2ceF7OyRlGjcu7OP
	CbdLBx2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5NdY-0005ja-HW; Fri, 29 Jan 2021 06:52:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NdE-0005dI-AD; Fri, 29 Jan 2021 06:51:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c12so7724790wrc.7;
 Thu, 28 Jan 2021 22:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZQ9750pb4Xv95/ZTBBgYNPr9nohfVHkkFloTO0dyCmM=;
 b=nvyF51r9x9/YLPdp/EyQFT5ZqKEaWwNhEuv+ovU9d2j8IpI2b2a9yGYJJwpNj0tUlU
 S3ItXjpty9P1Y0uMmUL0TigYSfMgKho62QG91yWNjl9mahgISyhRvFm2zS/U2B7ZPgtx
 62AaLRnZPQz798aOpw2neFjspIg1CU0Sd5BQ9M37wl+TErtP02QMB+DoDA/FKe5/1/RX
 VJSLg0V22jH/3cN0lkTV8RtavwEStmDp9X45TdtMNeuGShC8Ao8d94FKJ5kh9hiYZBJ1
 Z3w4Miito4l+plCAU3CcLei1nQBQWy8f+6vHGY39Of9V8OM9G4GdtFpk7I4z9CMPNSwz
 853w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZQ9750pb4Xv95/ZTBBgYNPr9nohfVHkkFloTO0dyCmM=;
 b=LYcY7kcH56mzDK/0FcVEnWnsLbGS9YKcLZUfgblnaESUeoxC9bKkzGfShZfHH4Tc2P
 NTcbzDssHaclbLfkrTFMIOkZMKzatSXYxfou7F2Oq/6gkI7RI7rh/jBYVPO6MTLzlWYA
 waOnTjrzXcXByAKleb/h9UqvowD/3lz5g7v3P1c01tU0BZNy/Kkq0C+35lQpyb5sAVOF
 RWaEedvIhqOzYt/pncL7AZdXgs8v1AYtkGls7M4YSL9BAAsC6Nk3EcEsO3ZuGHSYH+ey
 YKYKkx7kxabMs1FrVniaQzW8pY001n2592A4PLQRZIGRsfUu1Sec8ymXtnAK9q0kZYeK
 XcoQ==
X-Gm-Message-State: AOAM531g+pBwiT6PtGeym1iHKst7f541mXeKA/Eucc7NtNtJPDLu/Y4o
 0XGZ4MUv5T47bNCF1dvDqv+PGJEk/VQ=
X-Google-Smtp-Source: ABdhPJz7FupnsVA3AiA68EDUKAtVpaNZLtThsTs40TQx9nWpoC9y/ZLso/zeMndRDIwLZ8lKOqmF8w==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr2739108wrw.397.1611903107123; 
 Thu, 28 Jan 2021 22:51:47 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b7sm11501236wrs.50.2021.01.28.22.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 22:51:46 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: meson: sort Amlogic dtb Makefile
Date: Fri, 29 Jan 2021 06:51:34 +0000
Message-Id: <20210129065137.5473-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129065137.5473-1-christianshewitt@gmail.com>
References: <20210129065137.5473-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_015148_403081_4E54A726 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sort the Makefile before adding new SM1 devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index dce41cd3f347..f3c8a85fe987 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -45,7 +45,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
