Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E41F46100
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMezrLiqjdC794o7hNBHQUcdDMc5ZqIV8IVE8AdpI+A=; b=mecIPB+WSZsPzi
	Qo/nbNkmnBQlxG+zeyQO2wVeqYxA1/dU9q9kODKvn7EAjczfN3oVbnSloIyV0dezL0WfSlSvEDIyW
	RYi2/Mf3H0ht2d2eHnz+Z6jhHsl1dUQ9GgW6zaFqvq7WmaUl62mY4S28BMgL+wfL1CmqLZud7m6zR
	qF1EbzzZCCwI+ISj761WYQ+RQpAgxXfOSRZ2mLBdJ4FTmY/GpZUDb0ct/NY6csanqcx9DtzAuP3L4
	qO6FDKj0yU37O+fJlbthQwGCUDmnrFHMuo8TmUGNli5ZlKBdnQfxHK/q4GSEYJkIBQG9WYenEI14P
	9sdEj2WHs+HO/rRNtOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fE3-0000000Gn5G-1Wlk;
	Mon, 23 Mar 2026 13:21:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDr-0000000Gmoj-0B3d
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Mar 2026 13:21:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7eelW3237007
	for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=RiIZdJBx0zNOW65x
	ejEVRTugcPZjZkn7wavZeSWx1bgJ4HO5O13SdCGuT/1h4UgYcpyKx4Be4j0rQ9sd
	eb+aUVikEp/81INv6F4RqByBtm0eyVFj6TergholBecydJTKEiWDRg6e8Q8Dsfbz
	3g5PNMFNWX7j2tP6DjJFDX1XZT1dsYsu+EMM9WKX78EyzHTPZXJdHRtMhIbPHIYX
	W7W+2P9Wb26c1byE70y4RREdYvJwahTJOUbaNOa1a4tjjOXey6YdVWniEGOFh+sQ
	6Pn8+iE7R+2C0YV7WSy5oatRlJeuZ06nwuhJW5U+WivfW2JJL2evw3kJmNnbvKLc
	kgqEhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng5gq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 13:21:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso1493681cf.3
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272093; x=1774876893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=IQhF12QYA4LPEHJ8kmGTO/KRwXtU532VSdjMpGEQvW8YTQ6hSFEE/gOsFmqwhCqew5
         TpRsvA+mgusLewtHNY/cgLP7rEBasrq4iF+/G5AJ9nRovvkZ25/tibvGxERkccGWLmEB
         sn/cM3Al0uv/Z1hEdWHNY3dm4HVjICdiC7+E/hSKtuBdBhY9IIYolv1FKPlNBHznwgsu
         erce+oPApl/0L0S1zwkgkWiMLE7raUITvzfNloYoxmsyUkIx+j50s5yMDLYb9BMA9OEL
         0xgyorCR4e/6fKZZGGEHivDG0pdTwX2zkVcR0yQgm124gYCh0iSdY+u1CVXouIshpF9T
         eAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272093; x=1774876893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=Uu9r/NwS0CSneEiSDYQDzn7gBQ78r5LNoNBYlq8H/Ted5tkKHfRdS11CjIqdqUgseq
         C0Jq+LeFInJB4tVLsO3ZkOvfKo+ScSwA21nvPy9v9cwHShINsaEHUly8+NOAqt0T2wkh
         4KC6C6HrJVoEk+PuzXzlebC9SXoaruX13VF1b1nuhWNI+0Zmy0yE3aYBok8eSp5d87kp
         PujOjheJb1/Av9T7urANuRwpiDDs/e93Ss13wgb/UExhY+kAkaHcm20WFivqrDEH5I2N
         lBdhkrmc/Kwxyc4PDBDL4NwNsCmQXY1tOmjwO3PAHZOQQlmRhbT84dOrbCL6TdRFWVKh
         BAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsSZ+cbKYm9Tl20Lvxoqwz1B2UXk8PP8MnlgymCN6gGVHd6t20X3lcQ9RPt5xLRmO/nE5zqsXw/txrnldd@lists.infradead.org
X-Gm-Message-State: AOJu0YzRiln6g7IRfD8SP6fjZnns1G/QuzdkveZfOUlibMuzGHL4ziEo
	jdYfdoPJIOH3RSL+Y8kl2rAAClLThuCjZhFdQmFw3utetdg03bwMXMcGhN5ZbDM7S41/6jPMBIO
	EAYx/ra2ZKtjqWCmaD0U3BtFiYjdcWZbcabMx5X+dBYa8Jd+uZUIfFY99wg2TAV0PuQm2UwQxXA
	==
