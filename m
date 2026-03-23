Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC485F4610C
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vka3gOPY3SKP8go50Uk/DQh55Lj0CBtpKpeZY12nYwM=; b=OYtDhF/aA/kAR/
	/4zjqajTtOFB/2KxHCPVyigveYaVq3LyLS8ohQfFHYB1vJG9XDCm4jsCvlvAyUlDRZ60tsxlBp69G
	R2YOZm4TuxJeU0yWSIORcU2SiMADiaRhCrCP/sOoZdq7qzcfpkm4M1/NHxe8qzlF9xfNWwYyUy6yc
	d2eRSa+pT9SazuVBH7sN9/p51RblHYZMfG6/6KcMmGX+v+35dZYcOgryWU9XL2UnPWoI1yblu3ANr
	aYjm55IUwgIGe2BrNtyoIGJ5JL68vtZy6urHXAf+V34ajqAVI7FX4Ig41a/e3qccqFiFvakgL7Osa
	z1EwlNFqKoZODA84IAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDo-0000000Gmln-1RTc;
	Mon, 23 Mar 2026 13:21:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDk-0000000GmhK-3IkQ
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Mar 2026 13:21:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7trRa3468141
	for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=; b=DNyUHVHVyPrHUr38
	Xak8Gq5GJ3zIqN8aI5S8N5ng4jsCxFEFQa+hG7ZyeZjAsKwCD4PMZjatk3vs0iiM
	+qMhA+XP8aDgi1rxxICX2A2N5CsexJj1YEh0US24LYYu8RKuQXybtLbQ4CVbUCUK
	fEwQ0123+8dSSgYwfj8FKP3sFJfC74sCdDhpGDNlWlr3iiRdxksTb3nDHB6VUl4W
	FX7yzZwoeggxFMDFrVwtfNJgTkC4QUSSLO7TtRBQQTs0LmvFAVV/79N8aD6zNPvz
	UB1KL1PvUWfr21GW9AVav7bnkME/0fNYb5xW1HRE+XNjO4PiSYBEryZNdV6OtX63
	d1FzIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh5x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 13:21:28 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so483748241.3
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272087; x=1774876887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=;
        b=IYXPoPq1EehWa4tdkydcyhqTCxIE3xhrBXm4k7vQO6Az0Nc+iHXB5alrtJN5CnLmft
         P56Fu3UVUDw+nzlc+EjAYBob7Q3b4rLTU86e77487hTqctUUV7Y3q6hGRZP4iW1A3/Yd
         Nmi6p8asnEep798hRJ3QtAmfFj+Gc0cp3DspmdN6weIPMPBKiGxuw/XX3TE6j4XhVUgi
         lrRxblVJ3tZHgbKTHGBtki2JyJ9mwBrru0mzeSj4frlS/jjherKuyT4Aqutr07tvTvGB
         0k6kG64dDhSDGmYWnIW4/TLwF4O5fUOEMjovvYNQD9nE6r6MHU76wIiHnJGmVl2X5Z+X
         hR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272087; x=1774876887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=;
        b=h31mUOZDj8GT4qSxvHM7NYsGkBVKJK+ucWz3RNtrpyTSCL4rQ7rO1NfdWEAceyCa1Y
         98ch7G10S+MRacbU3MRspyHhOK2s+/coAI1JQTYAcnU1Q7vQWCftbQqnZ38gldF6Uokk
         xCAOQJpaNecPhC8QHo+SWp4hU3A0RhM8/f0GMvtHAbvhFRO5zvx0Q3rvJ+mPtV1FOe/6
         7RokgN/STXgqJnoLud6vRYUdOIdmZceNRGKBh/yO52rvpied4cd48VHL1O35XEiyH3C4
         XZDJQlz4b4/O8ULMBuHdblVgQ1PB7HshnQt9opAN+fgZllgoVFGm/X9bw4wYcjOGDDA4
         fwUw==
X-Forwarded-Encrypted: i=1; AJvYcCXLHWw7oe9g6i4POMjvbO24/jHbOE7aUfeyKA1oTTeA/eaS6JiXzQwzpqe1aDHGlF9o/+3+Fy86ThqgMgZQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywld/tvkg/vBsAjirbsiFq24PSWnn7cK4zW9Zg7eNhNo55NF/zC
	1h9LH+Jw4HWu0QwR2eRXWV7kmF8R110XkuHd2PHaDbu/5Yr30Uz+3RW5l0+/bq7f7l9+/dlUwS8
	BKow3G0OBfHC2vIdmMSMGthkmdR1HH/A6lkvaVhDAknfRyR/8AJVrxOqjd8+RhOnbYLBf6cyU5g
	==
