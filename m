Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF30C5B572
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VnVg6SGf8VTmK+3zUj5QU1c3/JU+/Eq+R2K3q7tVanI=; b=yKoMTkbds9g/3R
	lqdqK3UePSGRKU2fmpEI/hziha8IOOArsZS0JtVD/Fp25EQtD4k1BaEmZS8YxQ4jqSXNZ9kaPKeKP
	wp87v+VTs31jxxuWA/jIXuwS/dcT01U2n/2WBZMXIdVx9TX9G8lrspbxATDzkxqZElthxKIkGMq/y
	fCIOU1zkDY6ndV0+A+RHkra+A+Qf+UDJIGrTy7uRG22vEjfQ1E/YQTd4/W9EdmBlSNwyV0FmgPPWo
	zaswmwe1RSyl8OuvLb0WML/0wtVKikvvXgGfht1JnxNtHw28ABADMMWyvCHQ8jucQFI+kKfAJR8Tq
	Sz5Qsju3WuWLhZE5+vQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9GX-0000000GJfN-2FoF;
	Wed, 12 Aug 2026 13:45:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9GV-0000000GJej-2k7d
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 13:45:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbT5s899547
	for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 13:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQb
	g5M5ApFk=; b=h+/iCKZjnv/cnKLWsVPIhbnMwvAg9aGKVfDK/6aiDaNx+QgKLCV
	XM07kzAKiA11zXyPcaT1ZXPHZHKgOQjzP4pWuekcZ0lIdBV56pHJUXSLfjrUAKFs
	Yu1GuGdc5NEsiRvp2lrAqVkDgu1J0WX+f6m3SFkzJiyW0ebOvqkni5wYZjzWl8Y/
	bu6D5Y11eM03P3aHEVw6W12Gz/cOaSRGplsky4fh+0Kf1f/oJfRiMTGdvPoZRmBW
	jflXGjjvm3HGzhPKI+LNUKzHW9NSCPOm914Q+bxQi1lEaT2YOtogOd1gOFeDVc6B
	0cfFA6m8XUQ/09UaIdccEJczLx3p2/7a+qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut924w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 13:45:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so120776585a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786542306; x=1787147106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=;
        b=Tb/7LWvkIZOYQdYzlG0WdWVolYkpY24g2fqiyagUCwMksTkc0jhMGO/kJLE2wofzph
         r4OxcRdnEOqFukcvHvioghg0KrxyVfHPbfn8PJPryY4kNe2ktFJEThNOGZPziQ9iik7F
         H+IQTM4opzzMj6aY348AFgq+Z22HGErs2t5Lkot8eeCrdcztwo5gmlihq7IFPpjP0So2
         rTUpSs7iN9acGRf2CUw/kaLjZgcOotfaJMn01RNDCD1hoOCuIAJM/HlOr8fbMODinZyq
         oPdAYAqfACPYQ1C8rDxWaJQrWEiRQBWZCjH7YWC8p9O8vZVHYWHzSsNPWZlL8j7S+0La
         o2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542306; x=1787147106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=;
        b=KaTXMvw9/tssMSJXV6/2Ncr9XcNVMSclexS/+g6HLkyb4IEga8b9b0CYm95R77cfjT
         bFxW6u7d/X2dfMZrh636wzBZD2D9sXsweAlAo7wBfYYsIlmvEl98xHF8JqxUO2c1KuvR
         YAmVMZ7qG/Qu+5o9bM7Oyqv2KsI8k9ieXXFADcXs+xyouWWFzre+AwgTe9SyC7WKmZGB
         AThh8lT+EYKaPqWVeOrNChZcb0n4PNlnoyjzTGEWTpPEcfbNjQhQug3flhdmzah9wRKr
         sszhdWFo0myuXk91PL9pBNBlY4xajwHz5MdBilMlOgc6t5GxxMr3udlrHuWCBgOiSF1l
         baCQ==
X-Forwarded-Encrypted: i=1; AHgh+RovlOlwGdNvn6RYb0Q+pMFea3dtDiDJSD5v79iiEgjbRvNI2uBoxmhCUtf+e+X25iqURwja+UnZvd8WYDBU@lists.infradead.org
X-Gm-Message-State: AOJu0YyyHHrrLpi1vS053EACe1vw0GjtmHEiqQtp/j/yvfx22Qsj6x7q
	3FmsimSzD3Kg4MPeLwKALnQBmBUscw3b/hdvm55x7E9YWVKlYzxW4cw+UJnSs0bQZ6asdxLQeo6
	mSKEm1IopbmloT0KW5aCTtUqgNsEqOisVzffxd5AWnDekmNoOWPNJ4KYg+EMl0ItLMCYgan9OlA
	==
X-Gm-Gg: AR+sD13Dd3+YIZaSSNAMVXiCI/PbnJkkE3y9wbJO/RE/UkmQSzYXQHhdFZrwbuo+UEc
	KyC4HwM0Y1jgB2QxDt1HhUpcQjLUqB9NWh3cXCxs3M03ueBQQMM3Wt49Zs6HzDq4d+mOD2JpcPf
	bNcCXhQqQ6O++ARekfdyc7UeIB1ctvhkv5c9K9kCuMWrrbf0KNUdc0lIl2sZD/Kum/2W2SzCwIQ
	Mlaj/BbcI4IT2UDf1llvhTqgTrsZItbMPsArM1eHIPxrx/XLSjziPiS/aasNmmTL1Dh0Nt9uK+4
	ysmpvUj148e8CX9g6li6jWf3CKIW9svARiqWcWbSjZIFyyL2ndSS0Asw3ES56GAkmDUQx+2yHTo
	nd+3HpBbTTmTp4kz9
