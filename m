Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9572C77B75
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw8TshTwHYgrYk6sHvtJKrKgN+A73WVbUHhr0/rJ67Q=; b=dNY7fX813qASfR
	W1ycPTKCKDeFX+pfNTWMUBMenBJZpLZjG12oK1QYclUTEhk+Fhh+CRwo3Yi95PZAI+2zXAmjXDDPA
	3pbshBEyqB/HW7CkO175A3i9jKRMxrjm22tivn88qpyDNmZxZyL5d1HCPis1BdNTjkSIS6liEsNM3
	hJ6xCq5RAEIdbWjCWYwlJAgyJIPZz2WlwU1NMil4IoE9dJjoIFeGYTNwq2aYRQSMoCWvvAEcKZZbD
	ngacb6RDi7iX66QeIXE6ngAzSceorZOfnhCtc+DNrBgFfDAVHpU6L/y1hDK3ZBGDR0PIWNkspaDjs
	RPaUFBQRammInB3KQC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0L-00C2sU-2E;
	Fri, 12 May 2023 13:40:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0J-00C2q7-1y
	for linux-amlogic@bombadil.infradead.org;
	Fri, 12 May 2023 13:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tU0B69j9oYl9odVdfBAPIMS59aKUXC4/g/SkHuPw6SM=; b=IOd6QhXinrxcmznjk6XIYS7ZM6
	9dxeDVpLyFV2YLVCq+UU9PvlDF9WbMtOqrCw5l+kk4I7uAuwETJRhEUA2pKQKzEPEBkdqYfDzS2zQ
	SaK7fELCvWPT82xaB88J+2a7lJcSVEnOlVAagvOuyEfHKya5x6ixq+VUA1TzNqO7ZO/ID+NJ35gjH
	watsHOMd6F5w/AHXpauyrnIkUjqP7po5twiRRWICkn+DFRPRO2iVDHK4VH/v2fk0yzEK0VOahs6+U
	86oEsGsVfO7aQzqX+A39/BA5Endkxwpz0arTwOoj6h8idaPE38eJ1ktNBJRgGEBRrv8G8TikNkroY
	foXD4N1w==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxSZ9-0099PK-2n
	for linux-amlogic@lists.infradead.org;
	Fri, 12 May 2023 13:12:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d4so70456195e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897124; x=1686489124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU0B69j9oYl9odVdfBAPIMS59aKUXC4/g/SkHuPw6SM=;
        b=DEa+d+uKQoEMQZGIs4gTTO3/X9AWlIU/3Qsb08OsEOQBhbyjHHtbjWpY/JAwJqya1Y
         4mF+izVr5PGl/ffs2k+N9LVtcSr4qARAKN8GGXsfKBMmVeDgZ7zc+1WXgOzwLvwLy1wR
         VY3jucYZBSMd+uRMN+HXUIhlEtXsDsnvKvN5MgAW2Mr8BrEdGFMcVq1HWcrliq7zgJVD
         84FEvJMjO4QjEMBgisKxSQqAK6qQefxO+kfR3wwjROVch7eBWT8QRN6OiLe/7hjFbxTm
         I90p5aWmr3LC9j7g06WfIqFi1tcRw06pH8QMQnoBEYAELhAeN3Y1YlUFN/dLpatWrfYe
         pEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897124; x=1686489124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU0B69j9oYl9odVdfBAPIMS59aKUXC4/g/SkHuPw6SM=;
        b=K3fPRBE5virxm+MASTrByBDZuK7y7ad/nGebAhosJiBn1UGhVv+XeQy7fmT37fhOsL
         CBrIHxCI1vvAIMXMBZaWZbMcZjCVt+jDBe33RAT1CwldgXL41aYiUzIlgZBN5D72lZwA
         BI3CCV4Pl0kCzqYXTIPkvh2SVMO3701+xTkqNiRK0GS2dW7QOWbatVgA+zoqXgWAo2u0
         345iqkusa49y8gCe4cfZD2H7MBApXP3bi7zRGLK9LfA810y86tP51JhffMA+RZ/70HO5
         8/U//6GvLjTfp0gPuQAnuXb57c93FNHiY2llXHebO1lL/k+AJbN0NfDsGBq6SzzWTCSu
         Vdng==
