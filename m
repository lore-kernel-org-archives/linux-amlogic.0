Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83032606A321
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tffNvaiM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HwkjbXZk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H9pwjK2+M8OpB7MdyK3KGq5UAwSr08jzy97yDJLGxls=; b=tffNvaiMHeJ1pxvsNCwgMyOKUB
	f5UIk8USh3J7fvD+tnfurADTYxmAbzfzjiurFHCc2UumVeUk21LLwmEGjni7IvxXYCCiSgLteKh1H
	RUvWMCs9QskqAh9HqOEXo2NvBb5asPM5d5ZPrUDGIfahx48gZGlkcNADDzlVSULqsWZnBoLjGOlRs
	LuRwC303Dq2Mc+PLcqQUUgctiLo5GSATfFY79PDxNeAo1t/9dtclWz8O0bjqj07SjMKRCs587Qbl1
	195fwxNg9S6byAelPjwBWM/Ty2mkAFU8cVpEdnu4+wOTGxONV5trI+VS4OGcFJ4TGOu2p2c8w9rma
	mcbrCnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEk-0000000ELfY-3rbq;
	Thu, 26 Nov 2026 19:34:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDy-0000000EKCQ-3mlR
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so60785705e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721621; x=1796326421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=HwkjbXZk78BhydLMGe1QHWjaZuPgW2C5EcCUwiQpz0b6BOreosB4fu2t2LKA6RyeZY
         RSGGQKeWpc3p0y6XZ9QRmhlsypBkCbsSvd98myjRz2GNb+m/MIxmQV4Iczfl92g8/us5
         kNWluWY8TRcMCM9bUIAW8QQwCHP5ILOugQMD0UMk2aIdQ7+4L60xWNtXcQAf/KVwa71e
         nvO5s7uyCYY1Col2E7LlpLejtO1xkYbQ8+cr1qo5qqcvxLowla8bIkDnYNrb3dCYWA4V
         6Snz3jf8d936KkWwp3Zix5LQ/KTgqZZKIog8jdM13EtDcHgadOL9RbtEQ6op6FlNJZ82
         MpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721621; x=1796326421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=eWpxiUOqcQnZ4jbt5Gnt3cKapUzEPP4tcsLRbwn97+k6kJkMVnur6CEWECIw9B+fML
         pkTVHBZp2acWD0SDSBdXlR5OeaEx89EHquMUgIBIxdL8FdKk7J/Y35pHM0H3VazkUxmi
         c26OzDCqGql5aYO5l2RYIfuGe8H0nkQ8mTXilX3zDs+PvgXnPotTDuQg6qULICrzUFNc
         UlQkeFaiDRgjAmHqQuIV0W87iT5mu+Vu4birYPbpAkV8cerSgL5kWWLelfHyeWw32hYU
         jt4F+aAs+2O0sJmUMgrvUE7slOa+5AZrRpXT8psAX3rRz62DA0OSITODAfPvu9nGZvP9
         qDFw==
X-Forwarded-Encrypted: i=1; AL+hErHLFbuGeGwvYXOBtfPo8lV5b+OUGwrG5uJzsKZnTTfC5kQ0c7hdUKa7sBrfmWtfzgUj4Bot4AjlaredKp+I@lists.infradead.org
X-Gm-Message-State: APuU4Z/7RQRJ6NoXXWX6kbwrwspRCCNZ1wY5VDjSiiNCNLh9AUW6ukxa
	6k6Ocerfornz1a30GL3iKtyRzLwcLIeR7cymNts3ahErS45zfqFJS/ec
X-Gm-Gg: AZFdTZc/gqXhSQXOY2KEY+Efjh3nZMYTMTpm+KkDr2ywus19LdssllDUCiBeMMbv0ba
	GWV/gmKi1iiSRJDiZU+jPZ7BljjSM6oNopxRLcF1FLsIEPwDQnTpEUsnQovyCpM+X1/Mqy+XOHS
	JR7qcCYuKyEE72fsrNLoAP9xul7+eSunNVPbNZmyBHOUXUqragVL2xHR3s4yn4/rByZSpXq/DKS
	bw0pzElAMhAaR6317RhpYNEOYrF+0Iw2Pw8PMI+rVJ9J0ELK/8bJMThBz3CsTtXacmjRqo4QVtb
	x7thdeYHmkm3roQKM++5OgA5tJAQl40wbgWJ9aSanJzET0Uq8pl4xfflM4Gcv27WbagvMMub+nd
	+irem2Dh+pNB9tVN9F1QzNCE+wTLM/qomZTIaKRGwQUDslXhRCSMpXAKPshfh12zPFZjanMRQ0U
	NKa/dOvcX1GasFj945J6ZS0Er+k7z5erX5rDOjQQTdPjGGLuaVDfhELeFE4gj2v2qaUwv5DfYbH
	ZxVE6BlONEleCVT7bU0US+dJbEfYdUgVkGnRR/9bkGsym7ZMj9ts+UwhZFEz1Hi368yrif+I2/6
	xbZnvM9gCPcRQOPLEYc1msss1PgNwp6z14dVpD3TNU60/w==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr425835985e9.7.1795721621193;
        Thu, 26 Nov 2026 11:33:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:40 -0800 (PST)
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
Subject: [PATCH v13 25/25] arm64: dts: amlogic: axg: add crypto node
Date: Thu, 26 Nov 2026 20:32:41 +0100
Message-ID: <20261126193241.1471372-26-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113343_380306_89DE60B0 
X-CRM114-Status: UNSURE (   8.93  )
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
