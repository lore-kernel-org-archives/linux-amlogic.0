Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B76606A31F
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sr7sj8m8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XfGrzt+Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZql0Ea5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OSVRTBVwLKhC1mqScOB4LZELREDEZllFoQ58vsrBoeY=; b=Sr7sj8m8CdHhNbBYoV+c/vu5t5
	rhfhECURbZLQmQWZvRRkwbziRs2Y0KzmIAKA70+vrVRDHjiNyl0EqGyzV+DawiKYvOTD9eBgvIZLY
	2WqDa6l+GvhqyqQV3x1WI5dZZTHZn1t1Gn5TDTFXXBji881z2TIcWq6eO3sONO++Ji51NXbsj83tl
	mwWrrFSbxWnKZ4ERhK1FLOJvdqEMzf69ceyg+khvFSE6+z0g1DbI4y/SJAH7qu3sTy4Mjq18e0eQg
	WBpnbQZOQNigGVexTQY7LmNfQkpqDilCCGgWheZHrTOaOh9eXTq5oFPixSDX5BpClCwww5YDwojse
	XAR8q9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufJ-0000000Fxz1-3qmj;
	Fri, 27 Nov 2026 12:02:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-0000000Fwz7-0S29
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=; b=XfGrzt+YkyruhcGM5dsF/jtEHG
	mlwXQLuQYdLYN7QgGVAfZJdmyCNIVNmPwl2KKuLlYO9dKq4VNvBASi6h10CrR/JwGUXIfszt2WFvk
	0vyAwbQ7YwnP9mh8uL3GsNUgtNb9H5gYpVb49sHvZtykhsN8NoIg0kOrXG/LtL6eiCI4Z/UcHIu+1
	aHUd5v4wmD28EBgDpg3xtG7YfHFHyT7+5vOz3sk8OiVyDsxilTRTLP3u9VCyxRmUGHTRp7RrbHxfW
	WxDZERTORqc117V1kSmlB9hFINx9Wv9H/Mluj2l0gXQwNq0xB8hTeyZtLWBCAmG/er8hlRidju/Ky
	LvINEHaA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueT-00000007fiS-3KnH
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75481885e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780924; x=1796385724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=FZql0Ea5Pe7YvOVs+5pQbgVeHbYT9hzkYUaT0KOXXfPrxNXiJROyiPrT5km3f6CcOd
         7grooyGmkTjESeuXyZZHa4n39k+JOuYFvgDgUZWVsGNyZ/OITYRmhc53/YUTJYagkZ5s
         jqRg+BUIdI153yBM/JterF2aH+AFnv1WOWqAuatDQMtwHcCetJXVqXUBQWnLvbLY2GAv
         AFKEdtxPXvhA3gzKp52FdT2h1Xegyly6v7bK37mQnT3YM8XgfMUKag2spmBtEhGlNMi+
         JBMueKPPOnWFkY7uYHgLgTWcS6YdKD+3XtbbazpM/c6VmlPPHFgQhFSeDoem2Ek4DKJp
         LVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780924; x=1796385724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=b3zggu81U+BL1U1RR+WulGmz4LMLde2mDfWDNGQroQp28Zoe1w9w2gpZve+Qx2keby
         oOB0uPlWrwKJ0+4HaBRFuLYqjAAlX1QVmq8VlFta4ODIFwdXQYkKxCFPC0rdmGb44svp
         OUefewQqcLtRVmTyL5+wIvBxKK56AH5z7vKW9EZtrlVvEZ0EHe+eamosqKIs1alZaJMC
         /uK5h1YLVgrNCNndiWs3G+n2VzjfN6OMLNNPf/K/l+QHFU5V018LyOk3e+6yJ78FB2mk
         p32mjQjIVecdPPM9EY0cg823z2WCXRW7vrvaK+Tp89pWzJ1fQmvdZVFG1eCpMRR4vV68
         IfHg==
X-Forwarded-Encrypted: i=1; AL+hErGasX46Z6nxGQGcN7lRQhzv3ddG3LhU9QcLIEBpBaMFABQYDx19/5VGCwX+7CcikFkL1MrQmqrSUFNfIg0G@lists.infradead.org
X-Gm-Message-State: APuU4Z9f1QIZP02RBi0FDlROD3vQgT/5KQzTlrZb9naQ+E2F24Na2CgA
	R05Q4BPnwlAjTJncMya9UxR3odD1fLTbKyUmnRTVCtZMsOdxvqVu0CHu
X-Gm-Gg: AZFdTZd6dzGjBS1rDb1CY/NXg8d8wO3KUo3G26TpHm3nda0B5cjtzmt165ptZ6XE0/j
	Gzy2LytH2vFwsEKoZeva5Ol9fQshIBcMYCnkQb2nK0R3+13GloUeJJWJmsDlSOTonucCMU0pAMK
	dQxb+53QXdJeGonYf0sIG7Nw97CJ9esKOZv0TRhJzWYIMUhMSLCnesBMXn6lblb1WToPj72m3Uq
	v4C1sizepsKwEoFKA/9QPmHzWqHj59PSNP4RLJI0sbJxWN9PKJGlm38pWriMCKlhMqb568kmbVJ
	qTPkzID3GcG245D6vTqJVDsNZqc/lgNqMpGncLbcv+DBr2inhUTlwgxjVhEJ2blvOwalATeQs1k
	q/IwXECwceMGZKf3Kh9e2Aj/Z+2tKV0xaORdnN/d1BW/ouEs48Bt/nvlSWbXR/yks9eKTmeqyBR
	D+9YdfiZPSPQwH/JgCN3VEvUyJ6pGBHSlfaqtqCUlkEtaF+NY01ruDK8HVJmevQ46O2XzVFBT5x
	yVdOClpps4nCxMNmBPrZd68gk1CQXjYjQKiJEoVtwSJx+5jnQDDBjgHfLBY5im1Fef8yF+DJbXk
	mLr9D7r2FgHBTFGHQqOiqFwvi3SOmK6Cnkl7On/IAXyVbms=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr488791765e9.34.1795780923213;
        Fri, 27 Nov 2026 04:02:03 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:02 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 24/30] arm64: dts: amlogic: g12: add crypto node
Date: Fri, 27 Nov 2026 13:00:57 +0100
Message-ID: <20261127120103.1532882-25-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120205_709365_C77A5B96 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..df1383f86366 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1742,6 +1742,13 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
