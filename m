Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DABC77B7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nv0u7dr4PjWeJL+JNnaIxiZmt+OR5QRTZg2PVGAPOwo=; b=eCt9ukmhj+qXsC
	IoS+mdKfiZS7H0vSG1E5m5+QO2wU3o9MTG5hgyquiz363+BquCwIqAO7auerj/h+3kGRpR1j3Az3o
	akEUrMUMdBnrWL3nx1yzGXXKVOGA/+k+DKNky1+gXfl75IVH+5A4d3MtT15YoSppIXmMs8AM249bl
	KZe5DLs6r1sVVmCzRwppIGk62td1I0cZIT87GW94tiw+0kJ3X4dkLhbOX2iVNH5ZtuaEyrrOZUTv0
	hJ28gnLQ4spd0ZxlyWvZ4tdLyPaaMHq0HTWpMLtXdBFpuc/F5j/vf6xQoqkX+ppApVhXCiEaLON7s
	uFBLRG5Usqf8J8AuBN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxVtL-00CW87-03;
	Fri, 12 May 2023 16:45:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxVtI-00CW6f-0Y
	for linux-amlogic@lists.infradead.org;
	Fri, 12 May 2023 16:45:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso19058730a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683909908; x=1686501908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pV4nPrNRb/e5WafM80+WTgCZOIxglttUA6kfvAksdOY=;
        b=rAtTDf0k3Ml8UgtR+tzFbgrEU1Frtzb2Uh5yFzcVNBb/uVQ92xlL8r07QQbagGU+kP
         whBZiC8/vuVd2sGvpxo77CUzrOp9nbqKwHRZQcvWPEKX1aM0R9hgRgf3ELyQTQkuN5dP
         O5gbnRRdv/mRrejSdKOYqv/d6BIBTelmIJO52Lm9jo5ZLQk7xybMVQ2zwp2gIDMJyGAA
         KLsVml0Pcj8oNqd4NWygtaU55VxCFHBbqUgYSbzmiE1agvIu3xtHBoxF/Z78JDhytKH0
         asCP/EEiqfZ8bAeybd7FTJJpn/ITH3m21OSDlq32A2m0ADSQrgOwxRsUlRhBRUbwhhMb
         YXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683909908; x=1686501908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pV4nPrNRb/e5WafM80+WTgCZOIxglttUA6kfvAksdOY=;
        b=V3z7/1twDLSSwvRAllx3Qzxj5Pvcstfy57qccw6wcJF23wLaCkGIfJtWnWkkKrupAt
         2vPbTIPcTbm54xcmKZWE4+99xtGOFqO3iOArXGh4ANVEjSrR5HLsZJ70fA00FHZEsdaS
         chr63aNZ/DNzRAtA+8ke8OnvvHTXUiSnPs2F2iyossJsd+3wE3jFSJvsYASV9wrKDCZN
         0fvpkOxz93jb/2xR5RIF3vbFxt0NaBu9F0QdJ5QJu69Dm78u6Kxwi3K4WZA7eiMcOnEP
         hvS8nbL0EE6ukbBk+BKz6dPTQdUZe2uC7cLH3XTrxL48b0Ma8r1mCiJ2EhdAjgiz/dGe
         YtLw==
X-Gm-Message-State: AC+VfDxX0o3A3RZgv4UK72IMGEZfn+wyQ/wTZoNNnCfONaxDHXIc3902
	9mVkN3hRemV3+F5fQpcHytzSgA==
X-Google-Smtp-Source: ACHHUZ481Ipi6sYbr6dIvqXMErSYGSJqL1hlxcYBia7v3v1DAdaoZuNPdl6tTgMMuObGicpdgqysTA==
X-Received: by 2002:aa7:ca58:0:b0:50b:c1d6:8d60 with SMTP id j24-20020aa7ca58000000b0050bc1d68d60mr21692235edt.21.1683909908410;
        Fri, 12 May 2023 09:45:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id q17-20020a056402033100b00509dfb39b52sm4218311edw.37.2023.05.12.09.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 09:45:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] irqchip: meson-gpio: mark OF related data as maybe unused
Date: Fri, 12 May 2023 18:45:06 +0200
Message-Id: <20230512164506.212267-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_094512_217066_C2B4C083 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYzox
NTM6MzQ6IGVycm9yOiDigJhtZXNvbl9pcnFfZ3Bpb19tYXRjaGVz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpBY2tlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24tZ3Bpby5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29u
LWdwaW8uYwppbmRleCAyYWFhOWFhZDNlODcuLjdkYTE4ZWY5NTIxMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1t
ZXNvbi1ncGlvLmMKQEAgLTE1MCw3ICsxNTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29u
X2dwaW9faXJxX3BhcmFtcyBzNF9wYXJhbXMgPSB7CiAJSU5JVF9NRVNPTl9TNF9DT01NT05fREFU
QSg4MikKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX2lycV9n
cGlvX21hdGNoZXNbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29u
X2lycV9ncGlvX21hdGNoZXNbXSBfX21heWJlX3VudXNlZCA9IHsKIAl7IC5jb21wYXRpYmxlID0g
ImFtbG9naWMsbWVzb244LWdwaW8taW50YyIsIC5kYXRhID0gJm1lc29uOF9wYXJhbXMgfSwKIAl7
IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb244Yi1ncGlvLWludGMiLCAuZGF0YSA9ICZtZXNv
bjhiX3BhcmFtcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLWdwaW8t
aW50YyIsIC5kYXRhID0gJmd4YmJfcGFyYW1zIH0sCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
