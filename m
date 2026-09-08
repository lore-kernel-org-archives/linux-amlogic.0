Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A9AC79F82
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lnIJkmZvxOaAmG2ZunSfZkDIdK6l+pJufURmR4fIog=; b=XOuayK7cV+yzei
	utH+iF1XqmohXfvurihC28WsHJ50Ei/GrUgQksALTydRAQhVvdZrHzQN5mVETfW6OcWKkjzkfoHGZ
	RYFV8dc24oYVAz52bY62/MBeZJFBh5boPFfiGDCv1bumOWJBV1JLKTe/lQjTbPbUCH00DNZYhA77i
	m5Ts9ZeZZqeUnbz8K8s4QcGqoYj8CdqVPqjCrQxQyGtb7vQUPz2U6+Mxh5ry2MJnDXcBW7fok68Vk
	lHYQYf1sEp66cfJ9WMqckXWSKZ0mYdYAHeXGtBWCy3XEb1Lo6G/a74rwDh5J1O1o4pqK8eiW5/F1z
	Lz8saZXr60QpDIFx52Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xHd-00000009MuC-1lgm;
	Tue, 08 Sep 2026 14:58:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xH9-00000009MOy-02Kr
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 14:58:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej3Lq3275676
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Sep 2026 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=; b=UrNdHwA16moFMjxf
	fJMD7pH4j0/lZ0U+AgJVseFdFW4hLsnlOMdoR8Iobss+OloYgzBNeMoBUZOMDjYS
	N56805fokNTB/bpnz8TJv9pQUhiYoRKNrzkNbjhkMUE3qLMTtgHjLQ5vAXizYydr
	IW/DH8y6a4dQq/Gg6Gw/YclNkuv6eaPdQ13pKuChIJQc1QRqm63HT9ZKlIl2/y4W
	Y/mQht2pu4kkJy3loTphjQF0/1HdO0BBpfPMnzOS4xSIU9jNccw4s3zO7R0Iz8Pj
	w98506pIY5mq3j/8EmKgnocSZ/is7sS39+oSAnfkAZhy2MbHIXmzuFHKCPXbaH4p
	5diaRg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwm4gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 14:58:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980989f5030so2839463241.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879497; x=1789484297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=;
        b=PasbNqAyYt7SiUbQ8uYFb795FGotYoif73nmmB+ZT6cdYO0Grc0XwAfiu4SoRFrQI6
         lGt/88+ZtdKj6e9hQues52vqzfBQNgHCAQYUMdX0tpQDMK3l2Qxj4la5aE3Mri6nIN6B
         NF8mMxE8jEzF9Y78irsA4URuSqo0BrHQeKlHB1bEuqXtOr7EJpzMa/QYu6l3Y54Tpep+
         8ZXNjuIrqoBX/b/ldgZsaWYsnNAFJ6+6aLX7f8lr+RSkFg0/y/Mv1HWS9AwDaj6tMNvz
         TmqMaOCJckP/EEqywN4tNsjWDr8yJFXC2PmHIvTwLBO0XYivedXrn1Bqi4IfuwVQSd32
         04RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879497; x=1789484297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=;
        b=p+GE0cgHn6Xh/EoXC1X1ONx9KdTb9NYuFy8bzpx4hfZTb3DPLkH9enZN8GV46FxNjw
         KFWzhTVy0DJAq/S6W0xXUoZaLMTrDJ/mRypCu26kcbLkr9I2HJcC8u/wFHRl62bFk7Qe
         0asD1XKTfUNBs/LPENAIQVFuhn/higxGFA6L/rP0U67wWw1EZtNCVZkkhSH513mEisGh
         4/RdADfWQE8Oo+LBGBcBRsQw8lLWOMw3ZisBq/t1e+6t9pdBQT+BXdOGX64HT/uIQ7Cg
         T72clb2kQcHgLeG36wXvZcQc3DCUm7Nam48EUzKXtdNQJrHjjXsCPq7lpE4/c4sLTCVi
         uZHg==
X-Forwarded-Encrypted: i=1; AKwUvBzE7agPTJypQR1yLTaCo1Sab50SJ0Q+8HNyjS+KYCJyr6WNrPAONKOMmuyYceNYw955FqLLZYz4aF00kuH+@lists.infradead.org
X-Gm-Message-State: AFuF++mIrz8SUrl5hZZrM+KM/jh8G1NSra+WFSPUV7OTz2Lg3uKFzdqz
	fwVad3PAZqLRTxgzxnzn5WEQgF9mVsADmCglO/lMNeY1nU7+jZ5E+7ytx7UbRe2zj75OWQL36Hi
	n6nnRkS5KC37wwlfbb+5gV9tA/Oj9F9cOKxUqoShgNkzROGBNzbA9VLqqi9v8fwYYJKo4Cr+isw
	==
