Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E667CE6F099
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=voR7bjDnByPYp22oV+2Z2V30+DhkhCm0NCE5n/PwFg4=; b=wrJBu/Ju1gZ+4p
	37dg+AIyZtca2GSvVKI2JFSCtK3/Kpj011uG4+qpPy9DwvJfHGnDAsrJmR7bqC7/LRONnEhyAa241
	e5GIhzaBNVJLmb0hJBcnE03HiZpZCpvGyWrNOxKWx5xVK08nqfsDGHXcDKdAoXTLH1fzrxY+NRqeJ
	j0RD3Jsm8Wk1bXy/UDUugtct/n7xtlhAAAliGXHeBkIuLgLumAV6LQa6LeqUw8MFrqv6O8+NBZ/3O
	UyRL9rVfGko60HYgcdtjEh//2zlYp0J1W2yU+3mWJuRmPrBeKC6atGHKS/Aj/cz1CgCb8cfZ/CB+d
	4S53dPFqodMSD9ZJv3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GI-0000000Fg7N-13pf;
	Tue, 23 Dec 2025 15:25:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GF-0000000Fg4S-15e5
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNENKSb913644
	for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 15:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/Q
	qJVxwAdA=; b=VkraxcAVQ96otXS/ddELXZPa9a5PpPly9e8JmATMT1TYWMEF6B3
	ZipwM70klDB0rOfhwtqrYibZtFbwHPfKbjoPjCjsdqRPbNGvGaa04X6oc2nRWGdP
	lhzxwvpWWrQdb+gYytCZTdjwnIzta75gqiw/rj7ZDDx76+uDJE9HVGytskNV8O9f
	ZnD5J6g3jL0V8/EjseZNSSi77peTEo6wsLeepI6I0kVad7lVoEUlak/eWw9+3Hjv
	/TN7N0ttCbeNeo6ej1/K4o36wvAlNl8M6JtXyVXJLp2AKr9lra0DF2k9PGPzxR3J
	XqNa5KnMgjoTECnJOyq9sfzlls9c5YYjbJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2g5gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 15:25:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so121082821cf.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503517; x=1767108317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/QqJVxwAdA=;
        b=MrfKXZIdLmI7+8JkJYKYjNKVIeLJ44sx77dPN9Ewpa6CfAI9pGqrpSxY+rfOfN5BH8
         XxEE432xk/LoLOr3So+L4AByWeRVCzIc+AAtQ8AYs0QRO3DjrRUG4pJtpu9UspE4S20Y
         rsPxo99nlvu8OMF3NABUQt61lwimJZxXoHqITmSYCdRxYDLW6kmvCezuJBfa7RCroHt+
         VQU3nGaNJ76HG8aFQssD2Qv1dojH98ehF79Pf9AxsbKpuO8uZbg2nRd9OmKZuAct3nEv
         xcYEYu653yBIymO1wXCBqq/8yuXuQhUNow40ViowWWTEf1hRh2PF8f/ItF2R8WphQ2KO
         Emaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503517; x=1767108317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swioPwHv+v70eeUAVzefRp8+8yRTw6Ca8/QqJVxwAdA=;
        b=QmXDMZvDD2kuKEVr7ZeZB4vyPrBRYgYWs0WSwHTeOEncg5vy3r6Qxh4phOFTbBw4h+
         bag1akE/eDbze1+nuOQZqo/fXEpVZFRo63qpDPG/tK6/LSIH/3EFqdnwnnuik5iqCjo3
         zwkdyyE/sLeA7C0yB9d+XW6Izri3IyAWAgSypVG+R/RUypZJ8Nku1L+/M1jhedpWEAUx
         i/+JhxmVypKhXrvWdebQCNNf7Afe6op8pwQkzy003Tycn895OeuFENA0jqMCQeZMgWQ9
         6Jqt9yOvcUmcfb4AP2u3hMALOwJdvf08mMs7oPvunzMLBEkplNu8GmpBHYK+IIPWOaNa
         y2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVQWlvaMyX7iQJcl+TTgzBhPWkcLCtQKal32xv2hAOJIURj5e3ur/5frjbfIumqFTR2JG1J/Umd83MGsGgj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw/obKsTSNHQDSDmA7Ol27jmqVcCXFenJkNeH1qQf4vzCiGvH0
	bA17u9aJNTP/BsWmT1DSd4vsKhFTypxuTHmy2EMjm9K/eircAzN+/T4mVZ0xJK/39Uc2lg2zsBw
	TRlVKN+BkFaI6EUCkFGo7bwJ+2VglJ+UCNVBv2ASNUgf6cBgOYShzDrk1gS62oDZnWIBCj5zccx
	u6xk2SFw==
