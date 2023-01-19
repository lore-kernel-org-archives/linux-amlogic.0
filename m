Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D21C46467
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/G1rImrNCWWd43Y4DZaCBKZREJ8e70txbrli3zg4oLM=; b=eVowE4cQR/5Tbk
	wcg2WBATOfkYGmL5yS90cLnWhtwhJ7AJQedn+YgfHmEyjBytt1Y/Xq829vAdazNWmC+E6N0GDfJc7
	JcHMj1TwC2w3HwkABQxiU1QmPysDPxV1eelZFN7gCYCzdWNGuflFg/DMLkg2K4Ah7Kg1v9nUD8HKw
	jz9Ok6dFBIjoOfi2676KDoOoxj3cX0fJ5Q1LF/cSQt4IMUhcMQEzj0EIqXZqtHg8v0CGaHj785J74
	MbLt6m3BzEJyg4klRkeRJkoUeei6L/h3RMw5APw8fYwRDb1bVCYMAf2wS7kylAZ1kv/dPFRAAQwF0
	Upwwk3rerfRF7iE9jrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdqG-007Wyh-1q; Thu, 19 Jan 2023 22:57:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdps-007WuA-Cg; Thu, 19 Jan 2023 22:56:45 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y11so4682414edd.6;
        Thu, 19 Jan 2023 14:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYzf9HQ2zlUGg3W9mPTO46OUelCFeD43C5kDuMpqvvU=;
        b=pXYdwUYtSxHogD1l+kDYFbRzwNvcs4Yq4ulD3fwZgn4Lbyw98DRR0gofVKaHwRMkG0
         Z8eyMNh6IpWlojrx/NZM+QGlLPdl+0FdYBO8Tk6Ruy0Rwd89hEcPxwFUaYDSfA3KQkbx
         wHRI498eygOJOyZN4X8MWR59DKi9RlZg4Lo2AHgR+tQ4WZ/fLMt4USEOGN5LAAPQ8qPP
         bdwD5aTGtJt0qmYwrHpKwi79xuEOnSAWVbmbtBxho2xRCcH9Z8jMsKvdzABF+nWs369E
         0pQxHiX3z57GpBOQI8vOT5nNcqfkFY80f9z9QjbrYrrA+LStNSRVpqVgNNj8l2nsjwXl
         tvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYzf9HQ2zlUGg3W9mPTO46OUelCFeD43C5kDuMpqvvU=;
        b=uzU4zZxGkciC6//H+DCp/C4Y4f1vbJ9HY717cdk9TDeXbKGhp7bhZoSO+8d/1aH72k
         Vtz+6nP/3ytXPBhzssWL0lJPrSy/YX1ZqGie8xuw5zbWFe00QaRdOE01wRaA/Z6Rqp7v
         po7LSEP9bUPiXyQojVnkhHk4T7cmSlrjZIsDt6vodbuElCrNkbvttUf/BRwwfQhT8JYa
         zF0Qu3GngAOubaqu4j+TJiLOt4AzQthApVuXkcTav8N659Gs1/SCutl6Gvb1Mombq5zi
         bLRlYurqIuwOig9ZWWub2n8Q8UsTea9PynVg09a+LO6NWi+6bTfG8FoS84fFV01faILR
         RNpw==
X-Gm-Message-State: AFqh2kptl7u3sosjJgzlxb+mcQ6IES7AcSjlmXNhimAj4VfsJSCo3Qz6
	lEcUm1bZonWh9FkQIRFYH7U=
X-Google-Smtp-Source: AMrXdXtF9IP2s6z+07gKEoKa8OoYIDT6JSpK9fzswy9qaIjIix7cUoQbSi1UTt0aFFRx4FVc8YEs2A==
X-Received: by 2002:a05:6402:448d:b0:498:2f9f:3442 with SMTP id er13-20020a056402448d00b004982f9f3442mr13693762edb.2.1674168999104;
        Thu, 19 Jan 2023 14:56:39 -0800 (PST)
Received: from ?IPV6:2a01:c23:c477:4300:3c6e:3915:fc5a:2ff1? (dynamic-2a01-0c23-c477-4300-3c6e-3915-fc5a-2ff1.c23.pool.telefonica.de. [2a01:c23:c477:4300:3c6e:3915:fc5a:2ff1])
        by smtp.googlemail.com with ESMTPSA id er25-20020a056402449900b0049e06995d99sm6750247edb.75.2023.01.19.14.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 14:56:38 -0800 (PST)
Message-ID: <84871cc7-2f96-7252-768f-5f869208045b@gmail.com>
Date: Thu, 19 Jan 2023 23:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: mdio: mux-meson-g12a: use devm_clk_get_enabled
 to simplify the code
To: Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
Content-Language: en-US
In-Reply-To: <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_145644_481165_26E4999A 
X-CRM114-Status: GOOD (  14.26  )
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

Use devm_clk_get_enabled() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/mdio/mdio-mux-meson-g12a.c | 27 ++++++--------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-g12a.c b/drivers/net/mdio/mdio-mux-meson-g12a.c
index 4a2e94faf..1c1ed6e11 100644
--- a/drivers/net/mdio/mdio-mux-meson-g12a.c
+++ b/drivers/net/mdio/mdio-mux-meson-g12a.c
@@ -55,7 +55,6 @@ struct g12a_mdio_mux {
 	bool pll_is_enabled;
 	void __iomem *regs;
 	void *mux_handle;
-	struct clk *pclk;
 	struct clk *pll;
 };
 
@@ -302,6 +301,7 @@ static int g12a_mdio_mux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct g12a_mdio_mux *priv;
+	struct clk *pclk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -314,34 +314,21 @@ static int g12a_mdio_mux_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
 
-	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk))
-		return dev_err_probe(dev, PTR_ERR(priv->pclk),
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "failed to get peripheral clock\n");
 
-	/* Make sure the device registers are clocked */
-	ret = clk_prepare_enable(priv->pclk);
-	if (ret) {
-		dev_err(dev, "failed to enable peripheral clock");
-		return ret;
-	}
-
 	/* Register PLL in CCF */
 	ret = g12a_ephy_glue_clk_register(dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = mdio_mux_init(dev, dev->of_node, g12a_mdio_switch_fn,
 			    &priv->mux_handle, dev, NULL);
-	if (ret) {
+	if (ret)
 		dev_err_probe(dev, ret, "mdio multiplexer init failed\n");
-		goto err;
-	}
 
-	return 0;
-
-err:
-	clk_disable_unprepare(priv->pclk);
 	return ret;
 }
 
@@ -354,8 +341,6 @@ static int g12a_mdio_mux_remove(struct platform_device *pdev)
 	if (priv->pll_is_enabled)
 		clk_disable_unprepare(priv->pll);
 
-	clk_disable_unprepare(priv->pclk);
-
 	return 0;
 }
 
-- 
2.39.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
