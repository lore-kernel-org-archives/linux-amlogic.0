Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8FEC25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAK1rk1E3/ukEoGyChPSz0XDuXwSlQtCuBoOkUzx1JI=; b=2+QenTEGwwMKK3
	2RmxKdVTjv5hqjBhaM5LiRR9Cxm35jdCOqoVtn5LPq4rtfLxy4/5kklRvY/Pgdg6/ddcONspVW3z9
	+lYi073HlVldPUDhBWKwpxVR1JQEVvhzr6mq74mK6RMpZY1S+a0BdwIKJ233rhSP0aTec27G2zt67
	DefquFM2Iln0BvDnJNiAoKwQIms3REZknhMFSFAhHalY/0Fby0Fnuc/kJ4MyLvPDM55HjVWSodrH+
	Go4JbRwzmKzFqrzX6/hwFzrV8HrXOekVZ5ddWBBC5IW2q4S8wtUnAajeyP3yVUnvcAdcZLw3DzCQu
	YqsXzQ6UzDY3VDMS20sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFPi-002q9K-Bo; Tue, 24 Jan 2023 09:16:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFPZ-002q5F-M8
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:16:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id q8so10883138wmo.5
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxnGtIs+CoSyW5044hODkJ4+MUCbjhxjSL5Kp9ZnQxs=;
        b=YnllctxnH3lzgD+EkXJ5CBe2SM5+FtZnnqa8+mqthMSc3elP9JPGPtvV/flyiga+PS
         b1pRCxEhdDtKFeFVfI/LZkbUBcw0YboNJpAs/8/+8o1wdFB24iCTnrx6UNegp0WP4qMg
         QQMKC8yO+nslnWeq+qYPQ14csU2OLowneTeO0KSofM0UZc/h3IlunhdF7iul/AJ38HV+
         u1ymLwMmzKbmsahGx6cdNLzBM6OxVPGx3f1pgenpiZQHX8/Z81RdYPtImrfshukt6BGD
         xLgMMKXK2WuzeAAW/EjGokg7YujOukYKFUh0sZMIOxwilq0pufNSBEA5I4dzyUxXBkY5
         R6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxnGtIs+CoSyW5044hODkJ4+MUCbjhxjSL5Kp9ZnQxs=;
        b=JjOqkpoNIEubTCBzCPQUMqTbtArG6Qc8y2IBgWqFlpR2yiJzwP5Exripm8atQXwptY
         N14waPZhu2XTZ+W7HiQUFnpl4IvgtkjYs8VRYOaXseGgUYzPru/aWUrLgC2AahQKJtJy
         VfQijlglepViiBx5QxClTN2Ur8T8KHJLiYyh5VaLCDaSIcg2maFJXMU22osBsrNdRYii
         YHPwr2sFAAJWjKrCDKaaWnv1Ftqk6QoedVwEo8qIQP+ZGNff9AsYC3Ou/bpvak5M2Pgs
         1R3aWlZJQ6hHi3X/XEb0g55dvzSRwsI7OdvSqauSfRwWy6GYapG4g90nv1FN2Cw8vYTZ
         yboA==
X-Gm-Message-State: AFqh2kp6nMiIgmSjvegXoIyPFYy6xlRjHMmL6PI2pvONZNRPC4k89Ip4
	MQDo7QpUZh2XxT4R346rnNAf4w==
X-Google-Smtp-Source: AMrXdXsuRP+oeoKqVLFWERXFxb8dM8qDl5/yxaY3j45oPHvjVh/Q6SrnrjtQEH+hcMQmOmf+j9YRWw==
X-Received: by 2002:a05:600c:434b:b0:3d9:cc40:a8dc with SMTP id r11-20020a05600c434b00b003d9cc40a8dcmr25619205wme.27.1674551773221;
        Tue, 24 Jan 2023 01:16:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003c71358a42dsm17882131wms.18.2023.01.24.01.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:16:12 -0800 (PST)
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
Subject: [PATCH v2 01/12] dt-bindings: serial: amlogic,meson-uart: allow other serial properties
Date: Tue, 24 Jan 2023 10:15:51 +0100
Message-Id: <20230124091602.44027-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011613_756009_078EB5F4 
X-CRM114-Status: GOOD (  11.60  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

---

Changes since v1:
1. Add tag
2. Use local path (not absolute to /schemas/serial/serial.yaml)
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 7822705ad16c..44cb3cf22bfb 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -19,6 +19,9 @@ description: |
   is active since power-on and does not need any clock gating and is usable
   as very early serial console.
 
+allOf:
+  - $ref: serial.yaml#
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
