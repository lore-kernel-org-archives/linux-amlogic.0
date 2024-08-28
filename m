Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE96C54FAA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2024 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egUgnEV3AIaovpwV2Kg6J+m1swSJOJribCrk5GZmCvI=; b=FilBwW71QUUMly
	fxT3UVkxZ67mZEZoq5WQGhq610TjUTF2xzV0RvmwdmmsKI8B28YG358GYMz6Yvjr7WA9fIBvaRAkQ
	U2U59gyBt9OeByao9wqTmOCxELCP56pJGN5rGiV5WWCbet58X1BlfuwwkgtKDj0sfMz8KO0gP0h3R
	tM5N2VvA0ub+RmGHRUOuN+pZyO4+fec0sk5EDui6zYjXU3aTPR9xMPBaPd3HmDBRoAs1ztw6UjvYU
	WmwJ6LQjvC0lR6pfYRCBkJKx8seZ5UvbF8JsaWsz8GV5DQX9cP0h1Cm0hmL/ovQi+5td4CyFSRvm6
	xTTwyBTIyOj6v9MVpWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJAm-0000000FcrG-1Dti;
	Wed, 28 Aug 2024 13:57:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJ7i-0000000Fbfw-43sa
	for linux-amlogic@bombadil.infradead.org;
	Wed, 28 Aug 2024 13:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TTWHuW86NTs+103uuN2zaYjUY11Ov5iBD80i8ni2ivs=; b=TwnlkGd7r7sBu12rLrJ6Hu045z
	/zMlnC+mNvoElfGyEqEdGeu+G8KUoweyfshVU9TsGxaSkiVzfup4Ng4WIaZIQra0coem9wYCJk7H/
	DO5t8zZyRaMvdkMdOQPYIGiVgfZGt4O/X+N6xzls3Q8ndV7bnEi+7DK+p9X7Y3O6cQtvQuUWpKB59
	t9kDuYSNQ4Mx+TINfodneYeL+J0VN1DiTZBzYVW0efLbRtXVSKOXu321aCNoH6I9P0+ZF0FOoetdU
	vUWOvWYF32GRbhsAWHGV4pA6/E23YqpKu+p4NL6cRtuaE32StSiTIfTH98oZ+LYGEHcWy1oxPU+wH
	7Vqr5Y0Q==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJ7f-0000000BBWp-1n7P
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Aug 2024 13:54:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3717ff2358eso3751696f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2024 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853243; x=1725458043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTWHuW86NTs+103uuN2zaYjUY11Ov5iBD80i8ni2ivs=;
        b=wZKmmpZoqPe6lcPzf8+Hqq7tyNjXAqAwdmiUUsAxuK8oiuDr/M4l7H/AHCnqvsH1Mk
         juWZP2UDMW1yOUx2ug+tAvdcQPe9F8cWQUYh7S1AWnRSs+TOzOkVr+78fcLTFLGX5K8T
         VzrG3RkNLFeMXXRNYOBBY/wXnNttly3lFMNlw3wnFXMO6UVptx63vT9JGmEGjyKoeng8
         Kw45k8w4n3Ks2y6mapdHN4wcG91A36t/kpX3BHTmwPWlTbRfMO6aAJH8HsVwt25WAuGT
         Dwgcno4svKU9jdfHJ8fOVYQrMp+fUPFCsYtPzTdPEIU4xDyiwSAqP5Whm0gC6z3MGh2h
         VFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853243; x=1725458043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTWHuW86NTs+103uuN2zaYjUY11Ov5iBD80i8ni2ivs=;
        b=Zc/DsDhulMIZytaHCFsGTWDgBpJKACxat8ahabBx5kuo3GjnUy3+MLMJ/8yroEybcl
         i7126FmzM732Roj+mzjZ/IeJTZb9ag3AvwNjuReLxFNYjO3ntrEcvOd3FYChlC8JiOkj
         LREvNH/BzpYsLhnbiJmmcXg+6Quga7Yujuwenb23ZL6Fckw4FvfOrzs69a6SdU6VP4wz
         qU9jlHzibX8oAxk7qG99qeXWQ6Uj95wkCl1/cjKRuwFXDTpiAtFWQOJ0vJpW45nuyzCr
         qjCSrr7Q6pLhwYY/fN4A0nbqnzp4j1GJhQa4NMOVM32UG7lWZgiu+5CaoBxCJ/I9exPM
         EHWw==
