Return-Path: <SRS0=GxHq=RD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C36C10F00
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 15:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23AC8218AE
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 15:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4qm/XuV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDpuVZ0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23AC8218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pc+ZFUNEU/5po6d9cZW92YcFw4DxoGhsnrhkqSTsx0=; b=O4qm/XuVnuNZWp
	MPOWJvR4icSmJa1Myp7Z1GbVuUm1XWnelk2yXzYGQfduQf1GGZ3yCAo7zzDPJS5wP3ae8DukfQWPE
	CP66O5ng/xwDVGhA7hpoevneP6DLYCm3+pfkQqVmwpE3YmjCHzocePjrADTBgOehGtn7AoFKHN+wT
	wY6xhq5dKeKd5ZbBHLHwIQ9KB9DeZ9DoKttsb2uzU6bk+d9sS/Ju0eHm0nklyWZuY/9jYhSlBUgb9
	p32UubO/DKDl3JPukvtqLkEykH1437FARqR73xGco7E3kZRmr4A0f9DYw/hkaf/gnu89W4yY84SbW
	qckqQ1Rn+benRpKz7wFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzNIQ-0002d3-DB; Thu, 28 Feb 2019 15:08:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzNIM-0002ax-Rs
 for linux-amlogic@lists.infradead.org; Thu, 28 Feb 2019 15:08:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D08BC218B0;
 Thu, 28 Feb 2019 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551366502;
 bh=3PTBFZ8XtEXLFzv3SCqZfblweenlE5Sk6LrY8xgasGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cDpuVZ0be+zbOBgA38nYt06BJG01TkXMoaFehm4dvTmpMUrQLl54u4CklQEgMDFFY
 +MtwFrAMIDgonVbEdnSUXSXUGu39I/HE5kXzsu6F82IGtg9ZJ51fR59Y0Elhsn+ac/
 w8f1nK0yCjfSl1CgKHBkI0/KWwxOH/oBxLJ2hwqM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 07/81] ARM: dts: meson8m2: mxiii-plus: mark the
 SD card detection GPIO active-low
Date: Thu, 28 Feb 2019 10:06:59 -0500
Message-Id: <20190228150813.10256-7-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190228150813.10256-1-sashal@kernel.org>
References: <20190228150813.10256-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_070822_916329_E1BAA1E9 
X-CRM114-Status: GOOD (  11.47  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 8615f5596335db0978cea593dcd0070dc5f8b116 ]

After commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
tree") SD cards are not detected anymore.

The CD GPIO is "active low" on the MXIII-Plus. The MMC dt-bindings
specify: "[...] using the "cd-inverted" property means, that the CD line
is active high, i.e. it is high, when a card is inserted".

Fix the description of the SD card by marking it as GPIO_ACTIVE_LOW and
drop the "cd-inverted" property. This makes the definition consistent
with the existing dt-bindings and fixes the check whether an SD card is
inserted.

Fixes: 35ee52bea66c74 ("ARM: dts: meson8m2: add support for the Tronsmart MXIII Plus")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index f5853610b20b8..6ac02beb5fa72 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -206,8 +206,7 @@
 		cap-sd-highspeed;
 		disable-wp;
 
-		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-		cd-inverted;
+		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 		vmmc-supply = <&vcc_3v3>;
 	};
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
