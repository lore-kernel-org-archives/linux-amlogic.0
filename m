Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338BF1125854
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtL94auTz6DvPwKD7RlsepN1kEDbo2+96sEZiEBf7VM=; b=Iv+QIw1ZenCGUo
	S3gpwe1JD4BnPHMrMXL3/eCw/WPyPWfBWwRfi4alFf/uJzsj/Mxl46BSWdH20R6C7ToXpTWooNf8Y
	KPNnFN2mQ7R/W/Q+meiIED44PPEkE+AE37rLU4Oq4yvUifu3LJOPePMgqMQbZd64iWjaiKsNHdIos
	H6f0a6cSiELwqBqIjaaentEQs34EoAg+Vx2HEv39F2Qkfll5gzb1oXP1cgbwwrHScafwS+1RvfA1n
	O6G+Bskp8IrEqRi6aCgvrdsi+TCMI8fCPPZD1IINmIAY7UgbfOzjlHIY5lvcMpNd3KIRAJGoJeiam
	YHW8cZygqtGRxzZTpSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myn-0000000ByAB-1Xgr;
	Wed, 11 Mar 2026 17:04:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myg-0000000Bxxu-1nDp
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BForkR3601289
	for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2026 17:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=; b=Vag1znOofy4KWeNa
	XHK7Gkan+Utz2ctuBY82nlWXcZ11ZO0aeZ0FpQDuqwGaJmNrUmNyBx4KxcoEed36
	t/aoDUd2bNLTA8o53HE6JNMVXLRNsFmWjEXQB0zL+eqBL8bcFb6Goy8TK+XAoocF
	wPiFGWlNIOdhz6wpsMO3k807HQNaVFwYwdO/2cJnS05XCmrqaRaNU3RES55sKcIh
	6ORMweOkApSxIXoTztGXGFzYNBQpr8+F2Oi9GvCfsQbydTY3/zAhApn6jXz0GZRx
	vBp5Widhy8YWU0BzngmC9zYgS+fervDaedSjWCPdKX3GQVCBWSrFM+6rNG14suH+
	vJ3zGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd4r9n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2026 17:04:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so11581981cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2026 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248649; x=1773853449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=;
        b=IP+wchBrBdTw8nSPlGohxFCGk1JC+KNH0WwlEdlrNYeev+ngZ7S4E41iqVmIXFPxZo
         dG++HLAa7eEWgSQ/lzbZCm2dzYUal+n17llQ89P2JC0BZqFleh7kZp68GgkUErG7NZIa
         fz2wIihdTDI9Nt0AndboGwpHt7NdYXOwl/58FbYncQy6rK+cXu3bICSNdFi+MTkwO8kB
         VHyWe/+8o1SEAERD+Np/u7OQ2CRKlRXQy1WfUd1G44LxO7nWu1vj8v8Wks/4qNYDdBGD
         jg6zL4wSaHsY5UHfXQBf4M7jTakCQ0QOiCnr/Qt5hwhGm8rwQrLAf3zZHstUVTOSZzUx
         TRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248649; x=1773853449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=;
        b=avs3GhOQlQ4VxwY+cJS2B2Nz6X25aqdLiZL49GO98m1mhBdRxdTYv5CXisonJljVF9
         ZYKkAQpLoqzIg2BhXpjBNI5YEzCtFeQtBxK2MnH25N67QcgVG28qem+POS462Bdq5M5g
         bCIvA0+P3+tT0A7aoAwHu6eGtWpUBDGN98l/02LjyagL54J4LTHBokp2F5Qh5TQBrzx6
         IoZv6H7tJXN/e56NWVhlqp4qB3VEn4g93aBsRyu9FnMosvVDHfqpOwrig6AnGXrKm98u
         KCXr5u1u4kdUSLhqoSfRHO1V9pZfN0FzJagVzl1zPod6XcHSBv8q2KXJxqHsOrhnD/gY
         S4JA==
X-Forwarded-Encrypted: i=1; AJvYcCVsxQGUJ+iSBKRDdy4g5FthGL92ojjIaA8vqHsBLhhf6hVyDjY8p9dwp0wTynKqlarzlKtALNhYua0vlQSv@lists.infradead.org
X-Gm-Message-State: AOJu0YyT2t3LJ9eHb3tTP/DWbMhrRxtmqj7KoVSWFE2jCL9kn6ZGjueJ
	v5bnsuP211chT4b8JWctgJCwm0PmLlJOIhI0PreQuthk0qUCRNvEOTnw8bFnOJ2Nar1rd1wPbKS
	YUS5dDmDZMtchQnozdvOZLoZxtxn4YFEgVSv3BQZmM3vSvk01WZFajsrR7XYm8z16tW2XeY5z6w
	==
