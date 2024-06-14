Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F1EC27C79
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhb5XkFkjWFMnY3S0eA6dQlaqmT2TIVXrTUAdOx1cjc=; b=4tk2ez/qIN3Po0
	tWKQubYWG1g8obUE/AEzgqCWs3he+zM37x+S1YEbxXPSgoPRkehhhec+Nl3/G6nlBhHaN1iqibDqf
	rnXrCgtTS/G1jNN6JGl9YXY7w0T33Wg5+JF/aEJtcLoN3c2jwNgf/8tI5m+yA/wWtlWOecYphTzET
	8srGNYrXeXo3TBXhPrsc8Zq3ijPvjMEyxYSPTD+7pKUSigTvN/r2oosyBhM4NrPK1A96ZW5AOWAIG
	HYEpQi2r3G5MPED8+jVdJxQykzsZt+JKXYpkAG6bbYceS503ZOEeEQvsCjUBqv2gKu5+iqYGAqwDL
	ERIkgu1zAg/pL4oVJM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9iy-00000003Osw-24sj;
	Fri, 14 Jun 2024 16:24:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9il-00000003Ol1-0wwf
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 16:24:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35f2c0b7701so1454997f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382250; x=1718987050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ms3akv2NcjLsPvbUoYiATp1OV1bkvK609lQrIE0+ce0=;
        b=vxNuxE4satjCQMIYvZhLAQ/P5NYJXBY19FQrwJ+54/2mjDOPWsmklvYwgyAEok1wc1
         Py7G09v+FVZuD9OEaFf2nhJ5Bj4F8mbhN5X6CGvwFzhsbsFLFD1NanJ1pRGaF2aVX3oj
         G45etbfndMPsk0A5THvb2EHrabcwNdpj5Y9cOTyDWMK1G86lP1ci50z4cBR13Fc6n9B0
         AbKPhkaUazVpnYvSBRfkA/sid4SixtGlPEBztNI6cQbsiVI1fxwPHyhkMcTZDtr3ZqU5
         ATP0GZo2gP7Pv27rjMWrx3uxSx9HHS99RAETVsAeT0/xtMnjkOnsqKui4zUR4JGOQRhS
         xg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382250; x=1718987050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms3akv2NcjLsPvbUoYiATp1OV1bkvK609lQrIE0+ce0=;
        b=Agm09e8UGzbU3XK+g6skrwqM/Pgf2XjE3v9o/7x1+k4z1P2yiikI4D6qAr3/TPNsmF
         8zroxrRhbnXgrn24da04VF2CLAA7gUrXM6Jj0/H7StODj2h0mkvvK/cPf6C/HjymphYT
         k8WhpC2p8WXQecC6bXI3FwqUAfMrENSvSs0I4GCu9ozMrI+ufnnHtMgid9el5xFY+awP
         ADuPbfXgF5XPKkExMd96GFaFDVC/UtD0Gl6Xbfd7Gi8hQd8jysNeNo28k+l+aTR15sNq
         On9RWIaIX8LmvzQd5sa6blbn+CnR9w2IG2jpTGDW27Uapy7wa6cY/3pWWt40yXYybSZx
         KSHg==
X-Forwarded-Encrypted: i=1; AJvYcCW2TvDShNpRzAJxzh8WIKxoEUxf7tBg5UP2EVJFtcLNqFzifjE0I3rD59uAkM0+Db+eCWZjri39vGmvqCYcvHDOiBKLSm5z97n6M5X/gBsPxkY=
X-Gm-Message-State: AOJu0YySeJgwnc93M/bGYitotf1noXQDOEwdDQNjfcnUUiuNACIXq/ot
	oANqUyxC5xTQYiTPNTeNBdU8s3+u18Dbgp7Ka//w7XkpMGSbA32nnnw/6q6gzWI=
X-Google-Smtp-Source: AGHT+IGubE2KBTAuJluvEZeX/JZ1C1o/BuDtJFqq9WxuCqZs7reywce3tZSwQNvzmAj/9g8N03KusQ==
X-Received: by 2002:a5d:4b4e:0:b0:360:872e:391a with SMTP id ffacd0b85a97d-360872e397fmr482102f8f.16.1718382249730;
        Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 14 Jun 2024 18:24:02 +0200
Subject: [PATCH RFC 2/3] ASoC: dt-bindings: amlogic,gx-sound-card: document
 clocks and clock-names
MIME-Version: 1.0
Message-Id: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-2-9f57d9e01834@linaro.org>
References: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
In-Reply-To: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nDYX78s666lmvDzBJf45D8iEKOdkkaUkatUIYyWZVnU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lLfrAQbnERIchEIXh2IvUxxAmbWE6wnoxfpN0
 aW/iCjKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0a2hD/
 43Zo1fD1Wz3M0L4WUEK9GJMCkzoW9XuWapOWFR60gH6pkFJMo1Fi/AKl0lF2M5/nh543sZN5YPG6lU
 QN7x59WZJ/uyuH8LDSrv2TE+c3yYs9l0F8XIc18gxVZpQAANDFPEdn+LIN71aG8QdVIbPXmMkS/Alt
 Ytftz2OGJ2/kbcNasK1Quv2oD42dTOx0oJ3KxwXyUgmM4Y/t6vDISq87aT0glCnR1qIir2LYeYOucV
 UYqY8hLOJ8nPXRY1ps1rAPemUikvFU043nuWhd0riAGvQ6XL9GR95qLYFBHYrwNYpunLzCp8MVfWvW
 qY5XgJD5ityLHxy17MLOXR3tm8j7yoTLXyfgfKO2/draeksgj+hSQsP0ADZpp8G1YdSo3NoOkkmJv5
 1Gtx8nC5gK4fQeTcMfEZe7WRLlzHPTNb5TODXzYt2kwTHlfqaGS3IQh5I/7XzJzliH9QjPR1Wnj30H
 ebu3jhZyWdvRDiY/0SgaI3IJibtkvjlhkj90PTQMc7tLDyUW9hMMkfkBQrBNvkoEe8wPLOBhJfZ7ZC
 ZM37Bm33KJ84qj6+9xo0+by9yWwDYhKjy2etn4ZxjdMhWu60TJVEt/Ne0uiHLe21aM3L1XvLQlOurc
 SWXEv60anpe89DxwdaWuQ80YQK3PTIJPgWisYRpS/dEm2QXbR6zZaZqI2RsQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_092411_412477_8D25B872 
X-CRM114-Status: GOOD (  10.51  )
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

The sound card design is based on 3 reference PLL frequencies that
are the root of all clock rates calculations.

Today, those 3 frequencies are specified in DT via assigned-clocks,
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
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 0ecdaf7190e9..d29dbca9ccc9 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -27,6 +27,18 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
+  clock-names:
+    items:
+      - const: mpll0
+      - const: mpll1
+      - const: mpll2
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
