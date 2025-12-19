Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF62FD767EE
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Dec 2025 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q27QvrV4LzDhIrzAiZt4aesnFoI5OIyyXKhkByOyk/o=; b=KfQ30CcGC7MEq/
	lCeoiNYAIt1eF2FYfY7dR8I71ft9Kkl5UqB/qnSZyG0NTDyeysplkPzOk6chCwZeKxdGGHc/8AImK
	c4yfMGaySspgdPsEaXYRm1z206bkrLNROWj26M0eozFHX/ORdySGaJqx5sru6sVcqYbPZhCDkssWL
	P9zHLgSjHtPufnz7jErk4gRnv5k/nKxGyHiSRcIWCSr2MVKVBgjtJedq39yJ1DgyMJfGOvvZZQo9W
	+v/MbsXZu8NZ/OGASEHs93Or+KqftQnAEuURxbQsT7xNRsko3100XnoWneyYecL4Dt0gcoNIxWoMA
	3mlXMLo44Fb+71uMpE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYt1-0000000ADIF-1yE8;
	Fri, 19 Dec 2025 11:43:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYsw-0000000AD9a-2WN5
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Dec 2025 11:43:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBBIW14102694
	for <linux-amlogic@lists.infradead.org>; Fri, 19 Dec 2025 11:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toP+4hHDSoxB8780ojreFhm/a4J1ZHDTB+HRCD79Zhc=; b=B3F+9YN+jWefr77j
	h+kL+X0o5z72id6q20kST95IstYJSgUswHV+udx4ZeilOqbX5rZpNWghQJK0DNei
	Nl/qpIX9KMz2CG5ue4C8W/Vk/bks1+lK56bNIp3kgcwXu8K88gXDorG80Eu38B/8
	OHlhdAV5Fqauq1nm1Y4y81nxFim9rsnXpIKJifkwe3Nj/RWYV6OXuDmGNPCDwx/Y
	5WLejG9/EF8di+1ix+rl2VsdwXH1EBeGMqzuOdrmmYpQ4cp+DUkkfpNgDMKg01XG
	leRxEKGtZpaKvvrX3ZfqELd5bX84kSsIsEv/991WlY0HXMWnapOMPSSTX/P0Kyf7
	sUU8GQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2gr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 19 Dec 2025 11:43:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso40488741cf.0
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Dec 2025 03:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144581; x=1766749381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toP+4hHDSoxB8780ojreFhm/a4J1ZHDTB+HRCD79Zhc=;
        b=eEEgefQTVJ0jeISrAsjP1zCCOw0i2S5USfmOc9olllTHp+hJJUgMpkthv6hcRkBb8l
         q/Qwuzsf794OmLgU46XLtjHjiE+IHPHey7pdrz0tS8hwiAim4EK1wthzrkezIWoBbaAe
         soWyOIMmvBkE9sR8vOrtfe+LxRCgNlace2vycGKw0VP5pHO9Da7GaI5jYGM6ma8gmdcX
         LrL08OB4Xbg00IkWcbXygGFVNTjZ+Pa5OLtN2QIipIiG0r0bKGWpvdrpQk1A+Rc2Ey/y
         rVVxadKuIx68TJ1OBL/Dt8u2pro5vi1JIq4aP2mKgkXneWnt4og1bnkAMkZC/4SzD7K6
         uUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144581; x=1766749381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toP+4hHDSoxB8780ojreFhm/a4J1ZHDTB+HRCD79Zhc=;
        b=A23PmlQuRVhuisufn/wTV5HZfcYAFeCp8KOA2NqV2vtGafDiTBTB9MKqP0q3kRDRQi
         G5fp09bfOLv6tLdZfv3/cBZHxFWIuPmEKVz+joL1x4nlLVXK3RJpfCG0cHTz0CYhVh8v
         th3vptCn/H8B+yM8kBiWHxRBb3bnUGNOrbT4Lgulm8Ooz+3yn/g1oaxPDquWeGOuwiDU
         CjjPSCKfLA4mXqlux71f1ut5TPAV5GyMoJV3SDFdK5DD6dc4X+cqCRto85zPglxPrZPC
         WU1OWsQ9v8PheTXCOp6FJlH7oRdqYG5LlZPh8p934Q07/ygVP0kpykx5AiFNbYCODDw7
         BetQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1PkksPJv0mloHKMiTfnuArvwC/L0o4Gy22KplaeqIsf81s0wcq7HthYLJhRNEseB450W+Phbk8Jc/gQ4I@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz2q3YzCVpyl8QvK1kVlRaTSos6zpcYr6RMBMSiji5nrZTHrBD
	qyNjnYz4k8oKTQZz06zK4mREYFyxpUfrKQs5M/7JCHvRim6KAyqERO6ifN4hHT8q2EpfU13Iesm
	c69VVLF1NvLEYo3E3IXzLKW6wk8fHZ72163rsr/LlvB1Fry5C8o86xr5ySlAMM9r3tuKBGekCpQ
	==
