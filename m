Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C667C43217
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I/K9FsJWcdyY9lE6OaFMXjhtPLxtxnwc2G4S/qsixb8=; b=hxyYyyfYIEWxZt
	c8m0igrNLW/sbABnEfLCkLiAkTTrEuc/ZHvB0MhJqf5n8cfIe1ct2g77D6gSJdh7bh1RnY6mkRQxj
	+9IJDzMNODxD/UonTJlZV24fG3ZSfhsZsVLS04poItG4+MaLRG5SZ5+HNgNwKxdaS4Ej/WowL8p2J
	ZJt/xWbgj7YjrexTP/A9U8cg+K/Xye7Ga4cUr3KZQNni3FyPi2kr35+gzYFM++2+2lax4xgkMyhgy
	ImnhgmSYXQ+2m1pNUTXYc9+Kcr9ESifE64MBPHtF1vqX22jlcbIFuJ7ZpE9X+jXXp9E4WvH+mJ4me
	TPkCv/IJtl5L14S0W2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9A-001Drk-Mt; Mon, 28 Nov 2022 11:18:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc98-001DqS-4W; Mon, 28 Nov 2022 11:17:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h11so8948855wrw.13;
        Mon, 28 Nov 2022 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xi6pBFQ2Iy9JcIpqhAKb8IIPjJ3///r7Dh4vpWsLSDI=;
        b=Afqs52V6ygFs3v3SzJpElSKc8n8lhgdoNoJoZh8moM1X7PpFmU1sIZnqdJWIW0T+8o
         IjrgAsMN/2zOlpN4w1GjijMH/r6PP2NJMtpPq3pRzaCiV7AQ6eLN6pOMsB7pgaZJWTqB
         T+v+2Dhd+g2EcmUwPza5x3GkMfh7hA1ZGCR6UA6U9lVWLI1mYC00Cs+4OteWMpR2Du9p
         kHv0ITGPXKP05U8RAS8REcRtBAzSwu+ikWpAG2rJh1y8XMQVWQ+fTSlsKaydSt/uTwhX
         0RaJth+7+or+j0k+fnceSzvDSREhrEhTCZYY+biGdfsQ2HhH7Pg2fDisgf5qk43wb+uz
         GD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi6pBFQ2Iy9JcIpqhAKb8IIPjJ3///r7Dh4vpWsLSDI=;
        b=G2rGqSqLffpe5HcWISLFdGDt6E//EOScaoWqDH7N0SsZQmKRHRfAUkzczR8/y2FLFl
         duy92B0+erwygxripD6U/FHwBrNIxQe9tCKgL+WP8jiToukDdG1LUf/YUp0y4uiQUNZJ
         fnBUQRh6odZbzwPHpr5MZDQDyI4wcXDUIHZLzY1dBx4a2+/NdzBqpRzF68MusWgrGGtr
         G3S/peCDYk6aSUyWGFEbmvgx646mXAcq1oP/k4jLwhlgfGkUyhPAQRJbTAkVnycLRU79
         IWwI8WVSXfi0nk0YvR04OkJK5BCGZr4Vor2RT2Oj4DUJGoRoavZMJ6YV99lsxZXluoHe
         89KQ==
X-Gm-Message-State: ANoB5pkBMZqRfr39kz8/VN7hUJyWjYgkDAzgXQsbM1/weR+eLpDlQjaS
	6phDX/AA8C27kOr0sxPZXr+EJ/L66mc=
X-Google-Smtp-Source: AA0mqf4GXJ9ZPIdgGqed8M0XM3SA8kk373G85PorjEdJ2qU7LCAoGh5UUBa4ygk+8Y0CVY8ueeVo8Q==
X-Received: by 2002:a5d:688c:0:b0:242:1059:2118 with SMTP id h12-20020a5d688c000000b0024210592118mr4869395wru.245.1669634275707;
        Mon, 28 Nov 2022 03:17:55 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 03:17:54 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR VIVANTE GPU IP),
	etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP),
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	Lucas Stach <l.stach@pengutronix.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux+etnaviv@armlinux.org.uk>
Subject: [PATCH v2 0/5] Support for the NPU in Vim3
Date: Mon, 28 Nov 2022 12:17:33 +0100
Message-Id: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_031758_200120_C7A904DF 
X-CRM114-Status: GOOD (  10.50  )
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

Hi,

This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
as in the VIM3 board.

The IP is very closeley based on previous Vivante GPUs, so the etnaviv
kernel driver works basically unchanged.

The userspace part of the driver is being reviewed at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/18986

Regards,

Tomeu

Tomeu Vizoso (5):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 +++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 31 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 ++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 6 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
