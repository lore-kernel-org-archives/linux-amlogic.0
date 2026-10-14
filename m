Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02F9CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5SKK7w+JO9Xifswk9AenrxpmDbYI1KnElI2KasVR2k=; b=1TMe53chqNoXS6
	pZT7N0A6poVhDtmZZNRznWWdWHIm78VOdYuOadMwx7pAP0M9+7mT8ZhlF+mnsEhraHfTjLtPRz6KS
	IoKlSHPLezW8kD8wg8wNRPJrVXotxH9YMaMZ0THr/GGacFnkfsr0WngdXUoZKehyycDxVmIG3Lry9
	ASFXQHKs8rIuwYIUa3xOdc1XIJ7ZsYJW5RXXKA+Y/I19QY1O2ZfONhdhYvbn7gKMQhisO1KeYP0ru
	Mljz0z8ULcgy+KTm4tJ5DodlxjGlBczC5o7zaxZr+HmIporaJJcde10Vd2r1BlfMNs7+Nnh0oqrac
	6iHVfkdpvZ2BmC6Toy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuFN-0000000EsEK-1kPu;
	Wed, 14 Oct 2026 08:22:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuFL-0000000EsCE-2CPp
	for linux-amlogic@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=; b=JfR8A27YnbnXiZ4/I8bgry4ku1
	/duKL+WcbI3qAyFfpXiTKEX97lXZXa1wo3y7th3fwZUPMp3YJkPPT1eub9uVG01jx3mMk0RRilzbH
	fz+Wcf1NPwG8FyVYsh9XWRTvN3QcaInKXksT/ODeDkupPaZ+EoyKr7zRwpyq1TzcohuGbOvJhPPKW
	2DzEUsNNTX/A4I/AFDHPD+uG6rHBaiR7l31EOtb8GYmHrOvPVPUXOjMXBaW8sE/SO0AHwCRvamMeR
	f41uGt/gOJIlClS4vpuuoYOUR8WH8l6VrgaO0TAHj07gCCm2Tz9iElCqAW0KULlrmjNRvnpGr7rwR
	Zvr2v43g==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuF5-0000000GUkI-1oTB
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 08:21:58 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so2282176a12.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966101; x=1792570901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=;
        b=WN+r1Tubsl82RFvCuqJ5GT+oPpq8kAAM7Fin4TIkwHDGeYol/TKE6kTBP/AVMxWBJG
         QwAZan38rim9Eef968xqCZufdh4G3ErYh9x2fnascMzhjeg4IMQUGJF+ebo7Uew9mxeO
         EeSXLOTCVXUXws9F9BOCakJMsv1W1KfQ8D0fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966101; x=1792570901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=;
        b=rJjRUuWBWF3kjro95ANxW7cLhi+2aPbQNIeTE6voA5zC9CvyTc/V1wCrQtzMl13dLZ
         wObsJltvL9X7nqhD4zQfECJ7oXn8NqqfK44vPixfKpw58TC7+ysIZQFgBa4xmuhmD2De
         RkWRwbt/Br0HG5TnGge7e+XEVbOeE3+JNz49CyIPRWVvqjybYjY5FxS6woRX4qgqTT4x
         Dk7BLEvMwfoUjVGPg0mTv5CRlDHefsJGk4Dq/mhDwZ/tP7X2e3vXS9rVhfzJW+fepAyo
         lLsASFqiHeX7t5CaxFwklBbuKnBgIMTyu30Uru9J1UR8sgkf4EQkBabEcFeAHMoKpE00
         jMCA==
X-Forwarded-Encrypted: i=1; AKwUvBxMI7TXi/mfIh+n3oJvISQTM3njp17eTYE9wWZENrfJ7YRmRhPIVFmDWz4jTEOu31/j6zpm83ycmEyODm+R@lists.infradead.org
X-Gm-Message-State: AFq9FYIfa/ht7ZqFgyZW8A1IQGIiLMlIrtAG4htejWje0L68LtHHY+PM
	PoFbQ+bL1cSt1Ep3tCWfg/gu5KGcXXsNTVQSF8iFo4MHFzKVaHOre0hnKosAHcncqA==
X-Gm-Gg: AYBFou0rcxdj7bYrbmSr1s44qXnj81MTPqFts65KBJJHlwPsxjCOtzbBgojrlD6gysy
	Cex7Sq7nmvfZwWP4sNrT+WvnTg93OFP28f91fFq7jPYF2Z+DAgmXWCnjrnEOzDxW7keAm0dAmqp
	faGrg5wzqXkWlSTPbLlE7xnnSubiQ/J0MwPHS1SxDTP0G8ukdjWhkSTaeafVr+9u6zq/OeK3xqa
	qDZYYQLvlv4uD+hLhmAE229g+dCmG1BdhE88N1TKhFfnHwhuqdfurwisERrbtxoH4nBRiYZvAkX
	2gXBdZW4BH+rlLUzxXyPneGRaHU0YkjWTlOz9rHpUgfgskQMuxQh0z1kt8RvvGrwCwphvK9dntX
	a4Vy2cwX6qsHsr3rlezL0iAQy9/YnMD4+UhaWHBLzZOyf/7t3Bc0sXxNtXSryNBpRATgjPlSJtO
	2yyHUEUngD0Js3KG1CR6BcVSQlzGD1hyThHo3ydboxnoKy6ekNqYtRWciafaGqX5k9NdICIb3gY
	KV4almbYYJZasmJt1RTHRYkr2oN7tJVlAs9HXJ3Odrx6PV0VJr0n+vQZw==
X-Received: by 2002:a17:90b:1a82:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3ab3ab209f3mr7706681a91.25.1791966100501;
        Wed, 14 Oct 2026 01:21:40 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
Date: Wed, 14 Oct 2026 16:20:36 +0800
Message-ID: <20261014082037.1774672-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261014082037.1774672-1-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_092154_269549_BB3E5222 
X-CRM114-Status: GOOD (  15.68  )
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

The DWC3 controller can operate in host mode. It does so with a XHCI
compliant host controller. The XHCI has two downstream ports, one for
HS and one for SS. USB downstream ports start from 1, not 0.

Reconcile the downstream port numbering with the common USB host
binding, renumbering the downstream port numbers from 0 and 1 to
1 and 2.

This is non-backwards compatible, however it won't break current
major implementations:

- dwc3 "gadget mode" in Linux kernel only requires a connection to be
  present; it doesn't matter which port it is
  - dwc3 "host mode" OF graph connections aren't supported yet [1]
- FreeBSD doesn't use the OF graph for anything
- U-boot doesn't use the OF graph for USB
- OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
  the OF graph for USB
- coreboot doesn't use the OF graph for anything
- Zephyr doesn't support dwc3
- TF-A doesn't use the OF graph for anything
- EDK2 doesn't support dwc3 and doesn't support OF graph
- OP-TEE doesn't support dwc3 and doesn't support OF graph

[1] WIP to tie OF graph port node to USB port device

Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
It is unclear to me whether the HS/SS numbering is fixed for all dwc3
variants. I checked Allwinner H616 and Rockchip RK3588 and they both
have HS as port 1 and SS as port 2.

This also doesn't cover a potential "multi-port" DWC3 implementation,
which Qualcomm seems to have.
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..4b6304bd2ec1 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -410,11 +410,11 @@ properties:
       property is used.
 
     properties:
-      port@0:
+      port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: High Speed (HS) data bus.
 
-      port@1:
+      port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
 
-- 
2.56.0.212.g129ede20d9-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