X-Gm-Gg: AYBFou3JicfEtKLPaYdHCsfgVuQYbAo/ZwxuYjUkKr6/9yuQ2edg3DiEKJsFJCDWcaS
	WbMXhPCdsmjm7Ol6/7obA1f92UrOzbN2oQyp2wvyKMPHG7hWoH6HjvkTl1P2pN9mGbn6zoaDJWC
	HWAWGShL3nZglyUMb0545Qt2PslCdULx2KBTmUu6yB+lvEmJXpjzEx8q9aPZ0H5HzsEmNKnF08t
	eO45kcv06rrO1t3UUONPiM620D/mBRUCxBdf1icWLGBGGVpS4J7RAL36IyGqKpwPSWOvgU9W79a
	btJa05Uqs0Kzww7MIPdAGRbfNAsDIqzYFYv5jpY0KZDSZ7ansaPXFc++siJm5W0p6EZVHJYFYIE
	CWhUhgcKb7G+eBHhuCUyxfQ6Cnrt+
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr14116051137.3.1788879497213;
        Tue, 08 Sep 2026 07:58:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr14115998137.3.1788879496786;
        Tue, 08 Sep 2026 07:58:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:25 +0200
Subject: [PATCH net-next v14 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
MIME-Version: 1.0
Message-Id: <20260908-qcom-sa8255p-emac-v14-6-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DLq5kJ6GnQDKhq8FVuX32328SGe67zNr4t3N9JmNPY4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJs9HybHaSqzBfK2Veao8xyX8UXTlPcezcbj
 QlPlyhTxkiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibAAKCRAFnS7L/zaE
 w1v+D/9iBpy/Ln8FSiJNFaOgPkx7WGqGjICkj3LljoYYONiLgB2AbbniiS/o11WhO6qaA3KlYCy
 5LpbCtIpTVc8+Hr/pdu+wDKOYKMU1x3Co7RJPcQDRTDBXbAn3UOdmYo48WkNu3mDMU4Dkd3bbw5
 K45RxGgRtI80+uqgWHFtKkKHnUi/KtbJH+4tT+bTmk0bhPQ7fqcgh/q+Pg9ijh4Zmfh6yyOwq7U
 TY6rIOEV6WalGxA0WrT7qNqvvIV4jB42F1qdYuSD4ce3AGZ9iemrKyl7qTE5LfOEMezpQ6lEr5P
 5RRxrJOOFtAHSKMf7H+8q039bFTIzhHKyG2hin3YL0duAYz55SGcBdfcPLxdfPga7JS04y2xkr5
 /04dhHN+1c65cwArcgWGGuCapxI2hvyEJdJEUg0Ny0+ezM3BvVFt8KW4xAa4rcO+mRjvvTFEfhT
 wwRHE77XpXq8zpL4yzW4wHiT023lGqHKQaBfqtJOzpD56dgQlZYX8zIZ/XVnz80DVKdb0VuJ6TI
 Tjtej0zBwwzi2noJhR4vy8malCbdiMtieCLlMibgq/nXB9FCnsQjTIIIn2oZI3uZfPtT8hn2TsF
 ASBniHYS1DB52vO23N8V8cd3Idv3x+i7LCDlX/FL99+cCvn8L/PVicsv9qc7QKgIiy2f2JaIrej
 lGHVVieGgj1UMyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6aa02289 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX0YTIzJFbnoW0
 oMAqlRfiFASWOLL9PmrHhkkSMwHJeiy4XLFxS1lQG1NpRGcQM42LtPxLAempDCnF9Cre/dDc67v
 qgr0SXE7pJQu4eOxdI1SCjlyPtFiXLU9SlOYHEatBSsbxynQbpKCH6AvJk6u4eZRnnTVuMERAle
 ay0tD+QhBO5EyxNfxhE4Ng4cbmSAWCQT8p3wz/8N76WQNoBJ8tq00GlDrnPv16dBIrIb37XTBKk
 3rh0lwg7fFOqCK2vpljD31/iC+/ISMdMkM3JxcwrgpLk1i8wdDldIaBhAm8p8RVCmelGZazN09P
 lDu59zaYRHH34UkK78A7jgg6fOCi/hpykK0CN1Uk83xLP+RPMhlU+uhjc2PbFpJBBX2IhrlxQZp
 OEk3+rnUVJl3W70Qr4T3xwNZhiG9mAi223GUtP/kOU6iTjVzHxBGShxN0jfFbXt0ZEpDYpM8ubH
 Wuy2dC/qSsOsWEHWCtA==
X-Proofpoint-ORIG-GUID: ilNNd4-6B5PSLN5r_LLB4yOJqNp5PGEC
X-Proofpoint-GUID: ilNNd4-6B5PSLN5r_LLB4yOJqNp5PGEC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX3DV1Q1jpPl7T
 r6y0mq/8MYoFuTI9se1zFaNXDlWPOzW7XNH7gHUStX61uzUnAPgMXQ4GfOjKiCeEV2YEQ/wrcc6
 nW885kS7OrkH0X8bl8IVb1LTnJWbbWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075820_592423_8C18A295 
X-CRM114-Status: GOOD (  17.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ZXRocW9zLT5waHlfbW9kZSBpcyByZWFkIGJ5IHNlcmRlc19wb3dlcnVwKCkgYW5kCnFjb21fZXRo
cW9zX3NldF9zZ21paV9sb29wYmFjaygpIHRvIGNvbmZpZ3VyZSB0aGUgU2VyRGVzIGFuZCBpdHMK
d3JhcHBlciBmb3IgdGhlIGNvcnJlY3QgaW50ZXJmYWNlLiBJdCBpcyBzZXQgb25jZSBhdCBwcm9i
ZSBmcm9tIHRoZSBEVApwaHktbW9kZSBwcm9wZXJ0eSBhbmQgbmV2ZXIgdXBkYXRlZC4KCnBoeWxp
bmsgcmVzb2x2ZXMgdGhlIGFjdHVhbCBydW50aW1lIGludGVyZmFjZSBhbmQgcGFzc2VzIGl0IHRv
IHRoZQptYWNfZmluaXNoKCkgY2FsbGJhY2suIE9uIHBsYXRmb3JtcyB0aGF0IG9ubHkgZXZlciBv
cGVyYXRlIGF0IG9uZSBzcGVlZAp0aGVzZSB0d28gdmFsdWVzIGFyZSBhbHdheXMgdGhlIHNhbWUs
IGJ1dCB3aGVuIHRoZSBpbnRlcmZhY2UgY2hhbmdlcwphdCBydW50aW1lIC0gZm9yIGV4YW1wbGUg
c3dpdGNoaW5nIGJldHdlZW4gU0dNSUkgYW5kIDI1MDBCQVNFLVgg4oCUIHRoZQpzdG9yZWQgdmFs
dWUgYmVjb21lcyBzdGFsZS4gVGhlIG5leHQgc2VyZGVzX3Bvd2VydXAoKSBjYWxsLCBvbgphIHN1
YnNlcXVlbnQgbGluayBjeWNsZSwgdGhlbiByZWluaXRpYWxpc2VzIHRoZSBTZXJEZXMgdG8gdGhl
IHdyb25nIG1vZGUuCgpVcGRhdGUgZXRocW9zLT5waHlfbW9kZSBmcm9tIHRoZSBpbnRlcmZhY2Ug
YXJndW1lbnQgaW4KZXRocW9zX21hY19maW5pc2hfc2VyZGVzKCkgc28gdGhhdCBpdCBhbHdheXMg
cmVmbGVjdHMgdGhlIGxhc3QKcmVzb2x2ZWQgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPgot
LS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFv
cy5jCmluZGV4IDQ3YjcwYjVlNzA2ZjIyMWMwMWYxYzBhZTNiMWFjYWZhZTY2NDExNjUuLmZkNzQx
NGE1MGViNGU3ZDRkNWFkYWQ3ZTkzZDQ5YTU1NTAwYzdmMzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwpAQCAt
NjM0LDYgKzYzNCwxMiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdiwKIAogCXFjb21fZXRocW9zX3NldF9zZ21p
aV9sb29wYmFjayhldGhxb3MsIGZhbHNlKTsKIAorCS8qIFRoZSBpbnRlcmZhY2UgbW9kZSBpcyBv
bmx5IGtub3duIG9uY2UgcGh5bGluayBoYXMgcmVzb2x2ZWQgaXQgYW5kCisJICogbWF5IGNoYW5n
ZSBhdCBydW50aW1lLCBzbyBrZWVwIGl0IGluIHN5bmMgZm9yIGxhdGVyCisJICogc2VyZGVzX3Bv
d2VydXAoKS9zZXJkZXNfcG93ZXJkb3duKCkgY2FsbHMuCisJICovCisJZXRocW9zLT5waHlfbW9k
ZSA9IGludGVyZmFjZTsKKwogCWlmIChpbnRlcmZhY2UgPT0gUEhZX0lOVEVSRkFDRV9NT0RFX1NH
TUlJIHx8CiAJICAgIGludGVyZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVfMjUwMEJBU0VYKQog
CQlyZXQgPSBwaHlfc2V0X21vZGVfZXh0KGV0aHFvcy0+c2VyZGVzX3BoeSwgUEhZX01PREVfRVRI
RVJORVQsCgotLSAKMi40Ny4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
