Return-Path: <SRS0=2QGV=GZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981A4C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Jan 2021 05:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A563B239D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Jan 2021 05:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A563B239D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:Message-Id:Date:Subject:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=G0K0d6t/aKzGDSou36bgVaETL6hfrLm/Ct1+y606KVc=; b=jtqvdSomApA+mMtaMTfBlo81QC
	d2Q4vumvnVgLqWwvqpzIA22L99Kb1AtXXIOGNTEc880hKC9xpLkWUIFp9rYsUb8nWnLibBzsnLgud
	OtYZBIaLbPaqRfsKruCGLFXzIqfWBQR1sxJCZHm2KYJo7I0anNo/z1xOpn2JYNAetXDDpxmvheucQ
	m7KypaHiseEne9wZ/S0vDtfNbNARyKD/MRpv4yDGbt9MaqXL8qWWGis9pYqWSM3V0QvhJIPIUrFPe
	YdYVBEDBuJVCKzXsItak4yMf+huDvoqbGhSmn/oAuW9QUoljfP5VW8r8KFYQB2bp3pR0P5aF+mKBa
	Xxk/XJ0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2pN5-0003pU-8d; Fri, 22 Jan 2021 05:52:35 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2pN1-0003ob-Gp
 for linux-amlogic@lists.infradead.org; Fri, 22 Jan 2021 05:52:32 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210122055228euoutp024b185c62d3e28e5de6931d42dc17812b~ceAlwKyd00466604666euoutp02Q
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Jan 2021 05:52:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210122055228euoutp024b185c62d3e28e5de6931d42dc17812b~ceAlwKyd00466604666euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1611294748;
 bh=z8MpXKNoMZZ1oO3BXP4bh0KDG94N2UwukrTz0Tph21k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=bBCVvOokFsZZNW1+0uVI752YoE2mpaGk9BtRs2sCNO18LvjYnKRKRR/KodxdpH+nN
 nJzGJ4aZQVAzVQP36oHwe6NmfgiOdTev3VLFfKE4Vclsz35SArMYPVURop2tTL8E5C
 JTotEAqJ+7aeql2bB2SBPff64yceuODaMIfMIg9I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210122055228eucas1p1cc93ae5c732b061d26b59e567e4db5b8~ceAldTM2k3232032320eucas1p1u;
 Fri, 22 Jan 2021 05:52:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 88.35.45488.C186A006; Fri, 22
 Jan 2021 05:52:28 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180~ceAkQ70Ia1133911339eucas1p1f;
 Fri, 22 Jan 2021 05:52:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210122055227eusmtrp1faad2c7f59e3cee5cfb7bd3e9d3d13f6~ceAkQQmEe1579515795eusmtrp1p;
 Fri, 22 Jan 2021 05:52:27 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-8a-600a681cd04c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 15.34.21957.A186A006; Fri, 22
 Jan 2021 05:52:26 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210122055226eusmtip23b1e524fa3e309d44f57e41d198cfaa8~ceAjwRmtQ0850608506eusmtip2U;
 Fri, 22 Jan 2021 05:52:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: meson: switch TFLASH_VDD_EN pin to open
 drain on Odroid-C4
