Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104D4EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+63tsjioUN6R1u8ZgnPOjkn+vIhTk+eDRgxF6Nb8nY=; b=1QDIOlFwf9hLBL
	fAHrUJCwEad4IrG18HrT4vw5mFJgolJfJcKL6BGh+IQ4z+QI11gMer83mKD4LfXNwNRt9QVFvgG6i
	APNQwdvxhSYupYZKHsaOhzV0QRWI86EmR5aryypYhdAAnKQnMnUC41fR2L+EhvAD+Tc98NIAHRq11
	iEdUkdpXjlQoLm8V775LCRhViJPYaojm1CANfDZBErkfesLAPn2qC0fIv93pAcmxrueZKEQaJKXiU
	N3C7Tb0IT5o7pCLiigVFSlHSKWYVwMmrTHDH/vjYcXUGQb5DmYyvxog48bR7y6rbYatU6sMdmykJX
	KXTYcFwFEfA0LJ1QOPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgi2-003yHN-1c;
	Fri, 07 Jul 2023 08:20:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHghy-003yD2-1Y
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 08:20:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso16922265e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688718050; x=1691310050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Z0h6vYSqXNeuBCoLrE61zLNx+lI9H9j/VUTdBVk10g=;
        b=r2Br/oqnScc9+dg3I8eO/6XZZ5PNr+6orb8PoloE9HRxKNhmqBK7YJV34xcn9q2Iru
         fvXEvfkAMwM8kt2QGQePhnGe7WnI94dJfE5FY6ZCof205veCIGAYcEaoFSP4CZNzSo/Y
         68hGtLi+2mMy2GioR1Qv7LQkEfcG2gpRuKLOHdPB5nGXTaHtCWKJuVi6hOP9fBLhnh3Y
         hVPxPam457728573TphfbiVYPDFfg8jWBxU9P8yqt+08waaWsdbraiNSEb/uXnjDfPel
         7Yet3qzpQdvpKIuvLWMd8ECWtqWxuI6Fu96bQzH0gOhVQOrjCsntaWNm1yJKFg9pWP0J
         AbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718050; x=1691310050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z0h6vYSqXNeuBCoLrE61zLNx+lI9H9j/VUTdBVk10g=;
        b=BLat7s0TM7rSu/IEuO+BWmJCb0YuwaH0CaDdSOojrgd0CiPaUAEOKDouzgJsx98NDy
         1q8Fe3v0qBzZFca6TuKtbzhQ18EkQTrs2aXxd23u/yeaA+2pDh6Ppv5FlhbRb3q/w3cX
         AcESShQTVUklqLV+0bn2sKaWnUroXOkN9K2Dvrs25HOqCSJuImTMWEGtZ019Q/ojpfhc
         Rapfbn8IFyH5oOG/5Gu0GOgDfaFmIbx98nRuB36RzVsMDlFgpUxRQRcjx+6t9+yx3UXK
         px8O7He+ldprm+TGrlp/NOevxQvplho9CoezFGqiOI7baC/RSx4N6j4F7xHg35puv1x3
         OwYQ==
X-Gm-Message-State: ABy/qLbtkpBkhL4xZP69f/mZAMDYUY5mYEf2+yV/NJd+Z+4hUUs1SYJF
	c66yqcDItmApr1umdXqIbFV8LQ==
X-Google-Smtp-Source: APBJJlFGuaAPvNctsxZT4h+rPeNLCrVRQZx2if4DjgbImxXDXh3d0dAHm+VNQdBF49oNM0Gf0m4naA==
X-Received: by 2002:a05:600c:c8:b0:3fb:b05d:f27c with SMTP id u8-20020a05600c00c800b003fbb05df27cmr3255792wmm.34.1688718050542;
        Fri, 07 Jul 2023 01:20:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a5-20020adffb85000000b00313e4d02be8sm3824395wrr.55.2023.07.07.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 01:20:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Jul 2023 10:20:45 +0200
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 allow gpio hogs
MIME-Version: 1.0
Message-Id: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-2-2160060446d7@linaro.org>
References: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
In-Reply-To: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xcMJDJisG5P8usDSUuJYQAhSJbsakC/C4wieWFF2OvM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkp8rfdkjrF4LrOwWQKI3uvXubBxsYnrCT9RuJaOrI
 X2sIXPaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKfK3wAKCRB33NvayMhJ0boLEA
 CLF9n1M62B3/yqBQIZjzcKQekaOoW5HwFNq5wiL2nk1Clia5bwryRVJ4Wsj6JXPDq6XUS9nGzMe+TG
 chtNsNDvtUJ9HFpO3436iq8nh+lAg5uscW8zUNvIpmTbu7vU+ADDAGgjy6j/U8m5hGOGCd4AwTNDSU
 DMhsndibEBRNH3aPBM0WB6UiTFIFHI9EP2C7Hhrae7UzEwzQG31pZtOrub3cwio4qIoaH8peWdf+Uh
 AjSbFZhorR4qCiY5pFnuJ213a2Z72dLr+7XVjd1abP2r8IWg2bLoEogRm1ww6FwqoUKEiwo1qNX5mq
 3eTbtyeCV8COkEuUHqaFLx6XNMqAc2SzSHTLdLt/hPNdqr3Agl3zwAjA3L6ZpxKylLQZNRXzX0OaVx
 nKbAF2NZrQ5WQOEG5nD7LhORjk4l80W0Aiu/AZVDG9xMdPiUp6nbnwJbjaBP4mt9OYNavi++zgurUR
 NzCie0NMF/sLnrDD0uUGEu04UcjZHUhjxul7RwzSPww0Mq7EGOm1d9JV5Xj9U09ZjkiDnFLj+IRGQa
 Sb/VdBwEjfdKVWJ8UvT4fOXio4qnDxProlJsgKHUarcHaofxLNQyrc0v/TQyiAaPDcHzVwdl2XJv6E
 zP+vPxgO4l+gGkJdr7nbTY+RvuKVaWRPCafL3whWgYl2EAgyBVz9OYpgX9mQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_012054_520954_0486BCE8 
X-CRM114-Status: UNSURE (   7.15  )
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

Allow gpio hog subnodes to the gpio subnode.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index a7b29ef0bab6..e707c222a07f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -41,6 +41,13 @@ $defs:
       gpio-ranges:
         maxItems: 1
 
+    patternProperties:
+      "^.+-hog(-[0-9]+)?$":
+        type: object
+
+        required:
+          - gpio-hog
+
     required:
       - reg
       - reg-names

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
