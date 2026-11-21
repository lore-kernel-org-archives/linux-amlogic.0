Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12F606A335
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AS1GtcTC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wZuDILpaEyQHZww1syPyoUDynxb+r7awOzvRtnExvag=; b=AS1GtcTCe6OmfkYpeiFQLQNg3f
	zB69GfAURkncOy1GUqmP0s3bLzqFgGJ77V/Y+8MKY2lLKjLqhW3/Sdm79bK5YOJUrJBYsa+yziWhu
	1Gqud4l/IICVW7fI9dQlkchCsDQdprtRU/HtefnB58IP+eRXOz50y+85l434PcHC18lemjr7KTv86
	+caefQCepbofZO2RBIkcPFs8XAnBuHtL+sVOdo4RwJQ4C3J3LSOh6j02mM62rISi6V32agsLsY0mm
	KbfbgvhHYZX9Ppk5MYgjiIBiG2dVhCOFHlMlvHTAFT3YpMXD7MSoFYg10RUCnkDsi2a+QxSniTZu3
	2+aA4mAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsgL-00000000Loi-1jlq;
	Sat, 21 Nov 2026 21:31:37 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfx-00000000LWc-06Ky
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:14 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49465892f7bso1561099f8f.1
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296671; x=1795901471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=nIGsn4KRlCbNzQpkN5P63VB82zH58PgoyYjQ67BrMrWQ3ZUFuy7cx8RFvnvrRSRbwa
         N7PcISS18br/8IPq4btq+/40KEEsn0N2mgRgAXE+4pE3aVH1qcZyaM6Sguob5O3DTgiB
         bshc4xxLCCY90IeCeEAJekhHhkEGBfra/pOAsoFwFD4XEJATRblSS0ROAtclk3WXH2yR
         Iydg5vcNBWQdOkIF00zbxVBcjjVkIyS9tweY1KnxZfZGomnEEYrc1ifDPgOsh5BpuqXI
         H6ofxzFu1uZ0CcEm6u5wfc6Co1tD4SIBh+FLbOnK/JY18r+Zzy+IDrPsIbTyqicH3MEr
         uw2w==
X-Forwarded-Encrypted: i=1; AL+hErHWjfFt7GsEhPH/S2cHf85KZU1OUNYsPcuUamC+yXxa+6U3HkwPSLRj9Mnep/xvNz+CYPF/lZy/8oOek9QC@lists.infradead.org
X-Gm-Message-State: APuU4Z8Cm6gKzqDnYVKFcN2HdyxfqjLJU7Wg99JlO6wfREEmASVPYpe8
	pVprfQWZ6jwHlSApbq0HHFgsItFowxWwNq7bYoWfNSA8CX1WKz3z5o76
X-Gm-Gg: AZFdTZctSiqd0BopWzKO7g8TYePglLIIkG260eiNccxpeikCV21FF1kcG8ECjuP8/wL
	7mxCPWpuFhzrChfygm/+6m6zFnYuxwqU49Vsw777NIhkYDjTvHwasWv8H2MsiT4Znbr5l9+3LUS
	Nj+HLcqjLKuZdIPNXtCsmPat3c7NiInwtVQAmpgP+H2gaOmsPiZeWDzE14nZ0/2jvzOu0hQkEf1
	zvBXTFNByapYMmycuj0iFbdwmmva2634W02wRB0HZkyNpo3uUa7qBYrguwpYGMP/l+FQ5Hr0tYQ
	/1Hv8YkQIYWXR7X8tcu9RNYDRk2D5bQjUUVeHNleyy/zaZP79XRd2bXSc9STcuoQx8J4/Gjk//C
	Yav0wTh/fsavKPg98fnvXfeawuvHG5TjmNtyrzcsiJdvtuZJqX6ripZL95LrYlmGLg/2HoEZqnM
	WdbjVA+WpKEWX+mFbH77Fl9TpFkYTRp0TorhQQLzmkwkDSe/cuLFaeNr+6h4FZg23cvFwR87oTl
	uFcuExVbd3Lj0i5h4gG/l1JfsgrDbqblPNwRAYZhvOzFXBBkhwAAE1U9gLHzAvd3MJd4T1b4URX
	N0KXG0GkfOp/vLf5zP0lomcPTVpUovPI9CS0rWFw/dSx6H8h5qpJOtU3DZb+zwMbxZSAl24a0aS
	r0odokFtWmmzPfAi0KTuJznE=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr14146074f8f.53.1795296671234;
        Sat, 21 Nov 2026 13:31:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:10 -0800 (PST)
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
Subject: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 21 Nov 2026 21:31:02 +0000
Message-ID: <20261121213102.143130-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133113_083839_9244136B 
X-CRM114-Status: GOOD (  10.66  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
