Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1331CDB471
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jun 2026 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ud2EqxZMEmgIVc6GQUyPUsEZRmfm2CC6tV4ibdd3lcg=; b=h175oSNsEEOzUU
	QcouBVgAJSzqCsVEMzt1sL9fKSmsJWyJ9sORhTX2JGDcF7q7radqzjgqLAwBb1QXD3dE01ZbdRO/r
	0+ERCwmvZyLLUHTXT38aGDE0eHqqK/O2HT+02ZHAj0LpeZXtuVbxiMnSacEl5M4SjQ6PQIiYbauP4
	DXTAynRee6POAfPBsQLLRTXSVIlySeh5SSbgdnFZWPBHTcZNmmOaLM/T3BZgnWCsSTaM1uuaT37lY
	3EfwVBy4ZzawkXc4W97Zuza6mRAN8EGczvYTB+/8c4vC9bgrG5CtF3mCYeXLLP1KRg1GMZnrLutjH
	ULaEGtlH3MUClEzacTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbUL-00000004ndP-2WTw;
	Mon, 22 Jun 2026 10:02:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbUI-00000004nbZ-1zEw
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Jun 2026 10:02:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BPh9255465
	for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 10:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0sYMNzaE0WX
	yJdKP90e/gCaHJORjnNxy6zzXtaHf/7Q=; b=YA8pEFwaOmPxxU5UrMlI+ajv9DL
	YgftcUlWbo8PE9lNgX3uERMiTZaCazR5n0EG68U4g7lTDjJnHDSJNm5pxo+WWAzw
	zYy2y23Rr8tOgGYfMxZ7fpylElqiTEO3/22y6POt7PJZYGzGRZGnQHR1jcgojKj4
	7zBn8Ph8heaPMFnBGoGssXzNQljeolwhZnyXIglbjL++J7D14HpR6Mqy8eZUB6y1
	3f4fRDWypAWyQQjbfbBm76VwEz17PLrs9nzx1nvJtG4i5jsvLPOOxvhLml6V0Ifj
	WPxpXPWkcDDf1T46gIYJGm8GLTWXjDqbKUHqg7vaWGhVyF3Qc+pwijmr4Fw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5p3kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 10:02:41 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e71adbb398so8541931a34.3
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 03:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782122560; x=1782727360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sYMNzaE0WXyJdKP90e/gCaHJORjnNxy6zzXtaHf/7Q=;
        b=ArYKijj9RCpqXGjgdO6rP7J6h8NYs00uu7Fx+VePS+x4BTK5ZCnm134UxYZ1etEvZ1
         GG0HZuyzntbrnZwsuAClWmXfilZgpQGSTIc42DudX+aeh8MiByW102pq2xggiyWX8tEm
         dBZhxOFDTuNkBGBFyoHf+KjBMoItfOf/0fR0wvXfgBbdfUpDE7BS16CxEaPTWKuEWTID
         r+mZ7smGp/E5HUZPR54Cam+vUs/1TDdFZkvGm4RBmGmlfQyBhxqNnOYu+1th8Y0tOgp2
         oe/Hzh5+uI6YponEoYisYISxqgEOyAjzePERYOjM0xFjmOEYaN6A11t0nnGqS0FmCCB7
         D9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122560; x=1782727360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sYMNzaE0WXyJdKP90e/gCaHJORjnNxy6zzXtaHf/7Q=;
        b=KZc7vJLREbTncISbzqiSAvO03Uv8GAEr5yqUu7598QAmBQ+gvdcWiBF9u4GGe/Xteb
         DSXxRTWjBBDAD/SN+GXqsMU2/R52HaDHRDfpdvkJzrJxRfde77y8Ex64PuoS44OdUnWu
         cj7gYgghX0okxbE3Eo9eBmIjYuIEDZAK/9mCnmpIiQDZ1kZv+4PDmFBGgI16Dp7tIB5O
         FVP2SSoo9wypHvfGNzikwMjT0rWuzLPd2K8heNXSSy2s1D8ITVSfuUdfMfjjfTWUCCpD
         1kQwReGdXYt34Wh2Yia2hYFUd6kk+6HmKyUUnAxTux+BvFlFQAYsU24cdXgH2GYd6NvT
         lA6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8gfp6p9Qq7tM2rgVmyX3ZK91MAWh1YnayyXL15vPWJST60j6TcS7vV+UEVGW9tG7RmRKFBzvP0UvueE4Z5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4dsvLCE0p7hYww5VS63byC3M4BW4xfmEdxLmhXd9kfraUHcQW
	gHSm+gL5Zem+a6E19e3VgvflUrEZN9l1BJfe82I4IBigNuRBc3rygqaI9x36QADbGzegyDlfwrw
	uhLS6xV0SCAJThoEgtMARN0SCEd7NjfzF+RAmolpU4gVmVFidxMBf43YWSvLwWXjbnYhDrPdpVA
	==
X-Gm-Gg: AfdE7cn+ub8fiYepGXAWfHhhA8DsBI8Irri+bqRW3elAY05hoSxiVj797FFgpAxRM5k
	X2kEm9j5UosycQXtj8d4T2fkceE6T5sYWT4pkZyxi/adO9l6VQXYUSKFe6hVtLiCTi3f+39F3Q+
	VA5tlWKHFKcYBH3wLM2nHNx8pkrNZKJ2FObp2UCR9EO04bpfPot1lK2lfpDvLaI8FAryMledVDN
	CYZ3VnLtiphhcLrLape6L3gsjQOgsDOUuxxrBA5CKt3Byqs+7leERltBJFl9yCszV3+77TDLIJt
	O4/aMDv7wpXwBWwAyZdtGncKueSRb3ANLheSpvlz14rwAKH9Jxa84tm9pJaVOvlpbNVkv88+Bdq
	clCSfUT9BDGVokDycj5evjgzHpaM=
