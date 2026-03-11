Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450BF112585A
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwaIPyqCqE72tIgYKE9vsLNxryfv1KqQo/82S9vsIdg=; b=x/TAMcoHOtrEgX
	YW25wqXKApsVd9rKYtHB7RnrzlSvCneAiUqj2l4qkDXGXxYbMXrwjBVa+1Ojd4NupCB/+f3qeRQSj
	4IkYcFRp0Q3nUpDEz35OJopoYkVsITo/7ErzzRlbUlegY9FSXYQjGo57ilwLaJgqBVxVZ6paEJRvy
	uvtMHc4C0mPj051OCe+Fh5UlgSG1f5wOUDOvGuoXS3pP7z18DsRLehw0S3uoUVXfhIOXueaZBI9/H
	bRksgWw1Baz9+1RDEfhcFL2VAEBm65U70ibiBqs89NucvYuh0h6jcEvgXgMa7/5xHaQynkQTmwWRK
	vyS3gOG6xHMUVrOS+xnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myu-0000000ByIw-15BO;
	Wed, 11 Mar 2026 17:04:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myj-0000000By3J-30T2
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFp1K63171778
	for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=; b=k3+NlWJDG2n56Rsw
	Jf6FiJMeTBiIf2bx/JtNJthrmX6U1Jf11uZmEY5vORES4wgwmrr7T8kmuFk+T8EG
	dOrQlILvdmJL2bKtvug+tJOaboCH8jYBs7B7YmseDytbIJmLnTDlgChqKufnRHR+
	s6zoSQyvPC0uPJTDg79d9/62w5kbkL/JLHO1dbi0iLQlIRSorujgVAT9YkVLMqhx
	BfX55/m4is8hXQFUEvPNEDkKlFJqde5ecnYLBLkaWGKLsRBnJDQbX0MgiqiST81G
	ohcrdgVmQvrnL2+8vTma0fVnpijzmGasAA22pc+yfhVB25ExLozNCyBTPNebGM9l
	ht759A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd8r9j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2026 17:04:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso6766561cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248652; x=1773853452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=;
        b=SDGdwWNNuTbFikn5CWfn93l7RE67WGXJwzdNoIyAaCZlfToB/S5wSNaFDpsDFj8XbY
         K5+gVui/VNaZO5la3Otr/fq6ZFf5NfissNdNPzBLmxFx7Q41uXpwL04qlCB7kCEnUzE4
         0gwtYjrTlwVvsEqX/kadvnThjurArodHmhvT6v9hJgPyDRWiWuo+pNvBOgZUOaQ2/Vop
         lZhMu3ANr18LxehogsgauKdKeznvRF//fwCTQsaTmmtk+bERaeJjO42cMkfHgTQPHHGi
         r31ZoA3P+ncR2fJ3EJCStWwtD/8QbDBkpdta1ky6wB/K0SRW+g3Q7TUwGYANPDypkDzR
         7Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248652; x=1773853452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQF4J0Ck1r7kMaq7FizMxZ4LkdIkOnUWDeejjTapamY=;
        b=nlhH+70l7/3oTP63iKyDO44Y+xAdKBEIAY/7L+wBj4LsxARr9h21Tk9nL4uyq0E4I3
         Znm+4F5kVQsj/R0kkvkoGEwp0LXV/BG7Uj4SG3r8BOXXbeu99q7sWBKQlgyFxfFYr5HX
         aGkjNvn0YTLW8z8VaffGqi96D9yelwaS/+DPsULT5lWRHuJpRiI0cVVamYq519AyvGwW
         8oJAnrSl69aOCuChX0I/LTFyBU4+vFiek4b9QrKU8QS0eb0rZyMEETY6MA66FDK0Lzwq
         Rj/n0XHKY4G+Suw2iipWpCbvTkVfVJN7FYnk2C0xHUVtquxuDM84tOYIgbvlbI4iwVo3
         uiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3hgNWItVOBWn1cabj5RTfd2hN894bZLrjgqcg+7inhYT8Q+OK8TaqshcnLhUfWN6V63SA2piL7l0LXxYr@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPe4m0/0Qp6xktLPDzg9JWyloAU3iYtXUxMyNyKfHOn0baXkW
	u5HRW6fgp7h84+Z4kWRjPZK2cOIzVk46voTK9++LMmKjEYoA28gm6ug6fX34WCM2Vx+8JM4NY7f
	uNq3oVObviFKK/sqDqhdoAYK+sWpt9oz1SdFobexc62jqiR/CKnxkhx3dbnKMWgkr8OQAKzR6Rg
	==
