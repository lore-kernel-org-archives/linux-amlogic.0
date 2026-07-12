Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B58C43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTpvxLh8/3nb7c7sb0uwcV2QzmYFH5CpBNWHpqv8YVo=; b=wz7IN73JFHm93x
	m/L2VKXY+hXf181lc0HKy87y4UPuM8mD16gzTCXe5SpMmCl7EcDuwTqRhmtT5GYswReTR6gh/QNMd
	hQL672FU8RaRA3awcz/7ozwOmhalpyc2k3qSWYKWMN4n/Kw1qgdThyvI2woaoLDcfFtaMP9DkO5l9
	1S7+4P0k7CNIQSpQN0LlHLnR82uRUzFTOC8pvnpJBCswBFeR6uWvMl4/jQkE9I99QDJaOo8zGhmlA
	EqPLLgRod1J9VAyxeOfQ5tLXcEOiE9JWLdzq0Q8mqdeAxvOOCw6Xe+95WWVctvgFaNClNOIOjLizh
	/+qqqYqH2+YObwm4VNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivcX-00000007XrE-2XbE;
	Sun, 12 Jul 2026 14:57:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivcV-00000007XqW-0sOk
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 14:57:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZWgF2749620
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 14:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/
	bMBeEHG8=; b=ZzeYaWQN41TGzdQrFgh9bvy4DfMIUIpA75j9VXX/0Yjl/pnZ3Th
	CdQ1mrUlwxKTSgt+qVsfVUxb5wnaXuaB/GMQ9W3RzC0KWkVlnsu8JRS3PPJxGyY7
	eCOcd9z53brTPD6mcYsUIxwxrWa9ctWssD2Slgsc4ab04uqqj1GwE79zPY9qXkup
	1BVVxiCD7wJQIycRHLJmiWZW2op9nyKbtrSr8GOywvmsV5gRWU8czj2ZjrSxHNYI
	EBglMnP4lT7PHrNdIXG5bPFDV1r41+OeUBodzbXfz1Dsmanvu1Qpb469BMM1yYoH
	Nb8+SwhpAQRQDjWwpanbbvn9e0vTQ3DVADQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgk0cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 14:57:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1852a86fso27391561cf.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783868245; x=1784473045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=;
        b=ctYeoIndYYwmmB2Z1Fxpfb9Del1HlfQKMmuEwGHj4Bjg4hnIgdYOMi/FwnHUuy6DYJ
         a8fIDdkSb5divypRcI4/RpMntwGIT7kH7H9pfsDcgcC/3cfrEzJ4qTTogvfLcXWgoGqL
         b4xBPiLCgNDjDyOCcSv5Vz31akwRC7GXyspooOp5lB1TKxJHdNkwteLGi06UQKhbiVAY
         x04SyZLZlII8IC0p5Cyy7XDP5ADRQDENx7d2LGJn0JUxjls8bTf9VxgwixlLhfTzMgEH
         yknVsZ1jqs4tjZNwropQ1vuhkud4UyVZiiwVaytH8LjdGOLjOxL3ZahdSdxYZE2U5EwT
         laCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868245; x=1784473045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pmF9pufgD212aiIVdQOWs0k5GzQeEFPiS/bMBeEHG8=;
        b=TdjfwHskbvqrsOHSLUEwEDa20iLhJ1/KKvBFN6ZLfiL7rJmQtnz0zx/P+cTwBXxG4i
         XUjGuZE1J18oCLszQc9ySbKRZzqI9mfmNqieRT44+ezjozQHZ/MwDPZ3vsKBGbaJAzpv
         S9cXYVUHMDcmSXd4bkbIOMn3roIY70g0tRm/ngVe12FHtBDW/IXqt0h+ACcEu59MHQrM
         PKW0k503xkokxzL+bIg9lUpfZH9s9LILiIZc+eG/fOXd1aMjtt/MdrDulaeq3nitvXsR
         VBOcEG2nQDCZNu6gMRf7/C+8yhY9eA8hkwB+WKLPPBGCEOhHwdPjCd3H2lGmuh3OgZbk
         UtMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr4SJTrxqLVkuAAIkVBEahXLZDhTAFlEHw/QATpY2qM93ZiiwIJURm3//Imk1Iee8mWqz4/lpj1OilWR5p@lists.infradead.org
X-Gm-Message-State: AOJu0YwiS0b000MxCHSmph3I+cRAOYI7AYYqkU2YYzm3TUiPo9nmktuZ
	A4lcNYxThtWKvpf9Rb2eDWhaGJgk+4j941PQHnKMrfyEb0O0CgdtZAxA2VOq0XIwDN82loN4Oru
	a9eIjRZfBkDxSXLr+rp6UdKtWfidFpxQJA0D+PPMY90E3hh7T/qzkwBIqXBynB80hzn3BCdb+Tg
	==
