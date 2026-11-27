Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E64606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+xcb2IU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mHO6VATe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c8TA0Xux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H9pwjK2+M8OpB7MdyK3KGq5UAwSr08jzy97yDJLGxls=; b=S+xcb2IUhhCj+qQEu8/Pqkv0a2
	14n25wCYLBvdRFRS9P7+hFJuMzzmq6mC/fiMjsANf08E21UwmY9aPpN146f6dNGCMAufK9g1V4A89
	ygXWUyLlFioJscZfGLlNa4fAEDRwrM/+/2KNSc30PM9pUCT1i/ZBl/Rl6ieMXW2TQKTegyhsDMBAt
	MkbMlzcMfK3mMyNhqltdPnGW4PNICVpYbNDpBeIwv9NIybBDPMJvG04rmoePqUBhn/iOYg1zvwb2K
	WXse4znjmJyGG2lduyxTuIbuD1tyuJD/Wx5sfBt2PQgGFGwsaVwhaT5WP8zunJW1IB5wrobgZLxeY
	do8o15Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWufJ-0000000Fxyc-33de;
	Fri, 27 Nov 2026 12:02:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuee-0000000Fx7x-1s7z
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=; b=mHO6VATeif/IBBNmROHMZHdPFC
	rqqwEXfIcuw7Er8quap8TJA2VkDdkkxn01MYjN7+MZo80VvQI3rGfDc0ZFYltaJj0qjhvDzMzuDWH
	fi/C8FL/5tvsriPP2PxeAkMX2pBuOEz9Ea4J+ZXHWzfMMrPeT+EllYTF2Rtq9iUDn4xv631IADcvY
	8EDec8QzrjD01tW38QSKamzYXLpH+uf8YvAslGNlMYRv3/sSmQQo0X7B4gZluhpKcOufh7pMPt5Ad
	1p7v6wX9q5A8uYRNqlu7NSxxLxCs2C+BvKw2XSPVdEEeQxg52W713Jt9x5xybe7PDwHS8AKpUT7JP
	xEy2vYdQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkf-0ttj
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso98377955e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780925; x=1796385725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=c8TA0XuxO9m4opmt9/m9zTa1TmaIp0ru0GugWotGWVdhqxVHUWHkoU2dWl6DPaEuEW
         VANGyG1MryAkpEMcU9U08sJAmOx4K0c6brwHX96nx6bMxg9xRJy/7CI2tW9aqKaKW+A9
         JLeC0vEM8NmiQ460Ti5z71CbAGg1Nuts9l/WQsB6F9MCFdxVbqYL58QoA1HcikUCTfBj
         FtY2++jVUO4EtneY0VayGdHe/jdc0Z55Mk4TSheGSTcyDZDYbUdjfnL8GPwJMm8t6iFO
         BTA+nqMDuzGVTzkn/GfDU2K4i12a3sASaf90Ol2hcnbWU2y12ctvEiqVjaMydaT8VVNW
         7FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780925; x=1796385725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=DbYjDlDoY1460y2UcvRZ3VNNV17VF71wng5JbaOO6k/tPntzNdjjRtE4a7wmwCGWBw
         BAfgfpkMfvxKzDJkJztE6dVmzmNFhbMlAIUI7umJg9/5jSXsLFQ1on1sfU5NAn1te10z
         lIy4a/HszLwcZVFK8hHLM8gSkBTNtn1u4uLyugBzz7QMczzT98mkoURJXb7+w+iqOTRx
         i5N/DCOpuK5TqqW5tduQb9ritNVHzJrktio9VXSI4mg2NIhj4b3TuctDB5mbYSRchp32
         2kIGx1HPWdPR0srDput6MDMjNLHrfM6yv9MKN7Ik2FjWN6ZhPMIsEY4FTK0zLFtfpg7Y
         WuKg==
X-Forwarded-Encrypted: i=1; AL+hErGHO5EDTA04EoAnWD8364xhvfgFbpdTvub2BGxgIBbHbnOGr57/usJdNQKrNnK+bybpvIg9fbb0kCSLNmBe@lists.infradead.org
X-Gm-Message-State: APuU4Z80r56SxeWZhc7NaV02pY/C7wB9JQX4LqjaBTbFPx0bXE5BVuV7
	MU1uZi+/GAH57Nl47i+2GNnVOQN2YEzgwR+J3pgDylYl9KsMbSQoZcTZ
X-Gm-Gg: AZFdTZfriQZsR3z/tKSAuits4eAYlbbCqgPuA0XTruwZ/a2l+gCEedrJjfUwx0+H8r4
	B2Zb/TMexkpTaSN4rO/ubOXj/L64WtpaWIAaT+/2o57LLEdhkvYbVWOWcBteAfHbV5rhT/Z5g70
	5Vudh7UqCKAw9VpCfBCO/Sdpl/WqAfN87hr6vZvDJ0F9J+8Reai/JedyWd/H3cbfR0SdPd5MFQQ
	arGiYrT7fiaKnihNSlCCTRzC08SPtn9zPQFeeuhIxZXCGavkEXmH8lnTxxBqwFtTthYFvs/mjEr
	tu6ePvLTxPnuxb8aaeZxIhPmkbYfidujGZkXlaOeRCduhNaKm22NAcf7h3Ig7cHHYYXfak52ke2
	pWYeQa8UyHIlA6XDDjuRrTN248ZykGqhW8vFAwlh5SS/76aPUnmIPI9TKE1qNe4+NdtlouaVE8t
	nqISuG9tLF2eU1uDriSTM29bAzVX81AwMCBrMBnYwG1Ln/eDAjEEG5/9Fc0ve+76XclG258z1BI
	V9n0AmU43qgxcKk8PReoKWZeYefweSv94Ihws6lCbeuqJDq+dWbx2FIrewHJVfB5CPaf4og+ocQ
	dqzoVApxJeR/jquZqgLRvoIbGNswQ5fgp7xHbVPWN0IuCtlGV20ov7hkVoSwya6wgZiH
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr457352155e9.13.1795780924749;
        Fri, 27 Nov 2026 04:02:04 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:04 -0800 (PST)
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
Subject: [PATCH v14 25/30] arm64: dts: amlogic: axg: add crypto node
Date: Fri, 27 Nov 2026 13:00:58 +0100
Message-ID: <20261127120103.1532882-26-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_182666_ED654930 
X-CRM114-Status: UNSURE (   9.62  )
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..e755a019b384 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -321,6 +321,13 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
