Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83A4C54EB4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mib8YQCZBjHIWyfykTbU6JkgRDFtY8x63R+eQG/ud5k=; b=VSAPO8r54S4Glm
	UUA8BcnNOZw1yWo5pw31WwJVciwqY6DNsiewU4qtZIknBeOTuyZCactqzzrQfqz6JJQ4ksmSRsvk6
	uNn3AoDV+g8Uheb0uKjxwMj6qD0YDbdTA3+OQ7P3lsZBWmEZwDWqPAiMWXnZ7gTKO5sjiiaoU1Pv6
	G9dbi9lQQunfsf7cXcA9+Thu6y20DIWbD5++36fq0hYEsMwvyVTB1TYw4NgWxVoGnjDk+VxAwdQRh
	ObtS/Q724Bh5HeoMnqrUtBcyWQpkl6N2nQD47AdvkMwPkp+6dNs6K7uXCdzbwfal9J6uRX7kJ81gw
	78ziU7rA5FI3mjdZlbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyaj-0007vv-TP; Mon, 23 Jan 2023 15:18:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVk-0005Ms-FW
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 15:13:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id h12so7121287wrv.10
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=rI16xsFZkU0eDWMTKFE0Ksxp73pnRnnVBuMI8tFbs3EAC+MtLCqM+X8v/vyycGcC5O
         USAChlzuDrcJtFWE5zuLInbgnGCpGbxV8/dQRqPYk53NiBrGIVppJYgEQ2zfRv7+YKSa
         YgXA+r7Uufexm6x2hExkt/4SgVNyVq8GFmMZhbUftDEvVH7LmMktBcLLpFBqx5/chHt2
         TeE20n5vBOYzlQtPwurLAxPiVEG5XNohtEKAMDt/NqKy4AnRpg/zhqZY49jckFfZ1deg
         CtvZBVIzioBWs9VynvZ2UYazAhmLq1ctmNt+zbnVQ5BlNz377YWULvNPKig7igJrEKyo
         vs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=6mbr/hsrK0SN+TCdFXTyx9WbrRN3GroOP1KfXJcZisaDJJi5BG9tkZjhYkCYSOvJmF
         4hQoNe+oFuUxaMBtK+cryk4Crul5WxYJt1TyVtO3c4YDE0tAj7biBfry7J6xcPAvPsWQ
         ZccyBQz+ztLAQG7v8GJgNCk+5hdcGz6WzemjLBgq1BWY2sAXqY3x1LO+i4If/1sx76NG
         5F7jWX5eT4b61VDPDpNx7a6RjR6umqSiwwxX8tkMV/rcTsLnp+YLRPrsRPf/4QGro0TZ
         fpnKcsuO5IpiCrGpD3GkZgqwlk06zmk/I/EsDq32Fkczu1SD+shMAWq4YTmpNfGZlZAD
         LPlw==
X-Gm-Message-State: AFqh2koTtItqBuX+KzkfXq7XkE+kUaHDpExgTRgMJwGnATMCoPipjO6P
	IRUavX4Pn8zjAn9c7kcSTx/rmA==
X-Google-Smtp-Source: AMrXdXt0/G7OJJgG09MWKAInBglkrtPYNcF28o6o5Fy6XNeVCLITjCuzgG4Lr6rNnIfwWhChDqTogg==
X-Received: by 2002:a05:6000:3c2:b0:2bd:d45c:3929 with SMTP id b2-20020a05600003c200b002bdd45c3929mr23730627wrg.54.1674486807943;
        Mon, 23 Jan 2023 07:13:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:27 -0800 (PST)
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
	- <devicetree@vger.kernel.org>,
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
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: drop rs485 properties
Date: Mon, 23 Jan 2023 16:12:57 +0100
Message-Id: <20230123151302.368277-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071328_599312_F882BF1A 
X-CRM114-Status: UNSURE (   8.34  )
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
