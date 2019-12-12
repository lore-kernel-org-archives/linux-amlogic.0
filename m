Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEDAC00454
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D0F206C3
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="McWapTe/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="swMATU3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D0F206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6tuu+kWXxPn6WeW+FxiKLXt2CWxMtUi3sjAu968j+ss=; b=McW
	apTe/TdCqQXtSnR2wZSc/WQdlk24xnE2y/dHwcUmsUZ8YNqHjs1uaAWfgxPCTxOVdJpxsWlzrtJi1
	s+IiqNgBw656i1r90myHf1AqGdwPI85WLLmvs3QoenKh93WoZQoTeY1nOXqDrzydGBKnYe9hKfTJ0
	IXT6J0fQOdG/F/mf3OWbV+u/6WLRDh82C0Pb81pCH8G8SplfdC5D0+0Yb/fTxg4j305s2qXgXJLaL
	c4ZDs30ZppfDQYFTLWXRLM8m56+8HbMBHTdqIw65bSmUKsC/8x8wq20oT5CgHPlQU/mcJTxtIbv/u
	SM/5MLr2rfHl6i2ig6sodpIBBDL31yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPwN-0006Iw-5U; Thu, 12 Dec 2019 14:59:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPwA-000654-AV
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 14:59:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id n9so2707092wmd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Q8cDD1h6Kbt+wm67+7ymZTLscWfxx20xc71x85bi1V8=;
 b=swMATU3v8KmM1+9GIdXKQR6jSiOWRMCOPd5Xl01rpFArfJ3XAfwd8XMvQ1jGf7EYvH
 S7MyPMiaWUjl2NpRaTx0B/o0QlP/ReDBkqJZ494uKUJZM04o8MM4jHdRMtaA9rGbcxH5
 md7ZfDoyr0+K5+Ds4FRCXnDr05l58y/YgLN/xVSuCdUTQ6J3M0y9atPTykJGq013MPKy
 taPvYnxGEb/o4PfaH6zsEyDl7nndMkomGvzcJKRL7jDZPI79kpFik1saoJHdGqJNgh+u
 lyqOOG8mSXuI/iktQ2xEuGxTypgZB83oAz+GqolP2EGv77BXqSSbpi/2IpH756bGcB87
 2MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q8cDD1h6Kbt+wm67+7ymZTLscWfxx20xc71x85bi1V8=;
 b=ML2JBGyVcsZYzUdgsa1hegUUJwqOuqX64MqyuK3WeB337C0UKHgNBIKOzd19DDRzzZ
 +uzijsOOdmpEwzzHdqU+DEYub3tmYDAsGvNnFHFbzC1bB0WNIIYgxx7EAQrGOi8YwnDU
 8tgiZ2LcP42OzwoGtunbQDDRV7ptAEZhCSikRy3b6q7xsMH5CHpB+nIcDfQsJoN8Q+GR
 qVP0XOgxpkKjAvL7Oqyn6ndbGtzU2Ga/4bmg/ah+r0dtWTTE8fOxlQKvpbr/rYnMK4Bu
 rll/gUm4MBfKyFVeN8+YbSLf1MAyOIAyG9kvzAIva/oF9yY8ZAdU5iZEsnM6zvqCDxCX
 Ms7g==
X-Gm-Message-State: APjAAAXRz6UTtIHJMdqGQioDqZhtC2XVvclE5uEgsCBez+ijssROQRYS
 CFJbHBejq7vO3wq2h4WKkkU/iA==
X-Google-Smtp-Source: APXvYqxQvIfo9ValD2pZteRv78WUJy9Ja4QFpldqUrLBkg8LV7Tf3HWrTT9klIIijQsPl9BRZGoXrA==
X-Received: by 2002:a1c:1987:: with SMTP id 129mr6978284wmz.112.1576162767185; 
 Thu, 12 Dec 2019 06:59:27 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 06:59:26 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add support of CEC wakeup on Amlogic G12 and SM1 SoCs
Date: Thu, 12 Dec 2019 15:59:22 +0100
Message-Id: <20191212145925.32123-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_065930_365984_9C9DD5D3 
X-CRM114-Status: UNSURE (   6.37  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

this patchset add support of CEC wakeup.
We need to set logical address and activate some options in registers before going in suspend.
Registers address and options values come from amlogic driver.

Guillaume La Roque (3):
  media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl
    syscon
  arm64: dts: meson-g12g12: add syscon phandle in cec node
  media: platform: meson-ao-cec-g12a: add wakeup support

 .../media/amlogic,meson-gx-ao-cec.yaml        |  4 +++
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 33 +++++++++++++++++++
 3 files changed, 38 insertions(+)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
