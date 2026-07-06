Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F4C44500
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ozqV4RW5IamkDQvoUb4YeJsXX7cgSYtouRuJdtD0W0E=; b=V8sHHSgo75U0zX
	uX2aUVm0OYvkyyLPsDpHXd1000mdInBSEfxZIy4rw9f+zt6r2fYp4x1+92PX48xfpu5T+ZgqSW//R
	mvobMQfLOJPuTjT5irTcebZGvAUymGJgOfNbjZ+lNK6Ph6BayTaBfL3QxPUknOJrDRLTXgCgAO7Qh
	pTX+lO7UKh5/0ZbSqqgYM/3DIL/L5i3WQ89EJ+DoWb5O9DUH+DugUWP4H7Vz88INYibZ7c5EBA/HU
	+0f1jwIBCxBPCSEs6jBY7hSPARnuSsOFYozMzvvwcY5tSeyyaQgyCa44vKO8lJd+DgwrGDORRjpCC
	8ohNeRoZ1YEGO6imyPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjo-0000000C3zF-2DDe;
	Mon, 06 Jul 2026 09:35:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjO-0000000C3SM-3Ulu
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693vXm4172364
	for <linux-amlogic@lists.infradead.org>; Mon, 6 Jul 2026 09:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1
	R4x7Glus=; b=E3zin6vjI/qF1wrEgjKYtk5Xcpdl9QR3qkGdXi/m75QgOHaK8WL
	uyRytPtZM8tW3ee/GRXbFFgEsliFNODctKVxWaYIrOKOMjYKo1Vc/c7LRSJ33y3C
	+RcsplFJluO4DQWeVtJEDCmwUWJo+nZlDrvTGGO/zbqeDuEZNkvzlVVIFWmSueoN
	VBLfnnQyvesTmronBkFm39yBrmzRWVB5Dgt1m0D9vrb2Qa8gOcWEmexD8YDGFPIZ
	HTVf/aCzechXGOTlixQ8KwFT552d4E8UxUcjstBTtiDheKBC425EUhRhekBFSzaa
	ewpquNfpHR4PT75T2o2a5OGUUoOUkKzoIkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t889a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 09:35:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so265554585a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330513; x=1783935313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=;
        b=anx7rQgk7WS4Jhp7bzqkab9csMf+5VgLcsHt6QaEig2HJHLpNJh4wZhTsA21q9SHza
         GGHQ/gWFgB5/VqSAAGoU/iOLSwvY0gVHF36VHyQsYNP160SJzwNhJGrSZFvf1byc+f4j
         LcAWa+ojD+mIwmgZm5xuX9Z1snl/UjHx//SvLRjx/1FgNIVdTSM/V8IsPXBJTYZ51+yT
         LsbL6MG00zSqO3FabUVwZB6gNMhvRYLqw86rXEXV9yepHNTV27Uny1NhF5FEK/QSsKCl
         H2aU/n2uiC5cIeevJCH5FhbzZAaGsodV4Da0rUbnTKyYPVkVR4eEJWiTi6Kd6B+m7H4V
         xqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330513; x=1783935313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=;
        b=mKNrbOZuKOAgPhlA4Ou1jviizIoCpa7I2v4NVKdQiPQfVtxe8YuEtO4wuVdgWvqRP4
         1b1ApGdVJtSpI27OPfea46ufscyjpPNrz4JmO0q+9F8Ut+jCNqs9/WsOpxe6Q/SFxWqF
         cnUqqjldRMDHshXHsoCvKSu5tXLtMPyY+yVb2Bf3g5FQZg7cfdQzpYmgqKVC3mnm9oSf
         0rr4Z9FTAuH0X+b15BdaK1vbmKVlsEvAUtnV5NJv3kfR0G5jk5iEN0OGUezRd7E6ic0F
         KAjlL3mL4rAc997OVRxAvgT8dnEHQHgeFq8RHtxvuw6/Nmi8WdiHHM437bXVcLdY8WCh
         hgnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8jR5MJi+U+Ly3iBJhGkgkCvjEhsqbv0v+qgTOxgz2b8fGcI5+z5/cOa8vs3ndFcDDudCB0eHYS8BDOHwE@lists.infradead.org
