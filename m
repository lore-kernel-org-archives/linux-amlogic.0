Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476FAC43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+n0+2u4RlQPe96UKDXo36BUSNYJbzy5nB6wXdDaaYc=; b=KDizGtOAnub3q1
	invH9xUcCd12DlhBF4sKO3hEnUFP0OvknSd7OkWOr6bOCs8Gbo28vQKWdz+zxlEChVbpHaktd3pvg
	29Tl/RWTrx5BHtJLDV4dXkIrBkqgvM+HiGX1l2/AzkPyuDE0dUYqr7//s/lYOvj5e8OMuc4mjPloc
	/dTkBCTuenBMOJ9clHomJTM0M6XhdKsjXDNQbimi9aROnfG6rNaecwfifNcpa2OIxjEDaEVOQy20A
	kjZg26mk4te4zkiVamcv+duYuFxT8Le/H6rhnRPb5Y0rS4+0tTTtKUJ3WFOY1HBlkoXIPySMsvNSi
	cUC+sUFhB0V1UYfiYW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFb-0000000CYbr-2NUX;
	Mon, 06 Jul 2026 13:20:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFY-0000000CYZD-17Zr
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 13:20:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxD6A361301
	for <linux-amlogic@lists.infradead.org>; Mon, 6 Jul 2026 13:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S+/dKj/4QSkaC6Y1b0yb4O
	abzlICyIBStrbgJ+vgezg=; b=JGdIn+mSzwbuvFvd3FIrakLHr6yq9g3AK3u3t4
	dt5ddD9yRCYCF9fvCcetIJpc0+BbCncAkFqjHqJedvaabYzHnHWzhnafFUOPEYZJ
	l9JOi6zOiwdjZklD1fWP9n3QVrpSaVWOtq/DWZwGEmcDKM3fRriQAsRM66axz2Gg
	TqdD72zv7R+ApRwvcix0LJKjCQF3pNXNWYQ9o1XXJJVDTOYb74r5Gvp55l9HJxI8
	fSCRmc6iRWhM3f+halyEgjR6bTMRjs3tfZYyDtaGOaZdgo4bnqSLil3Omx+iVMeO
	YuMkcCqUC7+2DGmCoaMHWDfps1AMhD/Zhk3iprmmJr6+Sy8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h5174r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 13:20:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so505529385a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344038; x=1783948838; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
        b=jPwcJw0S5o8ErBvmJYHaQ808J0+VqTW5mrXGJiGO70j79Z76T4B1CxJ+f/mq6CSey8
         Beb2d5nqwIx86OTK5lFDjeBvvItvprynVKD4+RSo4wzFHqVyegeua534fDgYdZ1FPy29
         sr4or6w0GgWK67jSnPW4MAst1imJ2l6V5hkLxvvke8eX9FzKyCvTMMKoJ5+q7MCBR43V
         s18hwDgTBE9h5T4/233wPZtCjsuT+J3CCrCEw2bxRavP9suivsz7G4BaVBSpiKxtKyXr
         FpIu8Zp8e7Q5diXUVlsfL9OjTBRAEk3DX6cTHYmCoScoaQVc8gcQjtie0mkt/vICHZeg
         HDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344038; x=1783948838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
        b=mQB9ASMhIbIn0JOnEeT5nnddQdpXtxgNuClmEmCOlQwZC21YMZn66t9IXE9c6uUcCA
         TwKEwAhCY9izxMSBwLo6rYVTzYuOMoA5K0yy3rK4a33W7TIcTYxbq/1vrGC9s/Jh6Iuk
         D6eJ7h3rUpo/ukMbwnG8cqSGNsuwvCVnR03ekl1rydCqM4D95V96w3fqRfZ2+67MNVYn
         I+zBDlN0MIkriwZ37duhL2TyEMjLf5IQe/w8r878I2BPIBjIw6oyRC/ATdPehR1U4704
         NtahUnzH9Mm/W2Dcz6O8W1kBZndSoSv0Swf4EMefU1S5Nd0SS6QLM+aEAGpkQCT02F6j
         k8vg==
X-Forwarded-Encrypted: i=1; AHgh+Roy7gaR3yoBJnJ4B5d/RhtPHljRafdn3MKeYmjKpREs3dWL4HrUTtsoE4YHmLtijPXue4L7EY3yekM8p/Ua@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/kf2lgYCWNpKGy9XXInqe2Ge6/3nmuPnypH1SUMJQ/okEItT
	HLlDaaU1GkE4hh0bavp/GdCO+uZJ/sLB8XnCQ1v63iNuBOX5WSEQSP99C4e8RJhYy20XtSLLSaX
	XKoQV0cdlQbic3/PMiqI5DFkFx7O1Mk9OKMny2IrbVp6uxhVU7SQokIbfG8oHTFs4nARJP+6h8w
	==
X-Gm-Gg: AfdE7cnPWIf/B1uja6OhiiG6QLAksgl0Ocm4wrLKnrsHCVJghIZ4Doeiy5Lt/XSO5kR
	1p+t0jU8vx0l2jrOAWtmppmMe3aBvbUZVqHrq7clEZ5FI6l2hkzvtWc3H9RcIVQQmKiIQEyhhJp
	ledFCJiDv9JttsNSUzXy9gLhcCsctrZHvzwTw9HAUqEL33g3kpcfUS3sTQ6zFF80hcfU/cpQh5d
	lGLJq6vtwbfykJf3T7YlgaNJi75wA4x2wrp96vrnz4VXpc6GBZUi5MweFNs0YfoZnAWgkB8KJYk
	XxomUj/O72Be26KCp6eqb7vtFpQyCj/VNnXZqTk9+gwtflrCMFqwLD7cF9+Oxbj9VhADKJAgShD
	SWRssyRHLbaYjP56L89I2e2I8QiZIm1CjR8qfjlmz
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id af79cd13be357-92ebb55e04amr64068885a.34.1783344038154;
        Mon, 06 Jul 2026 06:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id af79cd13be357-92ebb55e04amr64060785a.34.1783344037495;
        Mon, 06 Jul 2026 06:20:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 06 Jul 2026 15:20:15 +0200
