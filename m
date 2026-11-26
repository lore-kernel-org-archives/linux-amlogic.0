Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8AA606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xaGg6nhD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDSqrivY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JNCj+cGqasHZ6c/p43/R5nRxZHYWXqxbV5Z7ptBSm6U=; b=xaGg6nhDazeOoeY830bv1srGeu
	rY2/NYfw4Ovitl+NfWnjoDGed3zGQYT5OEIxyGpnFRg5ja0YJO1BFcgvmVEAySaGYIVpIZc2Hsn9j
	wiNOrpl18y/Qc685bNB1Qq1X9d1IRaZnvbYyjB9NHYGzsLu0lm5DKc2e9bul5hqknHiKe1Y1A3rwe
	7e2cVSdqcSeg6rvuuq8gSV9nbTwFeeSuG+VFWHUW8tNEk2HMjdEFlaS8R2kPfTZbCq4ucKFICd8Ks
	kdjuF3GR81aPJWp29/vGVavvoj/2tcKcAo1PsS2g68YpC/uUsKTUam8w+xCCzs9oAOUZKEDnnI6Ou
	x4uVKduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEN-0000000EKyw-1qz0;
	Thu, 26 Nov 2026 19:34:07 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDt-0000000EJyX-00CD
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:39 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso68527495e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721614; x=1796326414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=oDSqrivYozuPHDB/aQNjJgQeO7dAfJv79fd9Rph8aCFy6ydq5SWgeNG2UZk4fRXyDY
         kRCI3uriE+gCSMufwglkxbiuBo7b+7gVFD9pgooUBzi+JOsc/hvri3rcuf5K7n/MJgrJ
         hGayRWqPCElU8rV1v4rGG0+YQ7Cgpt/VhXNM23z2jVsjiyEkCrLYlvHO0a/CjiNF4o4n
         eH019PLwdeIU6TWNDLFhOloJe3g4T+6YoY2XXqUTH4eGuM07i5Y3uJ0EOTi30Ct5vlQp
         fAqYeG/unEgEGL/9I6kOuT+GMHTKGNplUX0cBSK/XegFIKrYTCcgtQsKzGT13cPk1lCB
         twPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721614; x=1796326414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=J5eWLXOUX/w58jE8NDJbiotdpNTT8XRZMcnUDTk5E2pRLY+DsOrTW8HVYREUqmHpTC
         4evUICDUVQKTpxCkJFcZn5meGO/kHvWiDzfqTjyck+0xKeTdoyGNyAoDs+ls4frtke4S
         LjnSZmwSTZij0jl4dgd+akAQoT2aYjAVLdbXRMrTmbYfDzr5inGdmmlcDLScsLC9yoPE
         wj7TSIfzRrOyoAeqA0QSx+t4him6MzU1Zr0XtGUGkEJibeGfYVVMQ8oM3et78Ynj7iZo
         j597m/ZrG5c3XakTSb5llopd+xzwWxhykz6GAC+qBAKqqBt4b0/nnQeZgVY7VpMby8SU
         lnhQ==
X-Forwarded-Encrypted: i=1; AL+hErHRkdYr7AZoPzaKPMYB9kZ+G6Nitn0jWkabs/x36GfWs9KusfEjNO8Xa096J5c+riow03fd2/TKXWC80kbY@lists.infradead.org
X-Gm-Message-State: APuU4Z/YOE8LsdHWKCxYk0qUIzMJGtzCeae7TkT3dsAfAdvLuJPhlljx
	ET2DwF8rVKS0/srBPudcRrP7pvzMi/PfYDfo/a236o2ZYe5psKW3vmCs
X-Gm-Gg: AZFdTZeMsEzCCysg2C8BF6gx6YTOmCxWRZsTPB/YkUFuLEqdvJ67LjERTRS6TumAlNd
	crptzDTevpoVK7xiiOhfN/cwzO/s3nDNVF/88d5dBrsAWwX0Qr7UpAO4X2/xO64MtkFAkJ3tHKP
	pDdXVJoFweFshOUySoEcxd1XNe3nR6343iHXrgWtrw+FHXefSeU9CUBB+H3gBJx/HBex8uWXqQF
	SBg1h6vhtA0+bbDAfQF9tYRA3I/iBYPfc44ylj3AYJBK1x1SbkV9ctW7hLAtqJ34Ketjb6FlwJa
	QE8yCsyiB62bVRlkYxUbX+XdbpHa50qqFbaoUKeiXEV0awsNvxNzv4KqVWcvwu1DPZAhr0pdaDi
	22YZgJcBsP2psKoxhenXsOyjWgmyo6WRBlHd3BE8hzc3/QNJkqAGKwKSdyw+RcTNO4Ua8YISXaT
	rEHJ0RSmQbiPsezpHit+AZq5zF1iRT3ye6qBg/aBX2Dq3zFRVe08hJiCOEdL7yEPsvCb2niUwMT
	sTi3jkmgCYxT0iYy61M4CmWtsz1ylPqE92J5svnQPgp+ZByP7ouKyTslmlox//nVqMs+AZRFpZP
	QXFz+tvAOUcjJTSZwUpjXEMhZjrTpwmWgiZD+++TeUTJtA==
X-Received: by 2002:a05:600c:c086:b0:4bb:a5e1:8288 with SMTP id 5b1f17b1804b1-4bba5e1b76amr99845895e9.6.1795721614313;
        Thu, 26 Nov 2026 11:33:34 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:33 -0800 (PST)
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
Subject: [PATCH v13 21/25] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Thu, 26 Nov 2026 20:32:37 +0100
Message-ID: <20261126193241.1471372-22-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113337_099701_D36317D7 
X-CRM114-Status: GOOD (  10.16  )
X-Spam-Score: -2.1 (--)
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

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..5d0bffda8f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