X-Gm-Message-State: AOJu0YwdyhnwZKX1PT0/yoOabZHS5RC8XxIkEalM0hu/75dWn1F4JOTU
	hmBdInfUysox+Mv5nlCGTAo5x2RgD5Qu7tmAZp4xrE+yRSdK4yl3+wsA5ODQG9q5IDCrgiviEC2
	K/E9ESdkyXKzeTnST+B7NgAaggOikNFad02F4qyg6TmhjapKvpa8jELDTHUWHOy/kbDFsSuMfYA
	==
X-Gm-Gg: AfdE7cmVs8XtYqrKMeg2mGudwNIDfs/S75EUpEOKc6ruSQHLlIaFGcUf43GQODrXwLz
	BxLySNasj3hmpU0wWrK+xLBz3T215XH0cx0RpsKqDt1NDiFONfcu3XUjLBzRuXjj1PjjV+KUN8R
	u3eAnKoOzjXNIyP10n5RraWOL907OeKtFlC0hIvbPWKMzHweuKtWFO7c+8/ym9bwAks0CTos6M5
	xfIOdvYeOF6KaPryjXZkYirw8/55Nxtm+E2rfVoaRlnMf2Zq12wtSuH4oWZQAWiy5t2ZBhpbHz5
	rFYs8PkCT0d6bqXyRn0s61ek2TLeRsY6v4y2P2dY+WJQ2BiwGqcLMGv4xJ7SiltW7YnoulhB/xD
	TxlQwbkNzWzlUx6MwEusGPJhNRQY=
X-Received: by 2002:a05:620a:170d:b0:914:7e9a:2716 with SMTP id af79cd13be357-92e9a4a39damr1416534385a.38.1783330513446;
        Mon, 06 Jul 2026 02:35:13 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:914:7e9a:2716 with SMTP id af79cd13be357-92e9a4a39damr1416529785a.38.1783330512961;
        Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm643831465e9.7.2026.07.06.02.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: amlogic: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:35:09 +0200
Message-ID: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2784; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=68yixvkGqxm+DcPwltEo2KU4Gf2PeCpLBOvJ/E4rAKc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bMNz+1+uTeX1yXmY4k6X6lVztcBi4LMoWE9
 W+lhtRViBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2zAAKCRDBN2bmhouD
 14WnD/0bf8oMP6p237PTTdeoToQZaShE30T9JA47Q+inYKAop4cuLzZjG+hHf4YzX8ChmgFrTzt
 g55iuaDFA1s+FeOZyjDJsHol8bjBUek+Myxdn+bWHlmLszr+0JksGN0Bg1EXgrR0qhNQq2kejBP
 jHiKvDF62sUDrfHDrpBHPqWzutswYzIgOK0OngJWZFvegW2B/SuF3z4l22GBYLC/bkxC9jiDwII
 D8M6pbLzBiwB9Uh2AF0b7Qg1o/bJtyUMgOTgaE6FoxFnQcyDg5hX5PvJsb6yZ0OCr1S69ei1qYx
 bDeTAc9tuo/bavKbIXf+3XRiPIxGOy0LH3oBVmd0IWPbACb78ldVwykmwnbPyoqd1q9ieSbB27v
 wKGPOfJ6En0C1h9D8z/dXow6iywPUFr3+DheCAgMnzgo6a/V0tlTxm/nGto0tRXdvcGNtPoD7Ts
 YWGcql1wGMJWOT/HHV/ZyAZ7TqDiQoGyCK5dJvFdL965QvMyfhQAB+UrK+oMexTLvioECNW2Xd1
 DBfm+8lKGJA9Fh3sYik9J3PjWNDK26zTkLgK0Kbit00xyaoncoizTuuf7N0+bvy96Kl4BP9NWtM
 ToX1h+s7os++R+LdeCO0TtXVECEbMrjjdK5JXtncSnq0K/rrzrzJ7DVeDZxj3Z2mPRwsAR9l7Kj 5cIh31U+QdaEOiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX6/Us5BRCL+h2
 hS83Y38E2PnJBRFaigAkVAbM57MA+lZkqBTmwp7PwyM9Fx21uthnZuJKxBeG9XoP+mUw9nNnBgd
 S4kNLZMtBb1YABn+W+ReDwqqE9zk1Vs=
