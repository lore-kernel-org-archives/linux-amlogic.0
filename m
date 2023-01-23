Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF72C54E94
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cEJ8IvIiEbnyy5P7LzerWlDfkO3xhp86SC34Gn4SQ+U=; b=bvS0J8YBKkVxex
	VOkQKEjyeX3n0eTLt5uyiwu1k9idfTpsDN5mXmdEdDK4SrJBAFyJ8N91dUW3Tc7UCKZ6ItD/jQ4qI
	lbBSdAQcHfOClSJCrgopdZFgSIOkI+g+XNzzsZZI7VRcFp7ylr0PyPEdptFE5lUo7vK8jURfTozan
	U7DrSbb+yaowXkm9Osyn5/P/AyGe9Pi8++McbC/7i2z0EuqhYge3Mt2d0eANs4D3POwpQb62Ve0mo
	bsrXUEq9+kGFGEH7WXBTPu/a8p03DsdDJjnrBX2FSu6oQvkczqxcTtrpLBB8FKRayZydRHoSkyBdT
	HSO50lOOvrMXbK6JXUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyXJ-0006G2-DE; Mon, 23 Jan 2023 15:15:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVW-0005Mr-PO
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 15:13:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id z5so11121562wrt.6
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mD2MSQcoc4dUqM5mN85kRutri7MSD6je9fF7r46KJ3A=;
        b=MDCHyD/DppgASNZrrhUSjfzEdGsHr7Kz8YcSnZeXCFkB2Q3m1NYn5ir3s9xFQEM9Ih
         r/EgvHAHTRyx2Rl0HeA47sdHCFwKKJ87D5ItzP+ACb/UmbEl/jwc32KLiWF2WLI7G81M
         FLPkwyO9hvXc+75utLndnMV9UMJyce8pEiTCyVRWdFMjXdU6DipO1NsVKGqw3QSQdhmV
         kQd4yhhe9ZzIvLKfstipN8BrQpxvN8R6lagBzjQRLzSsVCJfT5Hsccw2V7xNzoo93W2J
         bMYcazl+nSP3Onh/+otLqvybwdhDXxbhwDvNQXBL7F9C7AtvDj4p8HBqtKHh9msqOs+o
         9DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD2MSQcoc4dUqM5mN85kRutri7MSD6je9fF7r46KJ3A=;
        b=svNgQWOdEJVxBr+5HOUfpEU4oGlulLC0uY8zi4ZwT8A9rfzrhTjssQXuZ+aLX5N4Ag
         bd0fpFSmBYGQs1W6gRvhZzr97ygI1j3zOTHFvQzb2t8IcTkY1lsr2rAGascDOLDZdcwn
         cYyzSJyCYp0KK3nE4U+ad9caPrinQMLi4bVGZVU5kvJ59RvgOQR5z10g0zlaH2kb0keM
         j70+JNDQkxs0xXh2hBLaPrHqZ15z5NI1ES39i2xpqOv06rz96E1t6J1+SIz24EfhRl4F
         XGmFVk7pc1VBcFNGFRfESZvOh0Nx1LaE5JN1XpE3bIhG0b1Q17IDeWgOipPWWOe3hE5u
         3ozg==
X-Gm-Message-State: AFqh2kqJg4p622oR8LVsROW4OEukc4256odIvmobYCbpvTT/dOIc+cj9
	i7DOZvxul0Q2EjFwmj8MPqmxKgQXg+Em4DWc
X-Google-Smtp-Source: AMrXdXudvFeY1MQe2u9dKeFf/Pkg70gCT8e98Ho6iYUtc8YoXVClgM8ziC4ZNwtjUY2hEr18RBBmpw==
X-Received: by 2002:a5d:4644:0:b0:2be:5cf8:2a83 with SMTP id j4-20020a5d4644000000b002be5cf82a83mr9678706wrs.37.1674486790953;
        Mon, 23 Jan 2023 07:13:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:10 -0800 (PST)
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
Subject: [PATCH 01/13] dt-bindings: serial: amlogic,meson-uart: allow other serial properties
Date: Mon, 23 Jan 2023 16:12:50 +0100
Message-Id: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071314_952187_C8529EB0 
X-CRM114-Status: GOOD (  10.81  )
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

Reference common serial properties bindings to allow typical serial
properties:

  meson-axg-jethome-jethub-j100.dtb: serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 7822705ad16c..7abf113c966c 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -19,6 +19,9 @@ description: |
   is active since power-on and does not need any clock gating and is usable
   as very early serial console.
 
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -69,7 +72,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
