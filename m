Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F78F46455
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piYqe56zMEwrzil6sOg+c6x1uAsyTN1CtlQFN154AcU=; b=hzvHotd1BAFbQq
	F0youVAe5KAUG6iJ8PMUhDAJ9wg9NbkcC+a+2eGMbuTNVFQBloM0fuPVWNdK/cbUcjA0+TZIIMYdB
	NcjpvIUOdrKVwdffKkAupvjAL/F3ASwXYMibZ7cD4gJ2YN8XZcrZc5HpQORkNV4qIa3H1jnDMb3R7
	HX+jOrx7HyNvfspixzjaCtY5t2aIkMFMWYwvWSl2/B6uQfHdg7ct1Y9kGb4/v/sW+jQUWiYZkP3iw
	cwPf7pVuLOL+X9YhsQBSsZOwNKnzhga8y1CIHvASX4NNe34Zl1jd6X4vQqKURZOprrMKKhsq9GtJ7
	EZCRybCIOmbW0TObR9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hn-00000003stR-3M3c;
	Mon, 16 Mar 2026 12:05:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hh-00000003sjV-2AB7
	for linux-amlogic@bombadil.infradead.org;
	Mon, 16 Mar 2026 12:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=; b=pLAL8hv9NjYRM29+p8YQlLcjXj
	X7A/dqzsShjRCW34YOhfPyukR/QMRZwVpYx0bdsemINpULpmItbZLkoe9ULoaxlMfvGVIzZbOQsbB
	8UuTWXS/DXdFW9IzoiTOeCPPCfk0QAaZxfSS4CBKyfNtaMxh3YkQ8bmJfdfOLvxQ3MvLMPAtvyIIt
	99Zl1yxKqBYrpbjYOW1n6LaD+txc97tDk/+CDa2kKeZ9CjgZspJuVVwTQ+pjZl9hsG5FLH8raoP15
	ugfIvzoZqZzrkdmZHtthr4c2Yi7HY6rZ0P+o1ttWtShkz+DMcHibZ5R4XSKEi1iQ6UcIVd7aiwJnT
	VV8ru3Cw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hd-00000006fOi-0Jiy
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 12:05:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBueGD539830
	for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2026 12:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=; b=H4wv/95rrUsxz06z
	XjZDabTjstrwrld8qqGBx7o9FhrFh9lLj64r9yIhp7SulFg0ah0OVK2lNdJo5BJb
	3VNvJyiwQrdfrrcduR3enqHHG5yyMJJ8UiBZQc/k+NoPVFQqkRlazRQgWfG4bhkI
	OrremG8TeJvjQdPx0MSGJerW1cljot/cuo8C9jKfG4IKtkHPNv+yLIgjvKlKD3+x
	K1ekrm1WWPsob2i8QxZn2cv4dbLG1kb/dn0PNgwqgymSuwp70bJimSH81kuMNCqd
	x3liWepGHSUprMSU4EFkhdow/DIh1HN2h8miO/oB9c+pztNVBKDEvrhRkTGv7rxH
	x3leDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5nkq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2026 12:05:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c56a7e610so44957336d6.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2026 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662741; x=1774267541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=;
        b=YZCv9WVX6Pv/YfTwH2drTsDg5zXPn34OcOHGshHqRssW5bw9EMyBtSzeC/LzHNp/Oi
         8nq/itwUcSiqHD1/9TgAtEss2D6fXdnbkISRSliB/+3JyOzKQ1Zp8ojD3mcpF+P06r36
         xPyklenPUuX9fjEoy5UAQzKAYV+9m2sY2CY16ii1sFkNVRn3Ds32yWrtLiy3Z8Bp9aCW
         0FoMWPEd0azO3mkPQhHlnHvwCkXw6H3hg/QeVyy5yZqPB9imU/nXpq7vcUOnw3qGyRuw
         UO9s+UWEhPyXFzxB+2mUDM034NidLXSaWtYBwxvEZ9lOPLA/hecqqtdZWropbNarKmEH
         cTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662741; x=1774267541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=;
        b=kTXQz1403gwCe1+DfREhwJVIUhvIpTT87BJyAJWwE1sFnFj9fC4GxTB8pE0hU3Em/H
         MTJW8A8GO4QcBUz65LkfRYDwstEYZy78Hm7tyxP47/o1BJhQvWlSpOsXe+nut/yBJJGk
         yHKDpIrP3l5AsnyifZtIOF8M+7KGWMrjzcUgLHBDl/wPww/3zkDogbadP5/PQol6gl/T
         5ygoTJJmA4lrRCz2PkaJ7OimDjuTGvo9O61Uc1lcmSR2aEwPXGimKptxcWV8IFIhjD4j
         uSTLQPfcxW//g0eHnTPgH+X3bj7nzG0HHgKaVyeYa91iKahbvdPVq1M8d7RPHklKUiDR
         kF9w==
X-Forwarded-Encrypted: i=1; AJvYcCVHf/2tlX/GMNylLzZO89804Jmr/d9vA04Y6aUexjjpauttvSovrVer7Yjp5em1XCvO5H2l7BSiRifON0RO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3wAbtVfemf4iOFfeOBTJgcoCtOyXhkgdm3cGAJI0iLQgrCD4I
	2LcqMhxBHlRAFm0R7j73M2UI3cdlx+kFFn9FOiiF5F7KV02pxdFOsGT6O7n22rN//aGBZKpQWYz
	moXaaa+c2BZQjiYuqn/7exIJr0MgfvPfAC+V8Rsc0muL5fTUqVnNaajWX7r5rGd5o3ToJA2J8vw
	==
