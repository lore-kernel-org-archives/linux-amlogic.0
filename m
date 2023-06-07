Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DD0C77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUXpV0zeREDuSZ1bAYqGghXoHgOjeO8Va4GXNN6iRE0=; b=kfeQkvdUNsxdep
	Kl+wlLHLSmnR9cy9CafseQ1EMNTXBe573/EieoZP+UjpKeoMhbAGc7CD7NBP2kiFQ0FDsdBzGqmMU
	x1vdv9FHivg+pvmOxEF4pDmgZzbKlNuaxRwLg89VictHZoUv8wmQJNqXsfHGOFEODlZmWxr00a78K
	jwXPr5ijfIGG2cnYBaqMboM+gmU0F3Fsg2lLxXEEE4zORdYwJBglSW8qlaCYn1nxVBDw7ReOFza0K
	trMUAfOQHrbET2wETnSl3kT8k/qowFi3E4onAGAk1ZirBT2tbgrk1tjnmiwPRq0sfU7sR61577NyS
	W0c+ZHCdsLM5BWGT8nnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rfg-005gny-1G;
	Wed, 07 Jun 2023 11:49:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rfe-005gnL-1s
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=41DgEDA7RawwFVKe9DAaWHKPEIRy9vX8sgeP4hKFr3E=; b=p91Dk45kwXUXf2bVfnEPqnoNZl
	rVvVn0fsx8DOjfmaZi0Y8m7hAHFBJvs3xj4+aQNkxu7wFHrUM/bt/NUfB7bTQ9Sb/fvCoKJhR9g+D
	DbnvKrrEVCh4uSu1AL7x+Ia8MhMTKn2DrO4b+W4SdQl4uhE3dWkcHkyn5PnMc8d37Na0yn3PLeRRU
	aUh0cQHvpi110kJoXzQGpO+tSsiDyzfJ69Yyx3XZGKHem3NHzhH6Jtp8zbH1xsuh7nllHlLL6NYsC
	pgqj4v3SBAqVw+E7bE94cFS5AVno1vvCD2VM7i+EYIoYto9tQZ4azQhPHwbZiEYQwBGgOJMmgqKHO
	XdOO7KWA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qq9-0057xX-21
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f7ebb2b82cso16133365e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135392; x=1688727392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41DgEDA7RawwFVKe9DAaWHKPEIRy9vX8sgeP4hKFr3E=;
        b=tnRp8VCCn+7iu3kHb67gSI+wEsIiW0WgxvgOiGJwSWpxbh7q5BtHSkYMFFyhq63DtN
         KjjYP8wWEVa6jHgJbCY16ho+MmxNg5atxWzw32gOtLDVoXGxjzjKxgIyIIq8tSfnZGZS
         +ssFoGFrHHskfs4hYzPDFxudqTC5uoH/1mDFYbZqu2fOb/Qg01G7NZraMIH+iOy6PIM4
         +Mypp1pkGsSAmWSqfb51CaXd3c+6V3W+8LIhI/o6a/IlsG4DP0R50DxJURinOqMuEFW/
         aAUtZ98ILBO0MOcmTWTlmBJ4/BB3UmmuIFXnt6STnAfYWYKP3wIeuKwboqkXGz91wqJr
         PL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135392; x=1688727392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41DgEDA7RawwFVKe9DAaWHKPEIRy9vX8sgeP4hKFr3E=;
        b=iM7zbvCVHir3fLz7OXQvY7yH6OA6H9+ZO5wcIv/hYwAdIlbGUkNQZnQM0L16hb2kJr
         LoAFaPjmWXb5MS/MFrm471P7yWibS4BIE9PRrT6XmXGgsw+DuY755M8GKlFkb+JNraTL
         36HN/O6LxB820ESNU7q/eNrFNSabvcjAlnZbOZJJMnbEW1efzGnfMVDpNYsoysrmQjsS
         iGc+CBqFH+xuLPasGFWU+A9si1ZG7mQHMRtx6jx2JhqxaC/IeLfCUjSpo9atSzP5NmOs
         RlgBXbarNbeYzGyDszrxZVaUZaAgNwsQhMtzuMmMLhcRP69MdmEEnqWi0lCs60rCzxit
         i1kQ==
X-Gm-Message-State: AC+VfDxyw1LofHlWknV9JrPA7AxfCrZhRDy0YUXQkk8xTflGSkS/tC2j
	lLBCfql+3tFd9EyRBMgbkJSKbQ==