X-Gm-Gg: ATEYQzzWbvBpq+5tw5Aqj+RcaPu98f8EKfvPhcL/R/kqgpaM7/Y45mk/JOSrQAYq2uS
	Ke5mc19x5RtA1KZTmuNbBhUoXoW+m2/JRzTSgXPVTOIW9oIyVreBqhZOvcpgpWkvbteGJfFUtWL
	IBkPAL5i/PPZvY1OZ8wjg3XpZiks3KoKS2Wq2kS/kl5mnGPTx+9yf79zg4MvhEuzSUw9kwgKBEr
	HdyN8YLbScvVm6vg3zfbID78IqmVuER+OD9rCciiey8c62R3BMU8SCw2/NSkxkBf5jzhcfd3hYP
	hDLcbdU8MNcBv3SgtI3uJY4UTLmG3TNKLY4a5b8JP1+ZnQoEeqLkxyVaoCgDphVcUTcPI8BB8h5
	MLkS8VJDR06jq2pvaqARALJPva1kvrot3VXX72p8RA0qVWFO658NZ
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr163897511cf.1.1774272093183;
        Mon, 23 Mar 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr163896651cf.1.1774272092510;
        Mon, 23 Mar 2026 06:21:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:56 +0100
Subject: [PATCH net-next v10 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-4-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5JDL4jjZYhLTE71eK774W6IHVRe41TGruCg
 0vfvbkpEM6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SQAKCRAFnS7L/zaE
 wyLTD/0UpOnzKn1Gecnm8VFBmZ2swR9Ssw5MP0G8PYCTVfO8kjLy1csYm7RO4vytNIo7oM8qO5d
 6VoBYjjJkWEAyasocz5DMrG2vzcX2Novp5c6crEUytqg6DMJxkczKlStaI3yrLD+2Em58/aSiyH
 ++z/X3cGkMmKuzrOnAFcpNFNf0VBfKCugMPJX6yzzDRoSGvz3te1p6KN+ydlpdbt4xreWaEdjS1
 e4W1FGLBE2vS/WNLgzyJ40iy2o7uylNx/A5Dlg/TU+DiIj2TV6s7WeTTzsAdkAnuhyn1XjwVA3a
 /BnjOiasTbtH41mXdnzHxq48giidbbU/VLfCb4h4kwAf4pPLIkcXsChidQONJzOPpKYimqqR7TT
 IZfYtpFtg9MyioYyCVYULzUy3RzeU53Fedhy35Jkcq0RnPvLWA7WankUwL3weBHA1pbjqpB8+Sx
 MISWwp1ugyrC2Z1QjPhvn7z/PzCuh+WUQ+/7dDclXr8c/kMNISn8BX8YGkclxAt8HYxh0xKigxo
 toffB6LtQ9rM3LFay2BEeO4MZOmYVwFqKG5bdE2ISipRn5c62s64ZPDHd+XOWn3FLEK3LOCP4VC
 x9gzzbiXpBXB+TUP9CgQJ8r0S7zFQETvZ0QjptxL01AChqsAPptuNNOjo/p7CH5PLsWHvc2UWyA
 +CboqIj/Y3NjnlA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: g_1_BGQxrWTjwRLPGQ4PySvaoFSOf3p_
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c13e5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: g_1_BGQxrWTjwRLPGQ4PySvaoFSOf3p_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfXwFYOnaOfKwmA
 ynL8VGt9bk+eo5zpyTio3kLJApwZlM6ofD64OdyzAnXfeS5rPIKc4M/zyBkNE76Poifd5iCR/yw
 FcSkk2YfYxG8YBRP2AwOcpNdy+QTQ/v7VkDkNgwWPRaHWasbZl9SmKjswtNpnLMiM2wJfZxZuiK
 RqkWLq735U7JN4OvGdX9q1s+fQBNtcsUEnF550BHglMf/B7S3AGNK5tqa/1Ep7r1JH5EEJ/jNsc
 rZOIT6g3qwxYKFYxAVyj6dGHOJzmjzy8ORJEHpuBXyPKi93K2bg8TYlPzFrNB2al1e9vnNGZEuy
 DWzheewMYvlyh6RajYcFjEFXKde0ICzBlSMOwj+o/qq3aJ79G8tJRH0nV7smIRw5Rg/gdtoywC5
 wcyQsMaeqG8Umq+9kwo8KCvaDp2ioc6tErKt43kXzYiJTq7bw/I7+s8V7OpfxvCPOb/Uvqg6RyF
 kxRIDw+OOIL6OiF5B8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062135_213713_A7E8D5F7 
X-CRM114-Status: GOOD (  17.36  )
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
index 8fda6c128117d7f5b1dece68c919f2a09a511210..cbfae18773c1193cd640f07824f5a66d68f9634b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,13 +92,17 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
-	const char *link_clk_name;
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