X-Gm-Message-State: AC+VfDzPqfbNiUudaLxuWnuA0OhGAho/yeXqeMZTJDyHo9PTMowQJx9G
	1woROFAy4N8k+Qw5uHYdzAKn5Q==
X-Google-Smtp-Source: ACHHUZ7W/9YsLoXfyrpzR/TWkwhUIMNI3MoJdC2qky03ik8PdsAnXNDdYPZQPGK2elAOg3IC4k1+4g==
X-Received: by 2002:a05:600c:228e:b0:3f4:2174:b28a with SMTP id 14-20020a05600c228e00b003f42174b28amr16472329wmf.15.1683897124428;
        Fri, 12 May 2023 06:12:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:12:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:41 +0200
Subject: [PATCH v4 10/13] phy: amlogic: phy-meson-g12a-mipi-dphy-analog:
 fix CNTL2_DIF_TX_CTL0 value
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-10-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zfbNtn4eYfFGUuzqUqrrZy+ybT8YTEYYfxc76QqCk+c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsVuLo7LVxLSfdfUja2xovTbvm0HNpj1ysIYkBZ
 K/S7KECJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FQAKCRB33NvayMhJ0TVREA
 DOsrTgakHLrmGmB/wyrUhMoEXsbiUZVaeV97gzXwbUe/GUy+SedCos1HUur2UmewFphaZyJe+pL0Xv
 pYIXKuMNXIEQLQM4LH1wUbC8p/bvtECbcdUl8j3T9v50w/8okOh+JH/e8OvCagm18Ptj81p7CjtAt2
 B+podPJKhWvlV32zY9od6Y64uyflWC5bbTtP7iQHo5vTLnkwedbtSfg5aKNcaNb2Ibg8MDP1IHFJLq
 RP6wAGI//oUb3XmJ6kRtVCvV1MtcCwp7kk8F0AjnJ+hj8VpXIGQ8kSyxrlCk7JasfbudOpGlYMiX7+
 BWmvwaPjr3tOmUPAKsV5yzVeqb1ZQwvBJD8NDoemCvCW/4S4VRWvcg4caMDQCedK2/NZowXRP+LUzD
 uTq/oNzOgfgHSMlRMQhLoBhRLs3NAcukf7RbkNejIA4UnGZ967/URvq+tpFnXw4KW04PWsP6dbFIKQ
 h7iQD+FNh7PS2cAICGSV3G9duG0Is/ZsrU78dVxotPqBIQcthVuzB524J0T/fooqK0gYdG3LAloQXB
 q6pURKiBKYM0eglBEDUYiKDuqLVWo6QWuykfhtkAYYtUbJgDddhhe9Yu625L8uZlOGPnDXWRuYkXCg
 E8NbJOPkv/k7P0GWvBJo2joJmh8z4HAIzEau29jrsfXk7M11F/h14v/sDdnw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_141212_025393_87818118 
X-CRM114-Status: GOOD (  10.53  )
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

Use the same CNTL2_DIF_TX_CTL0 value used by the vendor, it was reported
fixing timings issues.

Fixes: 2a56dc650e54 ("phy: amlogic: Add G12A Analog MIPI D-PHY driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
index c14089fa7db4..cabdddbbabfd 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
@@ -70,7 +70,7 @@ static int phy_g12a_mipi_dphy_analog_power_on(struct phy *phy)
 		     HHI_MIPI_CNTL1_BANDGAP);
 
 	regmap_write(priv->regmap, HHI_MIPI_CNTL2,
-		     FIELD_PREP(HHI_MIPI_CNTL2_DIF_TX_CTL0, 0x459) |
+		     FIELD_PREP(HHI_MIPI_CNTL2_DIF_TX_CTL0, 0x45a) |
 		     FIELD_PREP(HHI_MIPI_CNTL2_DIF_TX_CTL1, 0x2680));
 
 	reg = DSI_LANE_CLK;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