X-Received: by 2002:a05:622a:6082:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d6482d9f3mr43867531cf.39.1786542305985;
        Wed, 12 Aug 2026 06:45:05 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d6482d9f3mr43866781cf.39.1786542305543;
        Wed, 12 Aug 2026 06:45:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c993d80sm52793265e9.12.2026.08.12.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:45:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: snps,dwc3: Correctly restrict number of resets
Date: Wed, 12 Aug 2026 15:44:56 +0200
Message-ID: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dHXdSEWJo3Fjmi2CPPFQMv893oaZbPDhTb0Zj+OIl1Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqfHjXSTfXOV4HITJSOcYjrngPqPruu9qzNufO9
 f1A1xMOydqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanx41wAKCRDBN2bmhouD
 18YRD/0RZH97CUS5pDObp8zz2sZPR2WGr6sqRsKyMGxXbTa0Jf4R9Y4d0NS9Dia/oAuUiOoJJQS
 4RBY2jUH1v3SBqHOiPzzmwwgGmSoolkwlxEwfXtqbUh1XUH/N40ZwoHVKYTH7U8lv3ehhnoU+Hq
 ckFuX6smhWRrWZxO1Xs7YWmgbdyh6SJiLXD+z4FZoRbPio29gqoqSVrss1kIv3Y3BY6djPQHKHV
 r7xP64OY7XWA8RmZhD5eDNiWV4StHhAOvK956kCiUSsWVxQvZVn6rbV3x7ccW5jFFNi/YICAj38
 UXCIoPC/vXw/cPaSCVpsbguMGMdTJlkn8B1Nk7Hsay6MqhqQXXY5YKppXaxrrjvit8KcTqZfk6b
 +6bi1EVUsbRI4//+jDp3cLpwYiLwcK9NluozhFPZcwrMRN99pLAs+SJQrDUnNFts/L+uM6V7yfg
 qisjVbh+U58iBC66zZlFZvyAX6XhjtBwVCq+bB0Jo/SqLrYnA8flGPaGz5qQJ1DA9m5/N9XOvcx
 raAUUenaSeeqxd552EOTA2LEftoXZ52zsEgV2/SsxzCmjmj5XX+pyZR/msibe+DlRIq4FV4h4B1
 ho8HosizCz1KJkpGMtyr6qu1IBSwHRUJvyz/emm2VTznUKI4ZU+dtg994K2/eANSMhhsu1l6gsY CD+u/oBf7yL3X/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfXy2CI0kjlIeOw
 AzRs/d5/F4Esda5Uu/2B7n3J1TIzuMgQfAo7HmNreznTjTB7AwNkf36fs9XsKl9XOef5pus40sd
 R+UH3RQndzX+uuPgxTtXf/JGxLvhMBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX04K+/Q6m6STl
 Ad5nJMEF/QID/esK+PkvxeVWGpzh3J/VpBZkd6x5vpRSjWq/HA4Qp4mTuKq4Y+oCVoLBj36J5UH
 +z6y18yq9SosTzuVQN/3WRgZxK4PE6x0cgwD/MzyYgsiqUuYCjdIqATnsU4qE10v4kTnemkwrMn
 BY/+UMb7Fwm3iuvhMHoDV4Q1nOW+0TO60Xnn+Fin3hQpZO3/ZcaviICHhkIgS1p+QpCVAk5vVvM
 quBPvPc7nCIwHIkDWuc7FNZEtDVDIqagnQrU1ovPxSsV55sngE/vUa5vS4hkwiqk2F4RwaDDfSG
 ePvW4CQY1g7M1LtWKuFr73i5sPlX8R3gPxq109agz+UmAqt5vfTeEn5nQVhRu4Xm2K/vRta+7Ry
 7xoltyNLuHUyjKp87S8fhUbfQIujl4bFBKu5sQHhOWC8YmiVctSfoPG98YnrovDy3MK6HupLzZg
 zRZvI7kCzKc5BAQFAXQ==
X-Proofpoint-ORIG-GUID: Nam_7JMEc5yOoktcu-NVikGY-4b5Po-a
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c78e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=F0jcGj4a8BhWEZHBF2gA:9 a=ZXulRonScM0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Nam_7JMEc5yOoktcu-NVikGY-4b5Po-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_064507_706552_2F81708F 
X-CRM114-Status: GOOD (  11.84  )
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

Add missing upper bound of number of resets for DWC3 node, because
"minItems" alone does not imply one and any number of resets would be
allowed.  Ideally this would be restricted to "maxItems: 1" (as in a few
other bindings referencing snps,dwc3.yaml) but
arch/arm64/boot/dts/hisilicon/hi3660.dtsi defines node with four resets
and a generic compatible, thus make this one an upper limit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 4380bb6fa2f0..6eb6a823bd56 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -74,6 +74,7 @@ properties:
 
   resets:
     minItems: 1
+    maxItems: 4
 
 unevaluatedProperties: false
 
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
