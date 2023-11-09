Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AABCC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hkT3KBuBot7A1OU0AMJl3qtRnFJTh0Tw5GyE+nf96A=; b=kPbO2ZZucNe5l4
	JS18wETGLGQ8Vf2zQ2r1VtelfrZhBHLK9oOzdyLGICedzvpOCzLZsFiPK76jq5bNHPB/2eIjiywhg
	rCCZnHs5UdXh3ahaEk/TmMiVp64UcqNWC8NlqD+7bR1tuxkFfoTSx11bfh+5B/1f7vZe82ridR8ux
	wL4+/brQpXkwmodGlEztCuojNsHxIRpsW7a+EBNsa01KOPPEFWGwi81sUvVqAGbHFbGjw2lryyrUh
	Fb8CtrHOzzV5VplUM2VtOkHOUv5sE0tzp87H5/xz2QsH+JETfSlELevv0PzH+LQIBttBcLAYUy1AS
	8nB+J9oTdM9QqhpzfKnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10ti-005gh5-2b;
	Thu, 09 Nov 2023 09:00:22 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tf-005gdV-1o
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:20 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507973f3b65so768437e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520414; x=1700125214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=G/fSuVZ/5cFByiHVBfF+Y/Elj2NH89oNAm47cY6vvI4yXgQsK9b3EIfmjkFLyPa533
         Y/bGvaajU9vXNCeycwXRVrFeD+Sum8/YooewOYIuecqlyJQEpUmzT7bh349fHx+5LtTo
         2SxPrY4UteTwk0OlTdHrrFLpAECWVVDojkp9LWIlPYJoake59ARA9sYciHEiE/lN3fhb
         9EbI0GqNsZu508+QHAOSvsUtaMcvki19ZChbrpLiAfF50CZN5id2wQXdYJ+7rCX3kV1M
         rwuHJlo2/HdJ8wJxcFtxSg1E91LfSq8T4JqN6aX/zD73GlTWM0VEdYYlSvrmP8Pwkq87
         UBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520414; x=1700125214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=vdF69GKDfdilA/ygzFMZqSrEs33ZIHxUKgHmLRwlUZtl7JLWrl7fWfWNT9t36X+lju
         HlAcQcoqBwFnhakja9Tcl9rLBD9QjR4+eVa4gnirxfFI20dAJgBLexSq0ip1Dv6UUxE8
         nJRmNCxSV9zb+hnreyJkniYTapdYFkw1J8SirTWElsBdByKDEfza7d0z7aET2cqQtFP+
         TpuUAH+TWUTjkohuIC+DF6x7U2PSVMuNqoNkiOYzj8nuUu2CSrXtiGotOacijAvGM4+7
         nyUwA7OJnWU1qanIVMXHtIQWsXoXAIoafydjc/RKkDMGsGOB0NcCm0PnPVPu1LuKKgsZ
         o7hQ==
X-Gm-Message-State: AOJu0YyiA7sm2vQ34VhDLVpPwCusiHWZ/YYx3PQsP0Ma5/VLKCKIBapm
	JuEMlVkxyqWhIbSM9kBNH998FQ==
X-Google-Smtp-Source: AGHT+IHbarTLeXs1xRLnlOEthFHXQkLlQGddJUwWyZGyU3T60ayER/TL09SkJXBO48qJCeZljgsIWA==
X-Received: by 2002:ac2:551b:0:b0:507:a8d1:6e56 with SMTP id j27-20020ac2551b000000b00507a8d16e56mr833623lfk.35.1699520413701;
        Thu, 09 Nov 2023 01:00:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:02 +0100
Subject: [PATCH v8 01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock
 ids
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-1-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+VapgP8WHcdrQgPiETykwQUlKVRqJ/4wVyCchQ
 YXz0F9aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflQAKCRB33NvayMhJ0RxQD/
 9C5ZGRPwcExahOsQp+FbfoxjpmIQhQTF166bZMrK4X3DXIHdj0XEIJf/stW+d9s8ZED+E350vg/VsN
 R5OhSGMemZL0MEM4w7cjd3pFBN1RXfzpt9UtYGdxkppLZsu/SgvZTnk+q7XTdimznCiJSl0+E5t4Wo
 R2/R7NbBSM147jSdi5bBeuREcm1exIjb2l48Atuw/a5Ab6EVXu/5nB4ieAkIpDuLLUztCGY8Pk118m
 yUKm8QsIcqitnSbhrG1pOnfHVmGPpptcLSxZPoG7P0eIJX2EcIFWz+kRo7VKBJpivZ5OJ+KnLoyD4r
 GI/QJgiVg7cnWNLkw5e+IW/9VCcxsxVcqXOzAl6i2f3NGq+T9IgsJ8I03z5Ppd3do1WshntIh4YMvE
 gstl29N0lvUGXR0jo3JZ3TVCMSwinf2AUgLS2oibuDIY0k3kdGG3ZuRevRpxjE/UNxSWWqmubUEnTd
 KtBi/TH3ACCcAsGTGh0VX7resg8xpbrCS7jFKxz3JEVMGa8wQ9Z9zNUcyizV/IvVu911b4KKruocfe
 DhBLWNPgLVBn2Xl8cAXuQJH3Jmz134RfvYj0UIzLHdbyrTkOB7RIOPUABuwP2jaTj/nD+P2F0OmKFm
 Ul0YEj/8PhtnUUoDwHdpk51cLMTTq+YhdJsUqgkgsOND5UV3glOI14ooO0ig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010019_607536_0173E94A 
X-CRM114-Status: UNSURE (   8.35  )
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

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
