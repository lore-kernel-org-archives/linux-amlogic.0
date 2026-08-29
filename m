Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ACEC61DD6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2026 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XtCe3TuQleNYRBQi5ADBcex2Mdsi3RoZzWl5dc9E8AE=; b=lqP/knTpkHiUEN
	rgcJxUFgMzul2hqwKtkAATjDjQhmoe5HPq7IYly0Ko/Uk48MgHegfA6S926XFik1uqdM/oHWom7rc
	La7CEHlKHxFgACR7gIDgKYlnSRD2Nqs/Sr4ZAHXZUpFZmN79eJh7H9TUwLuYpXLckMK2j577AoF1e
	KLSlv5ga8wFAqFbJMgJBToyJt+9NSvE1ZyJV09mqRdy7eC6ceNJud/ZTS+oU0IQX5ZMEEwRoRN+XS
	Yhp0yxV0YBB2RYH5QeDSWHwGG1BsRBFkCupXTShV9RVSsTfDFnln2hI08M29TwhLIzLSJDfHasT8s
	fJsSfwEtZfnVGiVMEFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ou8-00000007Fwm-33mX;
	Sat, 29 Aug 2026 19:39:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ou6-00000007Fvd-0cJZ
	for linux-amlogic@lists.infradead.org;
	Sat, 29 Aug 2026 19:39:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx9bc2456899
	for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 19:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZEL
	nu5QLbhs=; b=CnBp7+tSe/UvqzdYeytpsNJFAF8gsSVg2Bc30CaibssYfzFsAln
	xC22heBRDcILnMbF18KgxN9bAadR58xegwUoA7FixVCY+zChKiQ/4+hvxL9VchIb
	hJuFxYo46GwLP+xnAFpPo8ADVobkOSOrz8H09mGhzfAwHo86eiex0LQqNyTLIsEc
	JnKP+rsin1wkgjCuFnYBwXjR1RxvC8MzoAxh/MlN/dT/YRzryhICy9au7/7iLtuJ
	MqfL211WQMetqbQ3Sdc44HH2tkMJHfO+1xeKiEURgaLdaUHDD/70WP7Lpau1bKWc
	XP9ZVeGGtGg56u7hqfWG8mRcylvtPQDEgKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhw9nxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 19:39:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so25793741cf.0
        for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032388; x=1788637188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=;
        b=TynL8Iqw5aus1mTty0cH7spTbsyj/06aXr1pKpFVEv7aCZCBE2OLR6dPrxJneclhn4
         +iQ1Lh7c4WiS2bc53iOLWSeKqhSwtJDq8oMsA1LQDXJnhXAL54LJwSw+YqKnKjEUs1N5
         WXNWLeAJO8gmXEtEnVtAeMBeF/0xes9eq47BXzTVWE1xz6B1urbeYpC2AamNgW92wliG
         KazZu5RcEHEC1qC97xygzedag7EaIvGyHC0lpBagLGuCUiB7HaF15p3QLnsPn5P3Mby3
         0iYcm3kK4E6QQXhSgDsiAreuWs2OMlvdicekuPLjF9hJAM85GRpeYLuIN2rpPg1+jUfe
         jXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032388; x=1788637188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=;
        b=SxUYfSsmv6GzAkvM0B4CDMiSh7so/J7c5sn+0Tax0gGEBXXj/saIerjETFO/za3Df1
         +X6tXBu2ntewCLWRutNC30tu/UpDjd6H6oCmv6Ci/RT93xqVfmoYmhlq+wK/DuQ2DCm4
         K8QNb39kn5b/lbZbLgJ7j4PFhlPJRubxp0gD6HSHcUkX/ekz+2JEOeLxSC9Miuz0fVGC
         3UPwh3cAorYuQ8NmI4kZSlk4GUYbvNMp3jYyhEJ98mQ+kzF32f452TLWd+nbOnnIWW8B
         QplZCPBpQKqvuBHDpL3v7v0/9Wa5NMgPBdWxNPreL7GQuGcyOIRoT4sHrK+PQg9A0zkZ
         7ANw==
