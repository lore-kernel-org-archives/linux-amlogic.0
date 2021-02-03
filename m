Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36DEC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:28:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7304F64F5C
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7304F64F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EVXwUUCjcrx/P2Ne9Vfx1g0um0VOU/+PJ6LFNqnXpmo=; b=gSIa3enutugnYeej3y6g0y+Oj
	9rYSNGuZ3H0LOj0NQEL7QYzheFjNkypnUFsaBrqkH1t3/6CtbtC9tXelCjAkVg+f7UvWXucTS1G4G
	Gxc+Zfx4K8lgUeRkvWkaxTABpyuxSdsnoUcjjEAUnzKH8TYbuwpf6VdVpdFIcplP7ovKLW3GHsMS9
	Ac+5n0oOU+Hwv3GN18nNTnsmgsAopfGhWnAh112Bqildz2wEbMEHW5ROBN/MwUxrVqg2SGBK5i/Jq
	kARnErikfhcFuuuCcqrPjcQnfDbTlbOuXebLRhsWaUq1aXzqX+cOtt59u9q6gkxsNoY3hxOGJZ2+9
	HosigoGDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NpY-0001aj-D6; Wed, 03 Feb 2021 19:28:48 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7NpT-0001ZH-Nx; Wed, 03 Feb 2021 19:28:45 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4DWBYg3rdZzQlLp;
 Wed,  3 Feb 2021 20:28:39 +0100 (CET)
Authentication-Results: spamfilter05.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1612380517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTEP42pAAtTlJkhram5r80Haq8CEs/92apXLpm2eAuE=;
 b=WQAyxt8t2Q+yX/eeTeEeHLe5979jKb9MxKYDbJILI/9oS2tGmldg0sjxYVcLS2A3xDEm/N
 1WfNKxGD4ILEOt+JayNF7vGr6yUtSyklWHdYKvb/LRU5zJIOKh95d2BVjfuCVsKK8iROOi
 SnV+/B9Vd8+qST7LrsX8iy+MDDoZaNqo8uK6gARMQ0n0cHnjzZyd4Vj4sXo2KQJK3+6x6D
 OliDpNjb2ntlI/KgafgGqgL2p/DIVpiHTWoa3yFUPbF4n0Y0RBaswzpagxEMvStJ0+IpU/
 mfGmDwbktFDbV6x8oc3fVykZU5J+eIfaIxCbooM6i5uLSrRpqMTQhoffK1MBAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1612380513; bh=k/KQpwU5l6X07qudDANfk+peT0DOl4MN6
 cwNNLjnrFo=; b=s8vMDdYxAzImsA2ULMAF7WUHvWAqnxTn+t2fVaKQLFZRpl74i
 hUYAVzyPUh3XyKcswqa4kEkmKK3Qrcp8UWOLhaF9Y27lMilGsFxe9qx88eepvsrJ
 Zn2aunak4vgECDvAdkwZ0s7Kr9tg69CZ0uvIrPst+cpl3jSjp2FvrFVFmHa1vjkL
 aME2lOJ4BrtaGefohSEt/cw7wpWy9TOOY1/Cu0Idw4H9n3EdQKCRaDn2EnFypWdr
 8oqmx63PdCU/e15VNAzogg6k/nJ1YQN2uBxoZrveKjBckyINvO21N052/YNYu9ou
 e7Am64BeLPwjbKLXh0WdGXFKrQ7pqj2cR4kwA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id SrjyZodiK7AA; Wed,  3 Feb 2021 20:28:33 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
Date: Wed,  3 Feb 2021 20:28:24 +0100
Message-Id: <20210203192824.854491-1-alexander.stein@mailbox.org>
In-Reply-To: <20210127230852.66686-1-alexander.stein@mailbox.org>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 2.66 / 15.00 / 15.00
X-Rspamd-Queue-Id: 3FA7617EE
X-Rspamd-UID: 8e3ea0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142844_169769_198D99C2 
X-CRM114-Status: GOOD (  11.21  )
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
Changes in v3:
* Added comment on intented ordering

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9c90d562ada1..f9a42f45ac52 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -17,6 +17,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sd_emmc_b; /* SD card */
+		mmc1 = &sd_emmc_c; /* eMMC */
+		mmc2 = &sd_emmc_a; /* SDIO */
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 726b91d3a905..59d11f65c7b3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -21,6 +21,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		mmc0 = &sd_emmc_b; /* SD card */
+		mmc1 = &sd_emmc_c; /* eMMC */
+		mmc2 = &sd_emmc_a; /* SDIO */
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
