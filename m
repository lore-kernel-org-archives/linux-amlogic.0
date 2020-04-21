Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFECC54FCC
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 16:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9166E206D5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 16:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rth8jsKj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d3Xyj4aj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9166E206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THOYallx2/Rgt/TcHUjYrh2pupM7BmUwaYwYfa3fxWc=; b=Rth8jsKj/3f9P1
	U+0fVMRHtClndhenp5RNr8jboNFGgGXSNYQdcr18m6579n6RRMyfOQcMiPmdQpG/lymjqP0cWv+wL
	maNO1rPzWKPliy0JxY9V9IzEetivU+HYrtKPFxv/LSoLj5aRwHke6UJzMvYKqaAbzZ6cW2f1LPUp9
	IJDDtZLxWec5f4joDGAjg+5et2Bb6tU8Fm/OOipvuB5vdyVntbJVIyjuDPNpTTtgV1pf4RSmdhyqR
	czf/+bowyTqZ+ZIfSA44cDD0MRaaEOAjr+67nFUU7wfUQlpurl3KChqSeNM0CWgT9+cLYdgRtELyD
	hSmef2U1o/sbF7WEX0Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQvyJ-0008Kt-9Q; Tue, 21 Apr 2020 16:42:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQvvy-00040R-C1
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 16:39:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id v8so2940057wma.0
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjTbuYPEFcU0U4OECuT5PrqvnAvjV7VLa//AWxImO1M=;
 b=d3Xyj4ajd+lNe2Yla5AaKccqqcqtk0Iz3EHvzeJjwKUWWHTbdTLdrrY1dcA4V/IMJn
 dThxhXjNPHkiWw9V2dZtJCnITs0dLlPWfX+2MKi4Vl1xY/M7DebBqyzx3dRrc3iq0pDW
 8uRzgxojI25hPvLoV6XsDte/pRZlRXS5tSw9StTaaX/Rg6hfcjB1tBdHwgsQ86e35Oli
 5qNRbf4kA7v824A6jcw7sQXgBkI9W5g5Ti0+0/WHEQ8KK/nuL2dRRerMT/9qC3chEPWx
 Xl8dGMA0xmBzQomeIScJaX5Y/oFKQLbqNQ6BNknocwV9m4KCHUyZCxIog7J6D3L97uF+
 55vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjTbuYPEFcU0U4OECuT5PrqvnAvjV7VLa//AWxImO1M=;
 b=tj96lg+E8JX/HYPbU9v+ljrqkpjo1L/bB55z+rrWzdMpxa3RsH0eYFIA/i04tB5mGa
 +Etq4YrZasw8x0FQ5huaoDphGNplAhXfwbuk+FE+BMnl8Xi92go7Dsr95UBAkDjdzU9f
 Sgoab9UsBv2v4i05CyOgq2KgAFhOOJxV7o8zclEpc8CaLU+Ycz34Xa1GIN92BSx9dB9D
 rH9hietXPJgTt+FkwtPkyfRZ5Ak7O0Ul6PY+ZHkEuYDrUm5u4O2KFIynB4LyK4YtZ42d
 TBs+JpD7BrQeYF/WnN2m28hwA0vfpnSSyS+h3/JO1pql4uCqHHkN7l6KHPiQ02GYp9QO
 9GSg==
X-Gm-Message-State: AGi0PubjMx9Z86wArVyzv/8rDgiY8ASetDkWlTUw8EZkFa+wnYxRb4Hj
 HGQNX8MzJgEqtD4PD8AEjyUGIy+tqDE=
X-Google-Smtp-Source: APiQypIEYVjjAN5yphfyYI9bU9htSd8C5M9wv71+rqnmDicyNKccfSJtVpI2e+FtpT5ulSrAG71RVQ==
X-Received: by 2002:a1c:bd89:: with SMTP id n131mr5648056wmf.3.1587487181165; 
 Tue, 21 Apr 2020 09:39:41 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 33sm4578513wrp.5.2020.04.21.09.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 09:39:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/6] arm64: defconfig: enable meson gx audio as module
Date: Tue, 21 Apr 2020 18:39:30 +0200
Message-Id: <20200421163935.775935-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421163935.775935-1-jbrunet@baylibre.com>
References: <20200421163935.775935-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_093942_440959_86ADEB94 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the module config for the Amlogic GX audio card.
This module will imply the internal components usually associated
with it to make a functional sound card on these platforms.

Also enable the simple amplifier module which often used on the
output stage of those cards.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24e534d85045..71a6e1309b5f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -642,6 +642,7 @@ CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_SOC=y
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
+CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
@@ -654,6 +655,7 @@ CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WSA881X=m
-- 
2.25.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