X-Gm-Gg: ATEYQzxY9pq0Km6iBn4UzeXned+D29mE92FIgVdfXZZwE9f0duHwpKs4VkEaw9jlkNV
	pqvbN9qxtvHw2zHnGpkLIxt0A51imhwGS2dZsi23kioTG/4r/JNFxJvg2zIThrQMrrLemYjx+gd
	MLfZX+SUaymTBPJA9Y9BgG9wBmXlyq30Qf4TbaFzxzwxA1fIfjHCXARgSJ+gNZC8a0Tuk/x5QYu
	QuWM3thy+iPY/QgPO0r5Yatmji8IwQLfBevX59V9AEZG/o8FVmgoF1ekbvsRss3bIyyGznaq+zE
	LM8UP2LOKr5RmPgHRDqVutrw++hipv2232a2m8F/A5jZO7U8xYkTxyf6pCbgnKXgwzHRmgR0GVI
	9DqIEM9WjpMKPmkgqMH/SQnMRDeyLI2ZqmZD2WWR1WiVWNMca8KA=
X-Received: by 2002:a05:622a:2d3:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50957e4fc81mr163339091cf.51.1773662740833;
        Mon, 16 Mar 2026 05:05:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50957e4fc81mr163338181cf.51.1773662740311;
        Mon, 16 Mar 2026 05:05:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:07 +0100
Subject: [PATCH net-next v9 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
MIME-Version: 1.0
Message-Id: <20260316-qcom-sa8255p-emac-v9-2-c58934e76ff2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Z1ERLj9DtpkY3L9fjZNwikcGQ6rrwgdETD/VN6J+aQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IFzbQYI6vHh10CWsGJxMAjU0/ZVzCDhmnBV
 hivu5A91MCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBQAKCRAFnS7L/zaE
 w+vkD/9pL4X60sTfNeueDAukikraft0MIkL45kt3+a5pxve09qNywhg0oeLh4dAFFxzl/3y3ygo
 OV5VLkaq4s+pu2o3D5FlAa5wo7IoNsIeq4G3e/Y+q6EtUxNr2S9cW4q07a6CIHrtsGfZ49CwCHb
 nWRa3QH26koOR6cJF79Pv03TAaFkwJ2WErO6PewlTlOms5WE0JribiYsa4Df+SiNuiYk+MkSEmg
 3PlwJimIrLg+aH1c/QXxgJTyLQaFQaXrS4FTN/whate7IH1V3xgu89R4cBJlZEe+jy/UrWTzRLI
 2S/VS+3k775MJSVm7J+ZK++RN2RrRNM16Hfx960Ad7TH4oWAb4jgN6AwddKq+Dv0DULyxNww0Av
 deZ+XLCsbuRPo35wWbWQXrXqcXTfKf+fVyfrxazAWSzDItD+koyKBbV8GDisw6CLh3mblz0CtMC
 tzljCNXp88Z47y4Dn2EqKYDi3vEN7paUWrQwgjasVdBQ+GGt+6LgK9vNgTTQfdQI0tMY1bB9++Y
 Ts/PtMbAzkoD33fmhFu2YWOqYwr2hUje2ZMka7iD12jnWDnw0etKgiudbhCmD9Ja9Z3ZLbQ0RXq
 BV2qJjOUElCAYNYsZdEk5pWDtDVr2bp0fEZJolbUok4gFTto+dlAK4iV5NI6GepT7xqDLZNQl0/
 oGeX7UmdRX824bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OAumDbDdhR74uv4rbhKlbxC7of7N--nn
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7f215 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OAumDbDdhR74uv4rbhKlbxC7of7N--nn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX2KdrcutGUBD8
 puYcAlzhA+/h4t8rX6IIrZMhZ08oDLNUNaXs4V2mFCvpzBtahWxnsvEWmjj0vrJ2A4UZnnnwb2o
 Vu/JEGaTpo3+yE0Zs0Dbzudf4tS2J8v9Eqe+y1Gz1PRDF7P0r8x1ll5VPidpivYUu1rEF0kbpCW
 K64z24/DSjgzFrzKXU/rSDKZ3BNnEsjdFm2eD5yAjIlNC1YVEN2loFcHUGYBfuJ/GdbfzovSgLn
 OBR/6M565FSOOHiWNlATldSQI0FOmakf9xxq99gK2Sg+udrFBqgUzuV2DwrZrXpHQuEVKoh/Ra9
 QaprnAUEN8nZv9QWfgX3+uteO2fbFk0k0flT23j5hC7le/ql6VH0T23FACOSdWuDs6jdujh3s8Q
 4+PaBn12kvIBpFZ9M2VDoDE8HctgVldjYyybNdDpRJf1xc1/S2ta2eRIe0k7eNHEDib/lGtLoKf
 HSOKLrp9WFLHDlr8yfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_120546_050591_7EA3B1E5 
X-CRM114-Status: GOOD (  16.15  )
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
