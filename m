Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21E6C636CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Nov 2023 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BrOhTTMiPDRdgCp+uukGwukf9JFr3VkiYnO9IuZmwA=; b=wY8kf3CmwyukMD
	TnsP1WEqNNrOU2NHcQYMh/1J5EApIRYdHipk7jBPIrNLJ67crE1fO1UW6AtttmSZnexlSder9seLT
	W7QyaR19eB0VQv3en3Y3sBKAHAwHBcQ4wnGcLv4IccdEquxlvzfYC+L/Ww+gh0O1Pg90SAkwNwEAG
	oHlYEnGtENqDnM+cMsrJUTZcNCaX9GMf0gHp1kMFcgMwzmU7m/CoGaG85A/SzYhW1QLwdm0toH8O9
	RKZx7fRsAxofoUMj67MDENXVMFGrGYLCp+a4Fi8pkZLL4s4pHnZnoT/OH1HzcrpqStv2Qv3elG8F9
	UoGDdGzhFxLhtHdQx7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6COk-005Gv8-1G;
	Thu, 23 Nov 2023 16:17:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6COh-005Gt1-0H
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Nov 2023 16:17:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40838915cecso6814465e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Nov 2023 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700756265; x=1701361065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1QWKo5v1x3RldbHoETv2ObEXLCGaOLMr/Qq6NkPTAw=;
        b=dricHBxn2Ohk2JHUucwwJ2yODMDZSr5aCIkmJaw+tgfwf62U1qL1hR9mCCU+oPD2fs
         iP/bq1PIoyo0DUGJrAbtmLXIkyJ8jwtsRKZSQHWF63IP4HN2s7ZBcmKbzW0YIdBRH4Kb
         yjVFvhhlUxMrH3edFf9AoWxEtI1NqL5abjWfC9OYUINVgVEq0lo0EcHsFFTbg36pfDhl
         TCa/GIJwIHxyuNCDTChoO97UeWjpZcSyEAolZ4qb3tkwmsD1xxGNg4loC5z2s9bJQ2Jg
         Wckmw9J0oh6et2M5hvfr9tK419O6JJZUD0iAgYi1rWZPJXVTUYUPFzLfG2kRdGrKy64H
         Gnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756265; x=1701361065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1QWKo5v1x3RldbHoETv2ObEXLCGaOLMr/Qq6NkPTAw=;
        b=TnsISdicwUhmh5VguyjacwkD3rhfMAKiOsxNxVMaoRlut2sH9LVoeCAzLN7e01JnXh
         ZZby2WBPnEpT6GnGRy/6BQcXajO8imI93GvpbFPcIIIKTpWNlI0aY3voP+nvCFnZWBpo
         acwesdOF+tKqlDkJMSqZEyVdr7tC7MBnMPy4LyjIgNjKS6hZvj9OoeOf0NuAp2j+p2K1
         FX/EDWyDRamau4Gwn4iivPRqX+1nSsfxpEil2oL/hQBQp5Eze7TqkyTwkiF3VioYVc/7
         ZPxCjBNW0YqpSSx9c0X6INOoCMI4qLm7t44rOAgHKW2lEBG8iyLoFhABND2OTeNGfGAm
         Y7rw==
X-Gm-Message-State: AOJu0YyLxys4QEr/qdmF3R0jJOAcEQHXzW157sq130oU5MJnuA12JJgL
	BxVy9hX7e7VrvBO0n6UIMEDYdw==
X-Google-Smtp-Source: AGHT+IHG1IHPzr5+pbBp8rozL88cTH/APU9g55yvH+q/8GEbtJ5D528qSdJUOc4Q7WvVqxqFHAVyUg==
X-Received: by 2002:a05:600c:354c:b0:405:39b4:3145 with SMTP id i12-20020a05600c354c00b0040539b43145mr75899wmq.2.1700756265210;
        Thu, 23 Nov 2023 08:17:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y3-20020adfee03000000b0032f7e832cabsm2052748wrn.90.2023.11.23.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:17:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Nov 2023 17:17:41 +0100
Subject: [PATCH v2 1/2] dt-bindings: power: meson-g12a-power: document ISP
 power domain
MIME-Version: 1.0
Message-Id: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-1-61f2fcf709e5@linaro.org>
References: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
In-Reply-To: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=643;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TxQCQp8KexETWz0DJ5Ct9muX5KYY3F1pMZr7p8jc1eY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX3smKF0j7nA9VBHAoArGETDgFABLBq+akOAUMfBw
 jks/YGWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV97JgAKCRB33NvayMhJ0c8+D/
 95IVvCDmoe/Lg2/8P5KkyobwLXAIcequgCcdntyasiSIm4J1E1f86uko4BSsU5yVlpIaaTRrQ0N/3R
 y5hkNE24ppDxdjraw/K5W7Lu3ooELU0qiCiLJS46My/En8UXBv52LSI2RjzUA+IH/xXswYlvt8/RZj
 Cj1BmDSFmVewFPyctRF5r8YtaEsUQMhUd6lOxIP1OFE02wlQdklaRnjGH2DY6D4iFXg+NMwGUJ1Kt2
 eygrQ7B8TuV5alfnzgQvPvwBCws6dXOzVnufEGz6NcoZJoxCjcy+nLJhWa72KyVMFeiE0XT3x0mtC6
 Ru+l9E48F29MPVit+ijBGu1SkEfaL17/yqs5vJ6S40N+MfQ1Ta7A2pOQr855AsXn3ZTHPX1Vwp/FaK
 5rspfLzkyL7WvQXVCGbK5C4/+i5ltdiJgq7UDpXcU5zfJNF3YnKDTnd7yaOuWdp9ihmGBi4kmbSjG4
 cvq2oPuLGlmsmVNw4gUoYj3kJIGwnIYtFzWGDNWgC3YJBktymd+L39jSAhdt+B4lxU2UaGk8OUTJDz
 fTm9YxSUls8SXyiRfkzZ9f/X0w0WDzqYXT166ul81xaq4aaAan4BQLwcPxoTgewYTPbMo/4jIcjKcv
 yDMMFdXEKi5qq6578gj4ZwfuR1+G27bQcwYruddf39cSSN9vfdIOFt6pTVYg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_081747_124259_74C3AC12 
X-CRM114-Status: UNSURE (   7.81  )
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

Add MIPI ISP power domain ID to the G12A Power domains bindings header

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index 44ec0c50e340..01fd0ac4dd08 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -10,5 +10,6 @@
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
 #define PWRC_G12A_NNA_ID		2
+#define PWRC_G12A_ISP_ID		3
 
 #endif

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