X-Gm-Gg: ATEYQzyptmy2ubjeR2Hqksy9Kp0hhHUuy9SAG5BOxR3tW5TLSjI0+JeFLCFG+pV1rG1
	wFB3q9JBVOQNJclsLR+ow3NST+gGTSMwmcN1M2ND0O3Fx9tZgdrBKfShNkxdMlX4prQY81tE3KH
	6YAYdn1O+3Tddvhy4ZCY+FroqQ1jIWSNgC7C+lSWlq+pAXPQeHkxBy0sgHUlZEpIv40QHf93UHK
	i+LJKswoFfF6MglIK0/8OP8eauk5JtK7r6BMnJpjBy2Z2NFrpnF9U5hFVrDkrTHnqdBLWfcWGw3
	VZoD4q9rsOjalvwt/vYKl5NJ+9sEZuz9uWE2MDLCp7U9mWSgICaKbh3iU1v3snsW2/IH8xfCr0e
	eXt6+nPh4wp2lhbOYKfhRWlSEKlpgzE8dCps8dg4BdMGV4OnVgR7N
X-Received: by 2002:a05:622a:1b09:b0:509:3f5d:4fa8 with SMTP id d75a77b69052e-5093f5d61ddmr27706801cf.18.1773248648564;
        Wed, 11 Mar 2026 10:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1b09:b0:509:3f5d:4fa8 with SMTP id d75a77b69052e-5093f5d61ddmr27705771cf.18.1773248647821;
        Wed, 11 Mar 2026 10:04:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:38 +0100
Subject: [PATCH net-next v8 3/6] net: stmmac: qcom-ethqos: wrap emac driver
 data in additional structure
MIME-Version: 1.0
Message-Id: <20260311-qcom-sa8255p-emac-v8-3-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2zf7cV5niFr/Qb4QPMTi/HX8ZYjENRtU1oQDGJyGl9Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB1mmZQXuEu4bbth9QU3xYhh2Qxxy9q7oUg1
 FY+D5MHkQqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdQAKCRAFnS7L/zaE
 w74lEACEFJaarSoABJQFbSYeHV538sFoYbOryEnz5EU7iqj4R99lrHSfM5x3UoB1t11n9UkjvEp
 0o0yKon/m/Ew7ECqYZApQU9dlzDzicEm4tQx2TQ2L2BzWDuby+0p36nN5vUIqy9eg911C37FMCZ
 DddDlQhgP1x3xSehAID8j5ZQlvA3A3m0UXJ8w+GJg/v3EWN9c9TXv8jN/33/8wRAHw8TBLpfGLq
 QKykQ4IZorCOHDTxdDtMoBXfonN6czGW8xXyZbD7FOes71ciYkNnuW+xZAp+it888J1z1tGyft/
 5OLDslcDd7D4Vwu2kpk/IDMrRxt+v1fQSZgajOQJAxQ8DPwb1n4qop4x0maZaxaNmSMG3qKNMe2
 450PcXH9+3xYbMm/Lg+WegGJlVbYjAHmu7ALXvWDBQXQRPvZO5DEOg0LJwZ/YfZwK1P3F07iPq/
 Wx46v79ZEm2rADaWCOz6Eg8g+kMBkOSlv1+UaxIhGRj5sdzvj/tdzZ65uDWFOIE10WTcFaZH3Io
 jzuFVfWB92HDkH4EdopgtWZUjulJmhNmHULbJHwOkEUk2rUbpJmBupPKue5IEG+I/XUF0XFhwY6
 iO2n2U/+l2qBqtLpEb3MQaDKQsw7G92GCnSu1dayjTLq4Wfu1ufs5HeS5x0aeRU99gD6WVWgto/
 BK45EqfiyCx5hMg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5vav7XiXClZ9GkqPhOxcIo11oJ27zFhG
X-Proofpoint-GUID: 5vav7XiXClZ9GkqPhOxcIo11oJ27zFhG
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=69b1a089 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX56J5dgLGC9JO
 7lcj1JaExm8gGPsdgDcWBQQnAqVnpih7mA0RFO/RDtpRN4Ug3ZrueWDISzNX1hptugZfZkorgC7
 2Fuzc//eiekI29s7mywCoxZUKbE/XK5u6pvncXCLE4eTpm+ITboFQeMbBcQgyXiIjgPlicK8UmL
 Ix9dWozGmZOk6WRh/bEPfMgXlXVwqmT+PgiWilgE5O+VLuZmkCskvzZhSQ7Aha3X3/+yXjgk39P
 opePkLdwyA1JorQJh5DpAzKnrt3oIJD0wzfQRCUImnkUgRA1/xYL95IzC41afGqtkBh88SXQm6U
 g7kh2GjBJ6UXLjngE2zm0xtA9kqBHiOO2WMyCZxLP32tPBb1LMC5xmKwGPVaDhKD2PT7SzJt5Jn
 WjRe2BVnxN+YlY0cacuAHHuKc9RtbhjQOCibfkAi1uckqyDknm1DWaKCBBYTEHeSMC28EzTRLpg
 DPbEsCwfdwIsBNpGDDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100410_606781_C3CAC8B4 
X-CRM114-Status: GOOD (  18.65  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fb4ffd0d5360d091bf0192740b8a4a8d2c66e09e..92fc1fd0b4a1f85fdca7ee6f2c78b88415ce440d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -223,6 +227,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -239,6 +247,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -271,6 +283,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -306,6 +322,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -728,7 +748,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -778,13 +799,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	drv_data = data->drv_data;
+	ethqos->rgmii_por = drv_data->rgmii_por;
+	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -815,14 +837,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -837,10 +859,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