X-Gm-Gg: ATEYQzze8fcg5F5SndaYp+UnoXWvdPL2fNYOtTJt2kXehSAVTthaUlfvpWadZ06+QsH
	0trcHWOeOYGmMKpCx9JZ1fgXduxXTR6wqhjiHVddskDsSIJZSKGnKm9FKGflgFbphnaGbITdAeP
	aeLEiIZ4Y1YYj9qe9/s8x5jxbw2jeQ8lghfAPyL5QMRQInzARu50PYFmf88/Ddfz3g7pVPXI4I/
	2k/UZK+ZZfxFY/kByXD/fRxFtz9KM7xauIFY+ctGtmfgEhc4B7kQeFW9ShR244/rauWFhemYwOE
	Hj3PnmiW6v0nMliCuVuTyi/NrAPiUwPalLIQmQHhPGskq8gNY+qkpFufGHyMPVhpkBGDKibFwvu
	No6gmbVO3A+X5oOyKzaASKqLGN/ovcPDKlRbqUJqf6zm0hm4EBYVg
X-Received: by 2002:a05:6102:304c:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-602aed054camr5615952137.25.1774272087269;
        Mon, 23 Mar 2026 06:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-602aed054camr5615916137.25.1774272086743;
        Mon, 23 Mar 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:54 +0100
Subject: [PATCH net-next v10 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-2-79302b238a16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zcR0RnjcSI1SgFgu/C5UbX/pxDqfJ6EHZAvAye3xmuI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5HySyt+qzXu07TEj5NXpUEZpB9c2m0vaFfT
 E1nGa2TGUqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+RwAKCRAFnS7L/zaE
 w0wgEACygEU9p++p9rMQwhvugYB8IPaUzeQ7GkVztEIF9mqKAZo0I+UG9krsT5B2LLN1vr1Fd5S
 x35kFvAKbLN2/iPJKOHafYlD1GNfuQbTdSSzHbsh3TmrpCaBg2AK3hSIHCMjgKnfiw78fce6mSj
 6MoQpIT9wWxXKMzk02wwTU5Q9lfJG3f6EP79Srfo7laossl1waDXZ5tLMKVHyLAm5AL3erk27TV
 zwTBzl2tiB2bO4s33mHw+G8d9ygwWUT4xu9ZYTTTMHViiOoy6C5jh0DzLJZs8t+8d0twIu/Rbbo
 F2RCLFH0SyGp8WD/O83ulomlWSTdeuUIbkDn1KxjogRyCGa+bPK42XlN53N6PkyQZyQK92mBc09
 EgHwBByqDFMrLFS/cgLeHbvRp84htOOlMTeztfR8o2TlaCQcOgV5xc7VXcoRp6l0xUVk0x2pWwE
 xZKX2U6Lfa9zreopc0z/HIva9mlvHWWzr3dgOmUN/7LQSLzOonWwfPhT08De7wGSXNPG+UkIyKW
 SZLHlDqcF/DtWnwp2IUbYHx9SG9ZU+/Jaqx517wqcB6l5xLEqu2hUl1CSkYjrjtXjAQfxSMnSXK
 lq6JhO0zY66r93m165VwOSOVxdtPFTMiaFr1SGBvyKxvReFi2r19OotOw/37HUw11K//83UGgul
 xzQTM+ZNlEtnpHw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5SncDCWGZECRK73Lde0lkaRYyvCrGFnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX17ADwX9kPTJT
 WhOca4qsLAFLNPyLNn/LSvgKHa2QPoyZ5XxvwaagOE+KOArVsFtuDNdziBasoKFR6ECg02aWcFi
 HtYdrAKuC235SS3bQYJC4cldHz1TZJii8D2jjJULo2aZSP4s8RyrodmS+tWjrJo5EbcngMlRXQK
 V1ie/DzkmwkB2Ou56qktCx1ALmLcHnRZJUcN+DRYnMm2CuPpq1XwxCvHqrelwJMhCVszUGVwzKm
 I6YAC7DfScjN565iYCrZXeewhqkYTGtQYc5HpkfBCtYB8Qrg5iIJ2skvvAHv1DVs3KpV7QxtAnl
 iRcQBS44e98mu/V6CD72waq3PLSEXJEzJg3XPjzRD+/E9UfZ36VjwCgRKw6t/093V9yRqL/4Vkn
 ONKhUSMdETc83y2cCIXnVSCmVrrtyF1XLF8Q9fiq2J78RHX39F56t9I5IMBrKEdFngu9AnQB6Zb
 uq2WNftPzRrRnvU6DqQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13e58 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5SncDCWGZECRK73Lde0lkaRYyvCrGFnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062128_851105_D3C72B31 
X-CRM114-Status: GOOD (  16.60  )
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

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index d3a6ab7383fc1e1b2e4b12c670b12a8ad1606e6c..4148805a82b106471a25f9496b60be5bb9ce5c00 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a8ec4649b43ade8ee7b85d613e1c5..66fd2ed2c2c8428694c07d89220d0e1608546791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -728,7 +728,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -778,7 +777,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->rgmii_por = data->rgmii_por;
 	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -818,9 +817,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
