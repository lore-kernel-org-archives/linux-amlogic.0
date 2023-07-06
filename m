Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85457EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrb8MHA48gu+LKjaQPpzrhmfFNfufTisMLXSI7KzUIE=; b=CH36Rr9ckdxyLs
	7or13MQrWxAtxHUkNc0d2/mHpRWAXT/Kf8inX8FFwayS9I+yzaX428ibInEGlMFrQoS3UxHDb0nDh
	4DqJWRla+DMd2plh2O07lQeVI7eJEX+1dO1wG7P5ezWXrmizUAgK3C9GngcYA7alpZFLU7MG+MkFp
	KJwtCfcGiFJCTRNcwqyTHYT+80LqQUZNzQGOCBZZBq+4/PB7DJuUaAovx50NXLGuvbhbuPCEPp0fc
	5zwWO/1vd1K6Eh5STc7lmPFS7CUCrN7TZluv88W3vahYB0tVLGa0536fQvL6EfVtG8vwA49Ya1QR7
	ZslkrptW4BJz87z2SiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJdP-000phg-1Q;
	Thu, 06 Jul 2023 07:42:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJdJ-000pdm-1m
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:42:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso4132885e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688629351; x=1691221351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbxOrjdHKbXhlnZ+lfNH9KC2jI6IqoLPXw3l3BYO8wY=;
        b=LV5oFIVWpwFHAtWyQEF9vh5vXnXRpyYR6xiAOOJ8SbAYbIHjPP7epD4KgcUrI2PEPb
         mTJz27Bs9ZLYP4Qa/Klt3kmsPjDGMilSlAz3D0colMBTei4UxUgRArdK84Y3fAxzuXPw
         G0tE/y94iFQH9z+Gxc2YvLWST9mL/AvDpEJYj07I0Q8rrCGkovGxqqXMo42fW+JfK0zv
         Wgzwg9idZAKKNq+rQ5zyBA7C1GzU4Rh18U+n7huD+7GNR/fkc9e665vJkv7gXVaaryNl
         OrHF9/CM6pMQ/hNINnQHAboEovs9o65JsbFnwQmi+mn+jhDPuaCEFRYv7rnKfPYkagly
         3E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629351; x=1691221351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbxOrjdHKbXhlnZ+lfNH9KC2jI6IqoLPXw3l3BYO8wY=;
        b=D7gT3isAXCDMwmWH3QZMWmsa1yVO2JUcDAh+Wd09gGQFLMYmZwjZMA1p9BOU+1OliV
         lBBzgwbQdiBJII499ZarFgOMtt5nMC0FlZaM14uQhuC6rspyNjYsx92HEZ3ey7wd6g0y
         Kw+wfWLIJeIohb6GDqRmy3+OKmeumnXP/wwDS0kcce7I0E1t4SI/opNs5qmE6/wu7apu
         WYyk1ZOin1D0FVLwk2yWLxRAc76iMPMaKCJtwe1jwQMTtYFWV/18qoGfHZTbEP6s3Qqw
         vAmbS8oiO/8cG/6STbTkdUHOLz3SXYbjymNQKc8WeBxVHklZAS1Ycn55M/bZdf1ctul0
         6kAA==
X-Gm-Message-State: ABy/qLZw20RletQ3ZQQB5r7jstuPYri4iJBRCRgAZKGjmvYTAL11/xfv
	3bOD3QSs1CPd3BMZXlNvQ5yqbw==
X-Google-Smtp-Source: APBJJlE78Dpcot4yN05l8xxI9dJuyq1KKsR5IHRaiwqI/bl8PWsDff2pYf38Ywa82zxVmsHAVbKHPw==
X-Received: by 2002:adf:e505:0:b0:314:1ce8:a0a1 with SMTP id j5-20020adfe505000000b003141ce8a0a1mr692157wrm.17.1688629351386;
        Thu, 06 Jul 2023 00:42:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h5-20020adffd45000000b00313f07ccca4sm1076798wrs.117.2023.07.06.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 00:42:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jul 2023 09:42:27 +0200
Subject: [PATCH 2/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 allow gpio hogs
MIME-Version: 1.0
Message-Id: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-2-fa442d5aae91@linaro.org>
References: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
In-Reply-To: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=954;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=W+4PTPflVuY/VTPXicH0ipZFRZr1GRfAPhtre5st8GA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnBkxZQgeadpyhxnLHE7dGXL/a2+0lVvPpA4BWOU
 JGKwGOCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZwZAAKCRB33NvayMhJ0ZA+D/
 0S0mjbLMqRomWDtTETONTeNmMXhWFdiOqk2iujAavuJhICbhbBSGXgUhXEH5oOGRmzKySeDSLjBZEI
 JX4vq5OcTI19LQzLFG274URpzZXfXwE4gctZTORzPebDLjd/E3l99I5jFVZGxU8L924zd8PhLI3xei
 VbrhEuOIQupf1teWOzlgilrKUeTNipmnDiuhqlOCak7iHoM2nFN4aM5K7t0S57qk7ZIyorEJhcDVml
 ZfHdbxo81p/pl7vPP+1LxQO6YkMchSAdlAOAELBVYppuuy+udGbSwwqJkQquyRL3t5kYfng4EWVx8S
 XjZo+6E+3P3kQdrqVPGjyiygaOWB6iaARlNFhFSuog854zEPLpyk3pqALyRSHGz1TBFJIQn1tyzs/E
 X7gplFT75ytW1PyWh/tOp3x0Gw1tfVvlk/akmhUitpfCZnxTZDNxRkfc7kd1LlDrgloPiW3JTd0XFe
 wdCN8OcychuGSg8dxvKJmNl6puE0zHHENdHC2p02G2i+Bm3aPey5gZJruMdr6kpyQ0yRxRvHG7I9i6
 kXT6HRG0Wgk3jHr52ym/3H62Bh0zfVYovOp6ZSDUPitWyNCFfS/oqH1hMvbCB+1kwUN1AagsdzHN7d
 cpjd0ays2SRMU3hRJskBX/h3yd+6/g9GW9fFHNP+gpw+fmOSUkVB4lElK+PA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_004233_609968_8B7FD829 
X-CRM114-Status: UNSURE (   7.26  )
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

Allow gpio hog subnodes to the gpio subnode.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index 28659f0389a5..d9a8e12bfb7f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -42,6 +42,13 @@ $defs:
       gpio-ranges:
         maxItems: 1
 
+    patternProperties:
+      "^.+-hog(-[0-9]+)?$":
+        type: object
+
+        required:
+          - gpio-hog
+
     required:
       - reg
       - reg-names

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
