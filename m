Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D6C55172
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NRdybb9md2JUj5uiaUOV+rhxsj4d8xtUoUpX21Q41lk=; b=Mhwp1A1nkhqxVx
	xqxpa/qWXmJyowp76lRMoeZ8vYFGj9LuxVtHELnndWtXXuVTT7x+RmS5JkQj6tdNsBwWVZAYDmjFZ
	dd6T+r6CNlHuUNR+pohq8NVHbgvgMGYjkA/kbZw68DMbVWjHxeEXMHZNSfP1E70+lFdy07hyewM5/
	Jn5Qq5G3Pb5PpJJMPdzKb81Knti1uquK658fLPmY5bWcT3iBVeZv71R6nxKTr33MeKgvoEY6tqMWq
	Zmvwbg9CKVhbCiLLodhNZy5oItWXGY+EQlSXO4usbeou6gneQe2stN/0Rjg3nkzBTxS/Jm58qsMwT
	zPxCkX51UAV4KHB8Z5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqf-0000000F3wG-3cIO;
	Sat, 01 Aug 2026 21:02:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqb-0000000F3vE-49oC
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxOXw713376
	for <linux-amlogic@lists.infradead.org>; Sat, 1 Aug 2026 21:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjy
	pPXTk6so=; b=FNv61k5Dt0fi7BrLLopELhBNls8n8ibtZ7FknEnoxSorXNSxWR4
	6bqEyghP6cCpbXjRFZRHn5LtCSXFQwp1waAS3d/ypO2rIZXDNCkNd+XQM9x/R9Ia
	nXNv3zeNkSeYWGZRDheI3zcR2gZM+FL7gVcS3y9APZ5STfDyqeq/GoQhhfCUncgX
	2tyFIiDb0BWWBq9m0TB1fHU2a6e3qz7G+ZAerQ87iNfnAFKpJqdMSUdA9Le3ULVL
	t6boK5pAVWU1hRWvONJB9DDLMw+gMy4uPXPdySLvUvwMUqfcuAGAY+MKvfqdmyOW
	11D9B08xaEWjs1CH92j0nOIgOxAi2YCdlUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg1nar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 01 Aug 2026 21:02:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso21542151cf.3
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Aug 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618140; x=1786222940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=;
        b=GmzydbbGFUCee3pekELp+Sq/vtGog2EBDK7YnUu0r7GCIb9WKwza2m84Cp6/Z2yg2m
         zrFHuaaG5TY/qsMmNq61AjqSjBLoqfXg/fFOBdoNUlRdGcKdRB5HwPhzeei+GGLCaA1l
         1Wj7N9lgoNnmAECoiPDyJ+3kHKivC6ggYigH9o/T4d0zCnAhPyEngo1lFDVkmjmX5jnf
         PqxKtY28UF7SUxf56FOcGGw3poKNP+S2AuoPFAWa3eYw4NWKL7w+v5vs+r69A+aCSmCL
         +TTYucu8OHzbCOXs7fdgcVfc29Eyk1VXpw5RNX1qDBPCOEcwU4bWKBcfzri1gbLmyBIT
         mjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618140; x=1786222940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=;
        b=TtvBNHqe/1y4lW6xL/gYgHzpBHVsXAKu07rNY069VqENmoQH/WPecw4WQYejgqmGKy
         UAX5dDFyrY9Lo/dFKnRho5rDj5Z52iWjge+DwiIFOqSl/HyZ1uYMZIYFbCNMHhLWlya2
         mCPlfaqRZ8QhTjDPLrlFjL3dFguC4Tlon3Q+BifyxW9ydpKW8x145iCTPq/y4D/vC0Wm
         XenAJ+XDyEmgzrHldSV8+02fE+IEh5ojMIUm9mPB/ujKZNE5zwJ5RmVcA1Yya1Lwytt1
         TUMtLRabgyKBCZ9ltWDiTwc74E1AYOIHfOPe7xnTrUitXyrE/XxdlBUip755X4SF+00a
         Nzzg==
X-Forwarded-Encrypted: i=1; AHgh+RpZRVIzQiwkv87bbkWxPrA8SSvVj3BOMr2nu2xHplUMqRVIWHGx2eMe4ig1weo8P9PHQGBmKlMcjKy/hDxl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+muRIJD9zdEkPdJWdfxaRtDS9AmAEpnjYaXL81152YbvU88xl
	e3a70mkNUfo4F55XWKzDns/vBMDie3rZdWqbKtoWrzoPo6JKhZhKcl8wfPkzvoqA7aD0zmzv0O5
	zmea/wrDAhV9xKF+tc/dqZ1ade3AQ9Rv8dnlFDcMj0iuRoqrxJvLU+isWbVhyS9nRCdU0T9Rrdw
	==