Message-Id: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJCrS2oC/3XSwW7DIAwA0F+pOC+VbcDATv2PaQdIoI20Jm3SR
 Z2q/vtopK2RSi5IYHjY4JsY49DGUbxvbmKIUzu2fZcnSG8bUR98t49V2+QFQUAaDKjqXPfHavS
 WtD5V8ejryioGktrXGknkc6chpvY6ox+ii5eqi9eL+MyRQzte+uFnvm3COT67DqHgTlhBJckbV
 yeMzHb31XZ+6Lf9sJ+5Sf4TCGRKhMyE0YZNcCTBhxdCPQksVjepTCTDzADW1NG/EHpJFLPQmQB
 sZJTeJ2lfC+EnQehKBGdCWZMQLCnGuOvHcXv+9l9563Gbh8fLZ4ABkdYAy142KpBvrHwF5kzMX
 yYMErgEmQw1GQKU4FQwK5BdQIglyGZIWyIT8v8C2hXILaFiRi5DtbZOqmg4JVqBEBYSyWLHwaN
 fnAQKJK1HXqPwSTEVPwwf3YvBpOB00Jhcgbrf778j1CUzggMAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4nzs6Q+Vb/dz3RA3Qk8xYysKrUAYteRCb53IwmKpR0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uWhtNuvAg/7TbC2mCPqok9Ose0SbrE4DJGN
 YmzDZncOMmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurlgAKCRAFnS7L/zaE
 w4uZD/492fkF9KRUF+LhghAa5/B6yl9bIZPy2zmr+NuB1+uJHaG8Hm7kMRTPkhlNyJSB/uNjOyJ
 3rx9WO2dctD2xiQZk2pvLGnQin3nhR8o8cdlI6jzfZU5Nty5YuxTWH+WSqDy8q4YHPLJkW5WrJ/
 cEg8EZ8ZXm91TLT5VPIbq6iUtnTH8sySH/S6i/SB7TOlIeHUkUd7ksKug0gi8UQkmTFR+dNjdUS
 hlMEDyDza6mI51NADNs779EiBIhvvCDTHiOufvj/I3R+f+aswn7ia8ZmBCt6fu8VNVS8VpiMc8O
 qtLik7F9rCndGqr15FPOyH52xLeub9y0ctVr0AA8S4jaKxSIQA3F7tp1jcoLdRLAOck6IOnLm6u
 nOGOFVyHF8GIacisPRWGV4C/tRFDWrkD3EjexAq7l9PfRjz55yyQ1R6w+h5v/syxebW4+llB1ET
 c2IzGDiX1vjnqUp772AHLsVpKfAlm7xlZQMfsCyDi0qwXa0Zs94ts7Mvrpz39Zns98kZSC2b6jm
 Alitu/+XYQnjlosxKtc7ZVaV89r0cMYnPF9lHDa+QOIF4s7cSiSQXFjbz10LFMsDgJWQUO1FSsw
 D/AHRgWBdv6SFHNx1NhhkX6Btid9yv9yzDw3OQraxBv4lnjW+ta7AYdKNXZKGbmmaC734+7tNNO
 xGyF3acpcNwjnag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: O2fe-0MkQosPRs47Po38mHTkA6093sMN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX5WF3GQdooHJd
 6sXep8wphgqUA0vpet+ldfQN0/+toebrog83T/riI3HpsnAG0vUxctXzVJ0LJ+MWRhHR5hwEbD2
 VchVGFql95P1IRJjr2D17ZkQcu4oPU4=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4baba7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX4gW2RYTKGf33
 t+dc8ZKzb6ctUvvkrH3bkXsEuDkXRkG94HomSlghIwYTvQiDwmdqtoOwoz07437TJ8mCFj54Nvk
 osu66AOljQAWNXk/lITHLuO3WMDgy241ODHr7RCp6OV1ww1zkXcbQVAksrLtiC+sCfh27eIUzGK
 pw5Pbd0LBEwbcfMuIExmbJ91ZWYaE1DUN1KkXK4pRZYTiQhFSrvhVzQPAORaPhHoz97g0SoftUZ
 MExCc0OCA3NHSOLhg3Jb9OsHIROkm+u62Hn3W3phWdwpHfVmZT7t8OhGLrPz2Q+XiKWWyvGc407
 U94PZpaLt8o6oCzEtfSzuTgyUDvAxAQDBobjb96NPcLE2q9ZTV4GiWWgZ2W1Wkqly6TKqEPRPAG
 Lkt8ibyyAVscT8vLQcFEHmKu+mDUJpIT+aUFNB+qXuChVKh5NgtpURwfv2jt7vLeTArqQRH4mq+
 68Ond5SiAupwDEdilnA==
X-Proofpoint-ORIG-GUID: O2fe-0MkQosPRs47Po38mHTkA6093sMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062040_462168_93F9C9AA 
X-CRM114-Status: GOOD (  17.31  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 ++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 230 ++++++++++++++++-----
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 161 +++++++++++++++
 29 files changed, 573 insertions(+), 56 deletions(-)
---
base-commit: ca70e9a43a66435fda3a9d37f90c9c3b7bf211f6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