X-Forwarded-Encrypted: i=1; AJvYcCUEhS5UXsGZ2KfiYhAEqh10Dhf9k6ULkm73tnilXx5WOoT//Sn0brN5jP/wgoMZLsTU/rYQTSQLzjQGPZKK@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVfTy/gr9pHrOw1KSq0/mjJWvgrPBA4HFyitEk1OQKpIDVOk9
	i3WWddNq9ceqEHRsKQlBOsRCEycKVQXfbZGbT+BkevjPJ6HMmFYWSgR/avcPVFw=
X-Google-Smtp-Source: AGHT+IEIRP7AywU7RW8H7GuK91sm441qq/B1K30YGS/4flS761qiJ+wLNYFmEH4P9KhRRx0bXPBEsg==
X-Received: by 2002:adf:a416:0:b0:371:8d47:c174 with SMTP id ffacd0b85a97d-37311865093mr10293637f8f.30.1724853242544;
        Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 15:53:55 +0200
Subject: [PATCH v2 2/3] ASoC: dt-bindings: amlogic,gx-sound-card: document
 clocks property
MIME-Version: 1.0
Message-Id: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-2-58159abf0779@linaro.org>
References: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
In-Reply-To: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=H+G0uR0uGtkQ/5/97rdsSRom5F7Ggvn+WvWc7nnJ2JY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv2GqTu1q87S0Q2rSDxbQeeYYgHw/Riu2gqWSyE
 6fyZXPGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9gAKCRB33NvayMhJ0QPDD/
 9WZk9izqKs6sRDdw/RiFAlLH3jgXyr8Oen2cHF65E/3nU+f0raTKs8LFYUXB4keLMiIPjka4JMJ+qT
 Kq7U0XPlmrLBw+975gaJMTgvS347fDb9Lyy5925kgoniTSsUiQ7dFxSC8jHi8ag/FRTAE7hVDsy344
 pYCtFpDbcGbdFIqe4XiIBasUsV5d4cr0aMpde+pWil+jzt0fV3vUw4m0ZHO8u54FxV8vFApmMuqIpv
 oeOQdoUIzP3hmOFDjwV5N/CeX2fEB5YOcHupvL1toZyr1Z9cG1ih1IGQg4okSvoxeP/u9o1/hB5GX6
 atENd4NA66+Aa/uDTzZZS+VNIhkDxrhtLiA1RV1kgnnZ3TyeZogfz+hlTRLrWK1L6AM8s9A+DMtCHW
 zp4lL22MVI0tobGLNnzUAFdoF79ywKYXF8hGJj50NUOOSWWXddV/5I5mbDDi+kWUi+1WeUemaGeqTy
 O5e1X90OQP8GwSQ+1O1pLSSTHGPfVABg/NWSOzKytNNK8CVbTrMmLPHwAZTp2gssbn3Z06fayAKDxg
 GuTpXrh0m2b/gWmrqxaYDOz30LO2OrZnAZGufIpgiEZhou0WRyh4FmFdGOMeOsIe3mP9H5oKGaHesx
 WgrGpPI7vhohkcivoGL9ksfQ7YFP+fBABfp2a8u97oT2ZJJTqcASilQYZiYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_145407_771260_6B08D181 
X-CRM114-Status: GOOD (  10.96  )
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

The sound card design is based on reference PLL frequencies that
are the root of all clock rates calculations.

Today, those frequencies are currently specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 0ecdaf7190e9..413b47778181 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -27,6 +27,13 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
