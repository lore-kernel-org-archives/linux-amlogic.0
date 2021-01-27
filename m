Return-Path: <SRS0=O9cP=G6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39C9C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 23:09:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607F564DCE
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 23:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607F564DCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a87iHz5qTXryYcffVEHiAnJ+XeHgz0x9atI1DbfD2gU=; b=T/N9K/FQu9l9GMVf75UUugGA+P
	TWFYo+0ZL15W2+azNdWjHbq9/E+d+/tQfZuHE00qhbHCv+xsVilqBh95YQAjgLNOOqrtbXHgYDIM1
	4hOkpZ15gT03wpzr8rPBb99Hh7pX3yq+TeiZk9SPYHoZ+jl9x1nk1d4xq7CQvm53fXjTCWiOI4Di7
	uvFag4n8pU7zE6hA8oiE7XdNImmn6wuyn+EV5Jo/HGSm7zQeJXCR72OdVEuSbAp1HtTySTwEeu8sU
	3cpJsUX2A54uJu/yUSZPooDi6IODVoyQRMztcuc71/XZx2x7sLrtGpXFfRUEeoFZPrqRaaGN4x8ue
	zYyXYvvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4tw7-0008KH-Co; Wed, 27 Jan 2021 23:09:19 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4tw3-0008JX-H8; Wed, 27 Jan 2021 23:09:16 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4DQznN0N9JzQlSZ;
 Thu, 28 Jan 2021 00:09:12 +0100 (CET)
Authentication-Results: spamfilter01.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1611788949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iakjquNK7HYnd1DCscrW5kS7Mx8GAPfD6iE+TUqUVtM=;
 b=UBLsQ+7b1p/H9RCmdPdYfpf5OjRuh+dxFplCIllzkUeTojVvIxc05FbJlNp+pUhlvbrh+E
 pU2xPJRKKdsktEv5HZ+3Yn/lmP9DDKT+l7BlFwzqeRGDz1UGApivq8F+sXU1YU7d+ao2R/
 N1unGUWthhBd6oqqsMd59Yulx5NU+HtajEfQOe3ww70hWL1cMOqdDh+q+o4NyGy1cGUyaD
 8/1uplyKUk2Amr6a4drrf/eYOqfFDjBpssYCinACzu8s9A01ILSw5SOvjgrDSlQx+ZgZ1K
 psZlcqTn46h03B6hiZEvwzEnEEG6iHtZKs1oX/grO7GLkeHq5BapYbH9mOoz0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1611788948; bh=ABkA+fHZ9253J6mSTrSP8NlLDK9jdpdiq3bS1bDGFpU=; b=Q
 OlPCaew9GZVmXN7g38CfE4/4JyuMr6MyMW6wajUU5yD1ChdiL0MwFCUFBr8dHuKA
 h7+ohK2eEDEtaa5kfkY83JKf7rn2j9pzbe7V5bFhyekRnYDEkhljjw3OYgA9y/4a
 onssZic8BfH4veACQe0nqCx93c7lJlzzEPToYMpxFS4mtWISNIlgMJgsc+XYqQSV
 mviuIAwXummPFx6FjODXo6mK8ubsLXSCxXtl5jE7TAbsnVwbJOSBSp7KgYJjJEPa
 anm6RafnJlWORdjkZj6DSIhe0ZMaOic0QjKVN5QdVm0WR4hadhYzvH8vGbNxUeNQ
 92hT+EBXw7Yl4kdhiXU1A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id O2P3hU2O_whI; Thu, 28 Jan 2021 00:09:08 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Assign a fixed index
 to mmc devices
Date: Thu, 28 Jan 2021 00:08:52 +0100
Message-Id: <20210127230852.66686-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 2.93 / 15.00 / 15.00
X-Rspamd-Queue-Id: BFE2D1856
X-Rspamd-UID: 380767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_180915_986478_594E8084 
X-CRM114-Status: GOOD (  14.37  )
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

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
I was wondering which order I should use. Depending in your booting
medium (SD card or eMMC) you 'want' one or the other as mmc0.
In the end I ordered them according to the names.

 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 050862cd0996..2faa4da917c1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -13,6 +13,8 @@ / {
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		mmc0 = &sd_emmc_b;
+		mmc1 = &sd_emmc_c;
 	};
 
 	dioo2133: audio-amplifier-0 {
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
