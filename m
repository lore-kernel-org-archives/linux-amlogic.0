Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE9CC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fn71Mu56lkRAZ/zHq9Flf6ZwOZajycnodmgbWsu+xIw=; b=gUchrrptrqF6dX
	bnpzhDFIb+JlePZBiJGI/Fw/kfnKhfS3PvDnpoZUFWWtAIYNUve8gVrk49TTuEmwsZkeXeQXIzC2t
	cm7wv6hob5xq1FWvdvQxTaZj1ZYvrNox7zANMOaQC+JDk0p9HccfLRMjx3HnZBVjfMuRj8oRprexJ
	8JD617WRvDaOtqBXbY9qkKoOS66B6CoYQG9vOwGwMnsbyRAg4nkOkmKSnpn/tO5xIN6lRne6AQNZa
	F7dvx07PF4eHRlXqINi16ZvF0ul8GF3vzLe2++H+IbMTCSeuOV3I4gkBy3lq5LtVoRTkWuK5+9yV6
	uJgZHOemqGsSzGMVeTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nq-00000008ulZ-2u5B;
	Thu, 06 Jun 2024 08:48:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nI-00000008uKT-3LZ4
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42160f2dc32so120655e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663703; x=1718268503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whthHnnAV0riUU9YI5GKHGEVmsmBElqPPF6sWdWzQJE=;
        b=uJnMDADxf7cYWtSlf7ZeAujAwaOoh87mB6EqQ+mAon4LR4LSLO2FY19Ncym/ZFQU3C
         qM/3VygQMDxcMSNZsKCexMLMIoaRw1zhG84TNxuUZR8kKtvM067Pv8QNaOlqRPa7hguT
         CTukr0eRSwdbdcbzw7HArZ/ZZVyWg/zOQUmmO+KlduWaTfvbfzxc/OL0mMGLAjh46xzR
         +98O6O6ZmnuFxjyT2wNQ1pQ2dje97suDlCfseIMlKh+t/rszXEfbeLPv8odkcEYPuDnS
         Y0fVlLAkpLig+sJ+tn3U4NnmsBTegV/J2pNUkjrWiSCrnlFM1SQ9D4C8ktSyFktjuXcd
         9rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663703; x=1718268503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whthHnnAV0riUU9YI5GKHGEVmsmBElqPPF6sWdWzQJE=;
        b=w3AaUtJ6Eoplwb4dRJeVybvafvGX1/TVnR/w8GGCmesslErTmRa+V96OjRcI3EfKXT
         xrKbZLjmMdx5uNiCA+N/HgVBq1MLSWGOq6qJELLK8IQw3qjPCvk0js6xENcmJPGVg1Xs
         pIfK+0aDfabzDpjZ6oyvBDwFDoW5b5CWzIaeQPg8Sv1Lw7TQXzIGkZ2gkJ4+siqB6Up4
         3vCb1cySbqynzH3ZxbT0o7cc0smfby8ITQYpGJKnkNDVaZU35IZhm02/MT0kAAWsDghm
         lILRK0YL28obhLu31pogTphUNe2YXM6+Ass2GuCIby+gSr+jz+2bpANJOZ1/6DwLde7Y
         kOow==
X-Forwarded-Encrypted: i=1; AJvYcCUt1Gx6xRrAZ80teNBJqoYiDfnszFSBHqelVO7h1fifWeLAAC3+S60e2IJJDEj7TstWJ34pi77/tVJ0q98GieqoOGXCNq1lClgVpxjL4drYe4A=
X-Gm-Message-State: AOJu0YwP4MWf/6tj2MQv2sqoOds59p6q2P33GBktRrGIjiBOAvGdARo3
	vcaftro+TaZ1E6+VAHKF6dCNatF/8ilW6dUquKlJzo8b/RsbG6VJWqo0qgjU5Ug=
X-Google-Smtp-Source: AGHT+IHu9gterr3sxhxkdqJc5Qs+YCT5HRh4tbwy1mr9JObTnqFltnf5YOEZ1L7+4uLq7kG+fY0Zsw==
X-Received: by 2002:a05:600c:3108:b0:419:d5cd:5ba with SMTP id 5b1f17b1804b1-421562c7de5mr43085835e9.7.1717663703498;
        Thu, 06 Jun 2024 01:48:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:16 +0200
Subject: [PATCH 09/12] arm64: dts: amlogic: c3: use correct compatible for
 gpio_intc node
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-9-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JAb6Muut5KHcHBna9lqyRERkBmnN5hdIffo6dmjjMoM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfNVIBKe2IvSZ6gQuVXIN5vKTJ3pwx4qJvciHA0
 3AAwnYCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zQAKCRB33NvayMhJ0QqjD/
 98Nzxe2ojQV6/tCKNgn41bVNKl6EeN2XuOF8cgyikF4ikKDLr3ZXy2up1mw7VOhMf01UbwSjgr1C4P
 piW84JnlGWrLfXCpayYik2PNUIdiukP0GML4QSFI3ocSm4R3X8Ckym73SJ0OiPSmrZ+RLk1VjMle3Y
 S1+Woo5F8rZyqTm7dsUU6zrc9QALRO+Kq8YxJGDsjtgtCvIg77bfVxeEc6NuIhPLJLM0aofdPX1xsL
 rvnbM/3srKQJowTvAHnLJ/zwqH7bkjUWMQtBs4VeOW5RxRSZ26GATIOnFMzxWYCPgZflqGm4vYjQrG
 5b+FwpjdiLceVA9K3bOVzexw5ZQShZlq+CNkurR71kKkKtUHtqAui4ZhlhhJAFHLR6deX9pkEa6rgl
 Pz9iQkbeEcFZVv8koL2ayhN4h8TNvZ3J9Ea5U7vE/nNHE/1QugpUhPg6uB8KMU6u4gP08ScHoWapCP
 SFHCwJJ686Syjqs1v4teMvOlxosixnc3UKc5ehxN8kE7K15z/ulxkMkP6SoRaG2n4nc7WVOvBQDDZx
 5Dm32dCvBr4cyUu/4pUu+lyCOw/gyC5YYEwie3Dmzj3Aju7kmo0owozHrCJAYMwZIV8lOs5l8f9O76
 hGj3E9qnpgegW8OFm+BBo5IjuxETEBf93ahUQVJT1DATJWw8kjiZyRnkkT7Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014825_159674_45DBAB70 
X-CRM114-Status: UNSURE (   8.91  )
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
interrupt-controller@4080: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-gpio-intc', 'amlogic,c3-gpio-intc'] is too long
	'amlogic,meson-gpio-intc' is not one of ['amlogic,meson8-gpio-intc', 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,meson-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogic,meson-s4-gpio-intc', 'amlogic,c3-gpio-intc', 'amlogic,t7-gpio-intc']
	'amlogic,meson-gpio-intc' was expected

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 32a754fe7990..f8fb060c49ae 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -111,8 +111,7 @@ gpio: bank@4000 {
 			};
 
 			gpio_intc: interrupt-controller@4080 {
-				compatible = "amlogic,meson-gpio-intc",
-					     "amlogic,c3-gpio-intc";
+				compatible = "amlogic,c3-gpio-intc", "amlogic,meson-gpio-intc";
 				reg = <0x0 0x4080 0x0 0x0020>;
 				interrupt-controller;
 				#interrupt-cells = <2>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
