Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94565C44500
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2aqu+Ze1UuQH9gDdvVCcFHPeT5WaYClEf9KNWjFIHM=; b=dekdLraIuOk5KP
	yGxIa79i4oAqcc4D3KyOWvNn2ws0hsOP+3qmWJVZorrr3GJOZvbAQqRbv3aMkLljbDBG7bBZ0iT9q
	Xy5VBGicYFWyYY7OOTKzpbLTUTGvLIQLXnWdRC6ZQD1IasTkkYveHo1SAyfh5Vz2IKYd8YxBHd2dZ
	35rrDrR6aniOhfp6m4gnhWC/meWfOke2l2+CiHpk7q1GSf9ckHdvK43yXsdHyx8Gu5lH6Jtvz8+jL
	dLNKeGpq8apUsJtsEDizhWrs9BmeYorNeJsogzLiuqVTczwrmhUvOkd8iKev3uEg95az6a4VjoxWj
	Q1hj8jIyVd9ME1HFJCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFe-0000000CYdr-0wZ7;
	Mon, 06 Jul 2026 13:20:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFa-0000000CYaa-2dWx
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 13:20:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7u7245538
	for <linux-amlogic@lists.infradead.org>; Mon, 6 Jul 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=Of8SDNd8nSgjJ/b5
	fAMXAah/f8yVIsJxTIQZN4IS2TX1ZZhDbCRfkHtS8STKVwFNOX8hJ6rtZjjNUEWk
	ra1QRqhWhwEJuEuVJmIkKEjCyGnYRMyRouN4tOaQAL7WKGtLf6pMWd3jpTt3Y2mH
	yIB97QBgecowYhAqufxukVzcuFZFwM+XGvXOXPI7akvWbXSao/JQePT7AfyhqsKl
	TBlSuuWv5ZI5egv8hAhp+bNRuAmFql5cHMa4v59zda0oprUQ6QKaXhc46VcuwXqD
	ZXNRNv/BvaRTphCiqzmfQNUHvh356ktFDDX9m+0cmqfA2hO64P63QMAfeXoDLHrX
	zbhaew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gqje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 13:20:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so391984285a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344041; x=1783948841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=TlR0D4OHQ/ueO3d5gtcxetZOqKb2XyqJOJwIx37aD5Zk0B6FZp72UDOy7Ba+NS4amQ
         1tPD6L+RrwFqZzR/TRXkxrzi1xiYKhoX7Ghx7C3AAB6yRQa7g/kph8UOFCWoB9UuI5dQ
         CvW5j0N4F4inTLWCROINP9nEZneCuPk2tHuORTspr6v9COM2HsFP4HlpemFNcuMTSRgb
         n0PQG6A0f9piqvexWkubNDOrUkQTmwG1lFoMDDkT2r3zk6bWBGAlnwLRBqONVPt3q8mL
         4/LiZSHo8FHw/wvQI4NyOBkpi7KEpqLkZEfwoqJqCJ/hU73o1tTfbze2u7EMVd9lxeOr
         MNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344041; x=1783948841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=AjGsiXnQEULa6FzW+niTD8SxkIuNHTrznRgU195JVUqCszq6qd6tsFFRDvXUnibdLQ
         oKjwdablGsl01fq5l1O4XFhEsKf3u2HRvmR8ca/3q8nxtwQH6qGahQ/gt4jpm3vNtj4C
         Da0qHZgmixF9L+N9558WuBNCVc2vuQBG646qljj/vSGsGntLs4B5z3kYKIp93WiaCXz5
         3FR75uUJQCTkp5yDKQ5BSR2rrh8K5hFJnUevhvZZCy9NahEiOKYK9xDFv1GwhA0d5+qV
         g8abF56EXOqr6hE0TDku06UcmOlWDBrVvbYqweqfoTVi0ps1eyBX338WxBMspaD9iZw9
         jNEw==
X-Forwarded-Encrypted: i=1; AHgh+RqhZeYxvouSAGpLWEa85G3p7W2+lpod4NEn4rZkksSdM6GwDdeGyZe4RrDKVj2R7MF68nefKEYV16e73j4b@lists.infradead.org
X-Gm-Message-State: AOJu0YxkoQYG1EW1bs3t/QR/zNs8uIPJzmw3PFqp6w8J1m1rVNEPivH4
	wxcqteW08OVStFg0oW6Vi6Qcu2MrfOQOHzWW5VnUjP+zb1NYjQy+nd6HIf+FbuPzwG1l+sBFjBv
	otRqQ+XctWbZuhCLLekNNonvC12I04Z7tqC4cf2YXZunEX/AfoFA8z6y6VwpZG3Eknrsb19ESAw
	==
