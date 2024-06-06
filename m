Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2F3C27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuSEvv7ipiU15rgqXweFfx/soOE95MYF2yZ8oR7e1f8=; b=j7DV7JyNHkrGVp
	TXTbM5hh4X8iC2Ezaj/3PAdD+G22ONtxDFAptn47Fu1Ln4CXu1VDes5e4WT3xp8rpqyX+f3ZCJ/EA
	wiiDdxOIeHX9cYuWa7UfDAxKODHeWTC+M/dmwv0Eyb5Yesxn7mgi7X1/3YgjuMZZbXKFOOZsxApI6
	6PE8VJA4jQWReQD4dRJ3RGgr5ZHanqah718zWsXdt+xz18ZB+DMTsnQeNHvcRK+VqXf4I6M0RGQpt
	wKv5w+H1i1Qs0aRIowB5MeuMGHR8phC5u1M4l90J+TCMiU6nDkmZAyqXtukBervQz/77q2oRL5vP0
	vWLU82IKgxr4RJ+onkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nn-00000008uj2-3yi9;
	Thu, 06 Jun 2024 08:48:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nG-00000008uHZ-3XCS
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso875648f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663700; x=1718268500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnzrYhtyWZtGZAeRI1cKgoE7VfeX1i9ErTFoBPCkmqo=;
        b=oB87K6Vy1KVGC7ogngJXc1va1NAM0epJpG54KeNLJ2PrHrlLcJbjfNLT7d1LUEgc+L
         Djy2m5oHUdj0UdeKkuiLzRGI1eW8y22xXVOVgeaVnnNuOayUcMf2s4q3TZyVN3M9WFAU
         GRZCQaA8KK0hMXlqbzYMxwhqOzEZna07B6x875BigFpB5YC+IqMz6+L+RtrVG+H8WJ8p
         eDtO4/4Pg9MvyG2Y9pVGIkAcaJ+Cw3UshCdXDbQLl8fd5hDhzYZ0x0K0RiBWoPbRLg2m
         +sFVoHxFWqOEjBf5AibpejVYJ2BOOs7eHJIrGfxutM+Ljyrlabb/gTV8GzgLdpSGoTYM
         C25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663700; x=1718268500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnzrYhtyWZtGZAeRI1cKgoE7VfeX1i9ErTFoBPCkmqo=;
        b=SPuqas9EsBjygcHBYDoBnOijXG1yxAWGvNfByXSx5uIjJOkiRax9yEOTVStrEn2YMP
         kB5udmutGulMuCqy0g6nuQp5KE0VK5YpyFf52BRjGB80pPlAuLMX3YrIjljIPC/SzYkQ
         E7MqujCpblUIA2DM4+Za1K/mcz6nFFLKutoB4zyytnGiW0i3xXhHxMAdBkhRXEMCf7Ji
         n+OkGx72Pwuou47upu5+tZRMBZ57QEKUbcpTMoWTw5tYnLR+NCKYbf3Ng1J2WFKo5omN
         y4nesipcSXghE0ht1kP2rCSolr2DhpW3FTkpzlzwqgsj7hfZhlkD4Y3cmWc5wABspR6W
         C6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWjdWNRn+wSU59t1unbO5ayeTYiuVGYEEczWgrySSE5jCIYQEVlg62Uz/Hf3bRa72XpFR/grz53Q3sxIbTurlyhqzPnj8lGl1coyXNNiqoHjmM=
X-Gm-Message-State: AOJu0Yyg67mJXkZkurAVoD6RGkGqV3KMWDrLqGHdJO7EBfv6Ava64b1+
	p+TTO//hXqDC770S4eXqFy+R/CcHmtNKz2nGhosSE+Y6P2OtNFl6YAEOrYGoP2E=
X-Google-Smtp-Source: AGHT+IG0BYg8K/c4KQaRBp1EUc+GvZgM8axaFHE4i1jfIJetCHXj272C1ENl7iKjvIyI47e6l1NdOg==
X-Received: by 2002:a05:6000:1d93:b0:35e:ec99:77ce with SMTP id ffacd0b85a97d-35eec997812mr4343277f8f.22.1717663700253;
        Thu, 06 Jun 2024 01:48:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:12 +0200
