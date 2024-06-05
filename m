Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F126CC25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Au+JE20fqrGXsKDl76PAgC9+HUdeJZ0Q+9ilq394/ao=; b=eis3RflpATtZk7
	7r7Yu0marOeYB6jgf7MCSl8BJOYp6Xls25s7cH+GwsW3qCGlwtXNZcapIA5pA26gPHYYcwx4OZvlc
	qA3bsE1XIhUDJBmq7Nr7A5ix9mbTT+nCaLbkF/b/HPwm8fq3fnYkoZuZGo2cvmmm0LbzRX6mgMex3
	cZ0XQIy6Jakq8x8niHAmAmZQGbukncjGjl4yA1txPZqsJnbvmFk6LpDsufmlKgpsBbFs9BjCGDQzu
	t2yc/CkxMEJGOtsoOKUP95Hnm6o31bQPNdU4ptvNOckF9Iqt0+/aiN9Hum4mwB3DhqzSE4JyGSSFb
	xJZynnlo7gfZ3VQN6BEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn3u-00000005R5k-28W7;
	Wed, 05 Jun 2024 09:36:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn3s-00000005R4I-1aw6
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 09:36:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-35e4aaa0f33so3763280f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717580161; x=1718184961; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvLzM9PWDuCZzQefB2Y3g2EHSJvTBdod+ADOPN2y/68=;
        b=iFCFrirYPlbZFGnMuxRsksSLuM0Ep+J5y7hHtbiPCQDkzvwqEnHKu39pa3eHM/o8xi
         JrMr4K6nfziYIYkfRmAOFO8fGTRgKXIzIEE//GchzHOcUtOkydVe//T4fJjhCgZ1ukjh
         nZ2/AVBu9uDhL8sJ5OGHDa7/0Mx+EkxoMfRvG1PerkUKohCD1MXuN3daqJrgtEUF3EmJ
         ph2Te1izNFhqzfnjwZnWr8PdALzD6EUp+48VBFa6KKmyo2jYB3OOnKm2pKOhNRKwfpm8
         867JBzMsFte9Pea4df/3PSWp4iyJl0wy1a2sug06kpvaGeBC7C2fSNn9NY6c6ECAZ7IN
         xajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580161; x=1718184961;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvLzM9PWDuCZzQefB2Y3g2EHSJvTBdod+ADOPN2y/68=;
        b=BM8eyUdPthQbNsxArisVoi9VkoglOUZ/7HaT5obYZelQFYXmdF5pKg3GBV2nXvq+Gg
         0T7L20/T2yePd0DzVUhuHVAsP1FEzWwK0Xq6E+DVMUO3EZ5OGBNzwUpVX1mUUaH9Jf0Q
         JMYrQv8lo+ehwJJas3QwqOqo4TZreFXs9RKwfpa4neUVM+lSnVZibfHv/LwBjnMcQRxh
         IpXOABUyTdshMMOnVWEjOMI059EEPKFJaTI1PS4c7jEtMhzYjJWAWC7L1D32BAq4up1T
         dhGpctj3rTYK8dW2auzqhCFDzFf1MPSoI+E0o/7H17D6lSgHcOaLRZydcPVZTEmZWkMk
         uSqw==
X-Forwarded-Encrypted: i=1; AJvYcCVgxEVyu+w7IwkFHT5S2nCkuHGKeZh3r4nGoKiD6fQX9r5pamIxYb4qixZGi6WjFCTGyuMF5GGbGPkzxLurpKft23t/mV+f9wQHNiQ54vCNmM0=
X-Gm-Message-State: AOJu0YwZXJji1uMhS6JJc2lmnWiNm6Dr8pUqiRgzlIWoJcVVtqVtbZ4w
	1krYMpsoTudGTpQVSib56YWEE3LkVlt6QpAj5sH/eQVK7w9so6Xe73+a2aAkbsU=
X-Google-Smtp-Source: AGHT+IHtrU1+uKM8tZ8aHtiLuZxzOra0uUBCT7mFMeP5oUJarPdWQFzzhLROAKv0kBYHXRcX992Icw==
X-Received: by 2002:a5d:5747:0:b0:35d:bfe2:baaa with SMTP id ffacd0b85a97d-35e8406defdmr1840962f8f.13.1717580161377;
        Wed, 05 Jun 2024 02:36:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35e7e07d7besm4303860f8f.18.2024.06.05.02.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:36:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 11:36:00 +0200
Subject: [PATCH] dt-bindings: phy: g12a-usb2-phy: add optional
 power-domains
MIME-Version: 1.0
Message-Id: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-v1-1-c819b0ecd8c8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH8xYGYC/x3MywrCQAyF4VcpWRsY2yriq4iL2MlMA86FSeuF0
 nc3uDp8cPg3UG7CCtdug8YvUSnZcDx0MM2UI6N4M/SuH93ZnXApVSak9CzRdq26NKaED8leclQ
 M8mHFWt7c0JdEkk3zFwNd/DAyDRwIrF4b/68Wv933/QeVz+oeiQAAAA==
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2AiPNgYn5aJ9kmyFeJAW+F3M18dv8Gy8FjbR8CZ+MhQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYDGAU1XqPzj0KlIZpjxSHWVqHuAwLj3MQo+kTCmC
 fA4KajqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmAxgAAKCRB33NvayMhJ0TEGEA
 CjSucUUcLIoEmjR2q1hRGOWbefCwLDmdWvKRIPAt4kaVSs9mp1i61naayqw0ICNlct6wrWsH6ZpiqE
 9AdBsWN17df0MP+53I0k6On5hDJgAQryTZ73iXW48oT6HTJFrhY41AYguHchUmhM9fpY7UggYrtGqw
 nerealIaTlYLWj+zQl4iFPhKBI8mWp5Al/tjrzK8OXVQcOjja/6XOhGkyC/KDejjKpSCSzwoN6zO0E
 JFUU2HEz3jiSzjYGE4ehI0gc3n9O8uVN8p32KA0G71eLpBLA1QMoqi8xRqquZV11yrL7CgZFIuusaO
 pL2O+hspt/LpHYBQKnKirP4wJ60QHupYoK44J5vqWLN6iDWa8NU5Ryb1gastIy6g1y/FSmSEOh6b7e
 DBuVG6tBWGzmZygywv92vfxq56u4Xe3nrzhEOM77ODhcrw7CmYKXxOryodjgP0dOAy2LZxNI+fXq88
 o4dgJuPV6hZZv6wui8kEh28f+IJK76l1K+YdA1I2fox56IzjnDdZ7JiV+kOn+jsmaOwJdRZJjP54/+
 D1TeadM2vuJks/ZHLTJ3iLVydnLQJo2A6uWEDTWKzCv5nFANE0pve09r+xLvcsIdWBTHnvsdnGn6Yx
 AqVnEUrrgeUnOmVYrVCAmmuDd+oT/gnaVLX77Ch+gMZP9EFDWKmVCscsny+w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_023604_431278_F6E24562 
X-CRM114-Status: UNSURE (   7.28  )
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

On newer SoCs, the USB2 PHY can require a power-domain to operate,
add it as optional.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
index 0031fb6a4e76..1a0c436b87a0 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
@@ -41,6 +41,9 @@ properties:
       Phandle to a regulator that provides power to the PHY. This
       regulator will be managed during the PHY power on/off sequence.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-fa8d34ea3efa

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