X-Gm-Gg: AfdE7cmSXcHxyUKAE4I5dh+hSaCtHTJsu+nThKGBl2cwx6iW0Eh5jyWubkfHHv+mJy+
	n/5iN16ptcyPtTqZUcJbm2aw8v2vgLbPwvy+iyH47JObYVWptwy7Onq5KSdOf6Cj7Izby0NU0vc
	+4d4QgHLjON7uTaQYDjkLNQU48HRcZoxgqVmNq4OzWgkWSGVMUYGXR3NXWYQ9oF2IrCBIc2eY3J
	lMAO3VSKGg3R59I6U5adwsIyLPm7rbi+I142oCb57tI0dgr0TS3GISxZsiUTYsR+Sy0I0XUd8Eu
	mjEWigdXmZ8zEI4RLwiVKuVxin7cBKUPxMdbcEGLnX/2WO1e6LVM1lo9o+q9aByIN22/j7KRNSP
	ABP0foD6vZwTgZLUwLYg3KOCz8B3H5biTAIP5O6Om
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id af79cd13be357-92e8b4bd907mr1698932085a.19.1783344040798;
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id af79cd13be357-92e8b4bd907mr1698924685a.19.1783344040264;
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:16 +0200
Subject: [PATCH net-next v12 1/7] dt-bindings: phy: document the serdes PHY
 on sa8255p
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6ubiXdhUge3ye8k09h+7C2wjU8OFOs2+lRmu
 FCvxgxqyhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurmwAKCRAFnS7L/zaE
 w9S3D/0WsPuArRuolQJdGz26v9pT9Wt0u35Mgl6MOyqF8MpFHp1lFyjsAjDjk4AncmfnUl8tvC6
 PVNRwP4pwlRWfAsOg7ipKdd01pTeZ4FZss0kgxwsyhwvDYpCC9olobyevp+eDaonoGUFpbCe+mI
 IeoyE856odq0d7waceNBYKbUKPNM1Wn0rJwKYyNrOmp4srgyyo0ZZ64s7uIKF1dZFtpCRsd36FU
 +WK3Nc2BfpdGf0aJnTEx6WQ5dWwLf/g5nbOgU7Wz3lcHRKSkIBwUfBx7faOER/Cm99qiDp3+9Tr
 dMQWNkO7DDcZ5/2d6vJOQcnRiAUuJN6iKoYwaqaqYKIlSO1aoW//LHz/m+mD0zYciPYhazP0xKy
 eEp5FcB5PhL1n/Xb0XFnuYxJSfh1bWvVuPK+o0gS6NHanHquydjKhJ5QkIi7OsuJ5b63LU3wWmG
 Cu/MfIMUnEpiHZw9KbEV077HhSipqMXzxdG07s4sOJAOW2TwwH7igsRy+0EywCQ+LP7TSxBvaLG
 INjs00fu3a9KB1BL2O2kfmpZRawHyXgdKtMqMTRW/pPkp72D0F4KGm0iDReGqocgixQAGKSr9eX
 vKMbfamjR9j820ac19f2q34B0tVxvUosuSTcPQ+vHIwvd9S/uXcsDT0tRs2FwWTxH4xjIEFgPmv
 iYb2sLD5F8kSxfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4babaa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX5t1geCmhvhOi
 IhLBpKGgqRnIk7GUtJvR/I71q396DIscB5Bx0dHVaOnhcNiBJfNo2jdSixJXvPDSI8iBTvS5GjE
 XMUGB/7kPJieg17qFGQUIFidKqIDZ8LVb84yfyTj5A+hmTgvL6El7zcUEc9MO2e//7lvdKSZ1cS
 43xGHTip0mLErWkRO2d4BbdL6S/Mgm85tWP0Mu9Q8nPztDAV3SS5l5K7llFGvqEvJqg4vtA2+sW
 iYG0pEsBL9fdMyfCnEWknqM46TySa6j47CnV3OSH5uC56e4qYviOIU8VQ1HI85/wsmDVxCcpWDH
 wTWKgnVxIDhrUgvvYdYD1Yhe29oNz04In7m1Q/Hn/BLyZqGXyWM3XUx72xg6vy7cDhu/zgpfdLw
 yXerDQXWojZ1aHR81DOF33Ig3VuyiAogSXJXAA/87bjXSTarEJzAi8uC2+P9OJrNQSj0nZshdgg
 FFgNvnqTtpSKwUcQc4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX69RPaRLmYyao
 PgiyHhRVdUJUQd5uQkI3EYcGbAsUQs6QUeDzfg7dhbq0DPLIeGPcYqGxmqrl/MgtNWl9Kv8PkrV
 pOe/vV53sdaWKnYPDWLOWyeCV7Bp+sk=
X-Proofpoint-GUID: e8xCf1c3L6QeWdst_Lu24mc0swDX0hMJ
X-Proofpoint-ORIG-GUID: e8xCf1c3L6QeWdst_Lu24mc0swDX0hMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062042_690379_529696AF 
X-CRM114-Status: GOOD (  14.43  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
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
+    maxItems: 1
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
