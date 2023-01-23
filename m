Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80230C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BG9Kl3D18g4eaI6k5W+wrS9oMIwsYa1OZbVyV/BnRro=; b=Soab1m+RNYtCi7
	++2F99BInsFQw1f5TxFS+qFwm08Y2C3sL5uHFT9kr/P66Cyo1yITWhcqfljDABU17OxmIw2k6lR/B
	84mAiJBzXp6h/QWhewE7GPqh8p40oerIhFrCkSqoVCqJdkDPE17aQxWiqI/Cbi6WAOsh7UqoE7l3S
	q3DsUIIQevxdLDI/LEfR6DxRXabcFQoKHM2PEtg5gU7AB4CjgMS1nhPT7bg5JRpaYI/EO3aWpCuN4
	gEgo/WT+eLUrOqKe3kQDcPuJrDfxLpX0lPd3ROZHsfIWh0/+7Ze6xbkFd3hJLzULnDAqh3k2YyoLa
	Tg21JGFRi9JJZx34Ejzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzaj-000Ve4-Qh; Mon, 23 Jan 2023 16:22:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzHS-000Oqv-Rp
	for linux-amlogic@bombadil.infradead.org; Mon, 23 Jan 2023 16:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=; b=la7zdeoOEirTN3JVOg2OX3wjI+
	V8daxDboi0xEwKy7Fl8d3SNfEhBJwI4c5Bp8pZ3K21wptk6Td4YLOUTYG588Z6E54qqM7nUkDG6Td
	/wkfXQkMkAOJpGpjUuwJ+lsrJOSh58xvzeNOV5ks9W5uZ8oAbcbvSFf58YILy2px28CI6vC15N04f
	abZxsTiOlE5cRIVyPbcC+LJuhCW6J+rTs7XNFIyZrabbxBlKaiR8e6L72eZRrISc9IoxCYQRjArOt
	cBaMyvkcfpK8B0IwoMd0UPVHnO4ulMOS5/zbtq7MxSPUoJk6DqjrNcB9MQrrHLimAgfeW5906ecmv
	Ul7bmAjw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyV8-001ZDK-1f
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jan 2023 15:13:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r9so11123067wrw.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=;
        b=YNHH8XRTX/01S31iQXYst52wcTTzbNbPtyQX8SbuGG5qAnPY1IAqJCxowByc5NAiIj
         EVn8g39hWWoxqwFSvp+seTBUawYQXnNdYFG80ce8+U59d80Q9psruK3xc4Ch80Q9YQ2K
         7nLXo8JaD+hoq87mrhJnw9b9r2JkD5hpoExRj3QchU725f9quBfOmlP3QFCp1yrmlIh+
         yN0fT+2BIch3oSwCfldxTIrUFhydcgT/dWrzIQtWy5fZU5RDfkbqSugyevH04iBrUfo4
         KkH+FZ5UVdtouXOh29sg6LYwdfy4Y6E8tyFQT+bxnvnvq0tiMvWZprOXXi1+E/vda0cB
         kxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=;
        b=u4aYcIsWBLwbwawAhbXM0W745hTBHcXVfWAbZ8z26eRlvm+cLS1rVDXCTnZ2ZnOtZ3
         VmDKsZJAoOPXzp3vEP6+n2J1kAXue609B0K0t8pUSk8AbXzL9OQVwEnJQk+qTg48jLaS
         TU/znTqahfIoxxztJi25oUVDc/7cVORw9rxvYd69qFblMpiKs+cGGK63mY7r+wEgKGAX
         DJGdgIhAM9wflbKM46LhnM2XGQvYz9wo6krQBiYA32xCNxdF3ffsEs5y//fUyXIKBueC
         f5l0CvnSD8knrTQvEW2YyaYIT0Mx6CeQCCP9kGsdVm/ZRxm7Ey3rS9um/snsfIKwzjQO
         pdOA==
X-Gm-Message-State: AFqh2koX4g2XI+DAc5HVFgCEiGiy/YSNQTx2G70EwDsQib6zm8s9x2O0
	6TlhbwQPUx63+762of33ekLdGLw672K8S4Dk
X-Google-Smtp-Source: AMrXdXsQsitf8BzeJXaPtKrY+OeCwfG0Ax0tXdx3cyfdOVAR+FOLMjW3bN2wF/BNgF4woch/VT2ctg==
X-Received: by 2002:adf:ce90:0:b0:2bb:edc7:504 with SMTP id r16-20020adfce90000000b002bbedc70504mr23324176wrn.26.1674486798260;
        Mon, 23 Jan 2023 07:13:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:17 -0800 (PST)
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
Subject: [PATCH 04/13] dt-bindings: serial: correct ref to serial.yaml
Date: Mon, 23 Jan 2023 16:12:53 +0100
Message-Id: <20230123151302.368277-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151251_245968_1CE91751 
X-CRM114-Status: GOOD (  11.10  )
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

The serial bindings should reference the local (in kernel) serial.yaml,
not the /schemas/serial.yaml.  The latter comes from dtschema package
and is a small subset of serial bindings.

Usage of the local serial.yaml allows typical properties and children:

  xilinx/avnet-ultra96-rev1.dtb: serial@ff000000: Unevaluated properties are not allowed ('bluetooth' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml         | 2 +-
 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 876b8cf1cafb..0c118d5336cc 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
index 2f4390e8d4e8..6f65e9a81c29 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
@@ -63,7 +63,7 @@ required:
   - xlnx,use-parity
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
   - if:
       properties:
         xlnx,use-parity:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
