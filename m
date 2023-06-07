Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ACDC7EE29
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8Jz/PLmOlSS4zElBHGxPXIIKYGsVZFInbm85BICiTc=; b=Y5rzCFZGbdSai2
	5U2+Rj1joW6sdW5pj03XBmDYRMJ/T+92Q5F3S38oMSs5LTPZZUSVzyHbbTNejN905RABx1iZ7lGeC
	nxBD6m5NVvG6Mdw/JRzrnoovadR41518Y+ioUqHxr5TEP79xJC2aexrYLVHgK2hIFmT3sFKAUvM8D
	yEJUw0TnOEWyJG9vqh8Glh1StJY8ddsXcow896OwIqlDMtPXOOdvKBxVMknWdJtBBCdvo3fDwlKsb
	zkubrNTfrJ0972j6LZK0Dp/ZHholwj4EiFBvsj1SLi7Quh4PnXrfn+JbpfJz+6oqFz8ZkYzDuNb/4
	Hdf2c5YbwcnX+ewn34ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6r7h-005cHj-0L;
	Wed, 07 Jun 2023 11:14:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6r7e-005cFw-3D
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Nhh2pD6FUwpfqM+PflikOwAsazbxvES8HqlJahcr2Ms=; b=ei+rQNLVVcMmUtmYrilIj3dIsE
	6x91BrIMoW7h1taR29IhxTcDkgFOSv+iFX89aXMyuvFqYr9tRw5hrKDDVZ7TjMDvIRrCFQxsZJggU
	JXz979nQHNELn8NQ+xs2qoziBvFonZK3V4tedOi51t7OiEOoYJoB79YOCxWX4cMTZ8jRbaAmkNTKK
	FIdM/PZgbCXHFDljurUKEBGyXwd5nGQ1T6ctBySGmwB+uKLESht3nq1eOFqu/hJXEsGcA1zuqvGmt
	4vgwCgkvJ/iXjNZLRLsqzr8efvLdpztMdUeHTMZRQqyx8WO51AVyE/iu8Qk7XOxu4/awDGBxWowv7
	qRk5xpQw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6qqH-00EBXn-Rq
	for linux-amlogic@lists.infradead.org; Wed, 07 Jun 2023 10:56:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so58715045e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135400; x=1688727400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nhh2pD6FUwpfqM+PflikOwAsazbxvES8HqlJahcr2Ms=;
        b=KFQBr+uH8chocYBPMM7TXYaBgimmZKiLErP8bz4ZHdTtzE9Ru6QWpQATqFwtvuuIHx
         wuc/N4EKx4N8n/hUx8OX1gb0RSFDQXtMNZZv6dmrEs8ux3fguJQQaCiD6yjSzaTTfpQM
         0hMCopgN0crLDUV0OaMQUCdXFouGk2gidnGc4K9tpvd4kkY6rf6UMRcf7t8eBOvpR4Zw
         lCMX07Eq1O0KNj13awuraoSHhWLg9YkFF2oIWpyP27BnFAwRjeX8bMl/y//nI7NoZRb1
         EXBDA3AWjQCcesL+I7/gP2T8ceFUpoYblNMnPrOdfq6yWuH1Tw4fXVz3ip+qCc2ws3wB
         8h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135400; x=1688727400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nhh2pD6FUwpfqM+PflikOwAsazbxvES8HqlJahcr2Ms=;
        b=LIg3cRba4WcJRm0TsNGBCWnEmNoC0ygR98kaNdngIAZycCCAZkyapTv4Da+I+DlSq9
         sDzYb6nGRpAhnPx0xBfwdik6nBWkrCdkNmSey02Po/8+T5OhiGUsr90A+Hq66V6N7JtO
         jUr6PCq3szJZejhzdflkj8nWr2/4T+HgSi/fz1KwZh9tWLHsqHNfoXDQf9Yl/31vNE7/
         5u3iM41yIm7n1efjV0EBVZlUXjLMTBoZYIr8w5E0IghPR3TpiyeV/svSop6HfXGWjNdF
         qZGH4arFTehCPk7JjpQmOKfF6LxR9RsvEvy285IatwWViCdqjqg4E29jPfy69gGQidFw
         U3ug==
