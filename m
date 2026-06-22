Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D01CDB46F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jun 2026 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=67LnGgyzEZTz+Z+UuelU8HuryR71aqVJv2QSW0zqLOU=; b=kE9A7XttpqgXE2
	uSPABtZk/oNFW+JbEP2MBJaVGBvAxeMGIS+byKhSGaFgsJbcHpH8VBHG6bRZP1iQnxgT8QnX8i3Td
	D/q39AchdsiEoU8SNPQxq2QGt2lScLH+b08kmyjEND4bWiNaGYtoWOQ2XesX2Z/UK/OtT/ups/pQP
	pyHf5YDux6lNMpKt1fR7EaacN3ApUOStfwfg9awU2WPoBt2SUl8xvDdtfj58tojuBab90nLrY0CZi
	QIQXPjYGbobM75OS15gFXWRHqtBkuwtzYXduu3i1iVDVf8tiA6XaAA0r/jizeZxYiW+8kv9Uw5L3Q
	n7p5Qpz+AfEBYhNN13/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbUJ-00000004ncG-2AQS;
	Mon, 22 Jun 2026 10:02:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbUG-00000004nb0-2rMQ
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Jun 2026 10:02:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59RgU2428439
	for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 10:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qXMoO+23Px0OwfrZvsqkySjzGHIOA5hqkO/
	MujvCbo0=; b=auXNUeIDYdIHlx9Unqu3NHw5IFBSQL2mz+WU4z62UD2oYLQ7vd3
	lRBwjujuM0FxxUws2MJh0nAvIXFCbCpRDb5mIoShtD9H5xofr3VSguQXqmsO8zJw
	WDdLkYAiwJ29RHxdQ6Yjb3lyGctimZfWxXdcjnkIwbkpKkVxK8gWUlSVT5RTz02/
	jAf/5IXDPEnvFcj6iOTnLKAcC8yEyUnxyK1b/vBaiRePmZa0lmrHhkirKzUEhW05
	nOU/XyFYIqLIJzCxKNx0lgEOj17I49AxXo6K+r+w6folxvfFA87TDHIAP1A2LGyX
	/TtBirUI2IVbCP7Fw7o1UgV2iRzMHky5V7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtse1k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 10:02:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96722117cdcso379040241.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782122558; x=1782727358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXMoO+23Px0OwfrZvsqkySjzGHIOA5hqkO/MujvCbo0=;
        b=huCZCWlm+mYcHNa8GsW17775iKhM01T0iuX2Jm8Hw0DHr9jOTICduD8/yLrMMdbpLU
         mkuOqR+o1Tx7sdQbC35GZsuHKqG+VsvJSd+HVQ0OyKrSgiBj6wRm6COp6tEIwLuuT/Mb
         juO6/DIDj9CU4HJgc+U/PaKrTZ/JZIprndd8xmPJuX0Za7MVkthfs/pHeoG++HEFrW2O
         t3qfLh3V4pNGW8ZIWoaOOxFpFxvruJC58WvSia3lDQmBn3vhgo37Mu7Oa1k3SphzHp28
         Z85+TIofQU8C6xldECvg220aJkCBHRWQ7adUD0CEL/M5eTFsviKBI8FbgmGrE/dM8xry
         0uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122558; x=1782727358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXMoO+23Px0OwfrZvsqkySjzGHIOA5hqkO/MujvCbo0=;
        b=MAkLewxxEDU4s7Xu/6lhW7JIcyDiTZ9yYvE6nh+iI/uPEcmgxrGkkfUvI6zbxB8sAK
         drdTxBCM9FcbVE+IEmxFFHQ1p1he8I1y4u1QVmTWy+kWEtqCVrWOb5/Qed2NT07XVa9c
         +FOEfk/cb0S7da4WJ9wMWfoOJFdoE1R3b5KHLrIvzoJLbeaNfFFF59OMMHsxpwhr/JeO
         yF+DVp3FUFmZwFoMKIoePgddSC3l2u/pqyRE543mZDrfqu8gaQnCI4ZwHTBOYcjsz0ms
         swBMd4BAZ+YZRl4LcohnSnXCdoEe2pgcXePuSthIrmi91+2u5GBSlYCb6rjoUmRaG/bG
         MLXA==
X-Forwarded-Encrypted: i=1; AFNElJ+mjJzUxxLCqrCbMT50fNZgt5tjLPI4WD50u6FbcgmCUbs1ehzJ9Ncc10Ykq7w8BJTh4fato6Z+EmzwQor0@lists.infradead.org
X-Gm-Message-State: AOJu0YyXuAdHEeSf0NPG6mMXoBDWo3uGjRjn9IqFs1RXDZo54b7MjwcP
	sOLpMaaiv3p9CS8qqCfoM8qIJ1XPtl5tkvPKxWSbQ/rDf6GgOkxj6/jpm4H2OqJSrL5cAl8oN8G
	xAM742E+ejyo803X2lf+sxXQarNN0KnyILSfkwQTrUsQeSyOeGiYnKYnx/ykYQxIOG5bOXa1zfA
	==
X-Gm-Gg: AfdE7clt2msiYqsqB0IghybfAq8u3GfuYe4DKXWc7Av3FEqxTPsgMvP7CKSKq3Po2Au
	pM+xwJyCLlYuXP4Hhg8fMb1CuJaMWL/uouXrrYGsMGKNzfQ0hkeIhsL/utmxzf4I5AOt0V4uriv
	gUFtZnBUK7PjvcfolpWSfwZHfFaYeP2u1+NE6aM6pgRW7wyJwoidFcTCTc11tEE+5bet9f0uu1k
	T5rvEeQSINDDRjOl2YncjESa1zNlnseVWkCTmvGDm+eKGARrFAm4x4sSBfgel+Xw3xm3xkE1SiO
	uzNIQXHVFP9ECCYsPB4UnH51Y8fx/pWxIGmhTttY9jMx5FDir4X8XGb1SLXlCm4ZxaRsYZ6MI12
	MrXKOv1VBbYHwahxJtApwLqbSydU=
