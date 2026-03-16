Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A2BF46455
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjL0TW0/VvTAmrePtZvkgSzmrmlQNfa77aUYNsCGttw=; b=FMlj9O+S0t3Mlp
	jLT4XHWd2hm8MO3TmLD0eRurzvaGJQqjRvE+q6yzKt0+othy5ghCOjjiVvbhYjx/gmY9jwrGviMpg
	fU8lZVbZ1U7HKnJbbobQh5fJ7B3Lmy8y1/8GlwTlu0c1OiHFGutyhjSvW48LTd+xmCwIevIy+MoCo
	C3MB0pk9TC356fin25dsntydUZON6ohQpoZuScUq7R+Ip/Kf/a0Q/kOpUQAm5hw36izHjJKbx0Ph2
	hXRYkaeO1DG+kCU04eN/ljBhG5KI/0roVEFZ/jvey0YFHBnizOv0mH8cwKLCM4bFd3EGAN/uM94Rm
	F707pYqs8C9iwBYINKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hh-00000003sk5-0omU;
	Mon, 16 Mar 2026 12:05:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hd-00000003sdr-1sat
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 12:05:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjhPN1428758
	for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2026 12:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=; b=bqbKE/TausygwjMR
	pXQ2QX4j3/v27dLfoyVIfPX9g1cYvRop9VAcxVW/zgev2JGsOYMcVUGoqBtVMEp4
	HGvD0rSeQoQZGDPofVKLbhnbD/TdM5zSarJphqPMGtrQ7ud7UkKlglWkGOpVHZDp
	vtZPgvBkGZIL40HP9Mq1bzF/QR50SX4VqKMndn011TqAiaegYylMqbxAWv66M7yR
	G5zxJhBWzlRvmPjIjaMwBbOVcQvEhQx5HoSp6N9B70L9kxStO+M90ZJbS0WYptJH
	z87YxR48Xf6KphArdlCfx1cwCJXC8DxLAuEpEjXZ4dVz8W/R+08ggYxA6Ve851Zg
	vRW8dg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh9982sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2026 12:05:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffba6a4d84so6176295137.2
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2026 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662744; x=1774267544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=JQkAaCTuTToWc48htAQuK9iHhtt+fxP+9kC7dEblWLEEiLBGQykUqZKYu2aGoio5w3
         4EcwBhFtNJ6MDwpVQIcy9B4iPiLNcVaa9GvChQCL/CLAvfZJ22y3uuAjZpxgOCdZjf/F
         mT8k+YdpKeLaYdgkB5zd8QF9tcioWLYR4NADnwiJGs1g5ml8yENnQ6hg0rYJXsjxviyC
         pT5aMO7qwirkOHe2LsUVH8Ss8hJou9qMUwi8v9BvdcoCtFd/aA3tKS0nXfwocvH+CIep
         ylyNxwidz1OcUyFDKxg96mVd97fAcF2kiIhq8CTBr1eLj1xdssbkefk5ifkJADBFeHY7
         hH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662744; x=1774267544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=j9+hqWFqM3eMsau0R4c3bsj/wyaPeCTmz87gjUL2PZ4MpDc7HgKHolIdizVCouDj06
         gleU/gWMWhduMes29TRQYPXHaU4N6G4vhBbTmnL6fzBejGdTIdHV/Eds/qP4beBiBWq8
         KnVQ+cC2NFv+vGtPSlCKJgZreYHSqprphopl+g57BOjPlR0IDHQFAEzAhYONBc2kuVCj
         wkdmSA7gmz5ia4DW1h9axWN9Vr/mbBR/lNPar/DyHNjGQY9alZFPCr9eysud3pJZcNqP
         iP3GFy6dD8V7Rni1c8xsaTokBoORIkbD35WFkM18MatM5eMLbvGxrJKHfmDIVOqQM8ct
         SqEw==
X-Forwarded-Encrypted: i=1; AJvYcCUVFGTmYetaMexWEzp/WTFdkbGM/QzpKJd4uJpCuPRmCsAUcKqo2zW7FiY7TQ6EDyFbz1WzO+OBBPlTKc5U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2BzHdtOFBFNH130eLAcR9ymKM+g3CdemnQ5htHRPwM6gocW1J
	BHA48j77dPh1Qkofwk2b/6hFQJnLp9ZKg5u45/GlS144a0ataCQclm733BoR1TY0Ts3NVMnOW6R
	CU8YUsPi8mWiphfHaJGae6OR3wPnG9hSfuC5g6nj4GDuUUv+kbpu1vJ8Ui5yiMyk+tuhUlUk2Uw
	==
