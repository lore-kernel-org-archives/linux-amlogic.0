Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50353C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 10:23:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E4D23A51
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 10:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E4D23A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:Message-Id:Date:Subject:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=30wzuAENeMZk0hspF5T4zOPsSTeQxQJBKg9mJLoJwdE=; b=s/KRkuWWXfQg+FgRb+aYc0xFcX
	eP7pwhYEhL6LB8PeTTdWk3ZefSEWzqspcXTpBpH7nvyUGJpmv41+wP1Ea8UibhJKhLENf3Q1kktn6
	c2ULpE8nYMWdPggae5PLXOH2D3RX7KvemhtKq0133exePpn5nzvbVejIrbCaDyghJ5IIS3QqpJKk5
	y+8FM5ab/dhNglDSoJbF8XzuheDfczkTO6o2+tc6suaJ21A6jHmI8DnNzB9WB7dziNvA8RNv7DOc3
	BOydInoPYJZm0m5KJrFqnbDW8s3/eWunDHJpV1t6lWRsMWj0ewNplVE/NMKT4kQh35byOy6ntTx4s
	scNfNnWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqCut-0004r9-PV; Fri, 18 Dec 2020 10:23:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqCup-0004qE-Us
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 10:23:17 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201218102258euoutp0146edfbe86e4505a83ec1d6978b8f159e~RyHxFwFvP0668806688euoutp01b
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 10:22:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201218102258euoutp0146edfbe86e4505a83ec1d6978b8f159e~RyHxFwFvP0668806688euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1608286978;
 bh=YMSnFPC4pnpwk94nU7Tfi+xW3q1YwsY2Ej4X8VQdqLk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Ex780U6F6eeJp/JV2H9noGBLxt49TWqKibaUgKPcoJpUBrrY135xDSVMHSstlXpFv
 ZJumSQknERfR4g/RXtTg9DUGId/V/ffNMHZFnSwxo8qcwiXn/gK3Cvox0NofzSjon/
 0ui3K5MOT7HZQHzAlNUouX49AjEGcp1TbsIEf0vQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201218102245eucas1p21f557bcc32ab6db9244d6a9a5ed79df7~RyHllobJH3126931269eucas1p2g;
 Fri, 18 Dec 2020 10:22:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 60.5C.44805.5F28CDF5; Fri, 18
 Dec 2020 10:22:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201218102245eucas1p1c0e2cb401d9c5c8bb94b5fb740eaa3a4~RyHlCDju22555925559eucas1p14;
 Fri, 18 Dec 2020 10:22:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201218102245eusmtrp264decddf2f64d1d335b3b158d86f0db1~RyHlBU7F62966629666eusmtrp2L;
 Fri, 18 Dec 2020 10:22:45 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-2a-5fdc82f564c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 62.51.16282.4F28CDF5; Fri, 18
 Dec 2020 10:22:44 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201218102244eusmtip13a333927ae3c06199d1f7d45990f042d~RyHkg5_rS2318123181eusmtip15;
 Fri, 18 Dec 2020 10:22:44 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain
 on Odroid-C4
