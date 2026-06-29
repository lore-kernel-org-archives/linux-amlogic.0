Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08ECC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzW0Kv0og92pbTmfPN78GG30szOQRf8kQWeDzvLJOMA=; b=EZETT/0aHzJOiG
	gP/rKy5/v2ENG9Q7voitVLFlcT7gIX1u0dJwtwWAh0NDJZYM5MTdSpS0GhuPLJ3ieEHAk93gzWw2L
	UnFWOBP2vxa9IR5/B7S+KiuMxMm2+9pfSxCAdRHbPPCX757tkcnJP1AgYixR3itZ3uUC26xmPR488
	bOregEtxOJHk2YLKxX7H8RYFOfZjRwI/7qeCV/vF5geAJbW/SY3AMKZdTK+gh1Evdv5rwm/JTBC2L
	1X75vhAAdHGiYau2mGPkLX7oHSlk0ycQ4ZV9kbcLMEeiIy1IOL54IsTW1csswncIiVfmSc/4pfZta
	+DmVHJrnz228P99kMgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAAy-0000000ERJt-2PLN;
	Mon, 29 Jun 2026 11:29:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAAv-0000000ERGG-3AdP
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 11:29:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5FXg2728548
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 11:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=; b=mDoLn51y1+n9c+LX
	/uFOfzjryd4fR2ExPRPOfIXZtNSwDJNcyTOtjbzWDTOZBWMyugD7sJkoSPvrB5wO
	8kXIBQcn49GjQUL+q/jVdB1CkwqtGpIkW2ioZH71DFlDTpdZKhNCYR1kCIGtyzwE
	pMSK85M4O/Mw2GX3aVt5CKlkTbELhbsWp2ImFRXJhp2LSD9byS7BWFnATmxMfTGa
	RwrbnX/+nM70popR69Ac+CjBKdodkaOi51fWAtTFemCDx/MMiUJNTdnveuoDzzfY
	orBZ8QQ2KEsVOfVmmZzIeSKiXpQJnzmPWJPiwlSy0q1LeslTDLK1pNNaBCHdMp6N
	Fise9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha82jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 11:29:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so122402285a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732556; x=1783337356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=;
        b=MdIrSKG2944E2RcG5kHRNwZZh6HXdX7DvYfGZaniW90wQ7Whh70YNhq/F34uB78/9B
         QHDMeCAhnk2YxAA3tt01uZc1xQaNPWDDL+TCIMyEb1djjpne5eI2XsfQxMjuuG581306
         t7qqduR+oIjmQCHlJL8PxymOxwn19Da6pZa+AHme9VycflkTPelAm2g777Fnjyrmotco
         xMYv1C7RbNgSlL8Uhm7OY1MEBBD0ZehiKyHWC0KJqkJsazushtZzR2sBUJgz9sHVVrsN
         3+aBFdnTvitsoe+D6c6Dx08LjZIlFUd2BvL6uL7r2icZLnXqFpszko7vKDlNroUwTpUA
         loUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732556; x=1783337356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=;
        b=oU4nIQY5YAsML7kcyJpkJB8QFEhTy1Ys5IBmzgbCoky+5K2cD7GTbUytIXPjtqwGV3
         qj9dbua0YmVllVZpAM2Kjyo7Tm4LPY0Tq1f/tmeBHSl/xYXzEdH2SjFn8l0ep0UgCOMk
         GzLqI0Og9DhI+EZox5LsWjOoM33t2/MTAyjtRLejRNRFbAPKcd1WrkkWAbMQRHceTZW8
         iYmMb5vUKBkiwtbEm5Y0WwtvaB/v7HTpiH49SAbDv8Ha3NSqLTBvV9SFPgYdUA0neRlc
         LLeMI3NQ4EofEB5OPaVXzYc+NQmjo0//EwncD5OGiYA2+Wfhj35v2PKKn8naXEJ26AfS
         JT2w==
X-Forwarded-Encrypted: i=1; AFNElJ9X/C42ZCYwQ0P2xDeYX3zJlUHpxsUKR+Zy4LCcCQKgyW0c9aHKG8FHwFLkOCPwJnbqK5VpcX2glErVzN9t@lists.infradead.org
X-Gm-Message-State: AOJu0YyY5eVSlU3XGzRk5PfwrhNYWpbISXZJ6iN7A1kHohouXk94lCef
	mr+hXO+UzkvOODDMxCX4taq/G/A6Sr15slHxJ6qs2AFS4joLzS8Dg/MwYbLKAkrgXmbc4HRBahN
	xe8XO1/VoYexdJHZxeNtKYZFjc9iBliYkCFef+xZtMWRI9neebBHrRPokjQjRkY+95A1JU7p45A
	==