X-Gm-Gg: ATEYQzx98uT6GV1P1OmGhd2Oo3mQLK2zr+V0410NfzJtpHLql0yscPnjY3TsmHkFkIO
	Bh5MdE1wnNPwQSk0zYXU5IbGKcYxyrpjLoNUi9Ea6R0LuG0TIdfZ8XOZi+OgXJ4zRRfG0vo2ZCX
	Z2FiwGAkOlzjL43JWDrhNZtMTL4Qs3jRQnuao7EC7UnFa2cWyg/L4xG6B16V5J6J6OCdORLcMnB
	+Rc7ewAMilCj79/so0zdLuUBVo0LH0u07DECSrXKeszJMILiwhMci0G7XtnV3Sz3GZXwxAB4iy6
	HLmW+CXbPW7kOwT/dPdsRNfPX9ecFS9IQqRvpbMiIvIKBf+vD7V/Q48ZLTXhGRqlGLhd9+ne1mi
	RqwcInUDv1q5yDVwY6hmCE6SeOpYUmD4k7JTHS+MS1eVuvuw6gjA=
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id ada2fe7eead31-6020e1aa7e9mr4589820137.3.1773662743698;
        Mon, 16 Mar 2026 05:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id ada2fe7eead31-6020e1aa7e9mr4589815137.3.1773662743239;
        Mon, 16 Mar 2026 05:05:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:08 +0100
Subject: [PATCH net-next v9 3/6] net: stmmac: qcom-ethqos: wrap emac driver
 data in additional structure
MIME-Version: 1.0
Message-Id: <20260316-qcom-sa8255p-emac-v9-3-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5840;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEjA6ztNoVJqA2fzdic1acw7AfUASpMj8dS/VFE3Oks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IGiOkgQG00O6yLrjBHMqTdoAG75F1dhJnlu
 Lzf54ETAY2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBgAKCRAFnS7L/zaE
 w/NXD/0WYnQvTwYnvGFZ3tZr0XsqU4FEWJx9KsbJOyfL1o10P2IF+tEBWRR3H+MAqxoQVwNanY6
 hvTBiTIkSuWmeK0hbtihq3ezWr93j3vu6iZSXfCBxjs0eQ6v6FZtHMg6IAhkrne8u9MQCVSopwH
 Rve4qYdPMW2EX0okqbsmSvxK7pG5MnMo0JCrOVs95H4tOzH+Q2qGjQXnhTsaY89//IS4I9BbyW2
 PS+bbn8qDXRLVYu5v1LbS1eQMElYQn6yGoWNGmQ4nZg4DAUSs2oLP85k533GObc2dHy4nHpvyRu
 1mga1B3kSsERLkShcBERg64YOOWxBWUkZZFqIrBjYe5rXiP4zwGs8k9IzsYsDntFMlKX1khQAgm
 WIaxTDbktidDuqkO17AOraRLdCD5dziT+0OAl8oazGrHrbXiyRICbqLQF2aqQGZqEiCzNDE4mNF
 aRo4Mbyvg73vpHCcXKA+URZGgR+orz90M+w8HWPtIumOLT7KuUaxIhrJ8MQ3wqEBcqvdnuJUnmw
 JCFfSzqvHWm3D2jL6Z2Ms0hTXxj7plPjtrSZG3HOm4apQi2vVhebQW6bHVlZoLU2MbcszBf7q6M
 qIpC9Si0bbE6+0bas+VDfiwncRNY997gkgjiAWrNy9KGy8GX/Fvbz1rxy9JZpVf12eHBqlzM2Yd
 1j0Glhm9rpoPZ5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b7f218 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfXy4IUKIEPYUhm
 wULSqWmcTtuBKzosQI6Hpc6a/n3YzQDv4SoX6kOm8nDDs9xgV/AtKUiIaGZ0mu1MUMVHXj8Hm8g
 zU+wsQmseSAc+g9c32nQWjeqwxzF0Vufpg9CwbUBBMO3a1ZsZ0Hiiy42f9wXuJCnvidAEgiC9x0
 MrDjlMMV6mW5kyrYN/SXgAcTMTldbZv9i1zOaj78FDLKXR23x7/RqturmCzT3eNGt/zfOPVUrFQ
 aToHW6GSBGUP+xfrk3h2jv6xM7IKh7sZU2oc2V7S6PVu+yhaIG6KexT4GcuYhH0gGwnZxKSTC32
 +SbSxGCzzP27Eu33H4v35kKhPJ55lN1kla8ZapOH/sZVGcEVJyewT9mcBvGL0TqjW/JMzH6lMRy
 xYpDLU7pvIMTDD2a182QGWWd5fo7LoUxDt5mTbWHHFYbTteT+GK7lCmynduB74Uh01jVbVnti3S
 FXQdU1S/+py3uS76TKw==
X-Proofpoint-ORIG-GUID: CUzZMOpcgEUjm_X46NYCN6n1hWvXLfd6
X-Proofpoint-GUID: CUzZMOpcgEUjm_X46NYCN6n1hWvXLfd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_050545_537038_B67EBA21 
X-CRM114-Status: GOOD (  18.11  )
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
index 66fd2ed2c2c8428694c07d89220d0e1608546791..8fda6c128117d7f5b1dece68c919f2a09a511210 100644
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
 	plat_dat->pmt = true;
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
