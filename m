Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBFEC33CB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 18:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E31122522
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 18:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CYjbdVdw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOJnMFrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E31122522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0GFPDNiXkrtgEDHeU6cfMcb1z2lc95M0Dy2ZDE7a60=; b=CYjbdVdwr7TtBb
	ughm3bUHNJ2d+t6l3PhGPcMjLLtMhMY1qqSxwcxmv6UqQatSVp5ghXhX94ZpauMevWFPVS4p5w/cX
	5vRbUZqREs1ALCffiFP84FtPbki6mQspn7uWqqvdPCNPz6+sZ7sgP1JkLNWm8FcHQctdHZMJ92ktz
	EyqbpiyjPXt5c5aaKu94hUdQAEwdqwZrNPZknOWQkeTvkngRCYBVxw1lU+iqe21Be7fvSCaehTPOP
	inltx7FSYgo+dVaWXlEReoZiC3k8bgxf8pO6isaFBpxmVSicDWutgV9Vcvee5Z/S4mY6MQHqRwwiU
	2n7cdOLB4KWLcBF5SHHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9UD-0000EK-Tr; Thu, 16 Jan 2020 18:03:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8vU-00054s-I0; Thu, 16 Jan 2020 17:27:32 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84399246D7;
 Thu, 16 Jan 2020 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195643;
 bh=Hdh8DO5a63wF12YPbp0gG1po4zpP5uaPpT11980aqVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EOJnMFrDMLHRXnSU7lDRClOfdPnXF/3vN2YYYXgmqhyYrThu16yJq/OfEb6+Foa8g
 jU4NJdXWzOzSQN7iWfMiy3pX2xGmgcO13QwRJAlamcPVlWjNgijVHQUORjOVTqG4V7
 3YXWSiO8UF1GL7aA7+zSnpPPV+Jt3cejJwtBpZOY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 207/371] arm64: dts: meson: libretech-cc: set
 eMMC as removable
Date: Thu, 16 Jan 2020 12:21:19 -0500
Message-Id: <20200116172403.18149-150-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_092724_990331_E3C24112 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 9f72e321d5506fe3e162a6308a4a295d7f10bb5d ]

The eMMC on this board is add-on module which is not mandatory. Removing
'non-removable' property should prevent some errors when booting a board
w/o an eMMC module present.

Fixes: 72fb2c852188 ("ARM64: dts: meson-gxl-s905x-libretech-cc: fixup board definition")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index e2c71753e327..407d32f4fe73 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -226,7 +226,6 @@
 	cap-mmc-highspeed;
 	mmc-ddr-3_3v;
 	max-frequency = <50000000>;
-	non-removable;
 	disable-wp;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
