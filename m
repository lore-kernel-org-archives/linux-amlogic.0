Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3CBD767EE
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Dec 2025 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7wLFzSn8INb6MmpTW77YxrYhtF3iaddlTD40KJm+Ro=; b=V/UfATCshV5GD5
	pPDvP8YvSbjnyCsgF97Kol+4sIt6sjBVu8ZHq2rTPu2Qb8cfbaudyPFdseE1CxJj8GXJ9IrRqcQ3k
	+VK6hEuShoTL+fdRyXWmwvclg3bPlDccZ6BNhXqm5mjOWCVMQfRKH73//mtl3gNUypAbJKBtjSUhp
	aQQ5da7td30MGRy2nTzPs9S16i81oPKlKm7GVIW1BBtAfC9fmreM2/tjL9LV90b+cBS1iYkUvAF4H
	aFtnb4Sfh/kg5f8civUUWWsc6bLopCJVl/QJj62oVV4A3GF20hW9/ce4onJwOpsEOvpgy+AMRJmdF
	XsDzXsRAfBIAUs7kzrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYsp-0000000ACzC-0YSB;
	Fri, 19 Dec 2025 11:42:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYsl-0000000ACui-3fLX
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Dec 2025 11:42:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBXRFV4100970
	for <linux-amlogic@lists.infradead.org>; Fri, 19 Dec 2025 11:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9hvV8W0Fs1uVguUAxm1aJsUfmJwU3xS8/jxABF3lgY=; b=baVyyRmVfe9qj4sa
	pHFnT1QI9blnNeCFEOBU09p93csi463TZABWAaQSphX+XMncivwy66FwbkZaU0+Y
	I4Xn4T73pBN8ObNTB+GTaNBOsOqX6iAkRXPUf/14XVNVDXPq58JfQUHE2BWOKKSL
	4CPL4kOqBvLufXbmohZ72SvWZNI/NySIicIsk3zVfShhBWrgonVBq6y/9OhHXvmm
	N+UGWI2y78BXM679V/tboUk+GSFVKfcA9puMmdV+M/Qf8OW+oEBK797+PGZVvyi2
	hEKYdPo0Ysc0H2zSiH1beqFimry66v0UpCHbyGyKdw+3h+uwBgRvFVm4u7N8WuxQ
	Togz7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2gq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 19 Dec 2025 11:42:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so411861885a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Dec 2025 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144570; x=1766749370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9hvV8W0Fs1uVguUAxm1aJsUfmJwU3xS8/jxABF3lgY=;
        b=COkpcRLHSbU3Rwb4sCbHeYFSztl1X2QNIWxWPD5svVLdPyzms6p3DpzB/ecdM90GgY
         RUgQFEFj5T1ull3gKMSWpl2UYuDUzMTpazSFhNMgR3UworpynceU+mEIinCjBXwpo9n5
         9ZFkGMH4H+j6dqZHGWL9PZ4RGOxerxaJNg9fqYTwZiRpu3tpUKIyI/nyQAc/a1DEpfQb
         R9uRREz2Ma1zUUGU9N7AWnbVMwfiTpoz2eYs+PipD4uLqSsgfdgmnG44SfbnGg1+99fb
         qmqKjARq66g5kBWHm+zh1OxLWY8Gf2X2x3VTPFWBJ1KdgieepuVX+IfZDXKWknNO/v5b
         /8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144570; x=1766749370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K9hvV8W0Fs1uVguUAxm1aJsUfmJwU3xS8/jxABF3lgY=;
        b=l2DW+h+9EMKF1jcdyuODKuO3AkzKwZ5CKh2keULHwXzjie8BDPKQiti3bCUVGwJWz0
         tVE1/1FdUBoRu93jrAZuBgJ/nXAL8e9eDyYeaNbF7554t1E+BimftH+jItl4J1oM49kE
         p94kYEzltilWEkOS/btncwKu8RJniRlXu2oH6pvMIic8+lW1gU1OtdT0GCC5/cnjCfhY
         tqRx0+CwaXt+ZJtjZbKNhQA7fWWUXKQ1N4Nr3TmVUiBC6Ar7QDZhOEJtitonNkWC33W6
         twTsjCw3yMyF2sSyxPNvIVu9yUlaqgSEgmS39OTgLRwG1TgK2Nw/5cKTYjehXwfVcQFo
         LFvA==
X-Forwarded-Encrypted: i=1; AJvYcCUXgRP0NQ0HUVb+MPf/yo4IhjYROyYvmL02guZZclFuALp3Jr0zCgqwahWN7lurAv0gYgxVfGDVeBnicb8M@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3SYcmDJjytpYoRYo56zv2eGCbvJKa+m1APNUD0t0UvjVDHdKF
	U4P/2Qzh4U3JK9nnjGry5sToY7G76pqrYNvCBc7o4NdZTovam3en8i/7NtF8AlpoWUwglSRLtcO
	j2V0r9+E5EjqK31E3in9V2PZ4/UVyd0Qo6ctq2mqARxuKFOsb91uximdvBaWzOHANengPc7thSw
	==
