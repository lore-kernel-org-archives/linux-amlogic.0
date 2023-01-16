Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B10C63797
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3GWvCY0VLjZv9oR0WRw4Lh65UckWKjZI2mUfb/FnG00=; b=2AAmurCxUYspT0
	sYyYVf/vJ1UyTrr6J64dOHUnv3cuG7kvDXXRLiGhAYzItrf0KWkHJi3buZcVMyeNuIsUfOcATtPD6
	BR1oXqKoeJ53v87ubDAn8AdeioDSQocNMpR+qhbQ4TogqmMfzlMQMGjVuAeuL57s8qJTeDicjBFSe
	IRfz7/ZwV8qGO9A45WUMHr4KwOD9YW1+XBdkLVZq8wRFtF8ryJVgxIL5WNfShFP7cm65I8l/qn+CG
	ZU/RIhKop8HBO7kHYfy/UzKYROgoj8hi6Qf2sPhPc5+TJ1ifgalkO8sjy9r9K09J65NwO7nyBo+t6
	pYXPOzQ5HzJnUDoEdDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLbr-009J4m-Ta; Mon, 16 Jan 2023 09:16:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLbm-009J1j-Qy
	for linux-amlogic@lists.infradead.org; Mon, 16 Jan 2023 09:16:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id o17-20020a05600c511100b003db021ef437so246287wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jan 2023 01:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQqy7tmNPC1sLB0qog9J3nsScKuE7+zMY2apGe1a7LY=;
        b=kaf9ULVPufRZua7B4XdDJbK0fz0YS33wTnOyjdev+zPeRS3mCSGhZ1fBQcXM+0SA44
         DxXiGtm93SWoxgCmvT1tqQxqKkwAgNe1jRaTTD+HBIyqoYMoczZdGTtRcvUsNq2Q00km
         ATPU3q/WopXzNMdW3hvoempiWeKgzZ1ogoM4xX6ggPfannwE/kUDhU4ZfVtw2Mr6Yy86
         LFbaB+VILy7tLIaAJQQBMSd7KyGxE9lLikfNe36hkLmjMC1lppCszlTbIkXSwD7rm+49
         4LcsoyLkZGFuB1ZtlgtZizWit7vJOmL3z8Qz4X9frXYEeSpoGAkFksS66WciG6GmID79
         xg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQqy7tmNPC1sLB0qog9J3nsScKuE7+zMY2apGe1a7LY=;
        b=DtbCPQI9mOIYUogQf5wby8bn0P9TrbFPOSpFKA52UOgoliLnxgX90Rtzd0Tsx2SVRL
         LygLislHgY9Qsxiqx8CiqMkpA2hZaHhaGitBO9IXvlL59bhtSwl9n1wucJQUH7hmQoSz
         R5HPDalKk7WjBvmcaIZmCsW9Xlg/cUm7wKwfx6Ie3uKMkT5V+9BlKzB6K9JWWkjVtISM
         t1ijEbyeTmtXyfZxcDGOtuGQczak3+vFNhthAVvHeKAvdwWCJfVAaA9buAHiS6wpeYrL
         YIpOv1NyGGhBo0SJWxGR8hyygpjuyDfdWmCq4WfUFq+eI+Oo/mJxf06fFyHHuM0hE80X
         eEMA==
X-Gm-Message-State: AFqh2krwsYdgL0O2r9ZlWww2nNMsrrs+wFNs/YSNR2S83rPNA2RABuCZ
	oN75Pap3PvjPh0BIwbkJK4L96A==
X-Google-Smtp-Source: AMrXdXu9LWONh81BHjCmB6gNIdUCS0z8SVL3vdAXL+JwO2VJt70ZV99BaV8Tt983HoGGK8orA9dUWg==
X-Received: by 2002:a05:600c:1c03:b0:3db:13f:c86c with SMTP id j3-20020a05600c1c0300b003db013fc86cmr669081wms.41.1673860606919;
        Mon, 16 Jan 2023 01:16:46 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id h19-20020a05600c351300b003d9a86a13bfsm35923491wmq.28.2023.01.16.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:16:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: mdio: add amlogic gxl mdio mux support
Date: Mon, 16 Jan 2023 10:16:34 +0100
Message-Id: <20230116091637.272923-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_011651_121900_8E7C2029 
X-CRM114-Status: GOOD (  13.46  )
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

Add support for the MDIO multiplexer found in the Amlogic GXL SoC family.
This multiplexer allows to choose between the external (SoC pins) MDIO bus,
or the internal one leading to the integrated 10/100M PHY.

This multiplexer has been handled with the mdio-mux-mmioreg generic driver
so far. When it was added, it was thought the logic was handled by a
single register.

It turns out more than a single register need to be properly set.
As long as the device is using the Amlogic vendor bootloader, or upstream
u-boot with net support, it is working fine since the kernel is inheriting
the bootloader settings. Without net support in the bootloader, this glue
comes unset in the kernel and only the external path may operate properly.

With this driver (and the associated DT update), the kernel no longer relies
on the bootloader to set things up, fixing the problem.

This has been tested on the aml-s905x-cc (LePotato) for the internal path
and the aml-s912-pc (Tartiflette) for the external path.

Jerome Brunet (2):
  dt-bindings: net: add amlogic gxl mdio multiplexer
  net: mdio: add amlogic gxl mdio mux support

 .../bindings/net/amlogic,gxl-mdio-mux.yaml    |  64 +++++++
 drivers/net/mdio/Kconfig                      |  11 ++
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-mux-meson-gxl.c         | 160 ++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
 create mode 100644 drivers/net/mdio/mdio-mux-meson-gxl.c

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