X-Gm-Gg: AY/fxX4F02KDIj5aoqrm+vzk/VOfmvnx9Iu7jd1qf5RcvobZTBrSR8j+OzACmh8KmP+
	GWuI6Z+xzjP72fN5NsiGeb6CbNhPvm7QWhUE9aLpCUdpm4xMTtPJAlMRm58NCbRqh0/kvGxOmJD
	2xFglmicn46/l2BenSyzk+oY2BuT8SpriLU+OX6w09u7aVdnHlt4u7u+coAXFOsGsIDx6OBsbiA
	9m2rCMKDDAZ/lRb+qkwNoB3YiIeR4B9itrvTZcNhfCTsbI2xS1wGqNPtVU4AZ2LEn6d5Bk+4hpx
	XuCa8swptm7Kf0YSjqzw8gdcgNm7upo8seD1H3383cjJhkFxGwFHBjJqmf9ihaCp7QmyGU2vgvH
	YyuQfovJKLW386VYjKA9qfylnQgm5KCQuBwHXDJhuCxEdn7Nu0ZJl08ncoSMzTUZktx0=
X-Received: by 2002:a05:622a:1389:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4f4abcf6c6cmr192921811cf.15.1766503517266;
        Tue, 23 Dec 2025 07:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmRbhrmDceASeL3z5pklcWBSlwUzr1ZwN9b83wnRLT3KyyEmN31UjSsXEzCxHiojU90XgHlg==
X-Received: by 2002:a05:622a:1389:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4f4abcf6c6cmr192921081cf.15.1766503516519;
        Tue, 23 Dec 2025 07:25:16 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1430334666b.48.2025.12.23.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: amlogic: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:25:11 +0100
Message-ID: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=G66E8fx+L7zfz9oMuG35JIwYIhu6Ttp2Ewl9PrskaL8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlKtFbIQzko1XrP1llHftHM4pRSWLxv9oygGQ4ajS0ySTX/1
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpSrRWAAoJEME3ZuaGi4PX8fYP+we0
 NZIvA3rK1U6S4+XWHbMDwVZJw9AXHLNX/URFNBStFNEY24T0QCmIkWzg6UhLnzsBoEsh1E5mOQ3
 krMl1DoKvIyEfzgv1b9exH0na/yBAPfpv55poAL8F8gp6zAYp/sSFcpyxkv1FCoW87N0Ce6uCKK
 7fefzyJ8FcVrwd3xGrPtIl7MfgF+870/yUgEMMA2t+bPu30xP3h4accapDcrGTOFqycloYX06HI
 t6K1B8JEbvp638KO9wqQvuGWSXrhPMcYVoS1usglzHMevKm1EB+ZcG+X2bVE5ZB21bw0fUZPSpD
 J+tc+PEFL15iqtAqzehehH4ZrqxIlVLiP+/noO4Tf8F4di4seTXUz+WYTnE8tcLgEDpRTNmsGV/
 Y9ZU57n0dORu8O41Br9OGdxy1ybn/PnurBo9Qe+gvPlieJtvmD2iSOCp/YcRdONgzKS3I9KoXVW
 LlzrVmD2t8ttnnpYYlLiEFkKJRYzLmsW6Ph9ZF9+r/9wqJGMgVv+KH8BypJx+jTAgb/cchjYQm4
 /ogNwluZK0siSHrbQcBekjXJU+tLGxnm5FuvbssXcpGJREvdaAtC7oBjtFxYNaMvR22YA634KLi
 DVILZ4UodXadW2B7zn8j4KhFyenJrZecrhcu1YHrJnYJvZc/JXjSdL6C4UJ5adbCljkHuptaXnV 0fdqc
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX4R3mtW4i9jSK
 /PwhTJRytSNwDsHRf4KExJH+UNOJk/pnhETcTRRtx7ax1k0vfGIKg58+jyO0b1nzapTik1GCJoW
 Kll7HhEUEPgZfU6OeeQlXJhGw+LciS4LvEjm3mkqc1lJYf5AyukRclxNg02Y6Y5SSTckX0G3gKe
 NjCuWQj9VEG8lOHT/YuVsX3hQgRoZ475QFqIgszqRtjlxx4qDfI58dHE4Q2GTnkiJmyS+uVLZtn
 OnkI7VG7Jenl4DHTk7jTBSVanGGVyzVTDmyvnZXKYbK7MebEVI0J89vq+vR9W5KAk0T34NGZgAQ
 6l0G+UkEsErfhKRypMS9qNoI29bjtZsq2kga3ce+au15qg5RVaCssXihXPJrK++Ni90VRiljFkw
 CJMiqlLO/RQ7sDiAlpFPrSLzcH71XRozJGqko+UFhRN7UlE+/3CBPshGP6SZqst748n6NwBZoxs
 jtf0FmvK5EcSiPpp4ow==
X-Proofpoint-GUID: PzpPD6Zf5pX8NX3mf2RrQW-NrETECoMN
X-Proofpoint-ORIG-GUID: PzpPD6Zf5pX8NX3mf2RrQW-NrETECoMN
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694ab45e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WFmU4M8xItcfhem_W8oA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072519_419347_0D53E076 
X-CRM114-Status: GOOD (  12.43  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 13b7ac03f9b2..c9d9f3ddf73c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -780,7 +780,7 @@ int_mdio: mdio@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					internal_ephy: ethernet_phy@8 {
+					internal_ephy: ethernet-phy@8 {
 						compatible = "ethernet-phy-id0180.3301",
 							     "ethernet-phy-ieee802.3-c22";
 						interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.51.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
