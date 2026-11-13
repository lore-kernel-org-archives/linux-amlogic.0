Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C7606A8A1
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MIOjDoj1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lhojwsGe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bybxKfElRTyTTXbTiO+S2E3w/KAJNk7OCy/vE5EXuro=; b=MIOjDoj1Q6COAJYfduak+FanoA
	7Hb095G1ZfMy3Sg5dojtkr1aOGQQVSPkk3jzE78TkKzlr0F37NCVwIsM6s6NK2qvEmt2ZUlSQXYez
	M8vf62Jw8SyLnWBz7xHGxDPVPf1BVucwD+PsxQLPsTy0BOX8q39UCv8UYx6cchdfmEUnAWGWw93cD
	XTWm65v6o7KhWZBEL8rZ1ZHGzHeG8hf69rLRNrwqSCv1LU85nSYl2kpoATpMkCkwpos3+1SOuUs7V
	Iv0Q1nSjenspX+GTEhKy2PTcamFRD+TFwcrLtEZfjO2NNNL2zkHA+CrC6eGuQGAvVqFlC8C8dn33m
	a+wMJREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFY-0000000ChN8-29VN;
	Fri, 13 Nov 2026 12:19:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFK-0000000ChDZ-1a7b
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=; b=lhojwsGeywh2vDYTeEg2ALGR2r
	HNzaJw5uFD6gFVI0PxJd0jcRMXx1KCh/WWlRb3FAowSiWDUuTN5X4HGPsA2rhPLm4b5SWoMYptKOk
	M+HTjR8L1MoNEYjXXAWsQkfVsaRCizGFsKk/FwwmnpzY648sKyBn5EWN3hKf9UHB0L4DDwJ054R9q
	KvpjPi5pwJe2ZAV+DPZbUA1tho9EFPUIveArQ4uLStwBG8OAs67iB4prCOfVHjKb0jSl2j1OLA2da
	5ekNjppqgyZjtctxSV1eFDR1941k3iZ7z90bFAOjii1yJyLwyh0yDgcEyoDYyTwJM6jJBcb4KUwqx
	OETp7Hfw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFA-00000000mIe-09h5
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-49412eb1474so406588f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572338; x=1795177138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=;
        b=yJiZaUwT2kGF4WYoovT96xSPAMb1wBvQv4fRwdmQDXc1jg9kxR1KfEBaXkM87IGIom
         GcGFF86w2i3KxUkdAuECRL10TNkHIZ7Y2izXDDhbIogdkkXLXXVLc7aRAIVRJaeAXYDt
         yZ1kjbiSpw9lYoYjnhnfATm6Kv1YwSVXSWecwvWM9WZksluMPw/1HDpFcDsCA67kMekY
         Q0I0FMsvNx5gcJHe6rlFWId7ia5mFLBxFGL3rxozhZ5xSdiffc8k6cgeUzxIr7tVj7wn
         uScHInkSn92GQMHu4KnbeOcYOHkfEfzViXg0FPuT1aU3aDhzOS7DEDNt5rbwXCazlHnI
         YZlA==
X-Forwarded-Encrypted: i=1; AL+hErF4jhLc3NZxYo8+/zkQuKZADuqZ9Y6xvBIcaESok01Sv3Oluaml3pkP6x1FTvi6zqOxQh25aEp/gCGxfD4t@lists.infradead.org
X-Gm-Message-State: APuU4Z+6BMSNfDtVgeiWVCcCI7Wo814rkuDo4b/XvClWncEtq+vbNQqV
	Hv1WdX2qeBHa5vENV3vmZ9ACnmw4NauRuwO/GFmOcydS6pyOQDS6lOx7
X-Gm-Gg: AYBFou1ieSyiS/zt598YvNOEkY5ixIWspNKEJgnOdO13T8l0o3txQbANf26HicyvMW8
	isAU8xnG991gMEweGSVV8qAR4nTO0LcAWk86GazAgjGvEs4cQdnW0YJG+e2o7tbdT4CeQpTf4GI
	TdcNfDd3dF/IeA+LidQ2iXSCG1zsOXXmDITCy+S9hqaPF3+zj2C4WmMkFMtMjPgVcw0EVVc/RKT
	JYs3wC0P6MMHIUd/+rOamPJot1GLoVTLDOrWBS680X6aPRAtHlzjrWJVmc3yQpcROAm4O9OQbhP
	E9Or3YcWnzyIpAVvtZZjv0favQUbwQCR8NfDRdO49+9qh1ncp/ug8ClPLkvyxrusK+dZzSC+yEX
	m2JQOyAYryuDNUcoinRpmT1bNZcqEGje+KFsV6wtgPMngz1dJS1Il5OPHa9/4xrI6umlyKADT9J
	wc2SepIu9EztvR4BqzDgql+dVX2NFmgos05Gb+Tn+pGwlq8UZCOqqO8XmIW7ckAi7U+uYXBDl4D
	GgXmdHS/VXZJKq6haQeMr13alwYKgLT6Jy0I2lJ1hJBE3G0J/8a+kGpl/QVV1eaZDJev/v04Jjw
	iDVZZGJvvjK51ihlp6cWVO+85RfsPJ9xUxxnZqIACu3Sei9SmymFw59dr9/BKaG0sHL2AT4BmsM
	xoF9jWo7aiuGX5W03ahLOQFoMKaxpXDJcV4yaFn5XmhbbDr0=
X-Received: by 2002:a05:6000:2c04:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-49c72c9c049mr5208825f8f.37.1794572338269;
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Fri, 13 Nov 2026 12:18:50 +0000
Message-ID: <20261113121852.334604-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121900_130881_EB48CCFB 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