X-Gm-Gg: AY/fxX6UGLcnoi1mvGI5Gtqv1OcGSBbCnc03MWIuPhdmNlKecSvaWOQaCUpbwzFcCn9
	jCLjtnl0BCVv4eMIHvsymh5EWGsrm/JlRafI7RKmOZUdU6MxqpQgH4mHzpA44hTGt8QI7vOozT8
	Qt0ulDSb8Taa4G04ukQUJWj92Ozl1ilL9oJ/ca3qZKh6ENESzMWkfVeLgZCieHdx5m0GPS6RhEG
	x+8Z1fQnmAO5kAY5FVMumakyqF41C0JNDA2CofKInKAtCWcCOyFqflmGIZEPIetyDWiRXiXrRDA
	VTxAkZS0W6qUTAK88bw6e+RJm5rQou8KP5b0++/6r58bfxloeqZJ/LEGjorjTESyqNyCIcnFZDu
	uolGuMxGbnttcq5mAfq3yjjlUhPYDMuE5E6gr1Vk=
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id d75a77b69052e-4f4abde3e12mr32877611cf.76.1766144570058;
        Fri, 19 Dec 2025 03:42:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECiVptxgXjkIKJmiC4JmYWvSqGKkOWSJZ9Q21CIYcj007Vfa/jr3CTRomRkZ9N2QHy8fFZnA==
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id d75a77b69052e-4f4abde3e12mr32877161cf.76.1766144569549;
        Fri, 19 Dec 2025 03:42:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:17 +0100
Subject: [PATCH v6 2/7] net: stmmac: qcom-ethqos: use generic device
 properties
MIME-Version: 1.0
Message-Id: <20251219-qcom-sa8255p-emac-v6-2-487f1082461e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=knjXZj6R/hueaGnR6/EXXoMJkQxuh7Sk2qPaMWFoa38=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpRToqOS8oyUwzdZ6bFwCOj8uhGQOQzcwFVxmQ3
 nVgvnnvtpCJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6KgAKCRAFnS7L/zaE
 w91BD/Y+GeL1VbPY7IpcOD77EGxUIV7J9nZjHIfpW/lrdgeZuAYZCJoFR8yeKeZNZm+sC7Pf3WG
 DWsngV3W6tkRAbNKdIhbE+SwFne8d/w+C2SbN/tFi7w9galITpYTIo86czSnZRxJFGw/eHAa2j3
 estndX0VbgY+KAY37zDxHrDSmaI3rHv+nXx8YWLL+hL0ZWrK2qNNBb5q+m4vg42btlEt+9009Te
 4dx2Zfj7sH2I9+Q19A64leq0U9B9YekTPUDlhDfJ6E09jx5FM1csMFiaik0chB6DtiQ1/+mg6X+
 Hl9UB2Ihg93Smwu/8qJfKhL/4CQynSGGdzO6MTZJ0CBfyEkdR12eIzT20VNQ0Hv4aa6bktCbIiV
 bf5tMHkgVGpGNGx92Shhsd0IR5KTANJlOAxIw6BYqLepW8xFZStepSwM+gl02XYUjtWnbkgnQMe
 kZGEJbKYUnK+xRKz66PmMd+FEG5PBO/AasDrchuQYEAqxg8+GThb83raYr8aPfTjpEtxqcUvyRV
 k7qPoi7ufE/94WUtbC6VC8oXOO5np41VDm0Dq11txOLEHQUVidpxRkH7Fg61mG/qW4LIWpUNUqx
 Wm1v7aok+LcMIRPnPokWeXU+V8m1JdsjneNGv31WchSnoyXsDBwiVevbXHuv4+2C2UQ3pHXT4Fx
 Djn1tdjEHMc+S
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX6r3wcwdsCV8j
 qJMiBPPUjILe+8iSzBo/jM01NsmbDX27iHcRJBnO6mTfFDydXBsEFkP6RVz42DPFp06NrzytyFe
 bpzuuy3CukqnaXhJie21swnGKE6gC06G8Ez15G9X6vVe9rYnG8c3bQBUFbPXe5jW1YHHXsRltqj
 PoX+H8ybjxaOYEXn4P2V3ShvfL5waA0WrdlgTGQ1s4UfHb6ht8Ni6HxszxCx4UZ9BdHXcY3SxKF
 vF2eTCn+8BGF+XleDjjiqc/1sYJN1GooYB2hLtALJq+CUJHWZuKPj/6EG05k61UzYGZ4YtTVwVG
 hDMOGiJD7SvoSUOHa6n6GW6ykV7QX9hkw5sMd/QaQHGN/gieyk7Rn8rCpE4/ml2B7TZ2oQ6wNq1
 EJ4b48ht9T7qhtVQvQv+/NHeNIzh5vwDHU49RYXFmy6viyVjoTEqrpkfO1+6L9bBEW3ay44X7CP
 6wfRNPEKTV2V+iK7RIg==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453a3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aGGWjMbO5e2og8PNdkwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lzPQ3aqRd-9dpC54UrsFJvkKIeAcyiAX
X-Proofpoint-GUID: lzPQ3aqRd-9dpC54UrsFJvkKIeAcyiAX
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
X-CRM114-CacheID: sfid-20251219_034252_003968_2E3C0279 
X-CRM114-Status: GOOD (  17.44  )
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
index 907fe2e927f0..1310312e3e09 100644
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
index 0826a7bd32ff..457748e57812 100644
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
@@ -723,7 +723,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -774,7 +773,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -811,9 +810,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
