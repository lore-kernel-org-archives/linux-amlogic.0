Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B32DC4363C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:07:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73BA2076C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IX8sJtMD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XpHsc9NM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73BA2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FBH8uDEYOQx8banmnC34yfBetsI0BdlkO1FBzjl62Vs=; b=IX8sJtMD49naXhLJpIYFtmOo1
	NllxjA7py4nq/T8C+IdinYdW7SBdXIul7JLXwRTIiqkHdqRDmWcngt0tL2/mv2xXYihMirg+n8LYr
	pbHmf7dNwUs50hcOWF7OOJZUNGLoFp5icm3yltWoVVGu3qM26fGkj6nWyHGpXEhuPnqqHDsYaBV+0
	SQ+3tiDHOFY62y2ftexVMqeDFBtDXFOPYRMgGzPbpLPKLBZEXPY0ufvYBehHLE3neZtf+e334aKr6
	jS4/uUkKP99H256qm3sigASCe0rJd/WtJjb/r6hqECuv8fVWXInvvNtWit6z12PAVatm9lEXhW0A/
	XlIzpNo7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6LY-0008Mj-DM; Wed, 07 Oct 2020 10:06:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6LF-0008EO-TF
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 10:06:40 +0000
Received: by mail-wr1-x443.google.com with SMTP id z1so1459217wrt.3
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKGC4aJ7pVGKjgcA5u7g3Rhoe0Civ0MEouVUNdh999U=;
 b=XpHsc9NMXnH0fXij5AfiKNqZa46H+xqUjDFSWAiOz/Yc2UBExH+OlCULSsM9CQyaRW
 fGa1BlUQo9Mp2hJd8VB8/jb7sTy0AbnLzgKT+T4TlzwvMpNoXf3EUcctvebFCIavwQpl
 VcLfEwiCKH5YzKiN/rHeoaznRqT7FiV13K8IBGYuVPBCK4UecSRkmzgaulepDw/4OdTH
 9zNd5qGCsZF5qxcxD3y6E1+seSqIYHQT16OtlP//xZ/zCLS2JXWrRyjkqngqnx9i4FXo
 zSHBvi0JZ4xm0Uu8m5Y/HoUKAiMxf4BHt6ps33CH3+TBkU42iE3ExQdzuwPEQKoFPgBR
 CkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKGC4aJ7pVGKjgcA5u7g3Rhoe0Civ0MEouVUNdh999U=;
 b=XCM3RplLT4D8la8ChSozuTgX0aOjrDewXA5bL5tqOG1+MLUBYOcD2I9jdDdCgGiGQ/
 0Y0qhHz38Bh16VpD44qOO9rPNNiPPqPRlHM2k+CtDTT4ThgZlEt17JZBQMS5AatHq2Ff
 WevQ7lAtgwTE2/wcus+wLBONbdy5osWYmS9jT1D55fzAMsYUhB2eGE9GTi76pvvFAJoA
 EWZRnyPflc1M75lmSUtbSoRg4KRLqoOxqx600AoDDPvjmpckwPmPGUWqDO33+8jx5SmA
 OymrdtZniYVvTpPSlZX9uNUy467bX5f2wmib8aD4y9tdAVorjqB44eg9gBbovEz0A1gN
 eJGA==
X-Gm-Message-State: AOAM5314HXZ8cp1XqONDokaNzKgC/8fKbgal7R+sB5JoeGPPn5D50TDV
 rv+EkRibTaRAGoYWW4mRCbwa0g==
X-Google-Smtp-Source: ABdhPJy9x6oJ00YrXuOsPfoIio+5ofoiMcKffI+3mUrb4UJzBgSZWFtDkkkNLpiwpP4elSP0PSXASg==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr2503089wrr.377.1602065196705; 
 Wed, 07 Oct 2020 03:06:36 -0700 (PDT)
Received: from bojack.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h16sm2214981wre.87.2020.10.07.03.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:06:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/2] arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots
Date: Wed,  7 Oct 2020 12:06:31 +0200
Message-Id: <20201007100631.192348-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007100631.192348-1-narmstrong@baylibre.com>
References: <20201007100631.192348-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060637_951598_E29EB1F7 
X-CRM114-Status: GOOD (  10.25  )
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

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 84129abb2399..96c384a7f49f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -395,6 +395,16 @@
 	};
 };
 
+&pcieA {
+	reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcieB {
+	reset-gpios = <&gpio GPIOZ_10 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>, <&pwm_b_z_pins>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
