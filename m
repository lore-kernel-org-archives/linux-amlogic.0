Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F78C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ABD0214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJ6swWP4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZSHKMJha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ABD0214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5iP7/0EcvOXKJmCpUp8unZziKKyvLjRKLBJ5666SVeI=; b=JJ6swWP4+zUMt0
	OIuF1z9Bw+NRSZHoiaG+tNDvBbkSUU1t8vavLgEgxN2TTdks4yUnSP88wA1mPCS4myW79Fhd8yiBQ
	my67jQNVMeMo16Eran6+VK7Esb9Stf6l2FWLkJvdV6QLkKcq7ha5pj/em5sY6XGbcErTAQJ7wsA5/
	pdDsQPfkAY8M4DkoihQ10Vhfrw2HLbYCrT7+1jQS9WqFv6MQ1bh2kwcMOoZQgQEE8hEbhF8WRXILU
	bwna9121KiEejFdV5RgAKEqAvQrofNC0hV5va3kwWVPv8XQEM0MWC2p/adm3eeupw6WAyQralHiVe
	F+Sotew4NWog/Zm10yxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx96t-0006be-77; Mon, 12 Aug 2019 12:07:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96p-0006aP-RW
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id n9so104454152wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMduQLcYqJa9E1xoRdmMO8whZQuhJA1DUXAc3zPrO3g=;
 b=ZSHKMJha6yfzKyUtd06NcDFZ3gN6HThtYSZHVhI1dWDon6ToPzcz/3Own8XjxQ6mgY
 cNZxnu/TVZ+61qFCnUFdEJLOgky25gQCDhsH/+hNfvo1/tuwRFVAYIZ0rlF6tlIm0KyF
 iUCMnmfJERpt/DBw38nE6bUD0UhHm32KkD+TwpX8kS784VDRNuZ4zM0XGH1+eHhHNIGF
 rfG1P9vlqoj1SknmEStYhp/BpCNJvZPevmhinSS3o/GeDoPPCkItQDqi5o7p0o/Z19H4
 V/l1fiLnkQUc1tJTXSRA6hZMqewIKizbra1XnWkTwB1TSx5TgqY0slk6QhUZjZoyT3JS
 G5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMduQLcYqJa9E1xoRdmMO8whZQuhJA1DUXAc3zPrO3g=;
 b=ZzoEkAfgvzBt1SSmegsftsbgHjf1TByxUeY8+YkL/PD10vSL+/65ZXnOiwpstAyU3B
 0OoZlfZxYpevOvX9sLCJgwlHMa3qmh1EegK1shgHC/SBNY+ElYOIhdMQdjuU9T+Y9hZs
 X3vss6ftwbrZCGPvDeiqONlXonNklK3+z/e7KlTakZVMPhyiWmnME8Fp5rI7ByW2T5bU
 Mo8/33NEBpincDS+HVl9cJhB5FU6X6mPm9FeS5KGM72JbfBC5NfkxqPzVcMpwFgGCb7p
 ntogFGkWTRPHqE7jhV0W839xTc6MGuOkSh8RtO7Gd5hAZAWCoeTo5KrvH+BGvcJRTNfI
 JgDQ==
X-Gm-Message-State: APjAAAVJkiqfIEGTgm+OJf2a5uYliLAThNfw5kGQSbpP9xqWwxQ31QIO
 PiJM+XNdOlmpcuId+xj81MA2mA==
X-Google-Smtp-Source: APXvYqwBXFdcnSm3N9WSnk3H4/5r6eeqaMC73NAcum/+jEQe399Q3DLr4ex5iwjbxozzlPA6mgZt0w==
X-Received: by 2002:adf:e887:: with SMTP id d7mr24777870wrm.282.1565611649905; 
 Mon, 12 Aug 2019 05:07:29 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/8] drm/bridge: dw-hdmi: improve i2s support
Date: Mon, 12 Aug 2019 14:07:18 +0200
Message-Id: <20190812120726.1528-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050731_961110_1FFE105E 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to improve the support of the i2s
interface of the synopsys hdmi controller.

Once applied, the interface should support all the usual i2s bus formats,
8 channels playback and properly setup the channel number and allocation
in the infoframes.

Also, the dw-hdmi i2s interface will now provide the eld to the generic
hdmi-codec so it can expose the related controls to user space.

This work was inspired by Jonas Karlman's work, available here [0].

This was tested the Amlogic meson-g12a-sei510 platform.
For this specific platform, which uses codec2codec links, there is a
runtime dependency for patch 8 on this ASoC series [1].

Changes since v1 [2]:
 * Fix copy size in .get_eld()

[0]: https://github.com/Kwiboo/linux-rockchip/commits/rockchip-5.2-for-libreelec-v5.2.3
[1]: https://lkml.kernel.org/r/20190725165949.29699-1-jbrunet@baylibre.com
[2]: https://lkml.kernel.org/r/20190805134102.24173-1-jbrunet@baylibre.com

Jerome Brunet (8):
  drm/bridge: dw-hdmi-i2s: support more i2s format
  drm/bridge: dw-hdmi: move audio channel setup out of ahb
  drm/bridge: dw-hdmi: set channel count in the infoframes
  drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
  drm/bridge: dw-hdmi-i2s: set the channel allocation
  drm/bridge: dw-hdmi-i2s: reset audio fifo before applying new params
  drm/bridge: dw-hdmi-i2s: enable only the required i2s lanes
  drm/bridge: dw-hdmi-i2s: add .get_eld support

 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 20 ++-----
 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  1 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 60 +++++++++++++++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 37 ++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     | 13 +++-
 include/drm/bridge/dw_hdmi.h                  |  2 +
 6 files changed, 108 insertions(+), 25 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