X-Gm-Gg: AR+sD11ggdCWgiTl9IzftSo7sU/hGO3Nl9RY86JVkR1rHA9EdqGk28ZjT+iCXsfZAPQ
	aJ/OOlNYJoWwf+YK7Sp6XwpLP8VbCqKev8WAYmFuljfHrMC65KwNtdXX7cx7HDiXQrRwFV9Leq6
	6L/mvdLiLcBJJ4ZpDtocf11HAtcUnWSbnvSuKA6xI+C01Eu0+X8SFY6dRS9fjDKTYqQRbFI/Qpx
	2drjOB8q1SJw/KLUxvPRtaGblOrjJRrEWWW/Ed+t5tfA6gmaNps4heftOi4eyRw0In74o1+E3Hc
	LngtSF6chDj0PVna/v5jKOqxafrjFi43my5JXtaBnEI8WQeqE6eJRGEvFmalO072xZyi+93FNxR
	7Bc1jvJYfcRb3f2GC
X-Received: by 2002:ac8:7e82:0:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b56796771mr91233051cf.36.1785618139768;
        Sat, 01 Aug 2026 14:02:19 -0700 (PDT)
X-Received: by 2002:ac8:7e82:0:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b56796771mr91232291cf.36.1785618139228;
        Sat, 01 Aug 2026 14:02:19 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm17775127f8f.34.2026.08.01.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:16 -0700 (PDT)
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
Subject: [PATCH 1/2] ARM: dts: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:11 +0200
Message-ID: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6498; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dv0IIlCsP38vrPIecmLJafEpOPtBJNmDRJ5sixEKHZg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7SsRxgMMk94Xc+rsy7znxzWW5ysdX87dpQb
 nFQFBr+RKKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e0gAKCRDBN2bmhouD
 18kqEACF+c3RDPAnQEScb34eL8+0jQrH6tktw9P6Y8y+kcrVv8yqLoucGYos86e8vBzU5eSRai0
 Y587bJwjIRV4BWweCeATMc+i3muqTiLYWMGB4uSdfSSdYGRrnMZqK3TLtqsgqq+Vcuc8odVSx52
 mJJ4IqY5CnVkLr5Huvvm6g6/7OP/VaxBjHCVpjfK858kf5WKIRx89KbafiTl/LCqt7S1fGPmCOH
 ujW8j9GZzrm0ndk28zNRBmNjF6/aQDBMGWbArv6rGybceysUKatJ1w3vPguVzkRlDja7dRP6ImU
 wRkvws73lWIe53aHya8BQH9NZ0GAWd9hFjIlCCxiOjHQYAYwpIBbFHgOIB+4XNS3eC6Gi/Q6+PL
 I5hvZixbTC1ozQBlPK+PqmIoT9VVs8B8kZg0W4BmKoUbTxD6xY6YpM0Jk6q6MnvVOuHJPoIHd5F
 jb9tIYWBLHBWGNDcApVpMfqWh4W7dnKyXoUObmZrayyRmMR2reJ85HGzcGLa5z+WP1zKgZtlFmy
 +cziKE7NT4FYzUHhpeuqddFPzR8Fk0yaaodB8RE6C4DaLoFA2pjCFWv/rM1YW1GeHqWlL0+hEo0
 Yf0Xs1ZYIR2j0eWLVslPrArnMjNg0XCdYMGYi5BCIAQ1nAhnV06kVqIG2YFmyD22PuIKuOr4zv1 mVSVdXzbmhPbIkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 5jto0B2xlk6qK2lF8dytT84do1BrxI3C
X-Proofpoint-ORIG-GUID: 5jto0B2xlk6qK2lF8dytT84do1BrxI3C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX5xziC4gkbYV+
 ADSF1hrs6r5p0woVWNiO7pALjMms9BEAOF7Lit+l+JpkThylmVa1lCYFG4H1jGZpScJ06Ihgd//
 T+rAqnqDN1Mlt4MskGQAfu6Okj7/GrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX8Y6hzDyDaBFW
 0xfimUKINucXXRoq6acEB3upIUfQjRS6IZxJr5VtKNUBRG+86Z3l+ptnwoQGxCGH93kS7oDFqwt
 LREtSdT2rid5XN8huzY2P4eedeWaepL0zxVAUgYUE0zjHg4ar6hz+ur0/cZdH+SK0GrDE6xhdD8
 K6UTJcAxdpq/KzOmBIb0rfPZRRr1dgLlPGLsRr64bzXnR5XDWC21IeDG4zr8sT303SEf0ZmCFx3
 hQ81znAfka8CFDdQSCTNQ/459YxqjHDDLnNj6D52o2qLQuBfUyPNuuPdP8bCwuLPBKQOAi9eoH+
 ai3YsDQbGetNuqn3uYeWhryPASa+iAxsBzzrpSOblDC67gVM34iyoYiUungXCMDfmOp9HJaU97s
 5k0oR0r9lfAXkfrE+ktqd6eu1ujmYRA9soPAXAt12EaXHdbB10yIwyzC7I2sxwcfmfx7CuHmpEV
 Dti695AyM628VnBlGKQ==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6e5edd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ED_MHW6qaQPFTTync5wA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140222_071408_8D8CB586 
