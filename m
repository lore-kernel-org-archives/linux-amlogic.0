Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B88C5516F
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uV82ioBtbo/yfh9TV6SKOmsaTFUj035Ht5vlv9s3fLs=; b=2a70dJ12zq/rhK
	5r+fkmMnDhiuDRc671pi8FdpVaPWxVew15EvZZIC8q1JazXeEjTGsvPsz5179xcj82D6MzVPVWvEh
	5t7PWHlIlORJFuKXRRTHkBIgr1gWpfwSU5940qBEersysTgRUHV45DMl9m6dkOsx0w5E9Xe8+TTwu
	b6rUtrKXNX5QrbDd2MsPqi3/zfk/5Vq6CLmoM8fpG4+gyZHU8USzgHjEMZzXLv6i/MGVo/1VEyfqo
	myzWghb+jquDhUrmVWEqfpXXfnluh0X+V3Y5QiEcE3byzblhYMJnX5+qkNHZNG6KXSJWlrO5KhTj3
	/FsPUSnOT2aTH1cD5Ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqi-0000000F3yU-3BHF;
	Sat, 01 Aug 2026 21:02:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqh-0000000F3wd-0Z5E
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0wK23911487
	for <linux-amlogic@lists.infradead.org>; Sat, 1 Aug 2026 21:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=su8TE8rR1Eq
	zUsl1eMZWcW5BezyRgWIbH64DyFNzHps=; b=ot9IDzLj/rKKWmQg3CxAzCshf3x
	OwZBY9vpuNm1rU8CW5Fy+uLSpCVzu/YeaDr1tmVeI+ea1zjgRPG8U8gdCg5RoQd6
	jCE2NeAbvLvoocpj7OImn1uPAUloIySkhX3j8ZpC567lfYl4zthuMK31Sw4Uddc6
	nAOL1iB3Kb/PmNLcHhfDdgByDsCXakTFRn9FL/r3CF/YD1TTvy6lYXYbUWDTcrkN
	1xKcsis1/eThARvq1O3fbKRsHAfIEoejPCrtQfEJOvV4mYEbLwXGlXBBUvdlkTbA
	pOwTkqMs/+B1oyrbOINE2Bb0s9KAMw7T3VWAvzSbVQb5wcgagCAlolKcScQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119n4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 01 Aug 2026 21:02:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso37010631cf.0
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Aug 2026 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618146; x=1786222946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=su8TE8rR1EqzUsl1eMZWcW5BezyRgWIbH64DyFNzHps=;
        b=EbnkQuMenOieMY2gDOZcxy5Ie1osWSiSFlGIvN9qrLYvoMsGUzcevlIllmMbFP4ZO4
         6wluqCwtubWPClCseSVxBpBOsU//WfT15p2CpOPqQj5OwrBMfMjfQ3LlKCmPaM15J3z3
         sb1UDERzhJ2LxWzz/S7VZZRHN6Sq6I9igP8Co8i5m47g9wYkLYS/80j3YHbMY5s2vYWu
         tGSVhR+8jueRSdY+HYyrPixmrzxX+jiorYislBXOsekRkaGH/utHtbWkDahjunqIjnjO
         yIQhl4ckuVLpHJQ++ckiXt+lt3a5ltuQjkE3nzYgx5KhQqVdnU4XTZIMYtjcL9eFADc+
         Ef1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618146; x=1786222946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=su8TE8rR1EqzUsl1eMZWcW5BezyRgWIbH64DyFNzHps=;
        b=opB2iAZDGf199cA/RHkhgC6X2HeO2ZpQ9V+RZx7fiD4NxQTasPC3LO1An7XR9LTvAD
         eZxblvkiv7iafCqy9RcVW51Yu15O62b8wApO8p5gzzy74zDcrwfBp9UN4V1jQ61+CEt8
         1FQWo2BhCYVwuh/HhqG9BuSkkeeY4GriRvZ1rp5BQ9m7EbImNKV5SneGzSfX7q63WInW
         7i+HgtOF/QTQRQC52HVqQx9wSGf0pIYe55S52h4wqjzRc7RWu+g1h2JB/HS/FnWPeAvp
         c4Py+4wa0jGygIgjxwBJYcO7pvTtCTpIJXDPb/mLyKtdzpSGJ74VMj9vSq1kHN6bBFoy
         7pvg==
X-Forwarded-Encrypted: i=1; AHgh+Roqodp8d6MHicC4QbzGH/+HQHpXRa7aDBVRfhbYz4eCEkSQMp89y7yEYh5j1LD0atr+Se3QLaXB/aBET4pi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2x82NZGA/JbSNYRRbrauV1bMFettN8xx4oQxlShFiB9IledhU
	YKfh5T/NFTqRBelt9Nqr0TWijgiduEvrAUecSg2jI8wtVBNEivytIpn9Co9WhagFK2ck5WSpro8
	2ObEWiuRvf18LSHdbxpsVMjHVRYTyGdDhi8z5vdODiQVCzLtNfxr+bXhFbS6FGT6dqlbV9Vcg4A
	==
