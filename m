Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851DC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA9t9w2fK0mIKGro43NAJFcPa9ggCMJYiVGV35BNEFM=; b=ik9CWgLXFCNLe2
	nx7w8tBAKUN5/LGbVSYAdJXb1DdsK4zn3PHrJtsp+zwWYi+PSrxffjA6tkiLb5vH2YCW+CWdjov4S
	ktzTj8bFhzqsbkKaT8OWYcu5foy/N2KT3zKLvA1FkRRe+DR825+mgmRwAUS2e2ojbaMpSipLPgdWu
	jh0O7cEnJEab92nNlTtLX/pEzH87KJSddUMQawabimhaJXIiSX826SA0Bbv2YGRT2nVIZhnE2oDWO
	jnFgXD28EEIPwVZOp/ksQ4SqDscQ7b/4eMCy0KeIxQ9XJ0QFPLmFsyNM8q6EfGdkAOZOdzl9zd+xI
	3nnjMrkoova9vusKk5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uun-00CzJJ-2K;
	Tue, 30 May 2023 08:41:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uub-00CzBe-1U
	for linux-amlogic@bombadil.infradead.org;
	Tue, 30 May 2023 08:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=; b=IAz5VeinITMaI/xneybHiCDwMB
	XM64xgIDlyheZUAookIkXb1oS1lQriO3uhLYuZlIcPWrJXgN9zr8UHQP5r/2YuzgpKCmkoO+aSshy
	3mtSpOzyTbvvTXShdCAxBFhIZhRZcXiACetmPV57cfHxwbtReGsr4M9srEbZ8WZyrZpZybJ4rnkl9
	iFP8djDm6FDCasrtulWgyvwcdfDRxj1sPaspWxwABpVwVghGJ4n3QcnshHDNeaVtARPNa/fB/+R9A
	WqJAcYcQl/FJ4CqZ+qbCrxQCFan7hX5HxCSNotSgab4eK87VUxgokGshoNyyTuErl8wYO5cDg696c
	Y0EK6KPw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tw1-00DbtN-1K
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:38:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2568197f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432301; x=1688024301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
        b=suZawle7XyCtmTwc9koewCMnKkWPXacwHsZLDFLFYQc3h8tUK/ExADY4dPmZuPA2hP
         /2Otqa3QJVnMcWdz/ZIrVBE1/wHd1C0FynszMshKwVb1eP9jz9/Xb3PFlTps1pz6OegW
         bWZiQVQtr4ErEeffk3KKdTOHQ7e+94+iSX2WzbaDAfQ5VVBgJDbfVmTLapSwfYTppFhv
         oAfHRp68hwGYopDlGIkVcrZtNJJ+XlO/U1dRpOms/isnM0jfs0bVrwFRA7RfGWK6FxXb
         452cNwWfHaqWUuoApq2gUPLFUKPJgmmbeOUh8DKRQn+XyYPKAY4xT/Lpw+Q2vBggAQj7
         KfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432301; x=1688024301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
        b=LTv7z7Vk2XprIHkVWgoPuK+Dff8tPI+ykRc/WVMFZaZXw40AYp8j68YHNY4SfAI+D1
         MewrzdxrYOl6OR7Otz+KY2Vd7vshnA0o2oiKREAwIvBU2PpBYtoRzC3Cf32Nxv/uym52
         SPdcZhJfwOPUPyyHSOSdoldiAhuiM1o38yd1A5JhxryuR3y/Q2mfNHLrm+r7TdD/eTvt
         P95xsFh2blOmBqyF6YsLk2yQ9mbdncpYkYk3ucRFUkVD5sh04tX93obMeIFy9bGOoTzC
         IzzKotg9OZW2fHWQ4y5gCPoUgJGIKAiv5KlbtWsrzpw67ZjXqvbL49XprG4XZobHCfAB
         S0nQ==
X-Gm-Message-State: AC+VfDy6IO86o6NBiCKeibXPKe8LraPDu5xdxRRn4GdYQqZDoRcKXxx3
	Xl9pnPO+deddXbtgc7Ya9SQ+ig==
X-Google-Smtp-Source: ACHHUZ4MbWC2LdJcXlvseLKtinFpCmjk45kQkUC4gyJQ6tXM3sCovJx5aDRdYpZlfNDPK2Ol6Xs8Wg==
X-Received: by 2002:a5d:4003:0:b0:30a:f02a:b84d with SMTP id n3-20020a5d4003000000b0030af02ab84dmr898742wrp.13.1685432301659;
        Tue, 30 May 2023 00:38:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:08 +0200
Subject: [PATCH v5 07/17] dt-bindings: display: meson-vpu: add third DPI
 output port
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-7-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ngaRaj/ff6scDRZWhYNPrhhh/3jRLEZndlPLfgP8m5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgrQ+d6kVlnqgthYceWHgXDRj4X3G8yCwWhqxC
 zPMd+56JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0eT3EA
 CaIP+cIiapaagNPLfNF2mzXan492id42Vf+UOmKe5aW23Bk7xsIVga2C3eORTyR87dGU0msoFj0M0o
 PspPAeNAg7DXsMG3N0tpN3pQU9joVnYJobwujt7fMlBo9h2LqkjTlvD1BrWSnOtkn92Amoj9lROpbd
 296eS7FzQBOybBtYOICBCbI5Me8Epuh84+WZy9pqHaj44YiDeH9U4UsdteRPYutqED/1oGKZ0z6Eet
 Y6VNtS14EwxYbcB/hIoF07ReQFwqaSkuJOZFVVCVmABEfKsP7Civ8Kr5jWI70sI6eq9Uqn+aOEqUDT
 z2nnSHtmrzR6pIp1cWb9YbDB6YXQ1HUTx/PyXxp+M4Lj9Gw3laPdn0qRQ785bQSUSqFZgTXge26B0q
 xZVu4MnknfHXLTdZ1v2tPtErmaTrvGa9G0vadKqvqHbD0oqrSGHIlsg6zkw3c0GC8lzaFKdO6ZQ68D
 fm3GGGGjDrUvhgOdaMo4clJxq0mhDdRadCdwdWAJm1KikDaVwKShkRU87r5uu/kXur/uyQD/B5JLtU
 JGE2aZD4cvNjIywneK6eobQpnxStvcZs6mI3WOUwjNtYFqXnNKefvE9oP4lxjqMak0Mux0gf8vXtRL
 xJgFplqz2XADbImv2izEtL/ZAHgG1BZhNGjXQCZT1aImRaz9rH3OUOnzwSrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_083835_272651_6AA3F5DC 
X-CRM114-Status: UNSURE (   8.73  )
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

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 0c72120acc4f..cb0a90f02321 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -96,6 +96,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
