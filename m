Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B76C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM8xgga0GmCqg/XgqP0/kJL/HiEslHK4cXZH1Oq3Lm8=; b=RglbsLEeMEHvCW
	S1FtjfxPkubFwLoW1JVG4Q3DBcVNra3Lis8jQV4RSsFuy2flO775V/YQZLXCYkCZhCTV2qCzW2IqN
	vwhhrg3OBY5fbPwsMMlRWK3h6ROpLxEmkCb8QV71l5U8JanoIM6Cy+ZUGpeWknXmgRxYswxiF0z2B
	O11WwIvWdJeti06ya+KUqOAuNc0NXeJZ2xFVUKbpSHlHxsaUfiyzSA55B//CbfFMXoeI7qrubfEYA
	/tyYCoupHgB2JDtZlS29idDQ0FtK3pishHCjOcQI4FJMBR8+jtCO8S8QLAHjvv4JJnfnAcQhk7QS7
	Sxc3jHfIjUwbx3xS5hLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLa7-00Dpxp-Vq; Fri, 27 Jan 2023 10:03:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLZK-00Dpei-SM; Fri, 27 Jan 2023 10:02:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id n7so4476372wrx.5;
        Fri, 27 Jan 2023 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVjNs8ApiQ/q6Yn0xoVLNbwQz1nduDbWHI8WGclaVYg=;
        b=ENBAfKMwVYuqJWFy6oHCDHqOaVxIZ+7bd82RfqrryF4RV18JDGMgeQv7OfAgDv3iPl
         2YvQ7l6/X/sPqNrpS+Z7cqxqwINwNtdw8U8f12NCQIJuNZrHvHBk2ieXUc+5ePyzoFu4
         XQfaL2V6VL34lQ8bJqXt8Ge/geTWYAQSNGZdzyx66uNqJBIFdiCuarGwaXcD+Z5/Fn73
         7z0bwUu2eGP/u51KXdY4mBjuKsFTVjIbdyHtv0k6ywlmUzUjPMzSjEYtP6h1wHXf7znp
         98xXZWlWdrraqYsQOoiA8IN0XH4V5jD5tdds3v99qacADoVaf2Ho+BEvSEd1nAm4Vtls
         qCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVjNs8ApiQ/q6Yn0xoVLNbwQz1nduDbWHI8WGclaVYg=;
        b=ZRk6QKcnXa7lAITu+oxn6gVjXSzqkp6etwl3C8eulFUdvd674fhMB9AjXtkSgf0Q/I
         1GCqaORgp9o9RPBEpERdGbyZGMyF1vONEIXi2/LSnotBUivY0CIjaXKsRh2UM8lFFiLM
         dYVKFvz03lXZ7XQFmFi2GXolMiXhnJMmT1ASu5g6RLK3uVNw1A4mi4PBQihDV6/kdksq
         EyDQaECRhne3SZ5Hh1xU6KBFlU73sbJzuy4xkeNleTf8SToqItnHctUDG4y+AeO2fNYI
         a7s1DtZ/G9YnhqMuCLZgemy/hBDljEn90YMJ49pIVfdTf1ATiPW37ek1uSK9MnySBJX/
         31eg==
X-Gm-Message-State: AO0yUKUZw7PoqvBx72hKJrwxj5vvCDDV5ZJScwwYqyg4NFCuISElcBn5
	1qzh5mn5dDPouVCeAtQpyZw=
X-Google-Smtp-Source: AK7set+o2e/q/0/mxVxRI/tuvZJX3Fc0uHM/KRU3TL0Yria4HgEzC+zBCGB11NLZglehk3lbfjREFA==
X-Received: by 2002:adf:db12:0:b0:2bf:c518:b060 with SMTP id s18-20020adfdb12000000b002bfc518b060mr5128556wri.20.1674813768717;
        Fri, 27 Jan 2023 02:02:48 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm3493858wrr.98.2023.01.27.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:02:48 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: arm: amlogic: add support for BananaPi M2-Pro
Date: Fri, 27 Jan 2023 10:02:35 +0000
Message-Id: <20230127100236.3385154-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127100236.3385154-1-christianshewitt@gmail.com>
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020250_963843_CF074DF4 
X-CRM114-Status: UNSURE (   8.71  )
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

BPI-M2-PRO is based upon the BPI-M5 using the Amlogic SM1 (S905X3) chipset.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index e16b5fa55847..e935c92ab346 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -176,6 +176,7 @@ properties:
           - enum:
               - amediatech,x96-air
               - amediatech,x96-air-gbit
+              - bananapi,bpi-m2-pro
               - bananapi,bpi-m5
               - cyx,a95xf3-air
               - cyx,a95xf3-air-gbit
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