Date: Fri, 18 Dec 2020 11:22:28 +0100
Message-Id: <20201218102228.16211-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87pfm+7EGyx5JGexccZ6Vos3j44w
 W/xs38JksWA2t8Wmx9dYLdYeuctucWzRSRaLQ33RFvser2F24PR4f6OV3WPnrLvsHk8nTGb3
 2Lyk3qNvyyrGANYoLpuU1JzMstQifbsEroznDefZCr5zVfT8c21gXMHZxcjJISFgIvHpxnPm
 LkYuDiGBFYwSX5t/skE4XxglXrR1s0M4nxkljjwBKYNoWXHnFStEYjmjxP/lz5lAEmAth764
 gthsAoYSXW+72EBsEQFvic1tnWA7mAX2MUncmfcarEFYIFLi1IVedhCbRUBVYv/yRlYQm1fA
 VqKzbxYrxDZ5idUbDoA1Swh0ckjs2HqWHSLhIvH3wUkWCFtY4tXxLVBxGYn/O+czQTQ0M0o8
 PLeWHcLpYZS43DSDEaLKWuLOuV9A93EA3aQpsX6XPkTYUWLWqU5GkLCEAJ/EjbeCIGFmIHPS
 tunMEGFeiY42IYhqNYlZx9fBrT144RI0hDwkXlw6zwIJlFiJx3cvMU9glJuFsGsBI+MqRvHU
 0uLc9NRio7zUcr3ixNzi0rx0veT83E2MwORw+t/xLzsYl7/6qHeIkYmD8RCjBAezkghv6IPb
 8UK8KYmVValF+fFFpTmpxYcYpTlYlMR5k7asiRcSSE8sSc1OTS1ILYLJMnFwSjUw+Sj/ubvh
 SnrfjC/dXZJXXrZExjosEvJy0PScubUxwljc+ovsjtVyUxf8nvhIlTnLsFaO+6zJrLSjeUkP
 +sNUN2hxn+p9qTUxuKt38+vpD4qOFkYFClZn/0rSY57r3aJ2SivTIvjQlilB/43fNXjubJ50
 tErwq2R90Nq3rUovnu24+eTkVa4Z113LF5+Ri+Zg2aRZvP9IwMOjfxPCrAubli5a6H56gj7D
 xLlf1K4tePXiV4u436ltnbpX3zpNPtjSqKxu91DSc8Mi3WKZVx9Z98zcK8LtrCITcjDiib73
 R57TFq4H6gJ3aXEz2mQJXorM4bruxnFy+0MB18Rpr+W9Xt1a/PvA0qXy93o3fSnapMRSnJFo
 qMVcVJwIAGwQc+N9AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xu7pfmu7EG2xcaG2xccZ6Vos3j44w
 W/xs38JksWA2t8Wmx9dYLdYeuctucWzRSRaLQ33RFvser2F24PR4f6OV3WPnrLvsHk8nTGb3
 2Lyk3qNvyyrGANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzM
 stQifbsEvYznDefZCr5zVfT8c21gXMHZxcjJISFgIrHizivWLkYuDiGBpYwSM5Y2MkEkZCRO
 TmtghbCFJf5c62KDKPrEKLFiXz8zSIJNwFCi6y1IgpNDRMBX4ujfRWCTmAUOMUk8OPOEBSQh
 LBAuMePqdbAGFgFVif3LG8Gm8grYSnT2zYLaIC+xesMB5gmMPAsYGVYxiqSWFuem5xYb6RUn
 5haX5qXrJefnbmIEBuW2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIryhD27HC/GmJFZWpRblxxeV
 5qQWH2I0Bdo3kVlKNDkfGBd5JfGGZgamhiZmlgamlmbGSuK8JkfWxAsJpCeWpGanphakFsH0
 MXFwSjUwKS0z0uY2z884kG2ypDDk6r0N/U+DK7WSav/PYdEo88qbYrf0yUQ5PvNCU2s9E48H
 LJ1q9jpbW59+Pdm+eVZajY7uNNFXfhVmazeKM5rPP8V7WF1zF6ta7glzga1ajR81F3oInfDn
 l3ALLSx0Wq7fuNM3REn0k77KzdthukeWfRfSM7j6eErn+/Uc3YfW5/TvCjY2TXywXTUm8PGe
 wEVZEU1n/hhOES1czeW0kctkYfuHSXkZ2WfUj69xXX347vwtaWJ6T5oULHt2yt54GNW+YtJM
 /sksVyqexuXIzl5RtqZULvp59ILLaxa0hPuk5RxntVwiyDNXreDbBMUTzEteX3Jin/7nSeat
 s2aCIv+UWIozEg21mIuKEwFJuNj00wIAAA==
X-CMS-MailID: 20201218102245eucas1p1c0e2cb401d9c5c8bb94b5fb740eaa3a4
X-Msg-Generator: CA
X-RootMTR: 20201218102245eucas1p1c0e2cb401d9c5c8bb94b5fb740eaa3a4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201218102245eucas1p1c0e2cb401d9c5c8bb94b5fb740eaa3a4
References: <CGME20201218102245eucas1p1c0e2cb401d9c5c8bb94b5fb740eaa3a4@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_052316_213778_87771BA3 
X-CRM114-Status: GOOD (  14.27  )
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

This can be achieved by using the OPEN_DRAIN flag instead if the
ACTIVE_HIGH, what will leave the pin in input to achieve high state (pin
has the pull-up) and solve the issue.

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Here is a discussion on u-boot's mailing list that inspired this patch:
https://lists.denx.de/pipermail/u-boot/2020-December/435295.html
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
