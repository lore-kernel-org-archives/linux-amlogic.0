Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CAAC30658
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5U/+Bi5nCyRxhToM7tBgb43LmUaHTki9dLoi2Uigxo=; b=px5L/c+jM2R5VS
	xEdtcSbK5ZsaCjyTSSLo7kg9buSNZQ1e+0ZuStxizAUfeuHtBNTXZiqeE3xU9UImMo9LmW6O2ZB8L
	wIWtpxSIgiBuJEwxFO32GWDZX++6sjwUMc6CfvN/vdhZLSZ0gNrL9KE/qZg52bo1r1/sRwRPLQOyl
	CAFbhfqsaX5bSglcuyZoT8uWcNE/zvG2J02Prk5ffk2SS28hX/NRKZgPkQnt8bhzoOWOwlJ87m0EN
	pLp+8fKZ/3JV46Jk6V8bI2YFHxZoKR/sDrLMIi5vwMv+IgivpMDXJg01mRG87/BZJ6975Tqybwi1L
	h9SzfM2P1hZm66WCQiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7VF-00000003FkW-2LJV;
	Tue, 25 Jun 2024 14:50:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7VC-00000003FiN-3DxK
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 14:50:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a72517e6225so325385666b.0
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327033; x=1719931833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8FO99+jOTZQ4oml/X5Fq9PsFL65v7oiJC3yeWK0G1A=;
        b=A1h1Gugy5dIMhQ3JGIyZym0B/11okWY/aWOXXkooOW1t9oB8nyxtN4DdLRh+TK+21u
         JIS9xzLQ4G4y0d9EYtT7UPNLrxJOEIdv3hPxCCa0AILYgsH6kQKwUktQu17XiK5KHNsP
         voXHz2AxNSXspAcq7wnOvGothjqeGzhJEcj2wSwFQ7vl6fiP3pqrgJbTfzC/GJBT4KCo
         p8bTIUNGTDBGstNpKq2Hsj6saVvFC32orb2iNKh5hwmvkIHwNYqN7AlGsfQBV0EsQlKA
         1XkdrV3Qds6Xv8Tb8gfyO5WvTxm+fdVa1XpcjQYnoSgU46vDu/LXpxm5JEwK2TXIGZIJ
         CqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327033; x=1719931833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8FO99+jOTZQ4oml/X5Fq9PsFL65v7oiJC3yeWK0G1A=;
        b=Qbb6+yUHdqvAm6kd/bc6A1gVMmmey8ebVCX6plPmStMBxlE36ulz8DbOOvVwjsXufG
         b053BBshWNEg7RzT9owIyEenxYgmxbK2ZCmgNREks0SellivlAt9AZih37c2hiyzOgcB
         q17g4Xm9kpxymQD2cBOYQqjvJUmazttofNFpdcC2Ve4rtARsXSymBaz8fbOf47FoCxR9
         bSXbnaIOBLr3lNlwpSp/Fh2IM78x6duFFfakD/k5xX4aSh/SkSmoIlERCzkpYLB+wC57
         dxrwzN60IoUthAaphdgQgxplEQFVF4NgDfkCYCPebsCUj9A6RTVw1iri/eLWfBwlmtRW
         KJHw==
X-Forwarded-Encrypted: i=1; AJvYcCX9VKz44GdDr5qwm32HslQ+ME926kv4GKNLjYhJcYufI9Sn1VdhIud27ChAXMJnjmRZ4GhVr7kSEoGQPiRpXQlv/jshC/kd+qVV2LrPPJ5DDIw=
X-Gm-Message-State: AOJu0YxUYwlV00Ze5CeiMH7hp3IoVAdlJZ/mDYfhM9JlDyeFZVIVtYHt
	KjjMyLmpI0BqurvySU1Sc5grkQie4tb/B40Rr2URHzE0krJ5Q+zaJ/XPKMR3ArY=
X-Google-Smtp-Source: AGHT+IHxhm8K+90t51Ou7UOGxTWXFK96sTe4GE9XHvjFI8vmoRSsxXRqZgmnKIRXFcaKJp4IiVaRvA==
X-Received: by 2002:a17:907:a681:b0:a72:80b8:ba64 with SMTP id a640c23a62f3a-a7280b8bdf7mr21897566b.25.1719327033159;
        Tue, 25 Jun 2024 07:50:33 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a724162f037sm355945066b.194.2024.06.25.07.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:50:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: meson-dw-hdmi: add missing power-domain
Date: Tue, 25 Jun 2024 16:50:14 +0200
Message-ID: <20240625145017.1003346-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075034_836741_CF16E228 
X-CRM114-Status: GOOD (  10.26  )
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

All Amlogic instances of the Synopsys HDMI controller need a power domain
enabled. This is currently missing because the Amlogic HDMI driver directly
pokes the power domain controller registers, which it should not do.

Instead The HDMI controller should use the power controller.
Fix the bindings accordingly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index 0c85894648d8..84d68b8cfccc 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -71,6 +71,10 @@ properties:
       - const: iahb
       - const: venci
 
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
   resets:
     minItems: 3
 
@@ -129,6 +133,7 @@ examples:
         reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
         clocks = <&clk_isfr>, <&clk_iahb>, <&clk_venci>;
         clock-names = "isfr", "iahb", "venci";
+        power-domains = <&pd_vpu>;
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