X-Proofpoint-GUID: NGN2z3j-bNMQgMhZlNyIYuUCOLi4BcBx
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b76d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VfHiFvvmM37wtYbmGesA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NGN2z3j-bNMQgMhZlNyIYuUCOLi4BcBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX1lDn6XPVyqXN
 3RWHbNPj65HcWfMj96IFTNd2KEtjzKfm93tPigCg3Q0sjk4QpNxUWKxjJdKW72ZdTUEbuEh0GRD
 edEYaoKe668W/gP3p7WUFUhr0fbSP7UNLH8kj/5fr1/UVe95eGQolpNlCpFEt6zzlE62pfb/JQi
 eLVpA5wtKJQ6BMTfPxLPDvcA1PzS61rcaUgv3Xlm3qu8eAwj4Vuw4D3ZcnIq8AyVamLkem5fPaq
 c2YDVZrqMBCs3Qwaf5+FT3IiKwHuErV8QpCJ67nGuS6igtVnHkZKoeeE9AYI3BCAuh5qvr043kp
 iy7V8lpO7IaHWdRdYZWf/v43QqJ1ROLG37Cj0rDKoNdEV4LRxB9daX3ORSWnLRVJPJsag6Wb3iZ
 tJyRmoYa/tLoD+poOEumOS+CZlYEgqegq5GW9PZWIlP36JZbwYyXLXSk2+mEPNxNjwZWA5sEkOa
 c8iNkDa3kJ1o/jQq0vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023515_373554_F030519E 
X-CRM114-Status: GOOD (  12.82  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 32 +++++++++----------
 .../dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index f15baa708b36..8254e51d5e27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -88,25 +88,25 @@ opp-1800000000 {
 			opp-microvolt = <831000>;
 		};
 
-                opp-1908000000 {
-                        opp-hz = /bits/ 64 <1908000000>;
-                        opp-microvolt = <861000>;
-                };
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <861000>;
+		};
 
-                opp-2016000000 {
-                        opp-hz = /bits/ 64 <2016000000>;
-                        opp-microvolt = <911000>;
-                };
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-microvolt = <911000>;
+		};
 
-                opp-2108000000 {
-                        opp-hz = /bits/ 64 <2108000000>;
-                        opp-microvolt = <951000>;
-                };
+		opp-2108000000 {
+			opp-hz = /bits/ 64 <2108000000>;
+			opp-microvolt = <951000>;
+		};
 
-                opp-2208000000 {
-                        opp-hz = /bits/ 64 <2208000000>;
-                        opp-microvolt = <1011000>;
-                };
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-microvolt = <1011000>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
index c490dbbf063b..5913e59ff294 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -64,7 +64,7 @@ &internal_phy {
 };
 
 &ir {
-        linux,rc-map-name = "rc-khamsin";
+	linux,rc-map-name = "rc-khamsin";
 };
 
 /* This is connected to the Bluetooth module: */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index e202d84f0672..d5e0f72892f8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -642,7 +642,7 @@ mux {
 				function = "eth_led";
 			};
 		};
-		
+
 		pwm_a_pins: pwm_a {
 			mux {
 				groups = "pwm_a";
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
