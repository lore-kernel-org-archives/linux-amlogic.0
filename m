Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBE606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tt+0L1df;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFUMfXMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OSVRTBVwLKhC1mqScOB4LZELREDEZllFoQ58vsrBoeY=; b=tt+0L1dfJen4/sI8q+G6GEedNK
	p4JUma47QeR/TLGeK4BS57r2S20TuvBLbdl5KLc3X5MxHJn3hoy+WvWJvw/R3elhCUzIRc9MJQPla
	UQoxXOJiQlET8WdRqsuoptDxpPj1vlLCFICFZv0qDU+Qz7FmfRdugcE91oXzfCPoTkC1UcO2v2i78
	yhM7BnMMzbz0onVcqkwqqSUtaSQOLPVKwAiX/ZvyzXFx1Dm0N+NUEk7bxv5VFsC7+yLpBxpiLGFiP
	0Pnbx4OecjJKyrsMYSj3LRCbziFDPP6sAPW8TjY1q0ul4r2TXKUaUn4igrDrBb9a6D4CDfX//Rfwq
	uSlRTzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEk-0000000ELfC-36Qn;
	Thu, 26 Nov 2026 19:34:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDx-0000000EKC0-3QnT
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so78771535e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721620; x=1796326420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=uFUMfXMVbiHgCbN9IEbXXCGFTKuwoq2Srw6pkJaHShJjkLUK9wKi0ozCH30X9PXY/R
         KLTMGDFnn+Iy5ctnW8fc68/kYMfPVptPA4FeLs7NzI9xhsr04ymFzyaU6oJBpVWMJlnd
         5i9Rx5NSWq9VgSbT6mN3lDpq63ytCughuARF9BjXT0PYgz5ZnadGHLHMJU2yrpbGz7AV
         QtGsZ5wyJ8HXaUJG4gC4tPmty3HyguOVoMUyom4/U2orz9R59YqQJiGeM/dINQG/Bfva
         ydRJBKCuqYbwb6E2xWmwlv7cnoo6Ga4dBi8pz3Ax7D+arWwAX3jZnJF4p7AuwwnjzUYv
         /UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721620; x=1796326420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=S+2B9TTy97xwLnwlXr4dZQ6NX86ief4ByD8R+2rSZNyUriqewoo6guXtOIZbxpO61v
         OtYx1LlPupLwqxXkWyrq2j9HhLsniKVx0K31iAkF1DxszlL640xY1CzUeiySub66InTt
         yHcfahMYIv5e3RqPiwhIwG7Bzq3hWDk1ca8hg/c/dHoig3s0+dWi4dd4qK/EMrSXZPDT
         b13RN+7ZFylmongI0d1aF1tiMLan1To/v17JEuwbj8TijJ0qO5VEppYw5IXvrS2EE/6C
         SLliuOrbSdAoLMbuBz/GzCphxUoj5sENS904rjOj0Lurw3iOVvIZBRLlx8k/M6hvV5ee
         XmpQ==
X-Forwarded-Encrypted: i=1; AL+hErEaz2WT0eZVa94D0R7XGAVc3wbTtTAQtk8PLZmevAM8ZLZd7rEzNgKdKW/XjtN6pXCJJiAnzswyFUMZQ5lj@lists.infradead.org
X-Gm-Message-State: APuU4Z+O3esXj8/kDGrWdkSe/hXiQGkoC4nE3aJf4UZifC4/tGA79EuI
	T++DzB43YfOeWDHoDBEZXq3S8YoBOTcpQm6rMolPT9eA2V/lR4BYyg/2
X-Gm-Gg: AZFdTZeOpqpX6mofaBo6StsRtQFRxrfrP7FFC/V2kdKQjZmjy+JtopKWXhikUtciEU1
	Ojo91gG5wB5SUM7nxwXTTbADND14YCqji6W+JP1SXRZEFvlRDiRTdfDUcUoU6zAnx50tyHJimie
	Ws6XioSaMl8SJaU46TzmbH8UA+yWb0nG5bqSVcz9566z2DbZ5Kbg0bXR1nI/ZBvMnnjVA2vz8EX
	LLSUWKL4TEEtixgxLiJLebDILKxm/2vYEcAh729HsyL80EwEyZrNtM8ymlYspuYs9cqbjfNz1HR
	hmlCATAKx/s8Kc7MtFH8n209Dis4PwCY+4fas6WYsPjAV7mCK5QEuG8fDPVh/MRpMW6gUTIrxHN
	+3S1BzgkZTErXzDbyj/HwdAXYYUFRI5/U71pFNVPywNtLYgsZMXmwE59PFRsyHlSnfvtRikkOG0
	EBi5Q+UPJpbciVdt9vq++eMwZfyM8i/hksRTC/a5UC9uzIj6d4ATjNPKeUJ7f4rFJa34nyT5qxw
	bXq+Tf6Y6HWnVuJ5hcceIBw/eIngzRTflzmfShm8sCZSBPFSlkhK+HqmAcTZQ+V5a0obFpTeMOo
	SSRjY1MzrE9LWadWJBP6wI//9nvayy81d3zXfwEKNqzomNQ=
X-Received: by 2002:a05:600c:1d86:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb8892099amr474464105e9.30.1795721619820;
        Thu, 26 Nov 2026 11:33:39 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:39 -0800 (PST)
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
Subject: [PATCH v13 24/25] arm64: dts: amlogic: g12: add crypto node
Date: Thu, 26 Nov 2026 20:32:40 +0100
Message-ID: <20261126193241.1471372-25-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113343_317086_4D6C111B 
X-CRM114-Status: UNSURE (   9.01  )
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
