Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804B6C77B7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA9t9w2fK0mIKGro43NAJFcPa9ggCMJYiVGV35BNEFM=; b=jiDxDhsgoSzeiP
	kI0B3WWhm0fR2T5IQr0EdVqYBWY4prxRhyIJqfDy2k3X91+4u2ef0Y499X6utwLs0wTFDOqkdRWl+
	/lv4xojM07d3M05cVLNmojhB3g937ziw6ZhK5U+SY0EL/0Q/3TLdeeJ4sUv2IduMlBJa6ZT+5eZ5b
	UKa0FKsgffjIAs3oZzqcktpMLvnBJuT1co9us8CxqzNCZ8MIU1gnw8gT2t85nbqLV6dO6rywVjcbc
	KQ0usgwbHPrtBKRZRtMU8wjIUawAlCYyQXWRN9u7hPP30b7Wpc7hKKS1fa/mZp9x7U6e59f/1rReo
	Pop//3jVpGpbHEIPkKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0I-00C2qw-2F;
	Fri, 12 May 2023 13:40:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0G-00C2pb-11
	for linux-amlogic@bombadil.infradead.org;
	Fri, 12 May 2023 13:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=; b=cX0kmgBSPrPvyr9yO0+pe08fHz
	AuhQ0lQi8bLc+SxGMfw91O2kxv9QFP5KUQJobbpvq5f8ucn1UdGvDuUoQwmD+meQpjNfVTnXOlQcr
	cXo61g2p8uwUpAQzBVLZJUFQiarkXTne6D5+D5ny894ZLAa4eG5+DyPH2i48Mz1bt3PwVrQclgKEP
	klW2XAOjRinhJZ30Ul5pmaTdxi6oj+4cqQoZVT9+afuSA9Ui5zoAqpS5NGbAQL12NPonjqJLnBZ5d
	a2tS2J4RAKzTbnxjNZbzTY9p9r4p3D8BCRyKjoHwj+08Ek2zNPIIuaU5Q3i2YJbCUYdb0iv1LyYXm
	hNtSHyjg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxSZ5-0099Oc-2V
	for linux-amlogic@lists.infradead.org;
	Fri, 12 May 2023 13:12:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3090408e09bso193838f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897118; x=1686489118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
        b=UVCtYsypN67W5itTExzTednHd0K+yG+KL4EpyNFwnGdPdIvNUsOSxp7lcnYZG/7Ey2
         v7oMZugKSY4pohBQmPy4eDZ7SDAvHSx2mWzXWRUmNorKmZ2OP8sNYcorwTl5BguMnOVI
         eoaPpYswy51MjtCRPSBMbG4MnpDAjnJazw6cKKroZbMosEvudzDD1fg2VttBx1HCD0cX
         j3cVCxKuASiYy+9eusgcIJLNYMF0LOSWO7+WChTnItgB45fXDHuzXC+0uhtVL7kDEqEN
         IUQt4XV8EchJME2glik6NgOWTiVbazRCAvEf3FmaH+D0jyfN++T3/jMxa21GHVrJWxAo
         nHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897118; x=1686489118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
        b=ivdq+sLDfkM0qDIIg+XDw5iUfmOjokj6nuD2SEAdqpLZ6fI9I8Hzlpuiz0+7LU8rNa
         oBm1rg8luE6LvkBJy7qsF1PHjkhkLA9hLrM/01oCmvQr0vuf1UusT7Z23uETSXekQmp9
         gJ9aHjHw/IPZY32+yDCuscpAvlzlJ83P4/g8D09ClK68y/HEGD6Hkq9538fg2Zy6rUJW
         XZqGZQm2Cd3ijI5Ld0VPB/13eLWWSM3pGXHsjjyxYEEtLcT1AwVRsU6lS1aPyCZfCk+7
         amHbIal/wuNZESaKKHVfGs3eqesb4vIWWt774H5eNqIxak21I6uimV+5PvNJbVWGYK9/
         nAFQ==
X-Gm-Message-State: AC+VfDxQptFAY5GdZ/d0m1Datpwv9FKNol5RjlHNIUHE5AKAk2h9C5RB
	koFjdeYhuDStm1okyPXABwDEzg==
X-Google-Smtp-Source: ACHHUZ7IzdPm61Rr2uFsr715Ac526tlT5Hv0vb6s2t7X9303MA77SS0I44BQBpcPw2M5AeT9ip2IFw==
X-Received: by 2002:adf:e84e:0:b0:306:35fa:202b with SMTP id d14-20020adfe84e000000b0030635fa202bmr16023907wrn.6.1683897118717;
        Fri, 12 May 2023 06:11:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:11:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:36 +0200
Subject: [PATCH v4 05/13] dt-bindings: display: meson-vpu: add third DPI
 output port
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-5-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ngaRaj/ff6scDRZWhYNPrhhh/3jRLEZndlPLfgP8m5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsTubNQpwmz5c/oK2m/saPsEBPvZXH2UV0wcY7w
 qdfTDvqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EwAKCRB33NvayMhJ0boiEA
 ChDW4mIkGle2SE4bBMV+Zdy6APbp4Iah8IZf//W3pW5aOoJ/7v0VbGd2wOH9OSw2WpezBbdZjXEDfU
 4J9ocYwS6ZG5EtfIZifV5aW9EbmwrUhs9Qep++6/B5NrJtj1YqTcP8ml+CiUSHNZWtEyxIm+ygAzDP
 MmIyVX0ZPeasfzNcQTaj7EFrY9VxytAtkj5p8MxP6jNWcc7XPz3iw3dU5aK4Ixlctrwl55QPG3B63m
 8gY0qnLyr3jpQSR5zPMKuZ/4hppbnl7RwAZrQyFKxnBulrR1Y0GmVFFHh1RxD84cWuZG/D6fq2ZIG8
 rOKj/wWjE/AGcKSEIZiuvww0d+Ndp1Z3rKiOZiaLTDpsncFqWbTuw4LBUpzZfv7KJCedXkYDI3/fwe
 qd9/8Dk6n+6Z+8/sfvHIgIECRqpAtsOAPVLe+vJa4Nq0cmjmBXAx1dJONcuBRFNB1l+8sNDS8A5BJy
 IMeYC9r7/DPdijCDEr0HposrbxEQdWK3+MqTkB+eXE5QNX8Y/xpGYFIzDY03ZrVPHm58y02VYj+4Lm
 AwduefS4VNvdEx2qsygT5jBVt4YCWJpIy2P9VpXd9z2KbU+45RFPLA0naqcsXZi3RxPEBJg6vQX6j8
 6jWpuSH0Ss9dqkCnXktP5QCzzrxwM3+LIE0L1rWMD+Mp0GtPXsAevIDtt5Kw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_141207_945086_B6C123B1 
X-CRM114-Status: UNSURE (   8.19  )
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
