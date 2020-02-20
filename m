Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144EAC11D05
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 15:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1545207FD
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 15:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F7ga2efo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsI+M80q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1545207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=A9mylLHLu2PyMi/TbY8kDlX9lOxoZaizV7tzJGB32/4=; b=F7g
	a2efosEp5wesKzloPYoqKvYmSREfFU29zIC3g7pO8CwhiZeG0mAUNaYr858YWboBdKMdYVYG6Jcyl
	pcd+Qulbae0UVycF50eRBNuwLpc9QDn00U00bgLkjc89Ds64fnh6/U31g9Ppuhx+cRsV1Ok8OyPPW
	f8jctog+j+Wc76+6NyHFHxxLYRpO5wMlTgRwz3BGGst8mOrIMMRLbkCCxxuuwC+GdMTkIMkoNd7SR
	sAKN8eBRcyjeR2N845gvrClQc2hOBUWgUY6CoCeffvgrA9O8OWyoSftFk+eFMeE3R7b6/979bHRxb
	p4GUu/L+Pg6+Wagpb4i02qDD7qXvCyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4nqB-0007vV-4J; Thu, 20 Feb 2020 15:34:15 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4npy-0007mY-CS; Thu, 20 Feb 2020 15:34:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id h23so4673696ljc.8;
 Thu, 20 Feb 2020 07:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5019G7yq0avtfjWMAOLceayBMfSqRFTAMAXEQqHSZug=;
 b=PsI+M80qxN2gYjTcQsbtfNJtVJnILU6F6Pv0qT2SjfyhK7SbCDRjMkVsmi0o58N92h
 jo1mk5IJLbW1Sk6MFhu5ArFVWD8JLaSvfqyMXdkjA4LpSPjO3bML7zdrgMZSzLXpCZRp
 8iycMu+EvI+4tGPi/zOrMKWYEQV6JJ52eBc36UdfycUYYNtzG4qAYMCLxmgNHL+J2dzQ
 nIMCbMTBfJL4irXeigijEE8IoCits1/LDSTG3cC8hRebJB11KN/PN9LKSCySNQX9hxAq
 txCc9nafhCKlncTgwzei8TsKc1XsE1RrwlCyMERKM8EtDl/N/oaV9svC/1PI0UvfO0v7
 G49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5019G7yq0avtfjWMAOLceayBMfSqRFTAMAXEQqHSZug=;
 b=YHCjmQMYKuKb6bUywI1g+Nm0CZtqF2Rl907WWXhFFXs3YMkgjSz3qUGmHIuNsch+xP
 qWYCqrEbUWBGs/oV8LWw83eCk4zevB3ctvFgMlkDDrDGY49TPlHclrbefHiynH6z1d2/
 eHEv1cTbNtzI7bTlwIZE7evymqizDrLKQvSkmhjwryo2avWwgR1fyDAt0PTq1zS2X7jy
 L4WlYHeP+7CUJzJZYnvxm8WF1iLeFl6qt1Yj2mq/5XL5Oa/abarevMR+T826wB/UMXQT
 TdTqz9LbFAEf8Q4cbjN9kkpZ3MBamGwb+lz+qAa79VGhi+gQcaPZXJnD7yMUdxKTt9gH
 xp1w==
X-Gm-Message-State: APjAAAXU2PZW8IMn5aslNLWPoJHBhaVw/DwjamWPKYzAh9NjLHRTtPyp
 jkWY71o1VbC/X7CopCwD++J/JGTmweQ=
X-Google-Smtp-Source: APXvYqxaGUst+wKhSuMt86KQ7TYw1ssovVjk09fGgxif+X+Hf39ciAP//EaX7mfFGKuhhUseY3kzUg==
X-Received: by 2002:a2e:8698:: with SMTP id l24mr19404158lji.94.1582212840413; 
 Thu, 20 Feb 2020 07:34:00 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u13sm2162285lfq.19.2020.02.20.07.33.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 07:33:59 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: fix gxm-khadas-vim2 wifi
Date: Thu, 20 Feb 2020 19:33:10 +0400
Message-Id: <1582212790-11402-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_073402_448166_E2D5521C 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Art Nikpal <email2tema@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes: adc52bf7ef16 ("arm64: dts: meson: fix mmc v2 chips max frequencies")

before

[6.418252] brcmfmac: F1 signature read @0x18000000=0x17224356
[6.435663] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
[6.551259] brcmfmac: brcmf_sdiod_ramrw: membytes transfer failed
[6.551275] brcmfmac: brcmf_sdio_verifymemory: error -84 on reading 2048 membytes at 0x00184000
[6.551352] brcmfmac: brcmf_sdio_download_firmware: dongle image file download failed

after

[6.657165] brcmfmac: F1 signature read @0x18000000=0x17224356
[6.660807] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
[6.918643] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
[6.918734] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
[6.922724] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4356/2 wl0: Jun 16 2015 14:25:06 version 7.35.184.r1 (TOB) (r559293) FWID 01-b22ae69c

Suggested-by: Art Nikpal <email2tema@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index f82f25c..d5dc128 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -327,7 +327,7 @@
 	#size-cells = <0>;
 
 	bus-width = <4>;
-	max-frequency = <50000000>;
+	max-frequency = <60000000>;
 
 	non-removable;
 	disable-wp;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
