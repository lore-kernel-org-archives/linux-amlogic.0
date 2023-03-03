Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78DCC7EE2D
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 17:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZnmnnxuXGrGSEyzTaRAXYfdznCeUp748YO9VJ61bJU=; b=IW1BRzBqLQaV4O
	IEEFZdf0qo3+4rizd1K40/AESZeond5IM0AKVS/ljtXv84x3GDwpt85I4feuouRTdwQpqqT3JWnyE
	vcCVwmhdpbHCZrSZ6aJv4Vxh9PHc7eQ+zd0I2LEhGnixftUU/uYTgtEo5ruHeRZuOSzGQmoYqm7pm
	IBTKMl4WhDTH4ApEepU0cxiMmJyS8G/zxvery4GAd25kFunm9cAXWiEK772j9GP9yPmBq3MA7BqDJ
	N1ffiW9zI5+CcpBmDfnqDbzZdMiMKBLkVioFjJUcR+a7rlzB/1HavJFtFKieWx6PgyOmrtycvzVoG
	6d0Mfsha1RC3u9H5bf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9Sp-0073pz-CP; Fri, 03 Mar 2023 17:45:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9M3-0070xv-Ao
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 17:38:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so1728909wmq.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Mar 2023 09:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677865080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuwYJdAluAVqq0350ZDdjBaUb0ds5oc80wUc9O3dgIc=;
        b=IEdFjZXlGFiOHSA4JXDNHZx7kwV3q0QQTFC67jh1aPJwQ2OS4IrnaWAL6JlEW7nJNB
         xsyDJyFt6Rqz2baaYacVM+BX2ae9UyWTVRByhOnCM+w6Z/QvDJfDIcpZrcw1Y0EkT3dt
         Vo9KrkNRHOvuPFFHd3NTupJLHlHRhY9Oxf4KZC5NLM899BpqJBZyjWwpnwyqqy17KwBH
         Ta3KoMXT4M0meBUZfWB0BIOSTxI9qKs/MFO/G8UjaIzwzlELMgWK65O3vkL3XcKO+EcZ
         o6WgBs9eDyf2EZTqnnf140V3U3ujQNNyYi/oExjMGAoi5cUL0O3V6u5a5Zl3GaWzxePO
         7IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677865080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuwYJdAluAVqq0350ZDdjBaUb0ds5oc80wUc9O3dgIc=;
        b=EHo87TlKx6NferDeHsuXEZ8MSZKrQLu+HRwDmU7f42yq5DiC0v3Odn8xTy3raSufeg
         Je6w5SoLq8d6cWRFYjn2tyRmBDlUW7WeMq5DqRnFOkSF+pjkCOP3GPP5sB01a8v+WBxf
         rfE7U5Ha3XGY/yJhPTllHKi7dgYM0YRNpWTGDdSdV8xp519l1cRDg3j/IOu8YrQxnAD7
         LaovkLSIRGVIMY0Is6EwKiGh2efN9TyJazx9BUqcoTUnHm3Ru2v37giNk7O4awKjH6TW
         gl6ZqMUunbk+zIGzeIJlDj/ie4ILYdeTvDl0zibunSeooy2iG3kr5SlUukgPDwZOMOO8
         t22w==
X-Gm-Message-State: AO0yUKVRjxhIYKlnFjP1G9cPQAaf+smK2BlFOKCuv5QoD9BJ1zQSlGXH
	fiH0CY1CBiRdB7NPK7OIzVTO8g==
X-Google-Smtp-Source: AK7set9f8opmU2oD8npox3kSfd6u28Xe+s4D2TT5yG6JKLEWheOoAxQ+Pw+UHBu0i/zqnfmricm+Hw==
X-Received: by 2002:a05:600c:34d2:b0:3ea:c100:f5e7 with SMTP id d18-20020a05600c34d200b003eac100f5e7mr2261025wmq.39.1677865080297;
        Fri, 03 Mar 2023 09:38:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c161300b003eb5a0873e0sm2990170wmn.39.2023.03.03.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:38:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 03 Mar 2023 18:37:57 +0100
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: Document the boards with
 the BPI-CM4 connected
MIME-Version: 1.0
Message-Id: <20230303-topic-amlogic-upstream-bpi-cm4-v1-1-5a23a1ade6bd@linaro.org>
References: <20230303-topic-amlogic-upstream-bpi-cm4-v1-0-5a23a1ade6bd@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v1-0-5a23a1ade6bd@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_093803_416431_D0393771 
X-CRM114-Status: UNSURE (   8.80  )
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

The BPI-CM4 module with an Amlogic A311D SoC is a module compatible
with the Raspberry Pi CM4 specifications.

Document the boards using this module, by specifying the BananaPi CM4
compatible in addition to the baseboard compatible.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b634d5b04e15..4e5ae70db4cb 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -158,6 +158,14 @@ properties:
           - const: amlogic,a311d
           - const: amlogic,g12b
 
+      - description: Boards using the BPI-CM4 module with Amlogic Meson G12B A311D SoC
+        items:
+          - enum:
+              - bananapi,bpi-cm4io
+          - const: bananapi,bpi-cm4
+          - const: amlogic,a311d
+          - const: amlogic,g12b
+
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