X-Gm-Gg: ATEYQzxv4nQ5fYMpkVVS5ZAQGH4Zod5EXEyWZ1xHWz+jSantX+q0pO+HSqNp7YnYNWW
	LH2WtlEC/o78j9m4y2axHWIcCmp3votjOUKz3MGtnuiy32aLDfHxmvAQEo33Xm3H2LC09NIW9Yb
	23nhkT3Pj1bnzPmgVFmTwoRVjAcWKDjQ1va/Y8mPCDxuc5U6a74L+QQeGUrD21E3NIhmmPw/K0s
	t+6icq7d6795hRZ5K3lGZNOWFVxtMKnCQFPdd/qnHiJIvjb6MrREtkGeFfffmxs5f/VffC07wvm
	VUIyqxR0hSq5xatChd3hloDnduSx5UzYqg/LVtTh8dQLs9fOIldkiVgnNfIQAwHKZ+4ZoDa9ofZ
	OkdunhBNzHTJBpj6GCsOu2h0uoSjIA2dtJ7fIx/btHEtTgbeUFf/6
X-Received: by 2002:a05:622a:1a84:b0:509:2a55:9c5 with SMTP id d75a77b69052e-5093a0d96e7mr42569181cf.19.1773248651954;
        Wed, 11 Mar 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:509:2a55:9c5 with SMTP id d75a77b69052e-5093a0d96e7mr42567921cf.19.1773248651224;
        Wed, 11 Mar 2026 10:04:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:39 +0100
Subject: [PATCH net-next v8 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
MIME-Version: 1.0
Message-Id: <20260311-qcom-sa8255p-emac-v8-4-58227bcf1018@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3541;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RM1fjAFF4/rBfKY3AWIWw1rUVlUS0NVefDoxG3ay0KY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB28EUio5koyA3lZhJISL76YdBlUdjqzECUz
 1BUFVgZwEOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdgAKCRAFnS7L/zaE
 wxgSEACWWXRhsAqQ2n30DGIRpoOVt9yJvPksATliMt9oyQ2CJaSny//RPgS2Z52xWGcqHWKF2S4
 mYAm90ZApw+oAbeilIiVVdFqGrko/4CClxLfiUhx3sCGy+C2OfwB5M2DxGVSP/E0qiCW3WrMEBY
 V3u5UMZuB/y9GSpC387X8pkKgI5uvbYAH3cCBSYUOwtF5Bj+Dx6SpyGMruNJ2I/dnJvx/Qasxwx
 y5i6I+Yr+dPZetjrh7PDWkdDKmHI0JibzdG483DWl8QhLm/9H0rMqxjfv03aoHh1tng2/UNR5eR
 CSOwHfShWHabG0o304fwxWCzHsbAGfgGrgKXRw+yvbmw9+Vjw2Yd3+5BwpYd5aXNcI6ZUdgWMs4
 /WMf7YVs0A54r6VcXyJNmK8JQ2I8oVBAg8OnGbe9gCNPkxUTUkfa50ktLARUFc4O/tV1jmOl8I3
 zkiG/m2XPKWlWLlSN1ThL7P21d2Vhlm6Ht0mfFfHqtLnILW8ivqyRUg9G4R3XLsWpFAcJ1WkU7G
 5rTkVCcdFh1hnrl180/4XqFEOcfhtfP25wN0ZOMe9Gz5lThl9zDxDke0ATRfm7YvBdjW8upjvwK
 NyIueR490SafzehM4vh3O/O+lsAUsEC8YK7IzLo3d80oPtpVGEmRm4irEOOmuWl/wK31Ijhp+b5
 f/6GvPkzZB6eDCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pG84TzD6RFzKr5OC3SrOM7kG9CAR4sFv
X-Authority-Analysis: v=2.4 cv=eqHSD4pX c=1 sm=1 tr=0 ts=69b1a08c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pG84TzD6RFzKr5OC3SrOM7kG9CAR4sFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfXwAZ6jX69L6FG
 NnFUmROhOYrb9odRUD0Uo4S81ey9zqODlE3F2eFvSpVbqVcZe5VPS4uSOpFYH6MZSfPmcfWDRED
 Eg7OabW5Jm2goR81+kIoyhnTesr82+wg0Bon2S2V8gEk8kWij/CE0Opj43WFPpFelSavUXpl+6y
 xK26QIZtlhrqzISaNZaFEUqICaj2IwITReF2uRd0EU8+AfS9bRmEiicAosbCU92D0ZDZPtBV8TX
 QEkOEWGY93FYdFfjOP9A+q4bdyeJIzN+KqmmlgOz44s1WT9bs+ylsBINTBufKH6q6EOh/H9QIjr
 cNXOp5jfZGf1UUfFfBZvTSyVYTpVsQ7r5wCPrwlt6CBUkwSDCtXW2kLdXYm0NOfOdEkc029OIxl
 ZAGiTdd6ogBsYaT+7HYkr70NYDeuoIfDRJQNADMgfJvsulnyUtoFk2rlm25S/OOEFK8f4bVUovy
 qhIaK1HnwYcLezimGYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100413_958207_86C93965 
X-CRM114-Status: GOOD (  17.29  )
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 92fc1fd0b4a1f85fdca7ee6f2c78b88415ce440d..2166084aac999a38367af4294129f925391179de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -301,7 +305,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -322,8 +325,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -749,11 +757,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -800,13 +810,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ? pm_data->link_clk_name : "rgmii";
+
 	ethqos->rgmii_por = drv_data->rgmii_por;
 	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
