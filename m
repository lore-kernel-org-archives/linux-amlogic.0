Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CFEC001B0
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcbe4zviBbYX0XlNapAWE/k9hBuOoamjnmXPa2wvq/c=; b=2d3nYJORZiYIGN
	nM+/XlSA//u/vXwMTK8dzv7g9ZxkrhGI9dhyWM8v2gMxaiAtA0t4HSVNQOzQJsrHL61Zml4s95gi9
	gylKToPBo+DOmjEoyzgLtqKB2zg6jjmRefwLQxbgveqaRvtzaVXPR6wf63ae/GD1JibTHKi41Z9Yv
	YqTuOYDOfHGJ+38XM6UxA2nr+jAiylqBkDC/Gb8USFLFox8Qec+neHNiWLmlLmHD/wf19KL9HOe9O
	HDv5OMOzvQq5PZs69dZ7R3EUS3mdYPNgeH6y56tgn4bPBUXBVLbMFfZ2BAI52hB99KEDubdZROlad
	t4T/aFAGA4hN7mYiOeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJug-000sRd-2P;
	Thu, 06 Jul 2023 08:00:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJud-000sOz-1t
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 08:00:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso3960785e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 01:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688630425; x=1691222425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWpH1FvGpiFFPL3Zk5MB4gar3abtPZq+nswg1l+SqSg=;
        b=z8CF+23V8/iN9B9tos0KT/eKSlOJXhZaFRjqcobvmHkTtx8IIGPAXZqNO0Z9d5RUAe
         I6VfUzkrptGnMATJX60aX79fNdHW7RtIOvR/Ktt5vyHPW0VL00Oo1REG76SAh9/Q29mZ
         cVGp1op86QVIvT+UNPCJZ6U9N4SrHcVWr2boReW1ClXDHtVN0okuoYSl2zB5qt7eSTo7
         glKl3IFrKPRHpy/fO4n8RGqkoKt1ZWQIOs5/FZ00nriX4a5K4whqhR0iIYny/vBKzb5l
         KDURPEwtW6UiZzhAysSDh+dseroQYX3fi/P7BiGJ9kyP2l3J8D4XE5NG0XNBPhlHroTL
         LcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688630425; x=1691222425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWpH1FvGpiFFPL3Zk5MB4gar3abtPZq+nswg1l+SqSg=;
        b=Ix0Jb76R0RhHnZutM5ae2o/2qhC0WKxGJzeeWwelV3sDg40LQ7wsIwFhm3DrAE1zmb
         EIZAekivlvvJhm8Ulj3LXjRNiKuvygOJ6nA+lu8LVfC4mxsmeU5gvDDULCXncuT5LyfN
         CKgluoLVoOWFOKj450nsPz1qb4FZ8aMEs+VUT03VR65ozDDjzp0ulW/fbpnW5u9ni0mL
         JafAPCxEpmZg0HqLhHRvzrvcxc/MuW4JK841dJh39MZMrP0WFW0ByEiBLMGRBiCrQxEF
         rnaoCXBofH1mkGNsCQ1ok9pF+j1488snImWN3XJnZzpVNGISUtqhCVMwnxBQurb+bM7R
         mWmQ==
X-Gm-Message-State: ABy/qLbMo3Nc8xlDVtpKGlfspCUYHljuzYeWOFAdgI9cyYm96tbJxyoV
	Xbs5mxvhv+w/lDfRTL+rqRAr9g==
X-Google-Smtp-Source: APBJJlE4gWjcP7W0gh/5EZLG8ViE/6K0tZw10eioLU/v1QWdFBHHFFTEa7t0sYd/ac1rM8ha9/xDWQ==
X-Received: by 2002:a05:600c:293:b0:3fb:e2af:49f6 with SMTP id 19-20020a05600c029300b003fbe2af49f6mr678506wmk.39.1688630424904;
        Thu, 06 Jul 2023 01:00:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003fbb1ce274fsm5587375wmn.0.2023.07.06.01.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:00:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jul 2023 10:00:21 +0200
Subject: [PATCH 3/3] arm64: dts: amlogic: drop cooling-[min|max]-state from
 pwm-fan
MIME-Version: 1.0
Message-Id: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-3-63ed070eeab2@linaro.org>
References: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
In-Reply-To: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mTxrGBgcrLVvxfWXqT39OrtK8xzaQJmrQf3lTHsiMu8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnSVVlcqsYAlsspnNSpabIPV0CUsiTF7uT/6cBbG
 rIDdZdiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZ0lQAKCRB33NvayMhJ0dwuD/
 wPzwYHtKFu5wR0PYy9KwbUaetfp9VjtWrDRPP+zZV1/9ZYekIqbMITt+s7/+CILqWg+KgtIaoGieMl
 Tw9ewazOmGsAnNiJUgs3z9Ft6NpR2tPNHb3wPG+TFvnnM+HqmaKNkeTle2RH0UeBuwlsCv3rIhcOpd
 ZFesU/nPeW6vQW2EPtz4IjHH8gXplRzTPMUciWc9pNUEGm9lQOwThNFYXz2I08Ll1YFM+cRKF2tfaR
 jmM6nuqMzn/a3Txe560cr8iRb5H9NHTzslFtvUae4zif0wTpFMXhi3Fai/G2jsHzXMeeOBDEXz5XrC
 GMNRzEpl4zDrbXEmNihN7awahAGtKLL8gXgLqDwd1rKilzVnCjNvCI7Qe0VY2Mq0bQvA7/F9N0k1tF
 cVH4Ntph2LWpLZiJclHPElVe3rE75bI3uC0vZLmIXL2CpoccQYJPxIQEPNChMQBnIVxOqIAicwzkab
 QsX8O/w3sdZm0O0lhU/qW0VegQcfkgEEgtriSg+wG5hl3s+jjWQkmWC6DG95YEa/fKhdIa/FuqwZIQ
 I2H7dq5h0rlQ/JjDehSYuW/4NDA1eLfx8NedH5F+4N5OKCg3qkruvgqLi0Z92OCG0lhb17iN1xSJa4
 1lbTZiTTRvOoCRWODT6E/JDpp0eoK4xzgGP3B6W4CkAKz+3YJsTTsMZJoCYg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_010027_652578_22D25023 
X-CRM114-Status: UNSURE (   9.14  )
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

Drop the invalid cooling-min-state & cooling-max-state from the
pwm-fan node defined in the bananapi dtsi and odroid-hc4 DT.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi | 2 --
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 83709787eb91..42f30112b56a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -47,8 +47,6 @@ emmc_pwrseq: emmc-pwrseq {
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
-		cooling-min-state = <0>;
-		cooling-max-state = <3>;
 		cooling-levels = <0 120 170 220>;
 		pwms = <&pwm_cd 1 40000 0>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 74088e7280fe..846a2d6c20e5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -19,8 +19,6 @@ aliases {
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
-		cooling-min-state = <0>;
-		cooling-max-state = <3>;
 		cooling-levels = <0 120 170 220>;
 		pwms = <&pwm_cd 1 40000 0>;
 	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
