Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFA9C27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UK1jdgtZGy5a8WtT5ZyxoGzvztsMTZb0d+LqAWwn8gE=; b=oyVgZQDi91LtXk
	o1/5hgv1dEBeUD7xN+qaCMpCRWyfR+p5SO/fOwfo5RNUMguU+9d5D1tAS+4g8+xIMhW8meGvczToZ
	p10kbUlxNdt2Y5xtVOtA0kSHTORuD2S5kkh8beSpK6CiH7Shy2YDkgsaf6qRFBZQWDk/OqGHbWqKM
	QPeGi4ug3qjBNWI4/bGL2MtXAjOupdGf7Lk7n14akwkvpgatg2LIaiClxh8bwMHKT5R6RwnsmLnHt
	JQ4cyS364qXoFLUyM7bSuToDvphSkPaIg46sSgXFomQXqjzj8LIuH16VMIz/YXyMC2AxxdSdDSAHU
	QoXBYjf1HirK9Sos051w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn50-00000005RTJ-3j6m;
	Wed, 05 Jun 2024 09:37:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn4z-00000005RRx-02Dn
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 09:37:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42155e7084cso8049655e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717580230; x=1718185030; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSZI+79Ozf+tLjEjjKM/vl02OsbKzTxtYkNCBqG2m2s=;
        b=wY1Wg8EkEmUyCR2s8Ou2TsLnpcTj1X/T0xjiuCw6zW9QhJ7rHWxFWrnKTZf9xfUu22
         mN5BH8H8zKoGu7JPWbvXUNN+unitc7KzbykfwlnEc772kXqFNIzzw9tohTzGQUtSIlEK
         zLGF9foD0O9aIS2LtV5t0P2RSD3mdBGkFmZiLa2WBH4U8AiRJYLgLSmqZUs7oQgBbir2
         hAdg7Dvch9w+iqSgsgdd95blAJ7KewX4Iorc6Br2q+5WgM0ZfS3QKbyqQpxT6a9ZK9nj
         rCB2O2TSMu+GjB86XVohmPeYzac5GOE2VhfqzkAEaYksHi/yXwpbTBLwL2YEVcpqBULe
         XZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580230; x=1718185030;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSZI+79Ozf+tLjEjjKM/vl02OsbKzTxtYkNCBqG2m2s=;
        b=HhcJDb025DmhhrEGBbWCnqXupXZlqpVsYYMtmDfFOUsQn2O5ku4ZJRjjO2l7/Y4I3a
         xthlLTJWGBPLe/tCgvsmEE2+q2N0D5MXt0MeYcRXUmATMcn+Za184dFwVx01cA2nCs74
         TiSQH5a45xnhL2TYvtok78KJDZY6Y9Z9Z//S0HwZRR5eC7S1ZUYknK+XP8mgSxl8EcAG
         WF4SbQ0Ym1yE+5bmNle4r0Kslyks4chGHPWCykfmPm61E4KzgoPFYfZ19+bxJIqOABeo
         yzi8MBTT+mGqIRUB4G0A/XxWdWHco1cHljz46WMe98wDq3LJOKRsxIx5/CTyc2F+rEmw
         +NzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxvbhcwHPlsPIbcjDrM3pIbq/oBkU8cpvvLlYRFSTbrBpnJJBPD8shlgFlG4XuUQOcxRLiLEiyVoNTPRK4h0yJDdmdJAzm9BBgbnpFEReoaAU=
X-Gm-Message-State: AOJu0YwK7vMgJu1zt6Y/VGrpHlNzQkGtPwGlLA0wxFa6Und5Ll9iW02P
	vATWmIzGh+fiQQDT9S8SYK/3+SZQ/l4A3/Q3vNnKDMUxpKy+9k4BVddRPc32zgM=
X-Google-Smtp-Source: AGHT+IGAjFy2U1Sr+dNT5Lezmn24SCXAPKGBu2lzxTmKU5abNAvO1losuUJ7PfnTYXCgDx0HUW4r9A==
X-Received: by 2002:a05:600c:46d3:b0:421:2adb:dd5d with SMTP id 5b1f17b1804b1-421562c7fa6mr15583975e9.8.1717580230396;
        Wed, 05 Jun 2024 02:37:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581016c6sm14510245e9.3.2024.06.05.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:37:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 11:37:08 +0200
Subject: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: add optional
 power-domains
MIME-Version: 1.0
Message-Id: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMMxYGYC/x2NSQrDMAxFrxK0rsA1daerlCzUWHEF9YCUDhBy9
 5quHg8e/69grMIG12EF5beY1NJlvxtgelBJjBK7g3f+4I4u4FKbTEj5WVPnq9miTBnvUqKUZDj
 Llw1b/bBirJmkGBpppAndfIne84lDOEM/aMr/uu/fxm37AUJHyVSMAAAA
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oi2WvBkcuibAfXOROdiAwxHovEGXU0w54vU+XEWreVY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYDHFLxSezg6MSIqYHnt3c+yfTVn70mG8pfNZ2oUF
 kJzSJT6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmAxxQAKCRB33NvayMhJ0bRND/
 9VWdftl4+ZipFhnGlqNjNwYhnqAPXR3Z0dbtvuMA7h/YrhUWK7oCzAcQM/xI+XK/HfPi9D1TKdstU3
 KL2F2FexCIHybxIBX76TWWAdT7C/hN8/Y9zXPj80wZLln4S2POzcAjiRRQ89IjZB3C+8LVDApKR/uC
 fozYKf3ofRX8YJXg5yojKqoBcB2wH2JOysdHma+e6i1JlQs6GSa7SS6iBwyZhFena7sh+hqTu+N3NV
 ezXtvolX/8fA5N7H4u0q2se2jxPsxqo4jc5awmDyLlcO86DSh2q8rK5E+fqB6I+hN4Jta2oj5WQ6fO
 WrIU1IzJXu9q84bFBPfeOIRXOaRI4UT/D7oC3NysuOYVNKHFinu6hshbdTcyQMsrICWcodXvAia8zp
 rfrdHW+tgck335MYJ7X3uTJXztALrOhB48enyC/8pk/eTzV+VyIJ3vf4pMm1CUToJEihZET5y/qshi
 7OWOZHGeOQSt7HQusRVZTAkmHx7tktOa0IPSKZd6essrqWBLamjpSD6D7BN/RJegC040YlSBV4Hc4C
 2/lrsFupoKccNtpaMrOb8djrXYpMF62TNkmRA5cCP/uUg51FfU9tZVl0IzeLwi14VwKLBkwFJLHg0j
 i8AcF8M73dcI7L/LbXTxXYzGYrLXDueA0365BDHWLs3FGCdHKCVkuyqzZvow==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_023713_128218_9CCAB629 
X-CRM114-Status: UNSURE (   6.81  )
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

On newer SoCs, the SAR ADC hardware can require a power-domain to operate,
add it as optional.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
index 7e8328e9ce13..f748f3a60b35 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
@@ -66,6 +66,9 @@ properties:
   nvmem-cell-names:
     const: temperature_calib
 
+  power-domains:
+    maxItems: 1
+
 allOf:
   - if:
       properties:

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-0f9d22e7e558

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