X-CRM114-Status: GOOD (  14.95  )
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
 arch/arm/boot/dts/armv7-m.dtsi                           | 2 +-
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts            | 4 ++--
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts          | 8 ++++----
 arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts             | 2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8291.dts          | 2 +-
 arch/arm/boot/dts/st/stih407-family.dtsi                 | 2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts                  | 2 +-
 arch/arm/boot/dts/xilinx/zynq-cc108.dts                  | 4 ++--
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m.dtsi
index 26f5443d85e1..6ee18d6a93ef 100644
--- a/arch/arm/boot/dts/armv7-m.dtsi
+++ b/arch/arm/boot/dts/armv7-m.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
-	nvic: interrupt-controller@e000e100  {
+	nvic: interrupt-controller@e000e100 {
 		compatible = "arm,armv7m-nvic";
 		interrupt-controller;
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 74161b76008a..6c4131b846c1 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -141,7 +141,7 @@ mdio@200 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			switch@0  {
+			switch@0 {
 				compatible = "brcm,bcm53125";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
index dd5c8ffc8781..56334b71152d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
@@ -30,12 +30,12 @@ pinctrl: pin-controller@10000 {
 
 			/* SATA Activity and Present pins are not connected */
 			pmx_sata0: pmx-sata0 {
-				marvell,pins ;
+				marvell,pins;
 				marvell,function = "sata0";
 			};
 
 			pmx_sata1: pmx-sata1 {
-				marvell,pins ;
+				marvell,pins;
 				marvell,function = "sata1";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
index fec7269088d1..19a286dcc8a5 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
@@ -35,7 +35,7 @@ led-4 {
 		};
 	};
 
-	led-controller-2  {
+	led-controller-2 {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led_red
@@ -58,7 +58,7 @@ led-6 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default" , "default", "default",
-				"default", "default" ;
+				"default", "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
 		pinctrl-1 = <&pinctrl_pio_rf &pinctrl_pio_wifi>;
 		pinctrl-2 = <&pinctrl_pio_io_boot
@@ -170,7 +170,7 @@ verbose_bootloader {
 			input;
 		};
 
-		 nail_bed_detection  {
+		 nail_bed_detection {
 			label = "nail bed detection";
 			gpio = <&pioA PIN_PB12 GPIO_ACTIVE_HIGH>;
 			input;
@@ -276,7 +276,7 @@ &uart4 {
 &flx0 {
 	status = "okay";
 
-	uart5: serial@200  {
+	uart5: serial@200 {
 			status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
index 465664628419..75d2e748a3db 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
@@ -298,7 +298,7 @@ &flx0 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
 	status = "disabled";
 
-	uart5: serial@200  {
+	uart5: serial@200 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx0_default>;
 		atmel,use-dma-rx;
diff --git a/arch/arm/boot/dts/microchip/at91rm9200ek.dts b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
index ce691c4692b9..b849bc7049d6 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
@@ -117,7 +117,7 @@ kernel@50000 {
 				reg = <0x50000 0x300000>;
 			};
 
-			root@350000  {
+			root@350000 {
 				label = "root";
 				reg = <0x350000 0x4B0000>;
 			};
diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
index 3a3d76af8612..1f0b0b647aa9 100644
--- a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
+++ b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
@@ -64,7 +64,7 @@ fc3_b_pins: fc3-b-pins {
 		function = "fc3_b";
 	};
 
-	can0_b_pins:  can0-b-pins {
+	can0_b_pins: can0-b-pins {
 		/* RX, TX */
 		pins = "GPIO_35", "GPIO_36";
 		function = "can0_b";
diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 08acba209c56..436fafd30317 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -812,7 +812,7 @@ ethernet0: dwmac@9630000 {
 				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
 		};
 
-		mailbox0: mailbox@8f00000  {
+		mailbox0: mailbox@8f00000 {
 			compatible = "st,stih407-mailbox";
 			reg = <0x8f00000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..1d6435c59096 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -382,7 +382,7 @@ goodix: goodix-ts@5d {
 		VDDIO-supply = <&scmi_v3v3_sw>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <272>;
-		status = "okay" ;
+		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
index f5525c048426..e7cb82c7b8e6 100644
--- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
@@ -92,8 +92,8 @@ partition@f00000 {
 
 &sdhci1 {
 	status = "okay";
-	broken-cd ;
-	wp-inverted ;
+	broken-cd;
+	wp-inverted;
 };
 
 &uart0 {
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
