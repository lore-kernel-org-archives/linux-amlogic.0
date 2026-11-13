Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D6E606A88D
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QSUjdkVQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JLLlE5rt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2rt/dikEb8VwKXlh/Yqcesd3/k7eome8YsDkfvVBGfM=; b=QSUjdkVQhsVsa3bNUkma7e/s7M
	ok4LONUb07cHVgzE+KufNFTLnvQjU6DADymENWSx2pWK436dfe0doqEWTZK0a4OdCoKTmePjE8omk
	fvaD2QAMcO5x8F9UchTtNzlvj9kjekYJ11nOrMraCscb2cZ6qDjvKU4xTymrxHmb8O6wblry4Rby/
	qvoIBCYBl2ugJqHFBLATs3RY38G11rolK3VetVKbxEdXQ2SoiPqoOH9XaThu0FbGC1f31z5Zgx95/
	0b9la6StkDw4ctOTBJ4Vahy/wU1+oSgY/LYf6lZDbGW36cBTTYo473ViRhNzVcf1q1twopnkXeCMD
	5MMI0dAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFe-0000000ChSU-26le;
	Fri, 13 Nov 2026 12:19:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFL-0000000ChF3-2pZW
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=; b=JLLlE5rteg4IBul0MEslILgxXE
	vg3BNNZKBiGZZOz5ZQSmVssxmIl/OiOsC3vWclxsD3ReUKPzpGJi/7f7XbVaSffU+lSbYvkMz+rnl
	f2UYsPlwbjBITeOhw/aPWbIsf0uM31dFx3CUwDl7mWoKpL+P0m8cvZu8T/ZQgVRZp/OedJKavDFMZ
	9rqchK5huBa0UI6iUB4VEqpYggYFPAfWN2L2xPBwKFNn6ql5821e3HxzA7IKVneFv/8cyZ0EXC9Dc
	Kui36Oeh5X28MB+DxtH4pnshVGDhaJplaXL6GfJEWllCYde78cjjmRgxcsnI2Y6lf3ufuB4S1bzy8
	HyROefpA==;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFB-00000000mJY-1e0E
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49318428d98so314837f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572340; x=1795177140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=;
        b=rCkkIR2K0TPANCB45NjT+S99oT4ymbo0UEuN0mQ7lbn5gYAsgAzbYSBAtyQRiBzAz5
         j320hKoDvPVtxvur27qFNh/iGE8MDvzzJiZJMWzmd04lxr7Ku2VPrt0W2P6JZ26lEHI1
         NP5VY5XNGSTWhh9BMWjONPU3lzuJ/yIuaXM8NDCK8jWORuZJgXUHUDew+Uf5ImVAj1cR
         IoVOKgJj5ITKna1RNYqGPI14i8uzYjoMMAzt+STDW/g0nmBIJBWq+IEXBxdxR41u0D/U
         0FrZwldx9MCXx4aEKhMX+IpFCi1Qgs8pdrVw9TFHcy3Qa+tGOHEgpsDEFPlO67KNyOlD
         iCzw==
X-Forwarded-Encrypted: i=1; AL+hErFmj28g++bMSTZA6S0EhCdngZGicqSooLINk7Xwwq/Vk2uxSOKW+estuJjE+N8Wv6ziLWIa4RG/FJs1gK38@lists.infradead.org
X-Gm-Message-State: APuU4Z8nXs0O8Xwauh0QT4vLKhK8uQGb4l6xQ0L6vZeR5Mj8g8iTS4FV
	0d1CDDXkpHd/MAxW2QGLW4AnLjyDI79HkBV1ThLxcTp7NW9Nc5vTk/QD
X-Gm-Gg: AYBFou2C8Ce6bUCpBknLE9mj1VmTm41FaZpZ7lK5498gieCdxcWy9ljaMiRJH2APOvx
	uHQAEvzH7I+lTP5d9Zytae9Xk/G5PegXxOVpHOgHnH3FV+abM/+16IEQXVpYOJYaUpSV1Ear+sD
	XA3yAwdoTEfae+E44hWeeLtj8As9kzam9GuYezOmOm0inCT0aSM+dH8Kp3Q8iyqrP2ZbfoEDMWm
	bYnf/YGijpK8a9QsKWE+OAamL7id28QDVFgWOjKuXaK2jdRNb4vpgwol0eOHJLIPp6gRIYrNK+8
	/Zl2um1Dn1FwZN66KgFVVL3GOoUuYGI9qEpNuY83RLf2wupibcsDj6r5ljxVOFyyfJK8VQ1TcUU
	KlLDRZK7Y1JxFhk2xHdv7fF5L5Bprj5+HWELflOWvp4Sr5AR+PZdq6Y1szLEHWHHxS3qEHs+k+d
	OM81H3ySlsjeH9yFGd5bFQ3aAvQqHVgaFwKJqoK2VzqOFD5Pq28Ze39CWfDT5lGb+OtRRTsy7Ik
	BZpWBOuxI95z34N8T5Ek8Is2XALsdjDcfor5246K3EfEsf9WAQ4i881YE2Ixp1yUHJH4NwbVs3O
	mpva9zFZ9vZZjJ9pqoVv1S8h03G+0glit9kA4PS+pfkyX+yGzcQ9+8Tk4IX0WPsd57mpjeQcZ1I
	hyr41aXJS0xDvK/v/AzhUJukXpg==
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr6076606f8f.51.1794572340085;
        Fri, 13 Nov 2026 04:19:00 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
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
Subject: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Fri, 13 Nov 2026 12:18:52 +0000
Message-ID: <20261113121852.334604-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121901_485209_C5D2DD8D 
X-CRM114-Status: GOOD (  11.24  )
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
management bus, connected to the MAC over RGMII.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
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
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
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