Subject: [PATCH 05/12] arm64: dts: amlogic: sm1: fix tdm controllers
 compatible
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-5-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=39vRtYwQYEqRtQHSzA7n3fy3WwXerX7uCL5YXSWhBzg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfLG+HbYBIAmTUEl0ylD8D+ogCR9+kGUPijqzl9
 PktHmhOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3ywAKCRB33NvayMhJ0YHqEA
 CvUi5i3wSgl93xNoeNepN5W+1OOMgpo+kxK8rbUTf14l+5gou6zj/XcFER3vtR65wo51Za2D4bmzy1
 mBmmFX19ciNIcpQwhxOf8VFrRVmpF5fVUqkIrw04G7qGR4+/twNjqF3zhbcVrlTXyEEDfJ2eqjsqgq
 8uL0m/nSvr+nnHDAdBrFwWPM3Pw+riSaRTozWOXzJcMuCSGqXwvmSIma4wrUwyeYvOrEk4ftKh58CC
 mvcAFsVzZkO3DTmH7Ic3uNv8Lql/l/briLqCiUwCIX4e5/HdGe3gx6X53roXPSLC5O5P9TJft6Xhfy
 Ug3JdAYDumQqNFV1Iip6j38HIMFEhR73gUbyw8kD4ofojscj8RUCVueYPvk6bACR8LQf16GbO6lNbY
 7YALkBcrNzAKuEHOcEUaldbSMppfc0xBJizC5ScUITlGMOZDff9tIiGtneyjxKmizAhBZwnRW2Yngl
 fPoVbG8+R+GFc7jUqjaArt4bt6BlYeUxlo9dVJ62HoLgK1P4edKgrSnedPd7kJSwenKhE97SAag/F4
 G+13o/UMUuQaWKbds8lJJyq6vuBEVN0A32h5fsVQN2AOahxEhiYRuKaL1B1X7TetUvjn0MCbih/axY
 Hoqai+OdzCo8Uio8oD1WP2O8z41CvTHpwspZkp1RFuUXW84U8xdzMrYacZnA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014823_115964_245D27CF 
X-CRM114-Status: UNSURE (   8.03  )
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

Fixes the following:
audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 6822c2f3cfed..d13cf5b4aac7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -275,8 +275,7 @@ arb: reset-controller@280 {
 		};
 
 		tdmin_a: audio-controller@300 {
-			compatible = "amlogic,sm1-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,sm1-tdmin";
 			reg = <0x0 0x300 0x0 0x40>;
 			sound-name-prefix = "TDMIN_A";
 			resets = <&clkc_audio AUD_RESET_TDMIN_A>;
@@ -291,8 +290,7 @@ tdmin_a: audio-controller@300 {
 		};
 
 		tdmin_b: audio-controller@340 {
-			compatible = "amlogic,sm1-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,sm1-tdmin";
 			reg = <0x0 0x340 0x0 0x40>;
 			sound-name-prefix = "TDMIN_B";
 			resets = <&clkc_audio AUD_RESET_TDMIN_B>;
@@ -307,8 +305,7 @@ tdmin_b: audio-controller@340 {
 		};
 
 		tdmin_c: audio-controller@380 {
-			compatible = "amlogic,sm1-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,sm1-tdmin";
 			reg = <0x0 0x380 0x0 0x40>;
 			sound-name-prefix = "TDMIN_C";
 			resets = <&clkc_audio AUD_RESET_TDMIN_C>;
@@ -323,8 +320,7 @@ tdmin_c: audio-controller@380 {
 		};
 
 		tdmin_lb: audio-controller@3c0 {
-			compatible = "amlogic,sm1-tdmin",
-				     "amlogic,axg-tdmin";
+			compatible = "amlogic,sm1-tdmin";
 			reg = <0x0 0x3c0 0x0 0x40>;
 			sound-name-prefix = "TDMIN_LB";
 			resets = <&clkc_audio AUD_RESET_TDMIN_LB>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
