Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A708BC3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsPw1/FtUeHiD/fybg7GZzoN+wtWESCiMQiI9vzbGXw=; b=hgcPKsM+dkYC0d
	B8EkF6Ax1QdhfetUbtGHQDOJH//yt7xzPQdEd/KVg9ylA+VWqzV6qK/KySFJbHagOH0ib/HnKy+6j
	LuN024zJgotI7lBkGsoN+HAxEcSqThW0azG3DtMMHB7BCD3uC3pIri44kcPhjpIsiCeDo7n/4Z6RP
	Y/0Sm39hlNQuel/LzHPNDiThEvzoZ9zvMAD2SdLprWwtuFiHA2ZrsRL0+We0uS4eEysEvlRMO8hnu
	ATgdEad7IZO/PNH1iFXgxUpZP43AGM02hgkHfg/VWhKSmRsTOwplvXX2T1r+gqnk11zhVSUDSjMna
	PUsyWN8xscLXi+YLpdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6vS-00000003PDJ-2gYV;
	Mon, 16 Sep 2024 08:17:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mx-00000003NF7-0kKa
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so26130235e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474129; x=1727078929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuMyjcQm+2mDSwbBu68Cdtb09lvYh/quxjtuMaOLP9Y=;
        b=hlllxma9FdJLELyaf8asMEnEE0/mnwN9XBLtqcoklCiqTdUMumflk9eYGCqtV9lLlu
         oPMIDA1Fxyl+NV/QR1UJTknqiZKH3sWfutVYkex1mrXyWXwxL3kGDMWWOgwzP1c92Pq1
         XzCJ9EXkwA1SuGDre49VQKJwQLGeb86Oc30pfc+XgaMnbjQ0Dg31uncvbP5y8cgtBEi5
         Rcp1ZO+nTgfh4QV6ypZ8t6DfwVuFlwQTT2hC5/hQoFVhrUyoAIocRGaNq0cLYYgOqV6s
         g66d2Dd1Dh5E5gNc7nasKDwrGe4QDBBxUxHAW6FlJSf5HkQD8/azERkoPUDoPgHFW0q8
         E2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474129; x=1727078929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuMyjcQm+2mDSwbBu68Cdtb09lvYh/quxjtuMaOLP9Y=;
        b=C4gVn/2AUV3aVyYRpo3rZ2bA61hwiU/ei0em35wOyODseFyD7zFJnvefQJlcqDI/U2
         hUZe/pu6hr3jIub5kIqJznl8p8FUXeLH4C0Sm15VWsaRDuBuempQAuCaxRSM+Dtf8aLe
         2vZlPfGEuydZJPTp8fBvsPM5p0phdSloThod/r8yghvH5ld+k7t2jH8BnuLo1nD90/cw
         4euavhlA1se/v6FaOz4uyjH/eg7Bg5Huh4DdctTMgiPaYeiVFLw4CyxuLohiTFeZ3m6p
         ypuHC22s10yXJtteafW9cWtVxzAQ3uGsW17MlxjQB735uBJ5s+M9i8392AA7YK4SJ63A
         qP+w==
X-Forwarded-Encrypted: i=1; AJvYcCXp/JfyOPxSiJEOPqNSXYSb5bCy/Ldudk9Law3wXebf0tIKNQqySFpzlynuKhncmTrhChoGU/FgZ0f2ozQo@lists.infradead.org
X-Gm-Message-State: AOJu0YywvaV47p5uRVU0VwXbKZdYcqc/vYlAt/pTzVTXYmyk+baIa/oV
	IMQ5clsNBBsUDeWkpLudFXGDIAvpN9f/YS8T5v0KY1VkhK3TYr/6t39aR5r/P4o=
X-Google-Smtp-Source: AGHT+IHxCDX2wZDD6mVUdX4k15uaptnDK6FvyveAHybClETOfRQ850wki4B7ihrNJUPowV3Bfclrfw==
X-Received: by 2002:a05:600c:5128:b0:426:5c36:f57a with SMTP id 5b1f17b1804b1-42cdcabcf3fmr84801655e9.14.1726474128995;
        Mon, 16 Sep 2024 01:08:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:36 +0200
Subject: [PATCH v2 07/11] ARM: dts: amlogic: meson8: use correct pinctrl
 bank node name
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-7-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Df6SGhQpFwibDBqHpjPsiq+Dko+XirYqFFKgtz4wtnI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eHs7h/Zx45Fyf/Y7mpviRiuFBl0+4ARc//Tiln
 Cd190W2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhwAKCRB33NvayMhJ0dy7EA
 Cdy2NEiECo3yxkC2tjmTWOQr+c+6LA4Mrbj6PxbirQes/U5Fz9VEWCBxOm3RVH7hAWOl2Khe1Wv2nP
 Q8ZRUHftEiAAFrJIGY4gxhITv70hdXJ+p/k7870SyTQl3KrU58diA0Wb/Uj63zA/Kdc7V2s+T++75H
 LMe2ZCvB+w8+R9JUgcwM+z7O7CrBNoD2LMqi5zCcjukYLBSmfgAz90giarlXqMq7pR6hBVwv6QIM8i
 gLA7wrxPQBzJJQePd0+76+v3nn94cfrIpX3bEXFLS/GTpKcK+4Yd/FlmHxPPtl11SKEOTLkmUvjNJE
 NsSXltKi3vg4cR2QwjzoYGrvNAItGUi9hquLURs+nY6el5ht57EZrLK3IpALC+ddbzFE5krp94y41j
 x9y/dNcoRE3xDylvWLNr8u7OoZ5Sja36iIVXLFGym3VmOa67VOyQqGGg5DSPwkJWfy7NPw9uMKMgbq
 2WrawMBaHHD5ejolcHM3nbKAtLHfE+w4Ojd1GlMTuUmgU7DqQIwCEyX92H7TWY5JaFSU7fePpo3nT+
 sYUQx0GFG5b4raOsQO64PIv8ViMtrGPlJFrVFP+L/KfqWGdTyr5pU1BlDXMYEayfjDy79OWkUNYtuS
 LK5TBRTFfpq8QpOOpLyaCCDHtJ7lww5Xt/DP0saNbvDx69kdYFvjphnH3PRQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010851_285082_7C0F1292 
X-CRM114-Status: UNSURE (   9.78  )
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

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
