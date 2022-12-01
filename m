Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B7C43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJS9x09/3exmX7G1RY2mMDcxGvC+7/424XZ3GlNSA3A=; b=XBXVlgaEhldBat
	gJ3Q61Ve/YPhOy8h/04ULePA04YcGhU6Ryl+XG5MZLEa04MmeWv1959OOeaPoRXKZTzW2c0jkXfbW
	uBizsRjkYztaLP3vw2WfykXQtk/aqdir+1+n/EfTEtKoAKn7ec3ZygfXjkNRS5chRC5IgrRIwIVZO
	LU4R36IZ3+DrPTSDvCvFhDOH8Hy/fB0ZeaT2E1mazoPVQdVQhP2ALjCKEQ+Mh9F2yxBmlJ/tzdoFA
	SnOXAcX789RNJcmFzAwJ3v3SXPwV2Ajzt0bHpc/uFe3j6hL4p+LEQZx6ObogZ1siFCWfapTlgMcBM
	g6s2Vpu+YfqeyKeb3SlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gqb-006iza-KQ; Thu, 01 Dec 2022 10:31:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gqG-006ipP-Qi; Thu, 01 Dec 2022 10:30:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z20so1696228edc.13;
        Thu, 01 Dec 2022 02:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=KutmegGQGsv/gMkBbZbzfuVkNuLXhW/EgSYR1qqKN9AXRPCSlAR3JGKhkXpH0fQRpE
         e9AHn4lBp0xWg1i7Slzlzv2gw2KbjpIs9pyviE6SP+4T/wB/OoNDNvqs6fNJEYbg/7pz
         OtOmNTaBBz296GbI6aDaugchKRe5uJv3xPUCx7AlqpKAvy8LcAtmRODec+n8MxIDW3eY
         gvroupxW+sCVmW3fCPBn82s+8oXxB+k+x256wlM2QQ4+ktuGLj6HsYlOqCtuqfbDU2zn
         vnNL/OEUZ3EVcWFhFEV++ATUuZGV/KhgQNGsGeW9Ub3qz6sXwnBiwvi37M85LJAp3s+I
         FnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=TgcrQXXsZyUDjRVKRWVa0HSmZb1ROF77/J1Tus2dbdevaD3JdIvUXCrvFqjN6ojBIa
         6J4xiRewkOd6MWMoxyoYXTXNhZdFfqv5IeC/Q+kjR1/uaLjw8sSFCQw2cK0W2DDSmlEI
         pkoGTnddDkwjBm+hx+N8Y0gXrMU/9bVXrRR1RYVNJiIOpLfo46dGkdg7HaDn5NfK62Qb
         oAt0Ql7T6JqittgVbGXpPe/HO9Mv8PKMGi9IOoT3x22R+1jkxbyzBqzgOm6xxqzbzr1W
         hDaZ+ixOl2f6DyotajcflnCory6+TArjD6lDR92oYvnJOnfIybl2LRYin1hoNjpcE3Qe
         pKpw==
X-Gm-Message-State: ANoB5pkLUErwWPSWBuEVKAgTANl6YenARp4ZcLxRQGmjSQUJtUdf0Ojy
	9+xHSqeOZNhbi0EKKDOQTeU=
X-Google-Smtp-Source: AA0mqf5LqY3BpiA6Y64UXPqHHdECs7MICeKvHQSVrk/7RvPTjow4ThtGOhZPqltPT6o0TlHo4K2LMQ==
X-Received: by 2002:a05:6402:3886:b0:463:ab08:2bc6 with SMTP id fd6-20020a056402388600b00463ab082bc6mr42080057edb.143.1669890654995;
        Thu, 01 Dec 2022 02:30:54 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 02:30:54 -0800 (PST)
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
Subject: [PATCH v5 1/7] dt-bindings: reset: meson-g12a: Add missing NNA reset
Date: Thu,  1 Dec 2022 11:30:17 +0100
Message-Id: <20221201103026.53234-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_023056_886683_A5335C11 
X-CRM114-Status: UNSURE (   9.87  )
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
