Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A786AC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tztbwfmxPgPNdVX+gAVouDv73K2+f108Q68ZvB1Gbh4=; b=KAtMMpKYkBgCY6
	39J7tAu6mfs51fTAvAqJ7OIS/gE1Q03v9ZK/HvHp6tvndy76gKAPhsvKG/dWStlGX5A39/jNg9+A0
	t6tpIwh7Vfa+g0T9A+bbTAwNE0LPp4JYwg5hY2OeXjo1xaskM3kiR48Zp9xEtHQuu80ffmaIeP/Nu
	E8YPzJ+aXq/0Zp3l7bHqBdGeINN7VtL03yz0Pbvbx7D8uQhgBwwDDvT+LsGAJGcVFQIgKnjUMF3Jy
	gTyG5gobk3VOwlHDyOh5A/4h5Nj1zPx+hQt7OzSrdIxgDauJG8vGKnsLsHIithid8/LFTdK0aeZGA
	/2p7gL0hOhRsAVubhjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3KH-00Buf8-Hj; Mon, 21 Nov 2022 09:42:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3K6-00BuVb-9b
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 09:42:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n12so27080638eja.11
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Nov 2022 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
        b=cq8m6/mJPVrF19T4WTdu7gvq/nVLWRDjsh13J+Xr+Nn2iF4Hy9OD9nI54bY967FWG/
         3UOVhClJW4x4n2d97tfeDtKj/uthmhp699BqkgzMipcAj7tJSDny5vG9BdCLomnktnEj
         JLHLZjM0+76mx9DOq+ZPhDpQbUs1EjdA5A8QskH4ttK1DQdid4KKDe5WnlGyued2Rstr
         Jr5nh/9uT/4QkkPRzvI8bD+mOl9SVJHzqYG1WEKJvRVndpiMXm7cxc7b5miDOmV6Uxx4
         nj86LC1IOU+6NmDxVUZhIhYSv6YkCgpUu0klxQEKrS1S9MHECaNaSDIhEyK/W8FZe9Tk
         t+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
        b=5iSPFIfl3WnsWc7dUwv/MwlohBLbg3MWKAScFRWaEIYYjEoNDZMKT3QwLYX1q7fpHe
         wDLCA+3Wytf6lPhoG/gN6QD110WvgJ1XgiRMKRbiqKUq3vQL2Nx/EJrdBAOgjbDn6iXI
         wmhhRCOrC3Ax5MBzTxK2Dd6webT3VoWNQykfjW7YsnYpOLaFV1L34tO2Ys0x+pR6KTQY
         hD2SsltPBxJ5KBCzgqeMUvDj0hjj/CSGt0JKAOsLxT7IUmcz0jOniqPi7nsxCidP/shW
         oma+7T2Qi/trMKzbaUqPJVCW+cRAaSn3t/7fSP+wJBzumZ3T1LHh4g6uOGyzKO9xQOFf
         MqNA==
X-Gm-Message-State: ANoB5pnFEeinkpVK5msbBWcIpwutSA6B3lvmzwRkqYRS4Z81LkAO1GFz
	xOhRR8drLj2we2dis9ATwsbppA==
X-Google-Smtp-Source: AA0mqf4iGDXMlAJ1h8pqCDx2Am2EQUjsXM5qy6Z6ikSWJyeR7/x1T5VoUQJXLLJdiXSkQzAYW6nAog==
X-Received: by 2002:a17:906:a259:b0:7ad:ccae:a30d with SMTP id bi25-20020a170906a25900b007adccaea30dmr15189830ejb.704.1669023760591;
        Mon, 21 Nov 2022 01:42:40 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:c97f:bc5d:82d3:1a3b])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090632cb00b0078d3f96d293sm4822240ejk.30.2022.11.21.01.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:42:39 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 21 Nov 2022 10:42:30 +0100
Subject: [PATCH v2 1/2] drm/tiny: rpi-lcd-35: Enable driver module autoloading
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v2-1-084c6e3cd930@baylibre.com>
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_014242_349101_4573E5EC 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

SPI devices use the spi_device_id for module autoloading even on
systems using device tree.

Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
Display (rpi-lcd-35).

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1bb847466b10..bd37dfe8dd05 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -183,6 +183,7 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
