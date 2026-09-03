Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F3C624D6
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFzs/lw7eXvK05JJckn1H14vSvID2ghQa3oAm1KORe4=; b=qMZ+YTzl1RCfIf
	UXbGX70U9I67S6n+1oNlbDe2Imk1r7PxL64d1kVKEKgoL070c/K0m5J8i9kgb81ZbuKfV8Npz4aKC
	SmE8sgW3zscd2S441NActGZ3Y+xcNVlzDQE+XaSsbzXFCvrHZ8Mo4xVRWm79w+KIKohKY59RfsXHB
	LcHA3wkkyarmW+/jxoN0yxjGK2E94VeqK+catwesiwSuRu1HBrzI1hVxZ63L/iGb80mWhTjp14HsK
	sSYmvA7dBvq/Y/7pPEq+FvVZzvwHq5PwdwKaz0IT0Tk5Xz4ZiR1ERpH+jWVHY8nffRG0JYfajkasA
	AwOzw1sHT3bhkBRa79ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP3-00000000jxB-3Uaj;
	Thu, 03 Sep 2026 22:59:29 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP0-00000000jt8-34yc
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:28 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48584dc164fso374004f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476364; x=1789081164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUDONbWsQf4g8On4R7HSZLyPEP705AHSMo8bYRBit5E=;
        b=O7cN9LvbZP7SUTmT4eapTL7HfCLzXrFHA2Ugu7D1EaAzKYb/Zd7G455GJXgMUEX/b9
         URifNEFXVoK5CmGuXJ035C24PaR5Cy3QsJ++AyMOtmF6JSfpBVQLP1XxOlrvnSYrtSV8
         LeDf5k1Nm04xay3+IzCrtiborSttrF8612zA/eUIyQOhtHtnRYc5Uk+Pfgjecju6DOSf
         hBjDYgBhgAYjMXuer/XCYHmwUeHBHTTxRZDCeH6Ml5ClLoRzmkm2nNE3/95zGE9LH8mL
         qHrg5GjFrS1erYkzK++SAgeZDCYWNob3Exn1j1rmSPWyklRvm5IAloR7jBSD4jREVuFd
         C1sg==
X-Forwarded-Encrypted: i=1; AKwUvBy4vAYAMRz/VPjtOrmydSCuTOh07pU9EFHWbno//PgXKP1udb8f1jUnSYtIq16IH7zGH+4twjww6+itBA1L@lists.infradead.org
X-Gm-Message-State: AFuF++mwXU7bEg870G+SHgqttNg/LTIKr0kPqiIb5qIN53rI1INbpeBB
	tBxwBGXxzQPfcgDqoe7mqzIPixnCm4ARL0cHjV9lFscKcRbJmIPw+fZA
X-Gm-Gg: AYBFou2l9bRk/eE2h5Ny/V5QpPxHtpCgOXiK1AWBuHmEAWOlIMSMIYd9BcSwxyXDEd0
	xYNjTrpHYzie7kCqVALhBoBw6uZybmSr3teSXP+WlwzrLhQCn9ZO47s/CZCy7ucRqfNlegmZwPb
	QNVP8+ufj0QzI5kjKpTtHIFeH4zqMSc7oDljo7c7MeD5W7/pA1bOow+xjK3RzWY6BtdCu8dJ695
	F7vJ6Pis4mhHoZ+T8YkQU1n93dkvohYOUhL6BMDGWXX+ZoKgKDLa7nkJ9HLfuruoHP0bSC468U9
	yUEGaMJ/1wGcCp4EJ/yczOJpF4xQjOgGSj7mJaiaq2+J+9WB7uS2ybzFjyWvfpOoHWspFiktGfx
	LsS2PHP3Au7r9EAOedRu8jGkb8hrHqyhyn7hs7BDiWhCLNqabzE+BKOqbdeILpDCHwhLMMJVkVD
	XUPzYTdZA7Ibms5Yyp11x4DApp9rGMaGwe8KDgfAcgxbqpkbaH3zb5VMh5VpJGsept1Gqmxz375
	PnDnDcYjVNTH2FUsLZtiZQBlQ==
X-Received: by 2002:a5d:5f50:0:b0:485:8a46:7059 with SMTP id ffacd0b85a97d-4858a4672acmr372086f8f.43.1788476364181;
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Thu,  3 Sep 2026 23:59:17 +0100
Message-ID: <20260903225921.2290441-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155926_798458_5DE3AEFB 
X-CRM114-Status: UNSURE (   8.35  )
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

The previous series [2] for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained [1], sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

[1] https://lore.kernel.org/linux-amlogic/ (RFC: clk: meson: t7:
    Intermittent boot instability and memory corruption on VIM4)
[2] https://lore.kernel.org/linux-amlogic/ (arm64: amlogic: t7:
    describe the VIM4 supplies and keep the fabric clocks running)

Thanks,
Lucas

Lucas Tanure (4):
  dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
  mmc: meson-gx: enable the bus pipeline clock on T7
  arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
  clk: meson: t7: don't mark sys_ampipe_nand as critical

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
 drivers/clk/meson/t7-peripherals.c            | 10 +++----
 drivers/mmc/host/meson-gx-mmc.c               | 21 ++++++++++++++
 4 files changed, 63 insertions(+), 12 deletions(-)

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
