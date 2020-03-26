Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB4EC43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 16:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CBD2076A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 16:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tx5N02ZZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cZR32ujl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CBD2076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duXOMeXlfcLRgP9nUfxKQgkc2W1Aq7agbzQVwgMjnJk=; b=tx5N02ZZkGYyXk
	J9M0/8xUwyuDiZy0N+2ycTQJPq0AA0sjBtV3QSMBkkuJOEgtg2uxSscuoGsf18cKOGrNZy2y/2xgF
	Xei6z77kjcFLbDrvwwsgnr+5zO5Z57+ADHfDvy7j66vlbH4WEv2TydNjNHn+dSkQTW4Tj3uOhXOkM
	qjHjfchHEMXyXt3yCGT/K4lJ9T6sOYMBSqwKqWzBjLQiV+SX9eh8vB/2G3di1PFex3LoLHtenWVpe
	uYJrOUd6zqWnR4EDmbbYD0bFSWI2D/jgyNDZiSC3VrbOJgwinRlWJ0thNRe5b6KHK+9zKExdUBosf
	T492h7JBSXbXr2E+WXfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHV4K-0006QX-16; Thu, 26 Mar 2020 16:09:20 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHV44-0005sm-7w
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 16:09:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id a81so7647246wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VC7vCEcb96NN2X+1RtHiNHbQQNd8PYk2Ufc78Q16YW0=;
 b=cZR32ujlzrt8nUTq/gEyjjkJGk+dPyP8jr5UHD4ls3MRy4lbAmaRqbCN7tlou/2no1
 JETsTqOyEGxkwRCFNOADjJEfIVz3k9pwZTXPaPd4F+50Dabej/sUfPhxhLdQLR0Oe46O
 UFnrlYKd86NJJ+1xYrWV6VoLRA07JelX49Gb1bTyngekW71boQFi49dkbNm/Cwu0C6gF
 G8MRp0rUvLMQYmklI0DSIQMQcuErKgZ1NzRxmSJtaAJesQ2ZX9WnkiGN8vO2I0hAirlh
 Geb+3fvYOOp90SslSoRL63PkOVDdx8bxdApTh5m+fihST6gFtkOprJQgZoXywZqXLeQp
 tBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VC7vCEcb96NN2X+1RtHiNHbQQNd8PYk2Ufc78Q16YW0=;
 b=VidBa3xhV+9RFLV/xtEUYtlr1TnkpbVOjDuuX8QVpADTVmoaLavUZm+ROFhMYIDbn1
 NIlGS68aUub24sc90cMuc7TYwdHYunMjTHKNFPj+Vm7negYxLQet9Kb6a20vTLDlixEe
 oeKe9wTJtsM19cXzR7vrcCb47GbsjfZjZEAwS6ouUFLZIl/ZRaWwSijOCCHTF5IWiC9h
 2rBhpZiekFBGWs4M/K5TMXxcoNl35MwRY3FtUXEogDQmsa0g9lbgfPLR4/ZfQy5cL2au
 ZjUPGYM9bZSxCPGrKDRLEZKcz110C22MUTqU8Dl1FE+l81UqI2BkTFtol245EekooGK9
 d/Xw==
X-Gm-Message-State: ANhLgQ3C4dIAEKQBIhdkieR1rfGdBfAeEXkagM79L1NLReLclonSpCqS
 O5x881iVgQFT6abLz7eUlPyuVw==
X-Google-Smtp-Source: ADFU+vvs4kfivC/L5cN2+Rsomorx8j0QPCI1Qh8T4ckH7E9bvg+e8mxFZQeR285mqAeF3KF8/kF9GA==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr672257wmj.59.1585238942853; 
 Thu, 26 Mar 2020 09:09:02 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id z188sm4093511wme.46.2020.03.26.09.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 09:09:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] arm64: dts: meson-g12b-ugoos-am6: fix usb vbus-supply
Date: Thu, 26 Mar 2020 17:08:56 +0100
Message-Id: <20200326160857.11929-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326160857.11929-1-narmstrong@baylibre.com>
References: <20200326160857.11929-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_090904_294727_3FC225BA 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The USB supply used the wrong property, fixing:
meson-g12b-ugoos-am6.dt.yaml: usb@ffe09000: 'vbus-regulator' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Fixes: 2cd2310fca4c ("arm64: dts: meson-g12b-ugoos-am6: add initial device-tree")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index 325e448eb09c..06c5430eb92d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -545,7 +545,7 @@
 &usb {
 	status = "okay";
 	dr_mode = "host";
-	vbus-regulator = <&usb_pwr_en>;
+	vbus-supply = <&usb_pwr_en>;
 };
 
 &usb2_phy0 {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
