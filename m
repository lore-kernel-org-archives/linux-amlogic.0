Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDBAC44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWYlm0xIabvs/1urQcUCZowdK1L6ziAn4INlEd3NYC4=; b=4qvnUO+k/hBde5
	ANe+LbsPhyxSXtOqgBQFWvs67FIAKeZLD+bT/HI9HEGkuKfxx6LFK7lGfYSZoFwr6SOI1HziP5gEy
	LV6ayw3JPZwbncOwl+jQlim/XEJkjjPb6WWGZdfRyJvf1UHaVdt8g5lIaGsQiPrCZNUpH0AgRHGRW
	n6Dhwe3MItUP9ls5oIw5Mkx/gAwJcyj94Syky9JzAPPenxRVrl11E1CdRWRsIf8az3djQgmqL6yMG
	OyULUTnt9EtkV7mXAvdI1TxN2kd0stH1uV4d5TsfH80XLXZTzPgsTRi0H+JgslPqTTlNWYUIlU7AY
	yPjy1sFcZILVIEydnAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbM-00000009MzQ-09tF;
	Mon, 13 Jul 2026 13:21:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbC-00000009Mju-49LS
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE4q31561473
	for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=LuHB2LndYAhekP/j
	qqI6yQ1IIvHllU+v/KZAuCsz8E37eSBJ/bOgI8R9w1HloRsQVR/lusbYFphVuRQM
	ncaLznaaOZ+jeHtIqKrsrzK5JCqgTsSRyhCO9cXFZgwr9o6k33sw7mmJQNrb8F7R
	EC4ky7JImgq3CLSrmd3sZh6HesP8U9IIKPPhXIVLimSmDCbIAaSlKexL3PW2Gt1C
	hNXMwOBmK4v7ZEV+ILuRuT4iStzoti5NGJ4uK+4650V8aLn42qktRa1uUbwOZImt
	XTpbLooToXh5GCa7hlWSVWrwLEgxHPy75kUR40ZOGYkjWYalZ4Im/4G8MWbtq+ES
	FVA8Ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3apcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 13:21:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso30889951cf.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948889; x=1784553689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=E13itL0l+9lkkD1FqccmgUCHygvmPE1dzl6F6rsrKU1vevcNLasgbX+q+foMIGubXe
         DFChxt5N++5Y+6Iav+50Th5//hkZGqRAEox7q7PPPHXc2E8zOnYw01Kxcgkr+liOpxO2
         PbI34l7DCCF6kZjBTLHQ+S9cJKqXmjRb+KBP0dtTKnFUSmW/Mxems7gv2Z/NWmfqWSGb
         d8jlIB0amRQPUmnKCqI+TcRy/S2GvB303mS8U/jrFkoScb+0kXp4/0ATXkvRwzr4NWzl
         r3meV96PnqXi1JhomXOk2hSssXyH3UNtRE7aKgTXpQ5lAjh10KMjWuMjQ7Cdr/sd5uIw
         /czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948889; x=1784553689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=GNL3wF+DVa3USYMZINEoYW/KTdDsuIvx4e5F/F8r0BcUIg933rsTuN52m85s8j0BIZ
         uAgSabs84rZeUuRnJTD4UG6lGzwbPtkIfEyth4OxWlijmUgeq7588EhylXDbgjxU/qDV
         0axNFnnxsGJUrFn0x5naoDo7b1Ty5KA5TfWQLbSf0c1GfvwcCOasZkMacN9Qj7b20M1c
         d9Dk+v6ceCCY4kJa+h9z6S6O5YdoKlDq3eKQUqAG0hD1WgmlcZv2wD4EHgwuB7wtFsET
         pwJHhIgd/eRG8ozpz5WNGac2qTQuVCZlKBHQjocW3thaw8Pv4y88KvcIGC/WPs0rxm/0
         071Q==
X-Forwarded-Encrypted: i=1; AHgh+RpKd4ppsnms4q+ANydK3LYsySNakaulUsT5f0x5CTV46h30LhS4C8Nv/xcaqFaTltdM2J2zT3GKSMVNFrBs@lists.infradead.org
X-Gm-Message-State: AOJu0YzO77tJnU0ex+T41ZSKRS7mesRMEsnBiA+derTDXDIsoMOIOMUH
	9hmP+3MN3ktVsKPSXNQZ6srGaoo6DKk1wACb84d+76ismdfyutrotoq6Hbevl9E7/TUE4k77f7f
	f7x3/rkeEy0EmGTQGlQ5fGdAkjgv28VLfLH3VANw3eCb+NpsXQEqRUfR/CPxX1iGVWt+k4KAbWw
	==