X-Forwarded-Encrypted: i=1; AHgh+RozIPPkjirACV4TPYCphPHo2aINk1j9iB5aGFhoD8Nnj9ebKK3xxyp980KLp+99IwRtVSGnHEsOELPsgUgi@lists.infradead.org
X-Gm-Message-State: AFuF++m69c/FnsEGZ11M54KnBZWSDq0PXBoW8WkcacYfNhIxt/WZcFq7
	xnoClijlfhp4bp4yOCmewdEDulkni6rirK99aDccORIa15RDuDNCQXTJFYFZQhrRJtWyPikCum3
	VZRCDz2RQZNrY6SIb28NftjGMlFBKpjRLh1fF//Jq6CdxHHsrlsHUxPScQLaH08q36GXLJ5YXuy
	02we7Xcg==
X-Gm-Gg: AR+sD10VhMgDrc6JbQUUubRn3z/u8FL+B+IVNJQRFvV7Ys+/zr3P71xAhFHXtvA7YuD
	HEATUDfv1H444Z5KrYP2iJzq+nG6LcFx3ZIPr65wPN/11N4gC7+gsKWrzXXg/KSqvaIyPLQ9AUa
	l7ViuNbjO1i0SuCKvF32clv/MuQfJyaHXqeqRBcegZF/kch80HINc1fKjGo8ZDQFGnjnSagmkws
	96GXl8cBn/BCP3UEH3cMLPe5q71pFVBHoLKiLk7gXNaqk1aOczsjiJhbGQ/GhiM0L2zMOvi6AjH
	1OD8ignfIPT6ngND3tu+3/ybrVohpYLsodbmoaa+ZHEuYBoM+4WpQsT4mNEt0yw2pZxbN71aWa1
	imuhjxk0YVzV6WhI=
X-Received: by 2002:a05:622a:c17:b0:52e:f66:f1a4 with SMTP id d75a77b69052e-52fb96bb480mr178780621cf.38.1788032388481;
        Sat, 29 Aug 2026 12:39:48 -0700 (PDT)
X-Received: by 2002:a05:622a:c17:b0:52e:f66:f1a4 with SMTP id d75a77b69052e-52fb96bb480mr178780321cf.38.1788032388074;
        Sat, 29 Aug 2026 12:39:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm174807485e9.2.2026.08.29.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: amlogic: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:40 +0200
Message-ID: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2956; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Bg2i0c/hAjhdv9OIKOQ6pDZgOaY5zMut7G6FhJaYG68=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzV77bAJ3qccs3sw500Sm2xe0TUu8z8dDjiW9
 3F1wLWCHuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1ewAKCRDBN2bmhouD
 10hpD/91mk7c+0AJooUZdmo355ku4hNXWU+jRxVsS0RNOaDWsP8SI9t7BbFTVkk6EROq0bP0iA9
 LH+T3U0CGceCSauGFZbhZX4kgJ/1951Kw09YgYsZFjlAN1rkAZB+wycblUaqRXPkXK3qLR6W2Pi
 GqQsNl3+4JvlH13PdLlWKfUv/3Xrzd0z3UqfI5TbIhAkoR7hWQiOvJ2c269lxpWyUeUFpBa5AqE
 XjWFUBZ+mUvX0ZhTwBNyn3dC19tDevCClfNZ/07gSF1URpp3IuQdA4hj2EksLXFmGR2+HSqNI1i
 m+eivVQYhEB81N673Hcr3/zwuzP0mCVSIRB7AgskTcIag4USB2nnSeyj3pV2ywk/WsbGazRV/4a
 JsXeO6WIps2gE0HK3PWnwo1gIj7WddjZtDhzrRo4VPyiVzWo0OzUAMLkv+r4cakh2XtQw1/ObaC
 ZUtRvl4YzmP0FXA9umY/tDfdpekvvzuAfwDwLCH8nNPCUyF4YxvpLLdzF6n/5VKqUe/8lhq6Hmy
 G2c3gcwlL8+9XhEw09xgGmF5uMvwS+j7qsFChYJkUISElgXnd3jvZPKcugMM9jIc031xSIINGu3
 hasmp1zT/gh2ApbVAOsw6PQcqAmiWJRkW0uPl7iWaCuXcaRK1ccOV7iM90AB3In0onZqcMhk1Y4 3rE1vEQdrLTmphg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: yDiDWRaHQJ923dEj-7kDh8i1kja5aBTt
