Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116BFEE49BC
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PonW8+IMItHym2en9A22h3qXFJD6qXqnreCDYumf1hw=; b=Ifb5Q4A4g9hdjH
	A0gzrg/6fIwjc1bndYtL6NOA8A+noK5oFQQisgJaY5bLEDd+zbgow8TCWrTWMOv5k28eu5RIlfwYR
	WgRblZV41duQqbwBovdnYz59ZekeaSHVI7OwAFUs6dsXbdOeuBiCzyGv6talsgec2GOb1PJrzwSBQ
	Buw+biKIB1RrxRRNBn8axgw1EzHFCVIsP72z/TDf7lQrwkRwBaFOcoZyUzRUx+JQTCNrbKsZFYK2X
	NYTT19rPG2+uzzBEpv1J18jipzO7sBFLMGDGE7DVl00jhmAz7/B0Ll7tVixzlW5/yhEsnZC0KhF9q
	vDnzt72hpe4jPlnxLkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPFp-0000000A9Lm-0lE8;
	Wed, 11 Sep 2024 15:27:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPD0-0000000A8fI-3lec
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 15:24:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42bbffe38e6so54219925e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068281; x=1726673081; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+mCSuRCrN7G0xa97gx2nmqcmwFAHLUOOdWHh3hum0Q=;
        b=xDf+vG528LckFRrHcEomWXhnu+nIqcoFj4tp2OnfIcw85XoS0MiverUrFh5OrUt5sI
         3+QWFeu0wMZsTOvEewlmKfdGEb0w55JgemeRu0Jh5ms/TdKk+/GbYa6c2uzCwED+ehrT
         j1edS6SHk0CxDAyBrHBOWTRE1KNnDme5R6ZB6jPGX69r1xE1mz3KPqjfOO4Yj6r6KC0b
         7Y3fpBJadxF/NyyYw83wRGLmARdbnzKlOF1jc1OKk1ZMnZDGPSpEgwHAUAQj/ePI9+Kq
         gK8ZELnNZU5PfScgzjlIcIZDKNvpzJzSu/PE+Cs6rhM9FDLBEmCZk2Svd5aoOkV2Pf7W
         Ekww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068281; x=1726673081;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+mCSuRCrN7G0xa97gx2nmqcmwFAHLUOOdWHh3hum0Q=;
        b=wWvEQjGqUgkW6Q1rTvVOyu6IXUEbv+wFNW800d0mksnEr4+vIjWMB98R+LEwEopoyN
         Yn0bx7GfMP4DRqUTAIJtHuoM1n0TMmCHE4QfPZIId8pjwm5iPaNduptlXhX2w7kR88fU
         oMVKU/gSSiNNT3BrGa2rXKH/NSWiyiP9AOGQQ1zWWS2eJolworTY90FE+iRRvbHPK26b
         7jlJ0Kefujy/GScGw9JYgiF+6vpqy7sWUyq01WFkqmgETP/8vH199016pAjCCrF0OyQo
         HlRysorqSHbBopG6fEXQi0VC4aw2uzOK+GBgflhL/I6d/xeX/774sdufINXivOKIl9l8
         5Ikg==
X-Forwarded-Encrypted: i=1; AJvYcCUbd5NGdYBLRzk8n4fXSRv8rV7Ig/+K0LsGboP5UnAC1tudtVd1TYO+OA3V+29GYnD9F6gS/esd78cMCZvv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywum3rk4JBsjP6tm2O3uQ8zJIbsiBvY/tKwS18h2IZVsVGOanaq
	x3L/UrUOhbVim+CLvoIm7TsaQueOgygb5uhlVNHL5MNhpgKvqwvdzR7KFL3DRxc=
X-Google-Smtp-Source: AGHT+IH3bhy7rrynnSP3WCYSZqF6fCC6X1A4QkpxIgE9RiMpq1DgaTlfKY5xsL76vGVw+m2ARIt66g==
X-Received: by 2002:a05:600c:1c86:b0:428:150e:4f13 with SMTP id 5b1f17b1804b1-42cadb6a2d2mr113109605e9.33.1726068280849;
        Wed, 11 Sep 2024 08:24:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca87acf26sm164304205e9.10.2024.09.11.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:24:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 17:24:38 +0200
Subject: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
X-B4-Tracking: v=1; b=H4sIADW24WYC/x2NQQrCMBBFr1KydqBpra1eRVykyTQOJJOQiSKU3
 t3o6vP4PN6uBAuhqFu3q4JvEkrcQJ86ZZ+GPQK5xmroh3N/1RpqymTBxJD8b0scB3hlqQVNhJX
 YEXuBjT4oEFESQya2tQTwmRIEYgQ27YFVz9MyLZfRbbNqvVzwr7Xc/XEcXxDCTZObAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hyNz8ycs6mdBf/G5zzSRFgMbH82N2rmJ36hb7hnbrjo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4bY3y0ovqRmR5JO2MMnOOjcrBM0eWoMKWJwlSyd0
 hlhIkq+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuG2NwAKCRB33NvayMhJ0SsTEA
 ChLVb5KP1AYQAi2rQoRidUAiaDPlgHeS81UQho+taQxth0L0CQTdIDznKwGqL9ptsjlSjpfFpZJASi
 U/wVhjj/MNbUrdJydrcqzne6gu0uxHVS5m5L7HpZGcARVuMIeDk9DQh8LtLvietA2OrgfjQbhLlDcv
 0I9qwNd0RXFIX/usl7SdgVEDQ9dc+/2NIJj+4x3FD9/rNuEUMzU16Ycm3+mdw13BoqEfT2o0QcgL5N
 AIF7RVx3+aHULmADabg6URgZdv6alPYsMLxTTrdE3e4eujDVt/1Es2n3gOn7cch0//Dx8hThN/bMNT
 Wu1q5Y8uQS35+wkIeRfzRktsBuTfae/c7VhTN4unJcwtZIbajnCpL3DQjr36W+uxoGAGJjQhyb9BY0
 QmZZnQ4Qxcev0ScWPo+5Qnik8PXEAzmjXWeAdac7Gb12FAGRvsJxy6mR56Q7znnE/px5QZl21tXX5P
 7wfddbkDsaUFZfAkaSzs9xDZnRiqtK+yGQyZ3dZlG0yr/VQ5sP9mdjnWVnJiJo4hZPF01FLbf+6UCx
 jw+LF+ja3NYCCO1Yi0iYKEX5LyWf2uFsRU8djB8q9B4U4fM1qLrk2/tAJ3/iUBrJMl/9SdVBTnwXDp
 XsPadyeH8zxeY3l4NZy4Nq10tcrFuFkp6Nhe0SKiNQ+MIjQxTxqLfnYKB5FQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_082442_982907_C798E682 
X-CRM114-Status: UNSURE (   9.08  )
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

The Amlogic Meson8b SoC has 83 CBUS GPIOs, thus lower the minItems
for gpio-line-names to account for it, fixing DTBs check on Meson8b
based boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 412bbcc276f3..c954761e0150 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -46,7 +46,7 @@ patternProperties:
           - const: gpio
 
       gpio-line-names:
-        minItems: 86 # AXG
+        minItems: 83 # Meson8b
         maxItems: 120 # Meson8
 
 unevaluatedProperties:

---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-b17585863df7

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