Date: Fri, 22 Jan 2021 06:52:18 +0100
Message-Id: <20210122055218.27241-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7djPc7oyGVwJBg1LeCw2zljPavHm0RFm
 i5/tW5gsFszmttj0+Bqrxdojd9ktji06yWJxqC/aYt/jNcwOnB7vb7Sye+ycdZfd4+mEyewe
 m5fUe/RtWcUYwBrFZZOSmpNZllqkb5fAlXFw4xu2ghc8FdMX1zQw/uHqYuTkkBAwkVjS1cjW
 xcjFISSwglFi/Ya5rBDOF0aJW09uMIFUCQl8ZpR4vCGki5EdrGNBAETJckaJlnn7meHqr2x8
 wghSzyZgKNH1tosNxBYR8JbY3NYJVsQssI9J4s6812BDhQViJD5//MUMYrMIqErMXHUXqJmD
 g1fAVuLYm2KI6+QlVm84ANYrITCRQ+LJxANsEAkXiQ9z77JD2MISr45vgbJlJE5P7mGBaGhm
 lHh4bi07hNPDKHG5aQYjRJW1xJ1zv9hAtjELaEqs36UPEXaUWDjvDlhYQoBP4sZbQZAwM5A5
 adt0Zogwr0RHmxBEtZrErOPr4NYevHAJqsRDYscpNUiwxUrsONHGNoFRbhbCqgWMjKsYxVNL
 i3PTU4uN81LL9YoTc4tL89L1kvNzNzECk8Lpf8e/7mBc8eqj3iFGJg7GQ4wSHMxKIryPLDkS
 hHhTEiurUovy44tKc1KLDzFKc7AoifPu2romXkggPbEkNTs1tSC1CCbLxMEp1cDUUOv4+6d6
 +ptFv1+tcWTT2cAkpXeCa5WhZQPv7vzwZZ/yWI48fXxvZuOGxz/DzE02Om7dHF+jeipHb8O1
 e1fXBrRf83/r/MOp8Fd1xIMZf6RfbNL7zpFkH8Kx5+Tx1XOToy9vevZbu3r2Ev0nEv6ny7a+
 NxCckXvmUG3uOa1tUVMKgj8dMPO7Hb5kv8seyxmlS8OCPuZZHqv+LLCAM7/ozjZnMTYNB7Ov
 quvO3/8s+Cp65h/PY3sO3q68yXN/1r8DF+5uuG/2sn3S2xCBmZvXxM3cIXy77wbbBu5yyfeb
 5lx3//K2XvDHlGcnPHwebP214l5kQUeW/92onCsO6aelJx7YvOGx5x/lx266HVNWqjxWYinO
 SDTUYi4qTgQAXmswVXkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsVy+t/xe7pSGVwJBrP7zCw2zljPavHm0RFm
 i5/tW5gsFszmttj0+Bqrxdojd9ktji06yWJxqC/aYt/jNcwOnB7vb7Sye+ycdZfd4+mEyewe
 m5fUe/RtWcUYwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
 llqkb5egl3Fw4xu2ghc8FdMX1zQw/uHqYmTnkBAwkVgQ0MXIxSEksJRRYtqZNuYuRk6gsIzE
 yWkNrBC2sMSfa11sEEWfGCXmtt4HK2ITMJToeguS4OQQEfCVOPp3EStIEbPAISaJB2eesIAk
 hAWiJD48XwfWwCKgKjFz1V3GLkYODl4BW4ljb4ohFshLrN5wgHkCI88CRoZVjCKppcW56bnF
 hnrFibnFpXnpesn5uZsYgeG47djPzTsY5736qHeIkYmD8RCjBAezkgjvI0uOBCHelMTKqtSi
 /Pii0pzU4kOMpkDrJjJLiSbnAyMiryTe0MzA1NDEzNLA1NLMWEmcd+vcNfFCAumJJanZqakF
 qUUwfUwcnFINTBNbMj7/vS3o7venu2nXzDV5eypOehUkPDl7+cWsLct1Yiflzlz4WiDF1aqy
 5JBz/+mJ/z7O1qiYnPCCg/HH+VkNsxd+YuqYePbCKaEsp2VrXKdU1+x5F5IstnH1xei7fisV
 O8tuOv05e9U2/O3Mcy5rjsftet21X5DVQ0o6cePPnX7C93iPePofCQr/82RHenTE+YQzp23n
 H+hV1f7+NtJE4CDfp92qodNqvao/XXqhpeXn9PJQDT+n5A2HbmPRqo9Lo5Yevu56zmzl/0ne
 1fm3Eu5MKX3xl/N12H6GO2d+NygeVY3YLHAzgHe7zjSTO23B7wIW966d03Pf/m6ORZZztpCQ
 r7H2j8kqWRcnBJxSYinOSDTUYi4qTgQASsqa7NACAAA=
X-CMS-MailID: 20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180
X-Msg-Generator: CA
X-RootMTR: 20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180
References: <CGME20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_005231_886623_2C799006 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dongjin Kim <tobetter@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For the proper reboot Odroid-C4 board requires to switch TFLASH_VDD_EN
pin to the high impedance mode, otherwise the board is stuck in the
middle of loading early stages of the bootloader from SD card.

This can be achieved by using the OPEN_DRAIN flag instead of the
ACTIVE_HIGH, what will leave the pin in input mode to achieve high state
(pin has the pull-up) and solve the issue.

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Here is a discussion on u-boot's mailing list that inspired this patch:
https://lists.denx.de/pipermail/u-boot/2020-December/435295.html

Changelog:
v2:
- fixed typo in the commit message

v1: https://lore.kernel.org/linux-amlogic/20201218102228.16211-1-m.szyprowski@samsung.com/
- initial version
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index cf5a98f0e47c..a712273c905a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -52,7 +52,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 	};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
