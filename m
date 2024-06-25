Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446DBC3064D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTTcLlxQbr6dt87Lwqa+1fW/9Gtt5kRIIcBr5E2Zb0E=; b=RTbf39p+eDS47D
	nd82epCzv4EXnLScBoXkz1zwjNJKgkSo5cW284KQ4zuqa8OVF+hr0izdSDSBWIYW/DBUEJRH8tjNq
	NluPOUi1jRTpXCG+odqsATnZDIFyGZkOLszwEFvmQf6EqdmwQ//sRV9Kdp9svwFNFPQT1KMG+TkXo
	X3gawJZsjZCgQaGwpmRnxH/oNNd3Xvf5T7Df6pmrXIKnVh9taDsbMKFnUlUymACF5oUAhy6TGhT1r
	SvWInAUqEyBC5cg9i/DMQbi033MfWtmveY1Bq0TCwwYBbU7IDEtWcKf6duPVBfhqVhXJsJEcSM8k5
	MV3zB3caKoX3r6BUTEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7VF-00000003FkF-0LKG;
	Tue, 25 Jun 2024 14:50:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7VC-00000003Fi8-0wHX
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 14:50:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a724b4f1218so355667866b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327032; x=1719931832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lX3TM1Fki2eEB6hMLemhPlhYp9SkoeIi5lujOC+FPr0=;
        b=D/rOSn+OFErcD5f2Z6op+3aGv9B31xLAsUdlfe+WLsj5/b8aRZlxbjy2QUNH6YJiYl
         8gm44RkuagRfmtgJPgaLYu4EtSQPgzB592mtyEsNjvM5ZMdu33sSepoOStVmEOikYTnR
         Xt4IwOace/Y/waS4XtwpIg+F+NYWGyk/KQTJ2WKfycmb6C73pxVhjeYhVQpPjv3TCU43
         vbSs+T3vBa17nIRxIlem7YYmfXOl31XIcjq9mNVlAhS0DNoh1i3M0w4TZs4TEOWh2pb3
         ZI1Pnp3ukNlw0RVSE9v2WsbuInBEYDjjV3JbDIwM/h4PQCGbpRyvMf6xlmKBETzbiPzT
         tDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327032; x=1719931832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX3TM1Fki2eEB6hMLemhPlhYp9SkoeIi5lujOC+FPr0=;
        b=ozxWLHjKe5x9abnvm42E3Trhq/ahmclumqde63HQlo7aqxzv8T146uT0tSeNZ6YkTG
         9ExeMmTA8kfsTJPZAQXVVEO/fK23fUWl5HFe+o8kWcng2daED79Z2c8lpuT0d+Oejd3b
         V9b6hX6rYAUgMtk0+neJ4JzxGYm/bnQ5BVn6hDowAlWGhV4QRkcXK5GU9dHxTx+Rt7oV
         eZFmxxCBRpuIRZ7jaXez8GGwRkT5t+GcrLHfxuVMQm7hk6+pkyTx/R3H+0HfcsrZvcXH
         zpSB3wocBL2EUzym7zDqFkc198vlT6LliDgXAtSGKL9H4IB/1mYTCqZt1vkgeUQpKNQi
         dRgw==
X-Forwarded-Encrypted: i=1; AJvYcCWB27ANKy8MeRJhPnBctoVYkVdmTVq4IHDyoaIznUzIrC27ivDKuoDVVXliVLKtl2mo4geC1mZEGhUjSOMfdzahHpACn31Yi7mi+hpw3RUQNq0=
X-Gm-Message-State: AOJu0YwySgd1vTkLyTj+2d1IO+Ax9U9diOQ1Em2lTyJhl9SAy33uCd8i
	7HNSlxmR44c7DDNjacA0+AeeDvj3MG8iNNnRVYShzy1aorcYqYighS7Mxc2d0JA=
X-Google-Smtp-Source: AGHT+IFUUy+Ij+z9priiZtm1Z/MbuNV3/WMHqNwFfXw0FhxS9uRT69YZDNrxaFymHUjd4zBdIJFR/Q==
X-Received: by 2002:a17:907:8dcb:b0:a6f:718f:39b6 with SMTP id a640c23a62f3a-a7242c9c190mr463024766b.25.1719327032066;
        Tue, 25 Jun 2024 07:50:32 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a724162f037sm355945066b.194.2024.06.25.07.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:50:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] arm64: dts: amlogic: add power domain to hdmitx
Date: Tue, 25 Jun 2024 16:50:13 +0200
Message-ID: <20240625145017.1003346-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075034_293975_9F782CB0 
X-CRM114-Status: UNSURE (   8.00  )
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

This patchset add the bindings for the power domain of the HDMI Tx
on Amlogic SoC.

This is a 1st step in cleaning HDMI Tx and its direct usage of HHI
register space. Eventually, this will help remove component usage from
the Amlogic display drivers.

Jerome Brunet (2):
  dt-bindings: display: meson-dw-hdmi: add missing power-domain
  arm64: dts: amlogic: add power domain to hdmitx

 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi                   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                  | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                   | 4 ++++
 5 files changed, 15 insertions(+)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