X-Gm-Gg: AR+sD130EUUvkR40H1cAsVETxaendhdyG3mxn0nDixcAnZzr+B9FkvKW61hqkQb8lFt
	vP2fWEdX9FrjJaRJEzDIrrtw0X+ygOkeaHr6W0STkUuCDbplvM1CGwZ34UFD59cURDwz+7r8s2b
	65fMcS+Hfs/rowbpbo4zfFHBrPoLl0kocS39i26VHZRB8wQBIdRlxYTZd2nHACgaH6xqrWPZtCj
	VB+322SE0VJYDTnKfa0vXw4wnOxOTl7dKvBKJgRtDRJUVyXB/Tn/zPN/1QyGp5CsglLIos428P7
	//7ZgTk9oal7jIrPhFmJXkgPoczDeFf5iQ4gULgJO33DXl9Gtl+ud0wpqLzZcrSvv3ceXr9DpV0
	zyraXyR41cVJCKlo1
X-Received: by 2002:ac8:574a:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52b5666c76amr93604091cf.5.1785618145656;
        Sat, 01 Aug 2026 14:02:25 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52b5666c76amr93603791cf.5.1785618145260;
        Sat, 01 Aug 2026 14:02:25 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm17775127f8f.34.2026.08.01.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Dinh Nguyen <dinguyen@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:12 +0200
Message-ID: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8207; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=TLPCMq9dJNI0+U6Kp58B21ZcDovBwWfAn0P7dz3zarE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7TJVVii45zt1o7+UEuPFT7vw5plGR4g1qsg
 mNVMPmhXsKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e0wAKCRDBN2bmhouD
 1x/3D/9P+gGwrzJZcCZZ8dzqE+qXAUOgFQde1f7R/rjhrhTURq+nnKbc7/K5LkTMM8f4xCplwwj
 1DUuSad21WgOqbqUAReAOIgo+BpzVIT6NQG/7SAAw/oD5BPQrd0MlRoRWIkeUrPHnVgRVRelWAa
 k2U/bpEnIbfQmAoKk2ijnQta7j20LMIQ6uaTg6/jvmWcOWi6NS7yUBDEDPzzHX8WZ0CR8nzdF+w
 vP8hjgkivp5Q70XDe8dd9k3TA+EZbiWZpK//yjrJyho8jFNyxUW/MpuX0oIBmgKvbij5IsR/vU2
 fRk/Dvx5uKti/8BRyzpASfodeJ0Ap+UJ4Ie6Quv9h7y+m8dn/mlTginamjFnOJwIrHSb5Hu1uGU
 DeYa0n2F04YDKWD5En6GFJnmQPwMRTOHYNAvFmhICv4hziVIAQnGyv89rekdqhORowGgFRnps2J
 lvazkBvEXELaO9EgZKa0F9g6tQraVklbDWvhMOeaOVG/zrhSUxqZl//01VwTr68zs0UP5iKrW9w
 eFn4vsyLsBTQ6iS8SQUGVjYZiGWGpFh8ee5Mk4lYFFz2yw1QwEUoLw9/O+/gzc5c5WStkVs86g5
 lSfobZYNcgWB5+KYkN4Mtz9io59FTLzflsPYtfWar6qXzQwXch4sZg6E3PQ9iKVj8TNQxpclYBJ eMfc2a9el6+vyFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX34AWCI17J9WA
 io8qULfzoM54tga0mBqLDuFz2eizzo0/1/G+tM1ogltlxaM+CMi0l3ND+uEHud3SC3SQ65X19cP
 7R/+N8KqqLdlHc07PHdGppAIgb0v0hU=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e5ee2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AwhILCEgSuoyubdv8HcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: N-F6oIVX5OksPu5mLy2usD54taosA1U5
X-Proofpoint-ORIG-GUID: N-F6oIVX5OksPu5mLy2usD54taosA1U5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX7fY/4XY5hXPH
 vPqr67ym4ZwKJ7hBQFEnLCrC/9wQ6uOwbMYrdAH+ceL96C53M7wKpCJ/Xlt+5TgDCeVhVYcSnL/
 hXhu9HMQ/buahUg2K7Wr1NaNlqE8rKGcxVt1ZtpchUpoOydVhjNP4EmfPcUVCt7ptuQqvLM54kk
 m8Cr8pr4sxRA9w4WnAXzmsLwZkGq7kNx6MS8l6kZupzX3CdUMmOnbUW85S1QYBRPGEgpNcuKWua
 prhwPYcNcM4mPkCpBItDgC+vkXJri8aub2SCHpghstmF9M5TrxRKPOHGYoYLVko3blR+ggLwjkT
 fUB0n+riX2cbT8CVDlo97eJW5MVDd3prCh+4cJDgJe8uojWjOL3S14qG7I8JBygRZZFFFyW03TY
 y82JwcVsYDvTziMhtq7FLpHpHumkqOANehM8q3r1TfjFudzE3L8IIyJ6sDNI/ZSrl0CSVa3HOa6
 bSTUSLUoLtKDjF6xzHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140227_215616_D890E0B4 