X-Proofpoint-ORIG-GUID: yDiDWRaHQJ923dEj-7kDh8i1kja5aBTt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX9fhuxxu/0j+G
 /TuP7AJJDJ0XVbGs6rKrPp4sIVlFYW2EYCWE91X1tNJ2XpoVc/f1nTHO3/MWbKIpFJb2vhvuqLz
 EHHxJDiiafjH2/pyGpR3L7e6Kn1F+2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX8EiaEM1DYX7a
 csIn7Oa4TvBHn2mvst2rAKvbF3nbvGT6glRvKiuQFRMO3dLxp45GT9Dmigh96Ya0u4ak9nAi3hL
 KwfcWKvZNELCBfARJL7SnW/k7Fooin4pgvxerXUHhyRcmWjmcaLKjcJcBBu1rIdS/4U4l4oGwMm
 5zR4VrJB64BpUN7QbI+t9hw0vko0WlQTokY6m7yNyHC6FtKWtJh89XcBFqvSRxCOwX18YgmxwE4
 PV+l+yT/THOmN1mPVTmkuWPOaCEe1OrxipCfmyVOo38xdvREwAppSvFzTQDCYLjbkmDKwswxJ5f
 MHBj27BbY+vT4GVf95ySg2F83tjUADuAxMb6fQja5CPOuDCukWKVg7FBtrD1gTCvzZvF2NXkIbJ
 s4wNjXS0NQD7auD/jM41MEEMFhlgwOJW2vgbR897pwcQarMspu/4j/ZJ/iit8asuGvvQnMhYR+c
 4HmrJpVVv1VsLurHFQQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a933585 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2LxfJNKA3dIR6THBljEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_123950_297675_30C91687 
X-CRM114-Status: GOOD (  12.66  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index cac73c59a94f..348baa4e6d84 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -608,7 +608,7 @@ &periphs_pinctrl {
 	keypad_gpio_pins: keypad-gpio-state {
 		mux {
 			groups = "GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3",
-			         "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
+				 "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
 				 "GPIOX_8", "GPIOX_9", "GPIOX_10", "GPIOX_11",
 				 "GPIOX_12", "GPIOX_13", "GPIOX_14",  "GPIOX_15",
 				 "GPIOX_16", "GPIOX_17", "GPIOX_18",  "GPIOX_19";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 5d9ddb814164..e353f0ed2b49 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -70,7 +70,7 @@ vddio_tf: regulator-vddio-tf {
 		gpios-states = <0>;
 
 		states = <3300000 0>,
-		         <1800000 1>;
+			 <1800000 1>;
 
 		regulator-settling-time-up-us = <100>;
 		regulator-settling-time-down-us = <5000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..5c2fe9dc4f80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -781,7 +781,7 @@ &pwrc {
 		      "dvin", "rdma", "venci", "vencp",
 		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
-	         <&clkc CLKID_VAPB>;
+		 <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
 	/*
 	 * VPU clocking is provided by two identical clock paths
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..f257fe3860f7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -851,7 +851,7 @@ &pwrc {
 		      "dvin", "rdma", "venci", "vencp",
 		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
-	         <&clkc CLKID_VAPB>;
+		 <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
 	/*
 	 * VPU clocking is provided by two identical clock paths
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
