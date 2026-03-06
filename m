Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497BAFCB61A
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2026 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtUx++Ed2LucghqhxdxyZ1a+r99CihqCaI4il8GUwww=; b=qE3YsiNvyMtI+Y
	dig52IqKKvf3jx7nwh+yifULv3IMCMgwH0eAhfijnvul0nfh5E4HRepk+Zfhv1kh0BAqe5t6FYlOY
	ssD2iXSaIAh/LwpOwaiVwbTFnPdMN+4DAZjgHtL80ar3F2Wd8h4dr8tY1rLKi6ncRgCSWvByzp60c
	kDqp/aZiCN2W+n9jKKvoKnz4bzdoxciQkVNm4/f0MyEShXyjhO92gLLI7JJrpMZ/YqnVH3WztDZ4q
	hoXDUGUoexjkubetkTfVV6Ny1r5V4iRE20Dem0cc9zEOzgLoXDzZJazsaSa09YOqAFj1b/ejmxvAP
	THLtr0O0ORtUAqvHWiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOX-000000043yK-0EzN;
	Fri, 06 Mar 2026 15:47:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOU-000000043vE-0qDJ
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Mar 2026 15:47:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT6Bf2522589
	for <linux-amlogic@lists.infradead.org>; Fri, 6 Mar 2026 15:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=; b=blZWVVFdJm5pq2s4
	PO1IoTK0oZUWN8RBadFnYGbAlc3m2nYxCCAZJoeyN8dZ2GzS0bjFpB/+/WRbRyOp
	cZpzJbPQfn7+onkLGvTUQeviugYAqHOq/E6UEdZyavJbNRK4yvXe+mYUOU7QPYb7
	d0JbnJ8/vwP1drmZ8bqjvxRL3p2PFud7Af9xu0yJEOdXGhYQ882xIq3BJHerJ0ya
	OQ6T2xzkQsIWvvryi6uV2qq00vNQNaUvC9TLAdVdndnGw3EonILWJcNmO7I7ippn
	jt1rdjFiMLsOW7gxeD34OZKDaDvhyZit9ACXtl7PpgHj6PU82Ath2n/2lmPJW0Xg
	hjUYFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6brjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 06 Mar 2026 15:47:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so4939475385a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Mar 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812033; x=1773416833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
        b=RnuREHZ7I+3qh1j/6IAAhHT3k7sS5ehZ/a6sWuv12qNqsXRBFlM++Tq8OSXH8pjJiD
         AyupDqM27LFVNyZ5x988U2Tyolb3zMr4htIhYX+KEfgfCQvSZIPHpFDuB8IUvy2w+zgA
         TOYt7Y7l2AsODpQqHvJvsj0vnDIyp31/xUpzKUf6zdEi1tRsqdgEqON56bl/EAnYVA9z
         eTrJxp5iDr8ORgSysHK4sZsGkjGua7beV7HwV3cOl+W5u/i8V/EM9PLB+D7+7qyQPpoK
         FusSm5LXOfoSEz4LmHI4brMKIk3HFQCUE5kDQ0umeMeC6LnkFzBbK/C308zQO5KXvBxP
         b9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812033; x=1773416833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
        b=Rlh7Qybsd6XdTwjWlWBMGjGu+kNjmSVgSynClOr2QDxqSF39FalqgQNfjYGYxryC7y
         N1EoH/8aATzVhK7jGTaisVlF1IO4ldHR0Jt8UVyyT2W3nEJmDm6dpzvLR3RHFjAwn16s
         M/E2qwGfENVGmhz/YXYw/Knp+xfhbOEbWMyfYVD4c0lMpcctzwqX6/SrC+u/vf0ChrgW
         OSGpDXbwDC1t3uufMPUC6eRtggc5DLEaIgSYSpFzSYu7EoY+th+b22eyK96Af2OHidb8
         5KnSs+cw+pItwSpRBErrczpVv5iQA8GEGVaQ+cGVs/u1pFc+1YMt3jj/yB0DQ0axLfb1
         ofkw==
X-Forwarded-Encrypted: i=1; AJvYcCWmsMgNVbQ9L8LK0+cRMBfqqOZ94gBGhW2tyYoxqGnWfxO26sCpsn0dGMGO1XSzPmbJwehr76vsU3Y7trnC@lists.infradead.org
X-Gm-Message-State: AOJu0YyZlta9fyujA38nLszzCBHAF7BdoUL47cIe0yXffU/lCdKt8usn
	c/2bspjjotuHCtHO4xvk/4raezuPgIs+I/1wr0QeZlMx/lNzXV4zv/w2+1sKOJb4T4doeBNqs8s
	An0/402rlr86KJZDJkgqrWU2wqvc7JTiRCNeae5SS5OyuD/gh5h82bIpJCIQcNbKSjDy8zYnWlw
	==