X-Received: by 2002:a05:6830:640b:b0:7e6:deb1:485b with SMTP id 46e09a7af769-7e92d9c74camr12345322a34.16.1782122560492;
        Mon, 22 Jun 2026 03:02:40 -0700 (PDT)
X-Received: by 2002:a05:6830:640b:b0:7e6:deb1:485b with SMTP id 46e09a7af769-7e92d9c74camr12345302a34.16.1782122560130;
        Mon, 22 Jun 2026 03:02:40 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm26969074f8f.7.2026.06.22.03.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:02:39 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: thermal: amlogic: Correct 'reg' in the example
Date: Mon, 22 Jun 2026 12:02:33 +0200
Message-ID: <20260622100231.438435-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jrr75z3xkwFfMtmeu+zIMvJs/ytHfPd20ml8wylasTo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOQg4ygfRlLfcSEVBjglg2VauG9hcRR2aVageS
 CsxVfmm0ueJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajkIOAAKCRDBN2bmhouD
 19RCD/4/GnAM75B/sN3PSowYPUr2PmRH0S053tH85DKbVynKh69/2umobq4B8rLav4o5bJMVTAj
 jNdo227SUa8yBFB/n8KSD8MlpcrGjIFMgXuuxeZGf+2mD53jApTsS8/9Y6nQuvPtHFS2kPzB1in
 wZBBGY+BT/vrsSsyJCiSWOOXiuZ3tfc5tISQk2wj8TmUGaTlxWhguQ7vQsXWp2WklWh5Codhj71
 dUbdNyOWsY7hGssZydqUvNPkU4lMMotQVHMf/4qi9SBEzJLJfGfQ7xJlFD4flUDgyQgOPvxgPRg
 /mDEen+bTlkBHRnWUD+dTbvgrXzWYHChrOoZiUrB+hRZ6LOLertNL+sJn1xo8Qu8a5p8/wN/lNi
 p4VV7sh5zgDxcZY1syh2nriKunYjd0aWVHgNXFYV9mXT7j49n6eCEETSZTtwUpbkzml48mRuR/Y
 EuPY2DQai1DA+wyzNQCn/FEZ96ZeJjTtClE9IZHYQKW30D8fXchKXKT7Jksd4/AYf4A2r6OHg6E
 qXU5hMvIhv+gLfBbWVdjvp+E2uow61LSdvs7i3LTUvLefyXH8KwxahSTnJrazBgtqbNepWk8o1P
 1xgHl2KfhK3vUFWNU5LjpLGXxU84mN/NBet/4FugqvE+HcXmaxMQfq6cvXYqDM+S/q5pJIV82x4 AZz7/Z4ctp3JJFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5OCBTYWx0ZWRfX5RNr3xXSMdRC
 1s+B8EFK16qtQi6J9C+gdLmk51dLUGpvR8uRqspgqh1qqliCy5jkKNT2t7Mjnbsb3kBOpaSnsVw
 vGW7csPovvKj2ELTnatZYL1H07Y1QxyvkzchKZ2aJcI7RldQWvDM6MsfL/CkgUawoLn2vBsHR6Z
 LzCFlaaoLkdI/Hk28f7Z4LkWhKvLeXd/1NM0rvpI+/S2cOT7uf11qoFQ88HKsX2Ub3JpWGtoQlA
 GBba7q1q4Y/3nRryN9Mz/BGXl93BHx1uKiwWn46EZRzW8hsXJfp+lJ9efBjqKO6iwi5mj3ex2dz
 Gb8TScd2sjOsrcxK8yR7CXuk/KzMOrgRWUgDLI/AmEtjz5Hcw9isIrSJe3rIWRmrGBzEn0EFmgU
 Kk93sdbQeW1qCcRmjrKd3mbW3HoL0chj5Nj3LztLb3i57k3IHwGg1NEMmzopcQ4Giy3BFEm/NsZ
 unJIdqXlS8TEJpcZCkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5OCBTYWx0ZWRfX2TeH1j7IHQ76
 tZMosCvnDfrO8pa0TSw6GnszwbclnU5Rr2vp+3QY+ctSilWHumrNNwOHFmv0K11iU36WjNr5ltr
 avnycRVHPXvJGPBxkbTlDA3WIbviRNI=
X-Proofpoint-ORIG-GUID: vm902dTUCkwsCUvAmUQpuYxZ7Z8JsLyn
X-Proofpoint-GUID: vm902dTUCkwsCUvAmUQpuYxZ7Z8JsLyn
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a390841 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wgRPBKK9NZbZ-O_S2bQA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_030242_628760_BC1724FF 
X-CRM114-Status: GOOD (  12.45  )
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

The example DTS is tested in a wrapped node with address/size-cells=1,
thus reg had incorrect entry leading to dt_binding_check fails:

  thermal/amlogic,thermal.example.dtb: temperature-sensor@20000 (amlogic,t7-thermal): reg: [[0, 131072], [0, 80]] is too long

Fixes: b1c8ccdbd4e9 ("dt-bindings: thermal: amlogic: Add support for T7")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index d8f7f3eb7ae2..8cfa44dcda58 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -92,7 +92,7 @@ examples:
 
     temperature-sensor@20000 {
         compatible = "amlogic,t7-thermal";
-        reg = <0x0 0x20000 0x0 0x50>;
+        reg = <0x20000 0x50>;
         interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clkc_periphs CLKID_TS>;
         #thermal-sensor-cells = <0>;
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