X-Gm-Message-State: AC+VfDyKzHcZkUlAXGSS47xkpw5iOU/LFUCnOKJNqAtAZFlvqGnNEqCz
	Xvv1IIWw+CPS9pBMXMe6WE7VcWm3Gg6kdqoGFUDX2g==
X-Google-Smtp-Source: ACHHUZ7eRWZds5eKntMyGFzNnviMEO1GIcs4uQ54WBlODcq6ebb2XHG2cqK7AVZN/geoSptZTB4aSg==
X-Received: by 2002:a05:600c:230f:b0:3f7:e497:aa03 with SMTP id 15-20020a05600c230f00b003f7e497aa03mr3797345wmo.28.1686135400045;
        Wed, 07 Jun 2023 03:56:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:29 +0200
Subject: [PATCH 18/18] clk: meson: axg-audio: move bindings include to main
 driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-18-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BhdgvijRztviwBcQcsc7eiZfm245yvplEhk4v09X2IU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJV2unWoZQB8Is+DP30A/dALDDHhMCVzVvvcFv2
 PGQ/CBmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiVQAKCRB33NvayMhJ0RnXD/
 46MvIaTydY+HcVs2xiqs4Lci7YbjtjKxWp8v6nn0Z3ijGgUXQ8PGeTnbM4+Ey5gpcEQIaM62ERTXTR
 QNAIDhivwi4/hD0woT7niaX8MDvjwyIlJzbHYRzWOPbiTqo9Pv+uJb36obn10GwUay8mSXNwGA7mGQ
 +/L1VIDyDuJyZSOZvxasrx3lG56GBlqD1/q0U96w/uzM4EG9OmcFEnVQfuHxZu8gKu7+xq1o3UX2kQ
 AigSh9oAlIhmHs01Pn5Tpxb86w0uiedQ8s8ADhsh0EaZlN+dGhTz1AMYpxmG5ePNn/63LeAmkJbD32
 15NN24MxJDFTS+mV31gyQaL4+nXC6lvjCCGrRRee8np1Mbg9DUl0++zSUWQn8X7xVpsRB2AEV1C72S
 lHsR5xSUemfAsOgTUcuRLlqXSfJnZ8VcASp8uklS4WfEuKat20B1rxadN5OevgdIbBYg6cu+gWCf3O
 NKELjKEOR+V/ShXD4Vpb3RfcEVsofgT8pnjnn+MrQh+HdNVeCRr/499pqAhH7LYnartj+wskjFdhvm
 USmsp2ei3cpUC7jnKFTgcFOu14M7IfJ8fIASQOtVqrvkS6z/u8+8zlNJA7hCP7FSZs7IgKIdhxFhNg
 AbknKJDrj/4ZgNSn9sLenVJSU6sAe5TtEQCxbhMjbLpz+/PCKzO427aKu/aA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115641_952453_968828CE 
X-CRM114-Status: UNSURE (   9.72  )
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

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg-audio.c | 2 ++
 drivers/clk/meson/axg-audio.h | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index ef4e0552f77c..025cb4efce36 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -20,6 +20,8 @@
 #include "clk-phase.h"
 #include "sclk-div.h"
 
+#include <dt-bindings/clock/axg-audio-clkc.h>
+
 #define AUD_GATE(_name, _reg, _bit, _pname, _iflags) {			\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index faf08748b205..01a3da19933e 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -65,7 +65,4 @@
 #define AUDIO_CLK81_CTRL	0x030
 #define AUDIO_CLK81_EN		0x034
 
-/* include the CLKIDs which are part of the DT bindings */
-#include <dt-bindings/clock/axg-audio-clkc.h>
-
 #endif /*__AXG_AUDIO_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