X-Gm-Gg: ATEYQzxbSrnqjt47BPhmS/BgWy4b8vNZySGCuPWRhcwmZtlEnt+2fiKrrJQZzSnS4ZI
	80NQNvdB2MR5xumRvocBnV+1Xm89YnuDGkKXesm2qMx0yI2U3J66zpEoZdj0Kav2oZZ2WCpPNqa
	b7CHeGEF58lbLjVE14bPS8yjJToIHUimYKK9WvaxiZkKN1w5IGax1nMAiLOpWvU6VnnUiqPufMA
	5YyjSbyAL75saAOwDk3OjMYaz95v1H9dj9HoS8Iav3YOy99GsLHiR/kQIVaLweTWb56LuvFiRqa
	cgkZQhj7IOMHqGxQ0QG04eQC2cIzuP5/xXVbFN9bBGUiRJLXKSPi6T4XNYdJymFIhElP+AjRlFK
	wID7I5/sYsHUy/oOt/SdVY+yoveW9n6Yci7GVLniBvl8YV/oJKGGn
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cd6d52ca78mr307270785a.64.1772812032600;
        Fri, 06 Mar 2026 07:47:12 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cd6d52ca78mr307261085a.64.1772812031898;
        Fri, 06 Mar 2026 07:47:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:40 +0100
Subject: [PATCH net-next v7 2/7] net: stmmac: qcom-ethqos: use generic
 device properties
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-2-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8u/iXjZq36K7RYc1MNw8bxCkqJ95fEzxfvBCtp9cjI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbryaTIb50mRpj4hrxdrase97KkN9iHxwUJp
 BlJuvI37VWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar26wAKCRAFnS7L/zaE
 wzclD/0ZZh4K959JYxRQjHxVfznc7OkBZWgPBrYs8wAo/K3hokNK0WiKMHJZLzn2SMWtqWzVB0C
 lG0CmntJphIJ1AWgN+rXR93gl3L/sk5A6pAGK7SSpHgcKQlf8M1jF5SOdkc3uDgiPPbHCwxhOPV
 jfsOa3iwvidAeWEMmqummdnOf24q3RxuNLVYxiwqK9KQtEssdTXJFhs3HX4WSDrjs/zBKmKvWfn
 JfxMeHdfG7t91xJMf/P5Wp3DVHk5JKSvM5Lw9DE7CpH8hsz4OoZX1BZ9pxQwOeWcTQiPXheDP4H
 2uoOJ4gBkGRVCondWFER/PJsd0MdsXH5KOFfGoxuqaGdgK1Y3qqZ8vVFIxGTJSNkT4w0iZf3V+q
 w534YqTJUi3ZcbICEFTeWEJ0szhN2f2NEjKDqoPq8mJ8/FfC3bW+4fJQEhhxdpdhQWFeAW3sIC1
 Qc4NbVsTYrLkgRdSzSscY2UwVbUcqY2gpTkANq+PSasQaATRxTxNvKS0sINBmqyjUJmZB9tPw0D
 fB7ST1Lzwr8JkoDBdXDhAT3DM0FM3lJs+m8ywJMoOhaQf0+AsZ5IDwxI61znd6YAwLIw8bOQAQg
 Auc4hPSxQt6V6qfOaIm93wh6MAaEr6z5BfcPqlyr68NN61ugGkB2/8dMWzloVwETVtM1dMCmmwV
 DKcCepzLPjDweIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: tTpnKq4MrhuxolBFRY5AHFdBxBmGhXnj
X-Proofpoint-ORIG-GUID: tTpnKq4MrhuxolBFRY5AHFdBxBmGhXnj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXxADrROxg6W2w
 gHsltSjjZWPZsWXHNQYnuSEO6NX3CdFoW5rICNKbBRWLUNhSxui6DAsbUXt9xmSqaKLyWiIh0PY
 VDukXsfMTZy5ZAeumGbUelPooUsGGQpAsPnVCMFBtZrZMwxNWHH+Asx2xOGR6U2d0lHrszGqPCV
 2x51LBG3OQq/0jAUscm6TkxZyfDV9orrtBPG6q976eB46R8x30VKyKsbY9FfEC69Bbh2EsZR2/1
 NZNkwtiSHgVNwBZadRSY4kCyEhXrRzR0s0j4UU9RMoDWT+qOtHzNP/AxcycAF1o6fwIfstmnp3g
 zkV8sM0B2EGZ2m5oOGqVZuNmH4qjgo3brVDJFMik8oNAx2AQY1pcEAnfaKvNyzQSy0ViWR0VIC5
 W8NFF5pauI5Qvn9wYce8UyM0a/TlyaN1bKDVoKXB4/GvshTGl+4PRvzwyFZo1IodFLxtetA7EEC
 rme3aBaO1605zr4G15g==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaf701 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074714_262077_C7BA2436 
X-CRM114-Status: GOOD (  16.92  )
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
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
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
index af8204c0e188ca8eaa9f31abeddda607f273b4a3..219ea36fe01e6d41299649defe569de034859288 100644
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
@@ -730,7 +730,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -779,7 +778,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -816,9 +815,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
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
