Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF61C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mib8YQCZBjHIWyfykTbU6JkgRDFtY8x63R+eQG/ud5k=; b=FBHvMC4Q56GM8d
	16ztB05+KV4WC4go8rTdRA7tRPgOtUwgOdKe6wWklyiUsX3p83f3JA9GfvLmERLdh92ROz72cGvuM
	jQu6KY7PcxFcgaGLcrxniUrsk61q4Mhrom5PzjSkdqr5Dm9MMLZtvI6zlajXKoVhu6qBMPV5wgrHM
	x4p7DDbTZ/yVs95u+YFlTFMU2F/vWp4Tb85QbSXsPIRI24LXJ2nVEk+AvYYESlZMElDaJ5MKkHupq
	5xL1SmjXZlky1wd6H2nndsVk18ys1wG+60PpVE76zjC0v+YhH1EDXmUvYe4ZLjN7N61L7Z0LSrHB9
	uPkv1soCEPcHv1yc7AdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFVj-002sfS-OR; Tue, 24 Jan 2023 09:22:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTD-002rPV-Oq
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:20:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id g10so10916307wmo.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=QIK45URkusdjjJyIz28i81nYHz/bPWip0DX2PvrCQnN65/DuO7w68GyeUkuXNIKNsi
         xs/1Vj/8ytAp3/zQx6EAL9f9lMjpqjQMr2D6A57bkBfcQuqWvaPZ1xR2yt43BYBpaGMx
         VgESHMdfMFchyGnRbxszQ3RlARP5wVOjSJz7IFde+G+7FvaAGhJHz0TNkWNAfkbwMwa6
         JM6RrxW67FgZHlwp9ePpPQLJdxKKyy+zfijtg8Hx+v8EogkhvtE5DPWZ46MJhlpsHUal
         KLUOITI571JUoZ4F5YpYZN2pGyrntmAj6GwTh/SKIi0DAZdNfbnxcpZ1dB7MbB2hT2hx
         vA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=7azs8kX1NGJfiUUEx2L6kHL2+wrFNKcjHfIRvMp+MLtFNBbAh84YjIOgV3rs4btIZP
         D2aUGZf/tMWXQC8KVTXuzrQMEJZKZNguhrKOZ5kDOuEw3Djg8T9LZmmRHgCOvSWvXWOx
         ZA8lWP7DCECEFUOA6koZb76W5KpvtRm1Ig/S1zSTAX5CxLRY6uThihsnzvzSuEHXqDVt
         YW309f7j6BLOB+kvGtxvllsqly0aHEJF7D59mqFTt+1vNqp5pOcgnMmZfzV4Gy3s4LTd
         27ja9vVm5NPV2cX+Vcl+AjNk2MwpXdoiJrzmPNxIffV8RsozFsPz0Y/vXvmhQHJinYCx
         xBLQ==
X-Gm-Message-State: AFqh2krCsRQNNqQ8T6pJxWHcEBjxMDXcO50SytLWZ0jDD3+b/+vnTao1
	OZ9QnPE1kCVtuRSbqKtmk0/6ow==
X-Google-Smtp-Source: AMrXdXs8JG3T2Xep07y1ru/0yEt0ZLj+5ZJcdU+kq6WsnkoPtozPtAB9ElLE+hLK/vU0BiZFCOSAQA==
X-Received: by 2002:a7b:ca52:0:b0:3da:f4f5:ad0f with SMTP id m18-20020a7bca52000000b003daf4f5ad0fmr27205002wml.10.1674551998415;
        Tue, 24 Jan 2023 01:19:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/12] dt-bindings: serial: fsl-lpuart: drop rs485 properties
Date: Tue, 24 Jan 2023 10:19:12 +0100
Message-Id: <20230124091916.45054-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011959_855242_2F6E4C67 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 74f75f669e77..b1e81a6451a6 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -64,9 +64,6 @@ properties:
       - const: rx
       - const: tx
 
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-
 required:
   - compatible
   - reg
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
