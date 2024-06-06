Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A383C27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSAf/sbdQETCA/yRUyekku5efdQ3E7/cffy5JaFGsLI=; b=2nDkSEMLRK7JAL
	aC8xTgPjpzf8r5vekTVNJ3lbZBdsLgoa2Ye5HsaxXU7cYVlQrJ+GRrwntNv+1H0Hn6LkAux3xp40E
	ALo4DjtDvF0nYQBs+rrTVTZ1eZ5wWafkRSvkzt0NKdJq1aA/c5/5gGDt8/NXHoon3nvQkPRtcTTtj
	y3J7//uBOwJMfNEuLvm91LcOYuZlBR1DmYO0rWIk0CzqzBOrDAsglQs5ccUS5PzXD6CjPXVI0qblY
	vmy0rZFW//2tKeaFDbQtXMtiZc7KuxsjyPdlDrrreV5P2MY+5R+jll7JKncNDfQ+boAYc05qibX+2
	qd6kGSGItVv5hnnQrPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8oQ-00000008vFq-1Sag;
	Thu, 06 Jun 2024 08:49:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nM-00000008uMy-0WNG
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:38 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52b912198a6so863290e87.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663706; x=1718268506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUKn7nRoMeLL5mqRvKldIOdmuSCawvGpeoUFhl6OTCA=;
        b=T3ew1f0W2JsVbl4KysuMGxJZwndM8FhsrIDFFLCoCOV8CJAA928eOpzHrBggx5BaZe
         hMQUiQRdt9d0Sfc0sJsVmaUcikO4r82mZl9IeYdYKAGT3YBeBcz+iX+TI6liyDbN3Bz1
         tGk4thQTdw9RvuvsxFmpqOsc3iOAhge8yzZsOY45oA3TsHk+WHwJMBo6QUJobw9mo5t7
         eu65UigmJtdpijtBkULgB8VFJ8SsJ8Vd0nohAY3X3heqOjEzTIsUm0XCUWb7pILDskEn
         uKlLukScTzSkl7Zbkp8FqfALqSwN7OK6bpqLSEQ22GmqqE4vXGHEBbSkKuD7NrBK2uBn
         n8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663706; x=1718268506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUKn7nRoMeLL5mqRvKldIOdmuSCawvGpeoUFhl6OTCA=;
        b=UHsWdTlyWPhPEhbZGiM6Z/qiXijp+GyoM5gc9c2x/+FE0N3U1scXEw/8dwNlkTKEy9
         Td+NLwBncZ+dGvebYT+b78173XBSmnIsD9OCc0ptltFrf9GP8/ovnu6gufRhUGbzqbBB
         /SYIiQdBVCxNO3Zx1vvzNAYjm9DOHf2BX6/J+YX4iu2xTP9TxVz5ok9KSO+LsNZlN7iv
         r0glfJ67iIwmGVpU3USmUJ5CHUSp8pFOXZjmxJ5ozU6h7KW8gx+Ml78AxtV06a2PF8dm
         yeWciD/O8mCgo2pfM4jZTGvS3V7SP2ZkmsewzPErIRtxZ93mVG8YpzgpuLwYePzo0jUc
         SWKw==
X-Forwarded-Encrypted: i=1; AJvYcCU11iTUt/lcpaZ9j+agC9XPlTDn4FYFi0D6HVE6fOEJ6PJKPNDm5EZWI015p4w8k2dOyJhXcEAiixOEIkv1jxHyOlWm8c4wPHpYioR7UKgKfVw=
X-Gm-Message-State: AOJu0Yx1d0UsE6E7ipQ6k2HZdKq/1DdIJW5rSsyamJRtUgBNj+LEjYmh
	D4MScV02WNaaWz1cd4+ouk34vBbNmTSLeAirYAMktnFQz9N0/s/50ceqTLSJzGA=
X-Google-Smtp-Source: AGHT+IHrdV+x4TijqSa/FABtkOHGZVw6OnDi1dAynF+1M0R/1Oxx2xSnUnffhNF9+XNMmeVoZm9OrQ==
X-Received: by 2002:a05:6512:3da8:b0:52b:b4d7:ba55 with SMTP id 2adb3069b0e04-52bb4d7bb5bmr912193e87.29.1717663705942;
        Thu, 06 Jun 2024 01:48:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:19 +0200
Subject: [PATCH 12/12] arm64: dts: amlogic: gxbb-odroidc2: fix invalid
 reset-gpio property
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-12-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=866;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CB2bPtaDpU75ktGs22gfMyRNjffoEcH2n3mjNBAk7PQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfO/q9TsnRTODhpmyAtqQzWilWXGX5QAleIeFCi
 DdjYcruJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zgAKCRB33NvayMhJ0UsFD/
 972tFQmlu+yOj3Y3cb41aRStMfvlb1KNBydlDb4519AfovBO9UKgEg2eC9x0DxUYuocvuaqshslDMu
 8Jl48g6wGafXwyIuemsdnD5bdnKFrJnSgztIo/j010AMW2FrNTOHm30iN0HkTB9Jzv2eZyvhTSXmZM
 mlxpjEmqTRRhiyhSJbFjio3EqeGnaf79jtlqEq/cx9voSEOxsNDPo21Ru3+H0Le1mIWs350NhJzVzf
 UHUZQmFk/d5Nwy+k8iab+mCWwk2/OvVEtnPROWR2xDj5xxorBA5qwGMqofLtRTBLvZu1/hfBplDJpy
 taK5Fc6sNCBVvw2L3lt4jZ4NdbkEzzTCl5/pawmpls13eIBzKPcKS8oclR86HbkxIubZoZN4YiKsaj
 1QPPDrPJdKvFqUzfJLA+zosKqFEJkTfEfA5U/sWRBY+2fJXZf1XAeZBl62cWAL0P/Bez22+1bLTtsj
 G89uXpy2VhYLqEv6eMlYmoWfWsTF1tfZEBno75A5KLWczU7IFPJ7t+GcDH0do3wZjeL+RBF1O96SxH
 vvpvBnec20o1WZs+DWereAy8ZUeLZI8KOAJdeedPPeTMGATc9rqMufHW4+949yUW/IasisYiCLk+gn
 gan55yYYfRzcbVROlstDGHRL8OAlgGP/Yce3Usl5+SJO9AppT+agJHTwgDRg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014828_419900_D5C23C6D 
X-CRM114-Status: UNSURE (   9.86  )
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

This fixes the following:
hub@1: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index d4e5c960d4cd..cafbd5f5b913 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -411,6 +411,6 @@ hub@1 {
 		compatible = "usb5e3,610";
 		reg = <1>;
 		vdd-supply = <&p5v0>;
-		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
 	};
 };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