X-Gm-Gg: AfdE7clbik3C6bw4KWjB/6b0ms62F4uLZHUg4/YUpo9ra+YX3KQHnvztTw0XGzmQGX9
	i5K9PqmXUelXJbyDUVEPuBk/pOMJ9BhhpfFJBicxOq9RSC1v4n4iA5HBw/oHsNWT3WV/8deLdd3
	zI4CEwtKwmwHPzLFPpSKPH/fVW4WCMgBkg0Ar7KV3t2cShZfa/bmzwSj907dx4s75ysOm0rSdmu
	mM8+oo3875b/pTwSDnuYyPmqoc1xSMBvq5pXkSEAJTJhnqgtF911J9GR4yM20x5At1glG77isZl
	ESJ5DFsTt51doZ21UNoEtsZ5l6vWnh4JDKCaWYOb5w8LjJoX6nlIyAsjF2v7KRaAuJVxwXE9y0P
	lkCFKLZmdzdfKYcZxeyXHXDtsFZY=
X-Received: by 2002:a05:622a:34a:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51cbf049379mr63203141cf.9.1783868245086;
        Sun, 12 Jul 2026 07:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51cbf049379mr63202981cf.9.1783868244698;
        Sun, 12 Jul 2026 07:57:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm222688675e9.0.2026.07.12.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:57:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 16:57:19 +0200
Message-ID: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Xam3WnySSyihDDDGxNPmRcmRKrs0uTJ9euwWF3c2V3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU6tODyBAdxCv7LttYZ1TljOtnt5RYl8TpHtke
 z5IVF2RgpKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalOrTgAKCRDBN2bmhouD
 15QDD/0S5wV672WNwxOQ+uf/SmXYU0a/71SL7SJCwz5L+Sm2S7Snh+QEnukl/91QB8uvvIKbFUB
 a6ptRx6zWLegA9e76DbjuYkOItsyiiyAsyN7Ps3U14JYWlYNfaVt/a4b9Jfv9ahBrK9G+m4/MbU
 Q/jbnQM9DDxaNwj0nO5vzAM0AtaUskzDcau48XzdTpfTafyulMysq+gTvikJPCMqmc7nggB61RG
 RsYu/KPNeHqXPwktw+my++ko1y90OJVHZ53uSCFwNNaNSXsUozeXUgGTPjZYpYrhevy+KQGB6e8
 o95LTqOeTtt7RE3NiCMIHjfZCLjLKm/noI/SP4AHAKjBh3kg6AuS+2rfQTHLDGXzjWG4/qAyAVa
 O3GHO+MhqnkKqunw2Ci0LoxS7UByrmyFSSIjdMK7+HMJlQ/lzUBcAhTA/3QK5rneCsZPZzWYkL9
 BzpBfXeIPyNoLAJhZ2Sqc7BlsnfvtH3Nugu2i6gEQqZOO6mTKoeIAsDNlnY49RaK+2bQZQZyl/8
 P6R7xJ1+JVIxajvHdYrLCOL4Um9nKvl52uzBQZE0aGud3Debt2OfY3BlD4zG7JksZgf2oA5MJP5
 DfISs4qDlczuoI/rRyNtHXBfTbN5c6XeZusZc8Jyeh6qYe6HS4SqD60Xx+3/pYxBr1gdVtA+TNR RsMLs8SVQsK+bNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfXx+P0Bvm94B9N
 KKUAzQzImD9WD2BJly5bt1Ns8ELsYFjyiqyeavPNVv/MlOc3bWKP/8OG6OKF2koGsoa29SBXpkn
 IePCpZ1cuwBgeTWkp0NvlzUKBXo+QxA=
X-Proofpoint-ORIG-GUID: kbmb7iKcballIOM2faZfhQPfoY9XNsi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfX7S+C6Bnve4/z
 JxvQQ/YAgU/wZZTpHwB6yZPFEoTd+dHaq7Nl3Dzyl7iM8WMkgf0OAlmjRIZmRJqpAZqEjupqLS4
 VJOxLF0Rly6Z6KrR78kOmie5fjM0sC4MOMI+UzuE9AIU3n2wDSwvDFHX92oHK36Q7v5Jy9jRO3J
 nwHsxvGpOEvkSmISy9vh9N6oMm9slljWNR2UYOXe4J3cTSpbRePdxVuG8z4gsJ7oDilsfedkPch
 2IKD66QFC/YLdu+u6eYi+MbOqc7bxrWMfckAVWT7iVkXuSnw5nWVQrrOUcYXFvcSoLFxGKJDIAs
 GMh5h5kKGTomUk99kaztZF2A1MNxLysXmmwH28EF1HJ/AfSiNkivctnlbMTxgahBpCi2RwGaSIw
 e7qyHJd1Q2wY8RmYdPk9TEwzDJGuqcOcY3NuXqyrLRT2Gu8T5J2wfSk7+I9gMb2bImgmZxz4xeu
 cZq27c0plWmEPXwT4gQ==
X-Proofpoint-GUID: kbmb7iKcballIOM2faZfhQPfoY9XNsi7
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a53ab55 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hJuU4UVuZdPSbFSiBLIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_075727_376330_E5CEA60C 
X-CRM114-Status: GOOD (  12.96  )
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

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
 .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 3f710433e937..4cd5121b9a4e 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -25,7 +25,7 @@ properties:
       - const: amlogic,meson-mx-ao-arc
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       The name of the firmware which should be loaded for this remote
       processor.
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
index 2811334515d1..591471e5f93a 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
@@ -30,7 +30,6 @@ properties:
       maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     minItems: 1
     maxItems: 6
     description: |
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
