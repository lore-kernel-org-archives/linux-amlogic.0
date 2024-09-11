Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC46EE498D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7po9O0dAEUO4i4jpts3rjvElWygGfgbZ91IzzzHsfHU=; b=cIAfsjpx5MjLkQ
	g2zgtKU0UEtb0Cquz/GHvzrEPHKmsEgzeSHsjEmVRav9agN/8cDlcXHcW2huGze98vNlPVKZqhUX/
	5zlM+Tal1PqfNkbYyv05ExOMD3IUFpqu6NwAvyKgYPxJ/6UJapJwzvDWcBCyM60kAUaNvh+dUfJpq
	2faNFT8rmOXJiJJD+MRPYKPg3H8LPq5LlF8NNbYO31+6I/gLZeocTXaqxny2J0/GAHQLuVwoeLvZ9
	fOarDC6BRri+DEI8SOci1JuRqyL8slaMId91iy1Ksq5yRhVvWv0CGSLwelUITf6P4ghsQUH/fGa/k
	Mc2tMzCaj/PnPhtF//qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKZH-000000095JB-38SE;
	Wed, 11 Sep 2024 10:27:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS6-000000093MH-0423
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso41125115e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049997; x=1726654797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me22hCQ23h1Om/oU6Sm/hsVv2MUbHKFNehPhgvHyaEM=;
        b=U9Ca53ap9C7crx6i7rdLECUoCgtANe+CVFVfN9jUxGOAk69cTZrphauXkFuQkD6Mwj
         3YtU162HZnFhPbyJdREg7NpLw0RccfReoTGT9d7ez1jcu9i8IJ1V0C+rO8f2+y2Q+H0A
         ujvh1klP3rf2RAc+fD/dUszbApyk6Yigv9/Ry63kUBmNPqK8Xrp8qasEsvh8ltCOiD4J
         T18vXIDZ+Hc+0Z0C9NckpuVkhVgspSqoHj9Z60SK+WUr+DIkIg/HD5hK0f8zrsDM7UYc
         WPRlNd/MRo7XYJPiZmPMVas83B8OPFAXDRXcAPWGhpry7aE0lvOYscggz7GO4VNxTepT
         jX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049997; x=1726654797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=me22hCQ23h1Om/oU6Sm/hsVv2MUbHKFNehPhgvHyaEM=;
        b=Im4maxbGwuS6vpSE0Mpa/DENk1J9koVJX/zhnEFoQlhpFJgNAx5ZOubqpodw8h1bMl
         LW+7qGabms9WkQ6lkjNX4i9HEP1zIt3C1jEQWg/24F5JyTIuBGhi6nLvHUqEKH23zqlM
         AHyYHKPKoIvUvjv8gnokNBDdxKiNcSylCfIrdHatW/bGrqbWH3tnUbwaprwpi6uSzpXG
         e9uvU0v3lTfCIvt6dcontWYatq0VrdWVxntsMPiwOXS+UU8q8t1H89DPm/jKNloBZL0Q
         YJGiJvUxRGfUDNstk1UltC5jgfY2eYfe5EtBTydHtNQaTkZrX/hhq3yR5pskwOyM9+9M
         CffA==
X-Forwarded-Encrypted: i=1; AJvYcCUz1nc6uC1qGVlEFfeh2ZOB1t5toYgaF5lU9B5LkGECJzubMdURBOQeoQtyOX9o27WrUi7zHKtLxCgHzc0w@lists.infradead.org
X-Gm-Message-State: AOJu0YxtLRJ/lzbK8lJ3J0e0wIiiKD43B2Ur8zoFmkVqoohQcNFXZXaT
	2+RTJcghii6HdvBYqz3ZEzA8OuBTyVoEnhzxgiu4DjrmGVLalVg2JasOazHmh1s=
X-Google-Smtp-Source: AGHT+IH3Axor/ewUeeQs3SMNMrWCuLhgitgofIh8meuT+E2IsdocHE5ZLv5ZZVbVTp0xIAzPAGsGBQ==
X-Received: by 2002:a05:600c:1c18:b0:42c:b74c:d8c4 with SMTP id 5b1f17b1804b1-42cb74cdbc5mr99981265e9.31.1726049996492;
        Wed, 11 Sep 2024 03:19:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:46 +0200
