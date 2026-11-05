Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686CA606A32F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xQR2IjUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ykXO+VRIdEI6AzxM/xVabPbIm77gBWcvsq4XOLp/j6k=; b=xQR2IjUM+qJjojBgCUI/JfhzLj
	UabuoNItG++S+DiZ3JI+OgCXPZIWpdHmeWGF3nOPgac4WKSJHeAgf/qUKpp4OT9qFIYBaMEXnG28M
	PVr5ZJRdxofwpV38/7hTr+c4DpJ3pUpQH8WqQBrNK1fnz0RqAXkIkTwDNuz0zP0AjdiNL6NEWRSst
	gGPH9XXDv4qMNSlvUvct+tv1ssItAL6MJ29l3JxzBObDvnRYvzhwWxTSZPj+0jHBeQ2CE0k2Aw2fj
	ErYEqXtfA8YazhJGQ/9uT+KdfeQMGU40W6FjZM/7Iah2UNMA5Oxry+GIPm3vC60EeYaD/0DfPJlv9
	C9XU0UWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuK9-00000008Oiw-01CN;
	Thu, 05 Nov 2026 10:04:04 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJk-00000008OHf-0DLO
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:38 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14955095e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 02:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873014; x=1794477814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=cjEiV4owvT9ayfMDL7yLfA5woM+zOKp1VBQ/kiHypnP77fMQaE4W1ZLoGpc2zO2l6f
         bonQxwkxRSbEuGCBPWYXSrKIRQyioea+zjtib3DspI4uBSWr2etITYmcz6OjrRENAyPO
         uNzh73r4Uloz28SnhIhJIotNvNFc3vKplZO3OqWDWssGg5fap51Kx+bORr5ESwtR5bVi
         giH8BRRwZefmnSJSXRzsJPtxk9i0rJaoYdwgB5uxMFyQCsExXCtuliEYi7cRttbHLHZe
         WZOSlDi+DUX2C3pCYqPF9lXlEgyHsiZb4/IFcWbV01dPhay1FsGDaSYZ2DjBXJXT7ic8
         ln4g==
X-Forwarded-Encrypted: i=1; AKwUvBz67ui3YNkeo+4k3TBULYqPZWQB6unp8kxwkgrbf+hdBpVqU2lb0mipetzioRIOQ83y8qpb2vcDgucnQHnM@lists.infradead.org
X-Gm-Message-State: APuU4Z+YPpQAAz92hcYbodYpt6B2usa6ZtHgc8fwy3K+Xv46OFWOu4r2
	+cyIEQ8PVZT/JZU7O/2iR3EiKJyVxcRSOjfaWeoNRWwOFppA7H6YeyUL
X-Gm-Gg: AYBFou1YVXyOYoA3DBUIXYyjCRAErxQdyYY4pHVpB4FbQ/CR82+St9bnH8ckfMv+BOC
	wDVa6RWVyhY4ZxiGu9U968iju7jmfNL84G1WlkjAvQvhPDuN/JlM76DMWvfoHE0QKg4GTOu/yuO
	WekZnjXFeoFtBx1FQCyPjJQ/5KODwEgGAlLOoF1v0L5k4jfZLp2ncAk/Aisw70RaJE+KWmMsTo9
	hX1i7dxNWjhzyXIXTzWWIRAM8LyIH3K+mUefYgC5pQYko6CXVeWVG25fI5bMgQlWX5hpWYYlo3h
	qv7Cq+ecbRp+c2ZW5doIbPQonOCCN7m42w9VWno8ASVcEa9JsmjaX75GLn4JvcXequ3+H4PRzZ5
	AC3HYLeIIIpQkMVVPh/dTBVMLq0GOsK+hJTmsV7FXV54fXI+VC/Ktqb5mUKl734wLAuDbvkWJrm
	bVSlwR1GToodMhXZbb+fD8fZ1ZDTtepH5lV4Kg8hOoRg0aB6FeEi59jsU2RJZD/l7mJdNBt4/sV
	Xc7cfka8TsWFb+yGoJgqhLvC1wOBCxLjo/fHiPtgR6dmiVl30xwebR3tYfxMIBC7QWPvrQmYpRH
	lIWplyq/5pFpAG00BiKNFM/wnUlLp0Lnce0MyY6zaAYuCJsQUnW2CbQ/6y0vcFEe4T46lky5WNb
	7fw/p1M4CMIHPXh9ibSc22pBYXw==
X-Received: by 2002:a05:600c:3ba3:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b52c7265a8mr45793945e9.5.1793873014390;
        Thu, 05 Nov 2026 02:03:34 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:33 -0800 (PST)
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
Subject: [PATCH v6 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu,  5 Nov 2026 10:03:22 +0000
Message-ID: <20261105100322.37816-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020337_004752_899CFF7B 
X-CRM114-Status: GOOD (  10.84  )
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

Assisted-by: LLM
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
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
