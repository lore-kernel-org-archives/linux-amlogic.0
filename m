Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600F1C5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GB0gP60NcwlJBjgvWXz3HcdTi2wi+CejFZD4PbC6TQo=; b=e0FzLqutqUqKKu
	dwfXcMEa8t9xg7C+GYKuakPX44X1PBpxp7xYYvrx/+UCUbfUU5WPCAWIC6Wz556TNml0Yaj4uCOIY
	VnxzgKZunEm1tG7CWU/OorFJq9LSzibwMkzooTLDGaLLWnNFD6Pj9/H+LSPIDpvZL/wQ1UgnMD72Q
	XYRf7PbLIsKIPveE56OVmVTPJiDYU6Gx3tQlGic8oe9cgF6He7pbqTqfdYiMov+GhFXaMmottgBbo
	lVD8jaD3XFPFMSh4ZnS3ZbI5MX4lPk3EQr4Uwck27ihR1KZM5fnzUQ0HBC6v6ShuPyb1dAz6KEC+z
	9ZMPfMpVT1sRjZpdXA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQIz-0000000Arqb-2Fnr;
	Tue, 03 Jun 2025 11:59:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGm-0000000ArSS-3gBW
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so3630515e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951847; x=1749556647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=JYQNwJIQ563LoPfJoefIwGu+hEXLF4rjqykMgcdz06jtSUIHu4AQYfgV5UBaej0ESi
         xK0k3PikvzdZ0/+Gu4BWmY6gbrFPK2TSsxIPinOibuEr421Clk6oQ7L4rP16f82mOvgm
         zLpotjosX+ImqMo7O1yoL+zxlrJ90R7dV0j6zwYkK0qMev4CC6JNiqOUl3VmtTDG8s5v
         8pO/ohV+kMAkrQlfqZIl5kUraQaaw9asWF7By/C8u5gUpMRJ6b30VhU8wkaIBAhjfkIY
         QkSfzyiwoFrPapT1BruZsoUDvzkfwbb8Y7jq0FLYKrR6EZyZAXBVhlnWk5yNf85fhWFw
         zxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951847; x=1749556647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=V6yOJfVOolyBNU2KRq7HVnZ00Ix0jaOZZZeIJLsMwafuRbK2Xk9Hfn1M4M1Xtu/EjD
         LYvJWyvYLS2c5mXYS1a41vINIs00fEkBzrsSpjthSHQy413ZzQvC4DCeh4iIxD4k6jVl
         qm6Uz89Loc5cFfgxHcuS4/VHzdbMxSbbb2iNw4extE0GkjAwgWN0LnaCZnl/M3aMlrjz
         FMDvMMEew/uACnrgYGcVzWjRU9n26LVjS7e0j/TdSJmrmL/1B5XW2KsJybi1htpbLEXd
         xXeCrQbh1BRl5sNekvsDYkyaI42G8ed8jODAUsB4HFH1byxvFBM9BJW2WaPTGYwi9kdb
         VWPA==
X-Forwarded-Encrypted: i=1; AJvYcCVUf48ELRIVRi/8XtzqLeQcvBYnOH+EF/kCDumfLMxEo12w+JTknAp9DKMnMfZ8ecvNoUxl1nQjIne8FzIB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6RAmsmZUmkWcsFfQLbmcif2Xyhyk2MgzV1apBAb2mFUZFowZ7
	vJTMS2X8EJIAtqk8pmwd7M39sUbZS7ZXQW1kWFpwPQm5/vvXUi09MH0lGha4T+IxYrM=
X-Gm-Gg: ASbGncuZJV0udvMqCLKk/cwqMVgwJcp2GTIV/9cLIU1Guxbk41wQVCK740dOPMGB3+A
	grKwXagB4UUcE+8Eg31hWc155E4URenEsKDIUQkD1ng75SO/0Mz8Yx0Ka4xvYkA68BV7g2vJS/F
	6Kvnaxro8O0prHVk4XmSOnJmlRM70fnpnLfxlw753QWkO9JQFC1tQVoB2s/zGg2l2HkrrOqrfE8
	+CS46LfdxRKAxem8ubUm1fTK7tWF3fZAjTKYSUCNOZZhZu2chB2+tRdeSToL0/reIwl68GJIhtK
	i5WsRN/RK2MbawEd8QGQNC4jbVU4M1X+mWTqCUgXaYSj2Rx0hJUjTURIi8EmIY5IKG3o8YAXOWL
	vTmntDCyzhqWtkL5km33cdA==
X-Google-Smtp-Source: AGHT+IHBMSZmFHh0iBBqbg6iYgmvQuQtkRQ7ni42guJxRJHi8RXPAyYfJYKwxYJrmX9gnms5o+3FMw==
X-Received: by 2002:a05:6000:230c:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3a512c032ccmr984242f8f.1.1748951847021;
        Tue, 03 Jun 2025 04:57:27 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:08 +0200
Subject: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
MIME-Version: 1.0
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMafbts+SQHLrCKWoSXydLXFpBuxk4+UMd/K
 nu5qIc0ykGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGgAKCRDBN2bmhouD
 1ybCD/9RNGsVwuWaYUnIhMCF6XOqANSxF4pvD+oiEd/nFdvuoXKyHPDhNDJkzr5JI+eCG+Ub/MQ
 IFPA1Eq4zim5rKSJGghjZ4QRpCKGP/BiC0e3S+lzj0PcZ47Upq2cpIw5uEGa84l7HVOKXzobLHS
 4dtbpNI66GnxgZ1/hAQyG7cQ+b/JVVCKbo1XzHQdPkwO/sBtnEFmUp36ZDI/u9u2hJTCNd9xwDh
 z8DyRDvM8YT02OvK2sUVR4UoJIaFA43uNXyC0U+o2mZ/XAHLxkOL6t9aY9JhZ1KZ+heKhYVtVDq
 jq6Zz6go76ikVf85UUQkieagE/lk1hxHLb8tPkYIOVn2IR9e9sjHN/DFFOa4m725Ke7rxh2Q4FT
 3xEYfP/AU+h/cHPAK8he55zMq5tzMMHeNybBTtDKzJP6gXsE3UrINKmF/MYJBWgtu9wx5yWcFY1
 VYfpQ7cJNEoGpu/gPhFNVgrNwEs9yeRon6WMn3H12OTKdniyzdgIpnJ7JIqajxRgkZkKb7n/zxM
 zAzeos1xnYnl4qwTwwQHYBwmfVZYlkcYcXUthGxU188ahk3mMCNE5DE2eEzBmKlVUVfoGpETAFD
 xe8BwA6xrgnmksHotq8VKWpDAzKd0sqUmepz4DJDrs9GYrxZuqqnQzCCE7b34Hj7GArCuhFFaYq
 RxgIODOMV9Ib71w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045728_922432_C728B5DF 
X-CRM114-Status: GOOD (  11.70  )
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

Lists should have fixed constraint, so add missing maxItems to the
"interrupts" property.  Since minItems=maxItems, the minItems is implied
by dtschema so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 385809ed1569206a7304b777ea42743321c899ad..0849799ee0c5caaeb27fe1e3e3714a630a7c2b09 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -27,7 +27,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 3
+    maxItems: 3
     description:
       Contains the interrupt information corresponding to each of the 3 links
       of MHU.

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