X-Gm-Gg: AfdE7ckX5477Zk42M8qYgvmy84l6QOPmcUw5hK41vuJlix+C7QKLjtFdciH+ImiU35n
	3fG7Z/PsM0XnHXGEBR81SAzPmCZdp0kW7iMLrNKzGWtdnF3pwbpQX+UEGjxKo63FkdkY2k1Fo4n
	nnSshFGVtEXlZR1I18WwErs9Siml8vLngyeSAfQIN2BsRduv3vTIiXlJ+DgW9156ws8zdgFaT9v
	S2m+RAg/Iy7zLqX87tkdYNrH+35JlIc6MZNLCRWCeTik5Bj6E6kzfxEhx0ykc7OFqxgOFUtpKcj
	086rcWkg9KPk6yFAXZhLKSQxjT8H0lPDmQdQmPw/FQa2Lqf1RS2POFQzpPvACebFO+4y2YGy/3r
	FqcBYLObN8Y/XS/4d67p6RaFmyRpNwiUvPmknqPNK
X-Received: by 2002:a05:620a:8811:b0:92e:4613:5b0b with SMTP id af79cd13be357-92e5f3e9a4fmr49744685a.68.1782732556172;
        Mon, 29 Jun 2026 04:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:92e:4613:5b0b with SMTP id af79cd13be357-92e5f3e9a4fmr49734185a.68.1782732555518;
        Mon, 29 Jun 2026 04:29:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:47 +0200
Subject: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes PHY
 on sa8255p
MIME-Version: 1.0
Message-Id: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OFyFIYba4yDJjHIOFWWcs6aVl9zR1OAh6XyBHH3ICVs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb9/FP9ORrwIL+ZXHhc4b/L5Vtd7JbT7/lyW
 6CTLAJxkTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW/QAKCRAFnS7L/zaE
 w9DkD/9MZJRrtOsV5vLrh1qrBZUZqJ2J9P8RRMHcXW1H6bhugDvmWsApILNySh2JSvj/F75OBxe
 G/pjESTF0lriIWKZ0+AMeTHCvhTp+m41R1GmLxCqFVKAicTOXqKmgAiffSSBkBqVaNeeWlZ83sL
 6GLB1/MvboM7lOBK7c0kM+Q7W6L8mYDjhKMDrJEu7SJ1Gm/CeG71rEWMC0nrlutq+IMg3Fsl+KG
 8oQVK/BqD00erY7V6zhduQycUgvTDvlMrA0LVCGZNDD58EYhNTWUaP82QxlIZImo2D/QXFZFCWW
 NHk7KncIU8gjJxo2AlVAsVSl15s0QPL6iEtQ2YDugZyToITAyww/uLfUjzoOJg7EP2xGDBFXiER
 m6HrIZtcTkiRst6J6Ye1inXnGCTLjybVyT9FiqyYAwhW6xCKZHJz+X0xI7shjpvTJoAohGVbt2m
 X7d4hOW9l6tZi9IOCcLymOb51eOmK1TsCByx/q4A/HjihTwQmy5VsGv+TDW+zC23d9w5iqz4CuE
 MpNFlr7NUEUqgqmDh0hR/C8xQldgjn2QV+bMmIoIGn9M+Sb5UU88qOIgcXi4/Q4J7jR4tDnlzED
 7Mp0XiPmZaXaouKbY2axFMyY3y6MveKZQ0lVz3KLZgmiVOQKTmYQEgOXDbZt1cXRgf5FBbKnTMI
 DRZ6xiS1vJOJEXw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: NXu6ZXP0FF1oBsPpEvUWHBq6K1pxgfQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX5WG5DAppNr4i
 TFhBGstAGvtztfQWYRFTTaowY6VDpQxIM91J5VxP606LJEGNyjbDNQFn7jDMpk5PxBXZpi0UxOn
 FkHJiSqysnsORJwpfsPnZGK67heVmtMQVb0FmuUEIxBzuJ7a3UfL5DTy66O9CtImmtKthd8Y67G
 DbzlvkNhpfcQJ7SvNmE9lKNJrPSE1Y84qzd2WBpOlZfoWkITmKV37bPhWJaVtpXyPAOiNOMh2UW
 fSRpFcr1LcSMQBHKRZMCbsdpq1o3iW57HdseNAKKeMKIoVxVKdnArtYtLZFkPgcYwPrlqkZEWK7
 q390EDZ74zO+qMDYIP6AGurrYnlvPuGTv5jKklh5U/jFpsZqtCkUaGOLX+sRub/8iepw7MCZO9P
 BYEsII67UyhspnTy7ol83vVbvtqDMXJqVw4gn4yEAskbHHeDQdlezk89Igqvx+F2tfQ88tJubii
 A6q+OoI8DMKpv52SwsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX0FlVUUF5+u5p
 KBx9jDkw5gHod0p9+kq4TJAFu+cyP39E1U9z2W75JJiH6ZPfGwxqw9fdGG6XSklNtllNBjMNb5W
 Ne81DOpdizs8V7u6MIi+FIzI4MsJgnA=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a42570c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: NXu6ZXP0FF1oBsPpEvUWHBq6K1pxgfQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_042917_909421_8CAB556D 
X-CRM114-Status: GOOD (  14.31  )
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

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4cea6926d1c28872ea7b7aad53088dbbcb74fa99
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    items:
+      - const: serdes
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