X-Gm-Gg: AY/fxX608rxBvBJTv/a3a8wAARTuYUsw44TPVdQvEcmwwwUZ/FPrdYamdQL31Yi6KSV
	682EUT9ERGnGG55C1rtad4UXE8WAAl3FNOxrHbRF9Rp6qKP0p3kJo5zZeD54tVjVIeuYHN7ohuf
	QoD/PBn7/7euHjdPF1FRPpovBI3a4SEYUGTDpfDJ/4KO1iH+CFVw0X5gKqfogZ+Z3T0z4EeVlYk
	MCCpFea4TV904xiMk+F6RjqzYjXFAjITOGWSFmmYF5BYoPRG9HeZzt/QfNKYDlnLYgvoBMXWKxF
	LhNeWKC5ewGCY4sXIoYvLjex9M4OQN9KwhwRcmZmky0dpZSqcb3uxLZRZ1ZbYnwmvGuWwkbsAOU
	Fo+gYGZsD2FdFsak+oEfWu3NI3CqtMnfEOZAL4jg=
X-Received: by 2002:a05:622a:2cb:b0:4ec:f31a:1496 with SMTP id d75a77b69052e-4f4abd8e7f8mr33969251cf.56.1766144581156;
        Fri, 19 Dec 2025 03:43:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5jbLqM0SggQoZoqxYXl/yWMOKAuP4NS3/zbdcovR8zaHbvZkAv+xrhVScVhbR/IDMWeLfLA==
X-Received: by 2002:a05:622a:2cb:b0:4ec:f31a:1496 with SMTP id d75a77b69052e-4f4abd8e7f8mr33968661cf.56.1766144580591;
        Fri, 19 Dec 2025 03:43:00 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:43:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:21 +0100
Subject: [PATCH v6 6/7] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
MIME-Version: 1.0
Message-Id: <20251219-qcom-sa8255p-emac-v6-6-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9AVH+OLPVBYkTZnu8Dy/MAFFgxoNMd7J+eOs2UC7Uk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTovz4KhkkaA0q1/bxvZ0VVJsd0md/pcMO4QP
 6kalt0ntniJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LwAKCRAFnS7L/zaE
 w3Y7EACiTaf/AxXHvCBwgf5ZWLPoK5VqY6uMwyZrsrZsZ0H/zZOzbpz39hwncnMmgUTNBortv61
 rMYaV+GDCW0TLkw9TQxq4PUztMvCVNSWom3cT0srO/GBBaVIPCSS4IhTXusjmAh/XWoGs3h726Z
 2zqrpzLp+onwSvqpm175NpEcjzNBAbCIsb6YzwYRBF8AbY4y4uxhUIjTL4TpAURdV23fpTsCYzY
 TZ6jYK4S8BsJZc+1LhTqVWxyzkjz36VFUMzRhx9Qpu7DQaniKas6+NmVKgLY+ayc58FKnlyuOJr
 uGLNis71NNRkltPgJdx3HZm+yq9V3w4DdgAZurF9+498tKvBKGDmgoo26mqtdZStrHJJ0WnXJz+
 wmrcYMRFFBrIh9UNWqH2atCmsJpTmHzskAWR1hBdO/0jgw6fiIMsYX8kvbXSBzkKVIXOk8WoFtg
 UldB9/qaWJ7Nwkn3zPy8DTaFuMCNwb+WQA8IgGRVxO6Mh6YLnR4tP2H0hktD1UpcGYOYDyYFUJX
 40LfNVv5YUh7zMhcXlX/1k7r3PuC4KYTfLDDviob4nKo3xWfl87Rlv8U39PGwEr7qxFXv74g4jH
 x6XsiMfIoF/Vux1BLfET/tuwxNXCrTHEOnlJGQSb5vqEcNm8iMHrpwMi4kGouyL8U738LKYcOHY
 2L9+//6O4WaTsFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfXwZvqZjoI9qSE
 Tt03Slex3Cwxi1XPyHWXERNEwbdq+RKOLYT/QOULLjECk1XpV6zuBBhqOWy1KZPKcvj/WThRqKj
 Q4xPOhVtanMOT394fi/DI81tD6+8B6ZqcDumrEf82nLah2i9NNfYylOniwm6R33Qkn18WsVTFy1
 vWDmGCCT4RLSFbkverD32MUCsTe2P/BfuH9VtLQcayW7ci+PpkLW7T2DG3MDvC6XZb4D48szQtC
 +4oyK2fatOi+ammIlg3UUNwcB51vcF4eNcFM1p3XLgqpHXaMyfNnLUZP7mE1KtDW20HK+pA233E
 TM9/mWdyT5i5GSDkcxCtsBGD3TbdlxHgvrhNqX+g8M0f5Otf0XY0C2BQdtSe0YSi+lkfX0qbSSN
 isHEjZyv4WRA1yvFk7v8+nTDbybq7QGNns/UOoZA6n7pXOYfrchIBlnR/hS0gYWcT+chvi3ylcS
 TP5QNga4d4DJ/gI4i8A==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453a46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0aI5G4bYpHrJQa0XwroA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6zd1wUXCUBangITMzAL4Wtq7naq97Wnv
X-Proofpoint-GUID: 6zd1wUXCUBangITMzAL4Wtq7naq97Wnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034302_729667_F1834A18 
X-CRM114-Status: GOOD (  15.61  )
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

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 856fa2c7c896..8ba57bba3f2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -617,11 +618,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -838,6 +844,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