X-Google-Smtp-Source: ACHHUZ7s2BtfPEbOY+k0qWIYFagv3pauqJNnaEtrfH45+8D3kzSDxukEWAs43P/Dxh3PPQeFMZ80zQ==
X-Received: by 2002:a1c:770d:0:b0:3f4:2770:f7e9 with SMTP id t13-20020a1c770d000000b003f42770f7e9mr4229015wmi.17.1686135392129;
        Wed, 07 Jun 2023 03:56:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:20 +0200
Subject: [PATCH 09/18] dt-bindings: clk: g12a-aoclkc: expose all clock ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-9-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wGNjFvwT/m2SY9qfICrCHA3euNVfwb5B04GQshKGRz8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJRsO4L4fTFv9ZIkQHFxwTk4FQsNg0tNWHPQJjy
 cX6jRLKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUQAKCRB33NvayMhJ0TE8D/
 45dml+KkzDWCjCo6wK7EcpD1KadwYtEnWLfdehDeOf3TR18XV7zacE2RuWrwWlKmhrJ3gsc/dBcKdR
 3tHatCjwmWmUQ+nE/iPQFjTfEPtm2BSqKz0ddMk9aNFXOu3AVUrOASJ7fwGankd8WV9RWV8Jfe5zvp
 uFfm3KG9IZozpdu7nwqTEx3UGWgAJhDXtHalqvjPVrJb/ZBUtZW/6q/GG1gUaBX5CcMwjuKxqJrClD
 NtnHsfWiEHcvqcbSzG4D6yY0bevZz/VCYXhfqeoxu/c4n1U+oc/M5CU39RI80P7Dhc9/suw3ElAwoZ
 hXpBYrnSzKmaboBv42ginDYNNgpaHSAVqfamBb/bYg10lydBjgilAIibBTN3SQTXs2Ha9E/w6yd6B0
 BcI7CRkSVJpxVxEUifhrYNovFRVw10UBmghzwNi8hRWeg66/lheJRGrto80PqVBsOoRpGnSvIV7ihZ
 zOpZ8Jw5NOM5BhHOo7/NvbcnTbukCgJl0QBqVJNbrjFmHfi/QzMenUwqo5hecuzN3VNkdd/JvQVBng
 kBMbtlXY7Zy6i5OcIz2kDwp7moS6ZeI/pMoYdVG0Tgb0uitI4L9ADfhQrg5CZcnQOy+tQgw7oH97tN
 owR+k2l52tdxopokCz15pF0kb7K0iZLiyJCuSTdWlM/WRfLq8KD7PhWud+VQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115633_780768_CB8C1EAD 
X-CRM114-Status: GOOD (  12.21  )
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

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every g12a-aoclkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a-aoclk.h          | 17 -----------------
 include/dt-bindings/clock/g12a-aoclkc.h |  7 +++++++
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 077bd25b94a1..9d6eeb24ae0c 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -7,23 +7,6 @@
 #ifndef __G12A_AOCLKC_H
 #define __G12A_AOCLKC_H
 
-/*
- * CLKID index values
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/g12a-aoclkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-#define CLKID_AO_SAR_ADC_DIV	17
-#define CLKID_AO_32K_PRE	20
-#define CLKID_AO_32K_DIV	21
-#define CLKID_AO_32K_SEL	22
-#define CLKID_AO_CEC_PRE	24
-#define CLKID_AO_CEC_DIV	25
-#define CLKID_AO_CEC_SEL	26
-
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/reset/g12a-aoclkc.h>
 
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index e916e49ff288..8fe7712fb12d 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -26,10 +26,17 @@
 #define CLKID_AO_M4_FCLK	13
 #define CLKID_AO_M4_HCLK	14
 #define CLKID_AO_CLK81		15
+#define CLKID_AO_SAR_ADC_DIV	17
 #define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
 #define CLKID_AO_CTS_OSCIN	19
+#define CLKID_AO_32K_PRE	20
+#define CLKID_AO_32K_DIV	21
+#define CLKID_AO_32K_SEL	22
 #define CLKID_AO_32K		23
+#define CLKID_AO_CEC_PRE	24
+#define CLKID_AO_CEC_DIV	25
+#define CLKID_AO_CEC_SEL	26
 #define CLKID_AO_CEC		27
 #define CLKID_AO_CTS_RTC_OSCIN	28
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
