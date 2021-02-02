Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8347C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 17:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9804A64E9A
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 17:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9804A64E9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vi/YWn5XSyjFMajalBT2HmbumNDrM2psgzcSkZWZLnc=; b=woKE/OBPVKobwJCuMQaZSG/x1
	3MqoLckpkR5Na6nvRN3eRsw36Y8JeH1bXEwRFHetAg412ZCdOIUqh99JeqI4cDcGG1k4Nxsa/9BQU
	b+c/f/4TPR03018EYL4IGXoh9CHXnpPJlauu/BHnmXvg1+16wMJN7bsIWPnoUme+nXHP0g18su4R1
	31Xpw+vFQGduxpBcCO/rARq5qfHDLZv084vf14WQrqix7cGjRi49t7bWFHNO0YhJaLkLvzAxp+h0K
	0PnS1yDxa6M75uv4Y4rCga2jDZ8gKONWlo5hnw99Q+r9zce1EEb+W1U8Ff+IUy12VlERivRcO8yCb
	K1hHBHmSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6z5x-0002Ag-Mw; Tue, 02 Feb 2021 17:04:05 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6z5u-00029J-Uc; Tue, 02 Feb 2021 17:04:04 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DVWP86jGZzQlYn;
 Tue,  2 Feb 2021 18:03:56 +0100 (CET)
Authentication-Results: gerste.heinlein-support.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1612285434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6D5/NNgCOTVetoQPE6SDovy8rpNB2QtHZU3Hsq8VDHE=;
 b=hh4BVGXRp1CQ4OFi425hR6Hxys4090Xi41kbyTUKAI86yI0c0bvdLCd+m681l5dRkRNjiQ
 rI1Ddo+QuFnpgVQ8FFzblnEqE85Sztx1T1hjrVKWQgVzAwxGnIhwy2dkl5qcmc83a1Rn38
 bIpnDHQ/6Eiqi35BzB5Kv0W2+0fIJ4mtGaClSJuPg14ly2jfjhriaMTF2UHardHlTRc6a4
 wYuLsyB92fVHaHOImyObYhxxHGNtWjv9cQ3fo2yNsaJi/3894wRoMKch68+20V7HHcgM/h
 GS1TwFdToAncYwSwI9wSbkFEE0zCqMZL5wZg9WnKC1FSm0bMXL009voeJne/OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1612285431; bh=e7qcr6OCcuyOQBdhBmyous0iSl1Vj0YCN
 GzJUD20OpQ=; b=JjK9wtgg3aAdrgZAcqZCAE2pvOSENcYRPTDeJ3MpI+EXOvQHr
 q5jCkRZRZphjbsv2lekf1zq+Opq/ojX2kaJvkL0IyDYNhM3Ql/9JH32YW74Ne8tv
 7/OKWoOTrG/Knn32+MWYDRXwu/rfj3BOe8qcmCEiuJE/1h4TOChSns4VA/BmT6T2
 2fa5eTxdUuhQ4uFM+Bu6oqMGWTBZmM32XYZU2xEXx/aSmRWzYrsLc0bpvdcxQ39R
 hZvXcVsWZCz4DvvHfDtSZuQ2xU14rPBSmO3iOUucxLx6+srIbet8g0xNYN+kS47n
 h1mUYDtNkK7dzvj3GMTzGJpIr0w0J4JqMnD7w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id 0Xk8E5yPk1RJ; Tue,  2 Feb 2021 18:03:51 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
Date: Tue,  2 Feb 2021 18:03:28 +0100
Message-Id: <20210202170328.79929-1-alexander.stein@mailbox.org>
In-Reply-To: <20210127230852.66686-1-alexander.stein@mailbox.org>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: 82D7C17B5
X-Rspamd-UID: 94bdd6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_120403_392844_A551CF6C 
X-CRM114-Status: GOOD (  11.17  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Recently introduced async probe on mmc devices can shuffle block IDs.
Pin them to fixed values to ease booting in environments where UUIDs
are not practical. Use newly introduced aliases for mmcblk devices from [1].
[1]
https://patchwork.kernel.org/patch/11747669/

Commit message taken from commit 0011c6d18277 ("arm64: dts: rockchip: Assign a fixed index to mmc devices on rk3399 boards.")

The unconventional order (B, C, A) is due to the fact that sd_emmc_a is
(according to the comments) only used for SDIO.

AFAICS all boards either have both sd_emmc_b and sd_emmc_c or only one of
them enabled. So the alias order should match the previous non-async order
for all of them.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Just for the records, I only tested this on my ODROID-N2 (G12 based) board.

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9c90d562ada1..15525f3aa4a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -17,6 +17,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sd_emmc_b;
+		mmc1 = &sd_emmc_c;
+		mmc2 = &sd_emmc_a;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 726b91d3a905..769d7e8fda13 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -21,6 +21,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sd_emmc_b;
+		mmc1 = &sd_emmc_c;
+		mmc2 = &sd_emmc_a;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