X-Received: by 2002:a05:6102:5f0c:b0:728:572d:80a1 with SMTP id ada2fe7eead31-72a1f6ec03amr7010117137.21.1782122558219;
        Mon, 22 Jun 2026 03:02:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5f0c:b0:728:572d:80a1 with SMTP id ada2fe7eead31-72a1f6ec03amr7010061137.21.1782122557663;
        Mon, 22 Jun 2026 03:02:37 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm26969074f8f.7.2026.06.22.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:02:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: thermal: amlogic: Fix missing header in the example
Date: Mon, 22 Jun 2026 12:02:32 +0200
Message-ID: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xiW40JPZwqsEYVD6cBQyY3iOM/mpdV4HTfqmrLGjM3A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOQg303t1rJeTgKVro56ukNiv21q/Aqa0pd/vC
 Tn0HtAImzKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajkINwAKCRDBN2bmhouD
 11hoD/9stQQ73qmlHQC4U3hP3M4KnL3mBj6o/LLYxvBvRNPMJX/vxou/V70zG5yHczZgw2bR34E
 9GuXUPAmu5Se62J8QNorNzrfteTZrFZEcFLliFkwm6K61a1Y3DCqWkiZSoQN2xKuqs4LyaFDKZh
 LZYpJbzdEvPWieSRin15LfmjZAIYAoRifoJjS6kZdy2pdWr4CEYb7ubO7DANy0vaLvHsgWlJksS
 KUGuqPjDa5QRo3QCgH7CrYii28rWdjmgQmmTElW/l190DlT/vupUikmqJWCPUqVXVMyhc58jhsT
 5bcvRRqn3S160hpCfBInFIcVg5p3B6sMdduaI0BQfc7szcpadCloosEyLmXT8JSiph8dGLHDrga
 XyI0bwS2bJyxFp1a09dH4W0GpnA+jVRxvM2SPhUGPlLROTa9j2wWTEWEvfO21oEPG6JjyuvbGIv
 t+pXVg+PXEbyn8Pta6pXXgxabphTLbMebdbNiwUllXk6mYLewcxgta4BOptzvlyEBJZpi8GbnVV
 t1CbxDmOc2JOVtJY/aHDVv2jhhN1WI3xpHZAKKHay/Cg0bQNUeE6ICxcmm3sQUP3k3YjDReR7FY
 XQeXmFzhy2WwFQU+e8pqCO0DcbK/uqR5MknGqtVzD1Gt5BQBSCyB/mRT9fh/WWdlUoBwEAwp5Nc hnsvPdYariZq6vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6SXBVmlA-i05ZzE9_l3-SHJKrj76gdSD
X-Proofpoint-ORIG-GUID: 6SXBVmlA-i05ZzE9_l3-SHJKrj76gdSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5OCBTYWx0ZWRfX74dUxOqXwBiB
 OVQb/1fQa+nvMMl8KyzSvo5ZSdkpyJ29JnQc1MRcbeqO3DJH01R/kqgO6pKJpf+ku9Ocrv1uRLW
 0+qd4Dm6JES338UBIBVKvA1Me+YuWgQYVFi57NbS/LxLVNEpaq1AG5CjEcB4EYtGLwDSgq2wKS/
 UuESnk1ywXyeVVAytblZysG18HkCG1HnAjurMVdngLMdi48B5sV/CR6R5apnH+iw2CBE2rpQkgm
 XCHHrtOcJMPd0qBKIKX5aR+WutqZ8JzI5MDCIFbdMXPy91wGrfogYokNHVZZ3Ma96+dgAmQcFNB
 fMXeP3jgn14q78e3Mjc5of6clOKvooY6ucSZUfnSdfOfX1o8kzpVPfLEyy/4Qk00r+/rBwmB2dX
 Eko1kvBS1S95angk7eHEM7eQNYwifGBD3ZAe6U3z2qp1SpdlGnE1GfFHBuig7AOff8XmoUTeBZV
 Ptgo4iBZzxgeXwl+XEA==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a39083f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nNYyxOnhoC1xYqhD2HcA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5OCBTYWx0ZWRfX3+CuP8o1AZ0Q
 3h/fPY1OSX1QVKQUxt46kVc3mgZYYDpK44MUu2dD9RVH/3pE4EGTJ3AHgPlyL/yqAh8IddRYHho
 h/WO5jPugSse8JVby8MfekqUB8kvP7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_030240_729985_3D65ACE4 
X-CRM114-Status: GOOD (  12.72  )
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

Usage of defines from headers requires including relevant header,
otherwise dt_binding_check fails:

  Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.27-34 Unexpected 'GIC_SPI'
  Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.38-57 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
  Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:60.37-45 Unexpected 'CLKID_TS'

Fixes: b1c8ccdbd4e9 ("dt-bindings: thermal: amlogic: Add support for T7")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for current RC - commit already pulled in merge window.

This should be applied fast to fix current RC, thus maybe Rob?
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index e28612510d67..d8f7f3eb7ae2 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -87,6 +87,9 @@ examples:
         amlogic,ao-secure = <&sec_AO>;
     };
   - |
+    #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     temperature-sensor@20000 {
         compatible = "amlogic,t7-thermal";
         reg = <0x0 0x20000 0x0 0x50>;
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