X-CRM114-Status: GOOD (  13.86  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I'll take this directly via soc@.
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts          | 2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi               | 2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi                   | 2 +-
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi           | 2 +-
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi                | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-db.dts           | 2 +-
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi          | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi                 | 2 +-
 arch/arm64/boot/dts/nvidia/tegra264.dtsi                 | 2 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts               | 4 ++--
 arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 4 ++--
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index a1c5d10f2f54..91df4793dd6e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -546,7 +546,7 @@ &spdifout_b {
 };
 
 &tdmif_a {
-	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins> ;
+	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index e930f2f26f4b..e110792cdc76 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -293,7 +293,7 @@ socpll: socpll@17000120 {
 				clock-output-names = "socpll";
 			};
 
-			socplldiv2: socplldiv2  {
+			socplldiv2: socplldiv2 {
 				compatible = "fixed-factor-clock";
 				#clock-cells = <0>;
 				clocks = <&socpll 0>;
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 4c4938faffb1..d67f5ed985a2 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -174,7 +174,7 @@ socpll: socpll@17000120 {
 				clock-output-names = "socpll";
 			};
 
-			socplldiv2: socplldiv2  {
+			socplldiv2: socplldiv2 {
 				compatible = "fixed-factor-clock";
 				#clock-cells = <0>;
 				clocks = <&socpll 0>;
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index ee12fea5b12c..926bb4ab77af 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -33,6 +33,6 @@ &hpm2 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
 
-&hpm3  {
+&hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..6a066c43d24a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -644,7 +644,7 @@ mip1: msi-controller@1000131000 {
 			brcm,msi-offset = <8>;
 		};
 
-		isp: isp@1000880000  {
+		isp: isp@1000880000 {
 		     compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
 		     reg = <0x10 0x00880000 0x0 0x4000>;
 		     interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index 82cd4115746e..afe4ef182ee7 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -107,7 +107,7 @@ qspi_boot: partition@0 {
 				reg = <0x0 0x00c00000>;
 			};
 
-			root: partition@c00000  {
+			root: partition@c00000 {
 				label = "root";
 				reg = <0x00c00000 0x03400000>;
 			};
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
index 06d4a3a93f84..efc32074bb11 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
@@ -109,7 +109,7 @@ gpio_exp: pca9555@22 {
 		 */
 	};
 
-	rtc@68  {
+	rtc@68 {
 		/* PT7C4337A from pericom fully compatible with the ds1337 */
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
diff --git a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
index 91ba5f7dc9b4..feffb9c299fd 100644
--- a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
@@ -353,7 +353,7 @@ cp0_mmc0_cd_pins: cp0-mmc0-cd-pins {
 			marvell,function = "sdio_cd";
 		};
 
-		cp0_pwrbtn_pins:  cp0-pwrbtn-pins {
+		cp0_pwrbtn_pins: cp0-pwrbtn-pins {
 			marvell,pins = "mpp31";
 			marvell,function = "gpio";
 		};
@@ -378,7 +378,7 @@ cp0_spi1_cs1_pins: cp0-spi1-cs1-pins {
 			marvell,function = "spi1";
 		};
 
-		cp0_uart2_pins: cp0-uart2-pins  {
+		cp0_uart2_pins: cp0-uart2-pins {
 			marvell,pins = "mpp50", "mpp51";
 			marvell,function = "uart2";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 16cf4414de59..6f4879c49da2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -1159,7 +1159,7 @@ asrc_out5_ep: endpoint {
 							};
 						};
 
-						asrc_out6_port:	port@c {
+						asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 820670dd6042..b80f64bb81ea 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1765,7 +1765,7 @@ asrc_out5_ep: endpoint {
 							};
 						};
 
-						asrc_out6_port:	port@c {
+						asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index b141e8f884fe..013228a81723 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -2015,7 +2015,7 @@ asrc_out5_ep: endpoint {
 							};
 						};
 
-						asrc_out6_port:	port@c {
+						asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..b5db62a0a550 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -404,11 +404,11 @@ scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 	};
-	scmi_vddcore: regulator@11  {
+	scmi_vddcore: regulator@11 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
 		regulator-name = "vddcore";
 	};
-	scmi_v1v8: regulator@14  {
+	scmi_v1v8: regulator@14 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
 		regulator-name = "v1v8";
 	};
diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 15f767608e67..21bb917bcba1 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -1074,7 +1074,7 @@ usb0: usb@f1e00000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
-			dwc3_0: usb@f1b00000  {
+			dwc3_0: usb@f1b00000 {
 				compatible = "snps,dwc3";
 				status = "disabled";
 				reg = <0 0xf1b00000 0 0x10000>;
@@ -1099,7 +1099,7 @@ usb1: usb@f1e10000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
-			dwc3_1: usb@f1c00000  {
+			dwc3_1: usb@f1c00000 {
 				compatible = "snps,dwc3";
 				status = "disabled";
 				reg = <0x0 0xf1c00000 0x0 0x10000>;
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
