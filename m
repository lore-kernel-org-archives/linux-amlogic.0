Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881F5C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:42:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD23A610C8
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD23A610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1/jJ1cu6Rv1fIcWuE0Dr+BN52ZUL6Q20XWQihTiwVlQ=; b=VT/ZHPe2ybmBQXhhGTMeO1IAN5
	uyNDwcjvbXVlLxJJSyppBW3GjqvB0rVKZshChPAUJtG9yUoNrG28QEbkYoe7kXMQYJBG4rOUKpEm9
	oi+Qx/g0OT+sfJtsNZa+5zZR1eenljdTI4QwuNK6FJ2TxKJVwuYsyM0tHJJpIHSbunOxb8wYDcOTO
	dRclozVwdmW2G5gpbXUmWWz5eK3bY95ofAwk8aBrkga/e+fPOpnMfzuz5K80s/1C4I6KCoOmn/mqx
	OXWygzBwm0nUd86MLRX3vDuLEZPIz3R+P21k2HT0QKCxXOx+4EcRf3xgSPMf0S3XgQQ2rXphjXSOG
	Ems/eQmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXKzT-001aOF-1C; Fri, 16 Apr 2021 09:42:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKlO-001Y0O-C1
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 09:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2sUAYapV9tNRdpyx4eKitq/eIA5rKVYEe/d9xJHfMIo=; b=z521JUeXSrKRck9A5r7yd9ahEG
 CAD74xbUwS4+9y/OqMuch/U7YGBUx16496JJTasdZvAjzNSmalD0dCdbev4EEPV6R1R5wywZzReSh
 XBm6zS1eqCVxI0Q78lOl1p81KaW/1qPiYS6/UIpb5Jxd20NF0SGe557OKX1XiY989uxZOmugVgHxE
 ts0XzCN46RrjbLlMlEwSqaVhHq2b+sPy9Hxfy4VaCxUnb9M6AlCkkFsHu2q3f8OdCxCR3s/BVddEa
 I2zkB4+y9G3rtTId6DNwiXvT7xkTUJxMULdEfAukmyT2gsVcPCEVaZMNSYw+Y9QrSx5fAt7k4YrR6
 3DvdBTgA==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKlL-009Ezm-B8
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 09:27:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n127so2142955wmb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2sUAYapV9tNRdpyx4eKitq/eIA5rKVYEe/d9xJHfMIo=;
 b=O2ZXiCFmleQhG+6wTRzwjgcjsqsqUwRMoVXJCVR3MP6HhYcABYi085jjBpr0eAm5iY
 cyzN0S01yEtnSwdsDSI4UY0CumhvSWEsvjE/U2ZuqsLVS57yuY6+gRSHl5rGTb9t4JuG
 sssbwhVwNEkmKUl0cR6/Ce5Tz75KWGdR2YLRkq+b2goWzDqdpQo7MUYG0onpazmpXh7P
 EqGvTO9tt62tGrnXZqXLhQ9ZWkMayuoyc2oHnkMJ7ELOUpE2zKSC+7RcujR8MQ2/H1IU
 y167+jLmKk9VWHTlxacjHCa8EkSc6RNsUEfIcjOjk1b1cl5ATdaKCkEOS3KfngBuojTH
 jBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2sUAYapV9tNRdpyx4eKitq/eIA5rKVYEe/d9xJHfMIo=;
 b=n2Cj3JSSLht96xo0MIyYFn8BAlO8+PILkKmy+uLB6nv0uiV6HGMEzDku0pfk8yTgcr
 uLqCro7bd1xK3uzx6Jkh7L5qKkb489tURTKgdkfEO9S5IRuxQHaeeCVbueLL3MA059Ak
 WXeKwiLAjbSS8ZHSUFK6fxr9zM4nPITfnjxgkRrTFkJoRqEDv3C0ZXTIOq4I9BgNdJo0
 8YrGbuT1U6AvjHwPx3GR9zOTuDV7AgF7EleH0DIg3k1p6YWQr8+Rlzi4VTJ+mws210m3
 sLgns1iIj/iWz3UPZtp3rmyMsr+OR+b4JRzY4JwtRLgYvjRQd94y86aJTjy1gW8FA4oI
 6xkg==
X-Gm-Message-State: AOAM532+nWz8ypCx7IVYel7lh94ZpAkeD1PvLkvFCiIBXb6cZMzlG9Nf
 SNniYPJqtUKU0v2qN5wpAvt23g==
X-Google-Smtp-Source: ABdhPJyie/neP71DZoVh0xkkR/lSSw/WmzGCmPnhCr1wnRoY5kDS4wX57Io+5eFW0xZoEepPi9JQvg==
X-Received: by 2002:a7b:c7d6:: with SMTP id z22mr4774993wmk.25.1618565261256; 
 Fri, 16 Apr 2021 02:27:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 h8sm8805156wrt.94.2021.04.16.02.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:27:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Date: Fri, 16 Apr 2021 11:27:35 +0200
Message-Id: <20210416092737.1971876-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_022743_456948_D648BAD1 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.

On some SoCs, the CEC functionality is enabled in the IP config bits, but the
CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
confusion when the DW-HDMI CEC controller can't communicate on the bus.

Jernej Skrabec (1):
  drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
    driver

Neil Armstrong (1):
  drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
 include/drm/bridge/dw_hdmi.h              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