Subject: [PATCH 7/7] ARM: dts: amlogic: meson8: use correct pinctrl bank
 node name
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-7-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6HkGIahaPO/Fnz6tpDmCQ5Zn0iibPrrjjojrxJR/2DI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7EGXUc0rkBN+Y856SSdLNy9Fnz93ZB9YaS5kBE
 zfGkRcOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuxAAKCRB33NvayMhJ0d0+D/
 996Kgc1GvUGEptpp95mKwZaptGWH7QYeyM5Dq77T7oDfUpiyRsBS6tQWCod/Xl6i1rb+A9tOa6uppO
 /MgvXmSQF8OYFtxEv51h4eEMYUGKdOb+iUQ12c+yE6VJSKxgTw30HEhs/JmnFUFcBt4LJHkmTCGmhC
 5tSjCFKfRpNxkXXGfi92y3H/dc60HzEdYgtI+jyJG9Xje9OKtxPKG416yqOgjIfXpQa+q1c3y2pjVQ
 1H18TopuREjlGrs9Vec618BIqcRwBxwQ5t4yf+n5HDMtv1ijOLgU8S+vlex4wUMdY2J4kDZsAkt4Pe
 Z1zEUtac6kr/TLBnsdanxD4x73FzBU/tbv6c+9GNDHCSAV53cUMm2GGZfpmnpXSg5gBE42FBD3XZe4
 LSUzxXJQbEPJgAgwR+1FJfGHvlXULV+H7a7ILCAh72UU6tWV3gX1TbzIKPwDeKu0xAmK5Cpcu1ak0x
 +4ZN/b8ZxzPGI037olsW+vy8T6phi2j3YYZCc3/CUR+oHF4SQgqUo8U5OBgErZ0bENVCS4E4sxf1W5
 LWLBttHbsMBaa6lhSDvCiHYJ3HEhVtDue6pOfZz21fHBodOi/Wjn93DtKUVOubIeqoiFlNrreFHkhz
 t9xIyEfZbD74sAx5XsuqYMro35+IU8uzGpnS3TtBrwRXV/yHrjbjvBUT0sUw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031958_235581_830618C8 
X-CRM114-Status: UNSURE (   9.77  )
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

Use the proper name for the pinctrl bank subnode, fixing:
pinctrl@9880: Unevaluated properties are not allowed ('banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'banks@80b0', 'reg', 'reg' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
pinctrl@84: Unevaluated properties are not allowed ('ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'ao-bank@14', 'reg', 'reg' were unexpected)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 4 ++--
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 1023ff0a4f9f..6c7596c8b96b 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -353,7 +353,7 @@ pinctrl_aobus: pinctrl@84 {
 		#size-cells = <1>;
 		ranges;
 
-		gpio_ao: ao-bank@14 {
+		gpio_ao: bank@14 {
 			reg = <0x14 0x4>,
 			      <0x2c 0x4>,
 			      <0x24 0x8>;
@@ -468,7 +468,7 @@ pinctrl_cbus: pinctrl@9880 {
 		#size-cells = <1>;
 		ranges;
 
-		gpio: banks@80b0 {
+		gpio: bank@80b0 {
 			reg = <0x80b0 0x28>,
 			      <0x80e8 0x18>,
 			      <0x8120 0x18>,
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 641cd60781a3..c8fbeede7e38 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -315,7 +315,7 @@ pinctrl_aobus: pinctrl@84 {
 		#size-cells = <1>;
 		ranges;
 
-		gpio_ao: ao-bank@14 {
+		gpio_ao: bank@14 {
 			reg = <0x14 0x4>,
 				<0x2c 0x4>,
 				<0x24 0x8>;
@@ -422,7 +422,7 @@ pinctrl_cbus: pinctrl@9880 {
 		#size-cells = <1>;
 		ranges;
 
-		gpio: banks@80b0 {
+		gpio: bank@80b0 {
 			reg = <0x80b0 0x28>,
 				<0x80e8 0x18>,
 				<0x8120 0x18>,

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
