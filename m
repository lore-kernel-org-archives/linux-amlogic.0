Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05391C54FC9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 16:42:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2357206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 16:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kIyE/f7g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cC3hjgLK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2357206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2yQLTgLwNQc82h7bWAwC/ZpGzIq4eF6w03dDswg2HW8=; b=kIyE/f7gHBBMFy
	F8NOXIHGkbGorXEwDVRx+Q50DshWs9HcUeMqPD61Ef4fmmsJdT9bksLycOjWlJB9SuoN1EzLtO4bN
	bItSl1bltNhDr66kgoLM4AhvPFlC6eLuV5ecYNiP7FnLK8OnxKJmIHPd93f0xgeiWgskPEIeYEWaw
	PngWPRgExnHHJdnZ5ZZHkvdgV3NKZ/D6McIX/cbfa48vaS+XqCUax5GhnFugFVDQ11EIFiMupCq41
	c4RzTgkRkq3g/FEO7EoANtp6cF0+3HDAp+FFpiMS8JHZAiwuMKNKWzTeD21bL+LHv9KuuW2LwQqY3
	TAaS3o6wnGUPN19hfn4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQvyL-0008Mn-4V; Tue, 21 Apr 2020 16:42:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQvvx-000408-E6
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 16:39:44 +0000
Received: by mail-wr1-x444.google.com with SMTP id g13so15156197wrb.8
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pD/cklajXrTQwt9/i5DAty8o4fVAa/YnpTHBgrSpmUo=;
 b=cC3hjgLK/ed2VS7t6nroMpSd45uSi3v2KkxWLH57GmFzchId7vQD+xE75Cy6pC+J2t
 lI0tk54G+L7wk8fp5rDFWdyVIYor0pyA/Mnb6PDKhnkLdwtJGTFlvzi1jVWH1n69PkfO
 3Z4qwVDkhJzBzxKjoZoIANPzGMuVeUb+n5I9DuhKFdprbT49RWM5326NFEqO4nrS/8oV
 cWOpLbSVVZdqvE9IvrWHNMws7DLr6a+Txmf2zG1cN6LHVwF0AgY9Q0v5dXcxMynigQKD
 Dc1SuB9Rul4UYdn1bALQCRCnUugovCUySmVINrDIdSF22my2Vr/d5yfF56kXEs/r71DN
 lGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pD/cklajXrTQwt9/i5DAty8o4fVAa/YnpTHBgrSpmUo=;
 b=Kqkn14SHOzuiwIDlf9bNdbPl5umVnm7ZXQp2Ea2c+0Yox0GTD9YAkb708KGiXaqqQK
 i2oE2dIrYrnKbOOLf9mJHcjHIwg87v6I3j4Q3xCH8SpqAVT/3mHxCuaN5ZttEVuNr0Gp
 ux/Kn5OG4MQV0W6yVuOtmbznEgAJIQRSauhhho3mDbLChF1q/YjBP5HydV8hDExeqRJb
 FP97B56vj0p7DJvP35TUaP94kDViMqHNrFOGLun0PAxDUsVKR24kfJqvL/AUfycsxU2e
 9VecGkWDib5gIhRiq7Cf3BTofDjCsO3lCp0mEprneURlVUHBZZuLVZOLfCk84M3Z/jfE
 Tvag==
X-Gm-Message-State: AGi0PuanZMdwKZ/YVX/5cTid42Rvua/B1lsMzzDKFKgE6SuA3aTB59F/
 4wv/byEvcTIHVK2YMXG0Kznr0Q==
X-Google-Smtp-Source: APiQypLFS/luRYy1vtvb9oit1ZVDhPgOb4uA9Tjl0mXJJSRx+3VINZ7T+gVV+hgdxPvZr8sDYsupMg==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr25248133wru.352.1587487180151; 
 Tue, 21 Apr 2020 09:39:40 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 33sm4578513wrp.5.2020.04.21.09.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 09:39:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: meson-gx: add initial playback support
Date: Tue, 21 Apr 2020 18:39:29 +0200
Message-Id: <20200421163935.775935-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_093941_502672_B6D87D01 
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is adding the aiu support in DT and well as basic card
support for the p230/q200 and libretech boards

I was hoping to provide the internal codec support with this series but
this is still blocked on the reset dt-bindings of the DAC [0].

So far, things are fairly stable on these boards. I have experienced
a few glitches on rare occasions. I have not been able to precisely found
out why. It seems to be linked the AIU resets and 8ch support. Maybe more
eyes (and ears) on this will help. If things get annoying and no solution
is found, I'll submit a change to restrict the output to i2s 2ch.

[0]: https://lore.kernel.org/r/20200122092526.2436421-1-jbrunet@baylibre.com

Jerome Brunet (6):
  arm64: defconfig: enable meson gx audio as module
  arm64: dts: meson-gx: add aiu support
  arm64: dts: meson: p230-q200: add initial audio playback support
  arm64: dts: meson: libretech-cc: add initial audio playback support
  arm64: dts: meson: libretech-ac: add initial audio playback support
  arm64: dts: meson: libretech-pc: add initial audio playback support

 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 63 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     | 13 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 23 +++++++
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  | 40 ++++++++++++
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  | 40 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 23 +++++++
 arch/arm64/configs/defconfig                  |  2 +
 8 files changed, 244 insertions(+)

-- 
2.25.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
