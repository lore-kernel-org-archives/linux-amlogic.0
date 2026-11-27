Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C4606A323
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PuSYIaN7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHfKlEcM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FlSxw+MZRTglulRJrRleviuyRFVIcZ+gCFioV2nYFU4=; b=PuSYIaN7iGDCDJlHqENgvRnvyb
	tLRlG3y5hTxPiMm9k+jOQ6j7oFNPbJAM/nZUaqMWluwAhw1AzC+heXb4jIhhlxihiovkGevYd4TSi
	2G8n/vfGlpLxOm3cROWFQupNyqfPWJzlCK4zDrzMIm8S1aAEhO40SeXGaYvZ8/LqJOqheYeFFp6lj
	0m08D3kDIVaWyEvFlxQ9YD7KMz7yDds7APy2Xu7wit2M09M6Pu4nqKYh3fUj8iajkrNBCkCYgWMtr
	9CGiDa9GtVFfnsRpMH7T/PuQF6/AG8ZJB2RApImncE4qy98utzGADJp9lf3dArlulhKUk7sHW5RR0
	7pX1YNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugz-0000000FywO-0pLK;
	Fri, 27 Nov 2026 12:04:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuec-0000000Fx6B-2F5w
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so65386115e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780933; x=1796385733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
        b=fHfKlEcMlFEfBUK4PyrMlpbKUNjl4DNrKxnjRvZbG8YjDBSfLkXHoE8VI8F4IVmTgL
         yUY3k3EoylbpunF67Y+nU9ThVFu6EqLD9Niu2B6e2N2Rm43njH0wX5GPvPEhMmdX3Hkq
         VsP05aa24ABCe57osqHGf3zZki5IRoc6oiEuhWjzIaK1hFaU6X1+dMLlk9Afp2EIvv25
         Zg/60/rtFgN7fptMNYk1qEp91J/45sPq83AZtGQQAh2SaVVMUdt/P8iigi1ZRZ5JeA/0
         CiSBgnCA8LMIXRpyyLupw4GiZ7KNyWQb4xebm8KVDjs3yuP+yItCld7EtRNFMW9662UL
         MhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780933; x=1796385733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs/a4DDZkULpkfxaE5kGJ7kgjNQPkZBpTJ4KeEOsPSI=;
        b=ipqnupTrT7uDWRpCheMUmvIecBnBCWTnM8LIvov99wWi0li5lBtHKrn1I0CdR1BkML
         amSfgdhDtdinEr+nQtMpzrbQxZJ5b1MI7l8+xUWuRZTPObNJOG06SYlArW7l8Ya0Ximk
         6NUsMdosJZCa5mK41aKIHgS8mGxV7B5WsxUz5QXxFp3ZhT1K0MXBmPhIWMoHo+aathFZ
         qnaq9PFxclW+uEtmUbtQD5Abia9ZuHeSEp+z34pZP3NIdvfjR9kQMLlhw3QCyWSjN4Y5
         qirZaIbvCCFQyVT8jFB+Jnyc1gFOwhJra4cjgschRZbdCCcgMfIlWO5aZnJwLw93/jTE
         1YNw==
X-Forwarded-Encrypted: i=1; AL+hErEiz8roNqLlNewEqVtis+w4AHVouLdvVI2SI3JISox7Y05UsIHl5rHXRaqiaNDvlAa5pzN436IFtoJqziyJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9nP+ZNESeIacpHhLRjheCNir3XckQSjiOiJxbcHPfiiovgkC73
	p2N43shfl6TWy7FwAvkCdN21KBze/N3Z3vmOVstqg5cYD2jFz805s1jG
X-Gm-Gg: AZFdTZcn2Bxif/lL10eidv34i0Vo+o7NXoFOJfXklf51BFwBkvgO6Rl3UlzF9Vji+E7
	aiUDVWJMCQqVaDrINZ86R1YSnOFgUGH7rMmNSqcT7gPkWsz55cWa878uhLj0AU4MN2MGngJr+QG
	oouuwJehFefMaZ+TaLVfD8KftFKgunKNctQ9NfnM02pHcPGhTuqCJ6JrbUCZVQQPLIDHiSDmgnR
	R211sTMheQRzrOaqEJybVUEXnvxp9nH4o9Kv9soO6NShV+SrbfTOg1mkzym84hNHKiZKobzLMDC
	WgvIDUcqXEPe/oFtf2EC7FQSCrze4LjTAjU4qPg12eK2s3UejBfLedHfHCcsnd5DXCfDTGfRbaf
	8wKJNvkDV3Gxh/24S8W5F+rjIwL0TpoYIFVkElfFUVSVtWNiWuMbYhn492ypIWdD+87FbkjF/Ex
	Q1VnZb53aZ/A5EJDbDheVT8qERKPCnZTIyZiW5v8Gps8medASSmzpv+pTxFqv1JcEtR/V/aVkzN
	1ukdnUMB7SwwaGQ3I9WnDwxMF59k/4L6ven4jiIUGFj/1ATcnUIKguGIAOKIQgewDquicfZkNt9
	+z+/khaPTi4feEkFuti+qg1CDE4moyn4pRiifNiZ9Ntgh6Ja
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr486388005e9.22.1795780932698;
        Fri, 27 Nov 2026 04:02:12 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:12 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 30/30] arm64: dts: amlogic: use the system clock for A1/S4 crypto
Date: Fri, 27 Nov 2026 13:01:03 +0100
Message-ID: <20261127120103.1532882-31-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040220_112916_7940C114 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

The A1 and S4 crypto engines are clocked by the SoC system bus clock
provided
by the peripheral clock controller.  Use <&clkc_periphs CLKID_SYS> and drop
the synthetic 64/166 MHz clk81 fixed-clock nodes.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 8 +-------
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 396260b7b398..1b064c556c68 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -691,7 +691,7 @@ crypto: crypto@6000 {
 				compatible = "amlogic,a1-crypto";
 				reg = <0x0 0x6000 0x0 0x48>;
 				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clk81>;
+				clocks = <&clkc_periphs CLKID_SYS>;
 				power-domains = <&pwrc PWRC_DMA_ID>;
 			};
 		};
@@ -775,10 +775,4 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
-
-	clk81: clk81 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <64000000>;
-	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index de173f40e15e..c004ab7bbdfd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,12 +71,6 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
-	clk81: clk81 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <166000000>;
-	};
-
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -631,7 +625,7 @@ crypto: crypto@440400 {
 				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
 				reg = <0x0 0x440400 0x0 0x48>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clk81>;
+				clocks = <&clkc_periphs CLKID_SYS>;
 			};
 
 			gpio_intc: interrupt-controller@4080 {
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
