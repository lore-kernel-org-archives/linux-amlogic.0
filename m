Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA17C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJS9x09/3exmX7G1RY2mMDcxGvC+7/424XZ3GlNSA3A=; b=NQ4h7wWZ2fPMBU
	IJam73q5mcfZcw70O+ug6u2CEosU8SPqJ084qLmBSTEdwTy1hEIBI8jaT6w5sEdg/brQ49PGDYbf+
	ujSzX/UdqMZoZV/qnSL0BD2kwsg6dHdKEwE6lbmfehGi9fR7ZntWYnm+TEMF8rQreB/F7s315xzfR
	w7JHEZPlf9ipYvHVU52hc/++XHkMXov3P6NkgjQISAXj0QE52Z76iTNDhIUwpF2gZxc8hDYZnpmPQ
	nPah95nFAcrjeZBVAAWWYMnvyd+IWbbp9Ng0pZrq37HsPFGNBrLEBHICqAryjOcuI4ndJJSKSTeSx
	BT4T/WudE7XzveI17dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9S-001Dz0-Dc; Mon, 28 Nov 2022 11:18:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc99-001Dqk-Ma; Mon, 28 Nov 2022 11:18:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id w15so3023022wrl.9;
        Mon, 28 Nov 2022 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=QXR5F2bJ8Eij2/5WO+e0aTm0WPGRA2YwX4pj8OMlGSj1xkxltGn2jsplziGfPxjogU
         D3cACs1p3GlJvns3uMBvZVN5x+JhUhd4b7pEFWzUlivL9Q6qvt4+G212dn0Bne2zrLiB
         awdE2i32jCmPKobSrFTtq0qtiRCIbS6gTPD9P1M5+9pWnkB94LFfUdKlZ+chMfebUFZ2
         /gMQR5p2VYliZEAGt69NxjN3MbwUMmprVRwiVXPXQrP1b6ds01DOCt5p/dGWw9rgJV20
         O/gdns2/4UjKlmGyj+K6uIt/szHAlmFfZtvjfAq/oqWEqJJ8vQYzJLrQYifb69jIUkRu
         HhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=5I1AQoZqDavPzTgOaHYslPzPiBH3dSo3CPprUoshtgEL4dlqzvk8zv4NcpMB1D8Pnb
         2g1aHtc8EC4qoJmuriK0hon4mXTrQgn6goFEJkc2LjJoWWCp0MWQSLDuXKVIe2RD0Yej
         b6sQ7jcoegLAeSbf4CMzB4eI2g1GE3g99m1TzbfYNfyg1bvlmHG5LeQY2k3NthJMIYNv
         x/eqJ/jnnN9/3P4HdEiW3Fxwc/mUenZLRSovsnQI6s+j5ZJO4ZAM8MaBoPI4NvrBYKis
         SsnCn0MoCK76U0KIqJr9paKUa0Nyki9lAMMOImDMG02Xwl1INnPrTsZJO//Hh3iikBnc
         xuEg==
X-Gm-Message-State: ANoB5pknyoviPcC6v6xLG43iqdIJsgbjXwTUAaJOnsQtdp3vKTDcjOC+
	3XV7YCNd+QACymevQ7cX5HQ=
X-Google-Smtp-Source: AA0mqf4DvNm+mFTnoF3Ww3qLbB0khH/Om/MssTeWDr1wrlRac9GiI4sPTsNPfa9NwQFIzeBjPpF4zQ==
X-Received: by 2002:a05:6000:1a41:b0:236:f365:b778 with SMTP id t1-20020a0560001a4100b00236f365b778mr31551672wry.515.1669634277506;
        Mon, 28 Nov 2022 03:17:57 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 03:17:57 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] dt-bindings: reset: meson-g12a: Add missing NNA reset
Date: Mon, 28 Nov 2022 12:17:34 +0100
Message-Id: <20221128111740.39003-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_031759_751311_21B3949D 
X-CRM114-Status: GOOD (  10.20  )
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

Doesn't appear in the TRM I have, but it is used by the downstream
galcore driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
index 6d487c5eba2c..45f6b8a951d0 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -69,7 +69,9 @@
 #define RESET_PARSER_FETCH		72
 #define RESET_CTL			73
 #define RESET_PARSER_TOP		74
-/*					75-77	*/
+/*					75	*/
+#define RESET_NNA			76
+/*					77	*/
 #define RESET_DVALIN			78
 #define RESET_HDMITX			79
 /*					80-95	*/
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