X-Gm-Gg: AfdE7cmLIz4RQ0Gv4pMbeK3D4A7X3vIkvlksYeFsW0DCqIgbsYjAhDkjIHlVAYWtWto
	/hPjha8iSNKDsITWc16gzfaVyCvxHLjVU2wInetxsQ7sBQkeImLwoguxRxA8dr/DFw2+oh0zKTE
	8NKU0No9sYY7htzrBhpJoAmQpkrIjmSAuMK3QGF0JX6wiDk3lwDpqhJQ292lzeMwlshaKjf2oJM
	kmCX3jZvCMzy38Da8ifrDKGQ6xZzIq6XE68JGA/33otfJ08nkPgPrDTmLlTlRbAdITSM74o3tmh
	2Ihdu9RCwFsobT3cxOD5JdJnXSWtpfSq7hi79XFFMM5QwBEqD9h7UufZO2EbEFtYTbOMq5hMSNx
	dp4ZMRXcKx0cgj1QwLuSvzaFEvjEicGPjLwyzV9X3
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141764191cf.19.1783948889494;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141763741cf.19.1783948889084;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:35 +0200
Subject: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY5/+vs2/qf6ixq4/oND2Zx6UG66WUho2k1N
 BESE3IZZ9yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOQAKCRAFnS7L/zaE
 w287D/9ZdNDg6JWXdurG/2dzivQeLaVo/7EtsCSyerxef3uIlCFZXmkGtM9e5iwQwgajmvVUCn3
 JTuk3xBjg+Z1rKC1kB/R3MjBD8PhEW+E+xtyv0ZfJ0dLazOINtSW3GAlW8X8jCLTZTcdvwEFdzY
 KIC9IY/wiiZ8QSRR+AhHjb5oF9P7v6JqeoqmJjeOZtJfRdnWMv3WpoIwpkP7GEtoICT4ADSsMVw
 dZ7DKd/klrXJmNHOgxtCE3Sa/tiWHW37EyzPjzFDFIJcWktXMWkFucKsCab66xmA8dxOPc8oZCa
 J1xm+gim/rKwzek+BM1739EJ5i9AauUDha1WT5QrTL9P5+3SvZ4zNLwhomOEKkLoZghbp6Pbepc
 XYhKBRQQM4vu1cZJi7F5bb9E4ACR+buWVjXcCeDZANXlHHtlPmOHekz+wJ3Ua1YStpgBkEAzKk2
 dFiek2jbRDX7KFBUTDPBTBIRkqzc+Y7sXl/CwPYbMw8Afeddl8kY4dpRvzG29iFvQmjSVwHcAbe
 Lgkz6aIJy20PcDerwJKefrtBj6Uri6D3O1qhz/Z+7KvVbnD2CZq6zoC940lmSPJUt47jeAh1VDn
 Uu5E/R4SosFE1DGpvef7KgKjGkKrEm7yAWoep/YaYStb2OwTec/khkzbk+W6+0EYIeUbC+syBv2
 3gGFk01Yg1NAiWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX8dl1kOcyt0VL
 Nfpq5KVDG2UDxXIGgvd7QbIQhCW5uWKQe0sP9FE3SmPtatj7aZfROBzJGOqZxv0yZE2C5SM33l2
 k8ASjoFXvDusXdeSQbzYHn9UWpVS79qjQA8qd+i8LTzuI0ROqpoaT0mPtDWIcBOxMOJQUSjIE9D
 uyrkth0vOapZW7aRiBe8gZW5n8OGUDAad5S2ue4rSAL2pdEkTD1z6hvQHc1X0IM8q8JdjpQRzGf
 4A04LBO52NkOQ6mghudMtFN35/LHbzfN6HgqX6U8oPQJojAkLCNfheHzmTquDASwuMxlFtCb0Pt
 vADXVZJdeWxjYvsZi7TU4g44Ky18B1p2rBjbVpWX6Vl/LXIUsVrLB3pRhqgnTbrp2C2EdCPmPWr
 ORNC78BTEEepdhFvOgoDwVbdPJEA9idR3AeWpTvnJEycIsGBGNOEdummbtQQMfhrh6cjBI8Z0gs
 bz404DvtekkE0OyT2tA==
X-Proofpoint-ORIG-GUID: VYogvNPzlmkBeNufhv_W8mN39vp7UMow
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX+WbY/tTWmPJ3
 WH9/inuJ8L22wZC9UFdpFHgWTINoKswf4JG9nbqZbExKhoajRGoE9X4s34snPqAFdw8KpBNxoxR
 I/aFX6WiQU959BiCikys69MKJdEMLZ0=
X-Proofpoint-GUID: VYogvNPzlmkBeNufhv_W8mN39vp7UMow
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e65a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_062131_064208_C1E36416 
X-CRM114-Status: GOOD (  16.76  )
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
cy5jCmluZGV4IDQ3YjcwYjVlNzA2ZjIyMWMwMWYxYzBhZTNiMWFjYWZhZTY2NDExNjUuLjlkMTky
MDNhZTRiZDdkYzE3YWNhMDY4ZjVlYjg4ZmY4MzBlNGU5MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwpAQCAt
NjMyLDYgKzYzMiwxMiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdiwKIAlzdHJ1Y3QgcWNvbV9ldGhxb3MgKmV0
aHFvcyA9IHByaXY7CiAJaW50IHJldCA9IDA7CiAKKwkvKiBUaGUgaW50ZXJmYWNlIG1vZGUgaXMg
b25seSBrbm93biBvbmNlIHBoeWxpbmsgaGFzIHJlc29sdmVkIGl0IGFuZAorCSAqIG1heSBjaGFu
Z2UgYXQgcnVudGltZSwgc28ga2VlcCBpdCBpbiBzeW5jIGZvciBsYXRlcgorCSAqIHNlcmRlc19w
b3dlcnVwKCkvc2VyZGVzX3Bvd2VyZG93bigpIGNhbGxzLgorCSAqLworCWV0aHFvcy0+cGh5X21v
ZGUgPSBpbnRlcmZhY2U7CisKIAlxY29tX2V0aHFvc19zZXRfc2dtaWlfbG9vcGJhY2soZXRocW9z
LCBmYWxzZSk7CiAKIAlpZiAoaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSSB8
fAoKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
