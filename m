Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506FED29DE8
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hdETSJIiCQqJlRu/V26udnrkYiRoij7/mZSWemjPw98=; b=3ZZ
	0J2fUUbQkQROo8W0TTa6lq8+sWv6Xb/TdE0yo7JZH83gA0AzrNUCBn6QwGOKuc7E48DiJ6dTWM6Po
	8g9powlumlJNhUgFxb+WcWXuhRu5QDk7IcJPDeqFzJaHz/EVam90ZpxwyR2FGSV/IxSuR7VKxe8tM
	x8PbOP7/uB7hefs2bzO3Hpzvp4eIrxLw607tSGWLmL0JcYA8sGzxiYHoPK4qcNhfc/t7CL1A+ObSX
	51xswEEsDIeNyXxXHNoNqA7BDFAVWbZknMZHyYGctVgzqKx5Hhj0HsouP7O1Yz66GKnHBshkyxpxE
	S6RXpXBOl4OvfVrnaEmYYzvfxa4nkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaPw-00000006ois-2Jea;
	Tue, 13 Jan 2026 09:10:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaPv-00000006oiF-0vCa
	for linux-amlogic@bombadil.infradead.org;
	Tue, 13 Jan 2026 09:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=AL3AmhrXowuR2G2gwigOGPD7FLU1L7Qmmgu+Bu3T/hg=; b=Y0Nwljk/Xr+CWh6EAZJLTY4ih8
	G6PkQ33f0ce+wZWOpHxmUBGUzKjPnKHR2JX8S+8cQ3NE4aYhWcsBkMQ27SL/0y+zN1ruQN45S/YkM
	cBXxB2g5CpbNDG37oTZbV20bOy+c5FWa5BErxdN5/xwSwIaH4UNkrHuYtJ97xvuIJW6DkgbN69mlj
	IYybAu6nUj22RXvY5uznuT0z6nkJty9MbIf+PJ5I/vVUiIqQroP/R/qzT2elVLzzRQdByVYh1x1Jv
	u5myud06Y3BmMG/EwDD2tpE439YNkbero54zyjYQ6wLTPq2PNcHTqdvEeoQ9NOP+nRVqylPYQSOcL
	83nmEKtw==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaPr-00000002PkB-2JPU
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 09:10:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f102b013fso68100245ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 01:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295417; x=1768900217; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL3AmhrXowuR2G2gwigOGPD7FLU1L7Qmmgu+Bu3T/hg=;
        b=c6PxTrfpvoyC0MqHXXgPlecSVs4h9lvDVtDXohetEMJwU9rPfhvQAyr4hBfOLvTjnb
         FSgyb7nE5ro9PhoxbPPEn2qbsd5sYmNQQLQPegSZVqpreiN87gYp5oULPoUkswDFJdf5
         HvNDzd2Z0dG0l8zGopvIeXikyRFOOyDeqEfgXebpulwsaWY698GJDo/gy4taHdJwF+e4
         POGVgJb9yIpSQWYDKLfwR/+QAEh732yisBBy0/jiWiBJOYsqzZciKUlbRcUM3VHY42WA
         YUBuYdMwJUoaMEtf7O4si6FzLGRpgk4nRIFnb5eJYkeS7RcVBt2tiI4qMyrGX5KRq9BA
         hZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295417; x=1768900217;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AL3AmhrXowuR2G2gwigOGPD7FLU1L7Qmmgu+Bu3T/hg=;
        b=srTghOLnGIBDNcC0zyYzrPEJVMoLyQofE5gpirSO2tIqZf5LEngENwxhw3ISEpOSM4
         7ZJEoFujbHEz1xFPFFRMNB2mNAk9ml1r266sMx7q1+KW7NeAf775wlyBamSN2+mMd0E1
         W+Jo8LG5N1WUr1JMmOO5nG10aNcGXfVR5p1TCmbFuEdSZQp/tcqvvRgw3yckNYknLSU2
         ig16Tt+B0sRFKVZsSy73DjJpCXq/s0N7r/0q0G7AGxZ7YxwLyZ14UtxlMzsH8wh1/98r
         RFfOu0NCJuR9O8ltWwL9HedLI2V6oZbeMqobv28c+4umwfEZEA3GeoivMLjxvPuI9bBB
         7L4w==
X-Forwarded-Encrypted: i=1; AJvYcCVnHh2WMc4lHmyd9JnY3MihTA0pb+10bnG4R9GFJ0+k/OM0wGX3HH+5QXdhAcDEktyXRzrl0AfswvHrG2Y0@lists.infradead.org
X-Gm-Message-State: AOJu0YwZRNYr2s4Hhk337xdw8j6HJFu1iqC8WT0IhM0xytIBebP12cKE
	xy3BNcDKpOt+bnSfVfIqhFXweDl5xwPewwebw1mkBNrZZQORjq7ooZWQ
X-Gm-Gg: AY/fxX405U7lbU2yO9u7WF+MVGdIEnFE1q4NMOyeoAQJkod5MfzWYgtTZ1DbQrZYJzf
	+/f5w791qSevA8useVUiSYfumzIM5B5sBfNWMp3LLbxuMH1h4q4yT1oLB4VhaImxpW8QaVdWgMc
	gwLBYWnzrikNSU6mqlB1EfSn1uGeARjbb0Qz3tNxsREs/NWUPyikB88O0lg6sv+rxZ9iq2FuVMz
	1S0wkJ1xWsUsfhqLgY2sI6CaSVquVLb7I5HI5UqanzKlGnVo7bkkxVeP5zlK/1tHlQwcU8/BFjB
	ETkqY5b6XsNuhzuEogeq7MaPUnk3CStxAjnO5xNcyO86PV1KoCgjaFVCPbz+juo7M9V6XIjZssH
	DAj9f+gVuZK+CGrWQPK/iaULndFeCo3+7KIBChPXCCcHgni88Dnwq6zVzF9B0NNNg+hYZj8TFHb
	2luEUVyT8=
X-Google-Smtp-Source: AGHT+IE1eZuFWYVL1uwHVIQ6oD0tCHFHyYCy5zhe0eIXjlwMHvn0V3kwTkAqzeYTgYzwyX866SYluA==
X-Received: by 2002:a17:903:2450:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a3ee491815mr172892915ad.37.1768295416821;
        Tue, 13 Jan 2026 01:10:16 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c0bsm15293915ad.31.2026.01.13.01.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:10:16 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v1 0/2] arm64: dts: meson-s4: add support for Khadas VIM1S
Date: Tue, 13 Jan 2026 17:09:49 +0800
Message-Id: <20260113090951.35928-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_091019_672377_DB44845C 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, krzk+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds initial support for the Khadas VIM1S single board computer.

The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100 Base-T Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

The first patch adds the devicetree binding, and the second patch adds
the board device tree.

Nick Xie (2):
  dt-bindings: arm: amlogic: add Khadas VIM1S binding
  arm64: dts: add initial device-tree for Khadas VIM1S

 .../devicetree/bindings/arm/amlogic.yaml      |   6 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 191 ++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
