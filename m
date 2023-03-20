Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A0C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVnBhGHP6yKVGaoSb6CM9HyoMC0XoxELRsYEy4tJH2E=; b=ycSwFZ/COSco1m
	/60MHpWno9nDxU5N9fEv6xP/GVTg2R3pH0NktguGFmAJkiz7MeRjFkkdJru/Q9R7jCwfaEclOQnsD
	qBe8am9VzqOhJUOePYcFCIdhAknFhsiP9FihfxaVJ9wpRcbIVaf5UPnwTW91kVarCi9ih3hC4z6J5
	GPWDJ6Au+RIPD80yJWbWe53T09t4H8JwNfhlK88kjOjgb6E52RbbpYf53FXPNG9c4FdZN4Dahrp4s
	P1MeZVZWx0lcg4YJieOZ0ntPm/8jgMkmTcgW1SnASbWq2CH0V6hFNh//dl8xBLydADm9DjJsk3LKT
	oIH2xoyQSVqHK6x9NX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDy0-008rmW-0g;
	Mon, 20 Mar 2023 11:46:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDxw-008rkK-22
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o32so892059wms.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAnpEYXiX4sB0kjK50ard/j1uHGPKqU9tsDeuY5SwEM=;
        b=bgKC3EdedGWe232tCj+P2FJvLxLlm9F6/WfOXxKTD0tcnxxUiGR0HlAfEbcpPqfq4V
         yKtVc/D8bxZ1eY9LV6uhxy+F342wJjMfkEJGYn1fitjsqpCZEKL6/DrKqRlWKHWIW7u2
         JOotTqEZtWnA+XqiwEGFh1czsEbfb/3M5XjQhzJ4+W+ro5xZ2hmKo2rPWd0MNY52DVF5
         h1SWUtRkBCtq/VgB4ZCVr6iOGgVyv5tpLJnrmi9kW6T0P87NGMBGvyMx28mlzHpl5MMC
         RTjr+JegC0jRW1kr3akgx8dYH7Ry4EjMzTtMmK+dJ5GG6V43lQ78va2kpr30TxLFrsaa
         XjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAnpEYXiX4sB0kjK50ard/j1uHGPKqU9tsDeuY5SwEM=;
        b=n2IoOg98YQgDX4IYes05hPtrgHoUnJMXElyFCSL5qd11q79Erz+AjAXT/IzQtgsER1
         ntSr7SslZnAAPSEU+We1Y+/zjQuEsvdkWYj0gST3cS+0UYK1BpqnAi+ebmftB+NbSUil
         2lI06XuWNiaUnouGWrlSiGQCQiUstW85WuAfxOVsiSR+vTNGVKJChtCQSSIbFA/2d8ZM
         K8Tz55WcHtEng6O/u/MfuKiXhLX21VpC4sI6IHBUWGhWy9Z7X/rWhFTjUkfQjBtTY1x0
         GLb4fBMg1rYEVnsvnk2GnPSCb0ormTyuNwSx43VUvMR0BgH8utDHVC2vYWBCg1Gy/MdO
         zM3w==
X-Gm-Message-State: AO0yUKUvHA6DBOsPT32aPw0kCBY1R6VIUtwFwxsN9gbmvTNLqk1h4VXv
	IwXa9HW3UMO+EEdbw3K89KO6GHdn6rlLT+Bx
X-Google-Smtp-Source: AK7set/7QCSHfNyKSpsm1PL1IeKm621xYam0ijBVFkKVHBH/cHwASB2oh53U4iuFc+vtFk8eQxm4zw==
X-Received: by 2002:a7b:c5d9:0:b0:3ed:8780:f265 with SMTP id n25-20020a7bc5d9000000b003ed8780f265mr9662392wmk.21.1679312774178;
        Mon, 20 Mar 2023 04:46:14 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:13 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 01/33] doc: boards: amlogic: update documentation for index page
Date: Mon, 20 Mar 2023 11:45:37 +0000
Message-Id: <20230320114609.930145-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320114609.930145-1-christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044616_670346_B1FDEFFC 
X-CRM114-Status: UNSURE (   9.48  )
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

Improve documentation. Notably we remove all the board names from the
feature matrix to reduce table width. SoC types have been added to the
titles in individual board documents so readers can still correlate a
board against the features. This makes it easier to add new boards to
to the document in the future.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 doc/board/amlogic/index.rst | 137 +++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 73 deletions(-)

diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
index e51b904582..3eb1cf46e0 100644
--- a/doc/board/amlogic/index.rst
+++ b/doc/board/amlogic/index.rst
@@ -10,74 +10,65 @@ An up-do-date matrix is also available on: http://linux-meson.com
 
 This matrix concerns the actual source code version.
 
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-|                               | S905      | S905X           | S912         | A113X       | S905X2     | S922X       | S905X3       |
-|                               |           | S805X           | S905D        |             | S905D2     | A311D       | S905D3       |
-|                               |           | S905W           |              |             | S905Y2     |             |              |
-+===============================+===========+=================+==============+=============+============+=============+==============+
-| Boards                        | Odroid-C2 | P212            | Khadas VIM2  | S400        | U200       | Odroid-N2   | SEI610       |
-|                               | Nanopi-K2 | Khadas-VIM      | Libretech-PC | JetHub J100 | SEI510     | Khadas-VIM3 | Khadas-VIM3L |
-|                               | P200      | LibreTech-CC v1 | WeTek Core2  |             | Radxa Zero | GT-King/Pro | Odroid-C4    |
-|                               | P201      | LibreTech-AC v2 |              |             |            | GSKing-X    | Odroid-HC4   |
-|                               |           | JetHub J80      |              |             |            | Odroid-Go-  | BananaPi-M5  |
-|                               |           |                 |              |             |            | Ultra       |              |
-|                               |           |                 |              |             |            | Odroid-N2L  |              |
-|                               |           |                 |              |             |            | BPI-M4      |              |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| UART                          | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Pinctrl/GPIO                  | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Clock Control                 | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| PWM                           | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Reset Control                 | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Infrared Decoder              | No        | No              | No           | No          | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Ethernet                      | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Multi-core                    | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Fuse access                   | **Yes**   | **Yes**         |**Yes**       |**Yes**      |**Yes**     |**Yes**      | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| SPI (FC)                      | **Yes**   | **Yes**         | **Yes**      | **Yes**     |**Yes**     | **Yes**     | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| SPI (CC)                      | No        | No              | No           | No          | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| I2C                           | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| USB                           | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| USB OTG                       | No        | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| eMMC                          | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| SDCard                        | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| NAND                          | No        | No              | No           | No          | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| ADC                           | **Yes**   | **Yes**         | **Yes**      | **Yes**     | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| CVBS Output                   | **Yes**   | **Yes**         | **Yes**      | *N/A*       | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| HDMI Output                   | **Yes**   | **Yes**         | **Yes**      | *N/A*       | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| CEC                           | No        | No              | No           | *N/A*       | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Thermal Sensor                | No        | No              | No           | No          | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| LCD/LVDS Output               | No        | *N/A*           | No           | No          | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| MIPI DSI Output               | *N/A*     | *N/A*           | *N/A*        | No          | No         | No          | No           |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| SoC (version) information     | **Yes**   | **Yes**         | **Yes**      | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| PCIe (+NVMe)                  | *N/A*     | *N/A*           | *N/A*        | **Yes**     | **Yes**    | **Yes**     | **Yes**      |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
-| Watchdog                      | *N/A*     | **Yes**         | *N/A*        | *N/A*       | *N/A*      | *N/A*       | *N/A*        |
-+-------------------------------+-----------+-----------------+--------------+-------------+------------+-------------+--------------+
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| SoCs              | S905      | S805X    | S912     | A113X    | S905X2   | S922X    | S905X3   |
+|                   |           | S905X    | S905D    |          | S905D2   | A311D    | S905D3   |
+|                   |           | S905W    |          |          | S905Y2   |          |          |
++===================+===========+==========+==========+==========+==========+==========+==========+
+| UART              | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Pinctrl/GPIO      | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Clock Control     | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| PWM               | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Reset Control     | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Infrared Decoder  | No        | No       | No       | No       | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Ethernet          | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Multi-core        | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Fuse access       | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| SPI (FC)          | **Yes**   | **Yes**  | **Yes**  | **Yes**  |**Yes**   | **Yes**  | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| SPI (CC)          | No        | No       | No       | No       | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| I2C               | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| USB               | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| USB OTG           | No        | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| eMMC              | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| SDCard            | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| NAND              | No        | No       | No       | No       | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| ADC               | **Yes**   | **Yes**  | **Yes**  | **Yes**  | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| CVBS Output       | **Yes**   | **Yes**  | **Yes**  | *N/A*    | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| HDMI Output       | **Yes**   | **Yes**  | **Yes**  | *N/A*    | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| CEC               | No        | No       | No       | *N/A*    | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Thermal Sensor    | No        | No       | No       | No       | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| LCD/LVDS Output   | No        | *N/A*    | No       | No       | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| MIPI DSI Output   | *N/A*     | *N/A*    | *N/A*    | No       | No       | No       | No       |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| SoC Rev/Info      | **Yes**   | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| PCIe (+NVMe)      | *N/A*     | *N/A*    | *N/A*    | **Yes**  | **Yes**  | **Yes**  | **Yes**  |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
+| Watchdog          | *N/A*     | **Yes**  | *N/A*    | *N/A*    | *N/A*    | *N/A*    | *N/A*    |
++-------------------+-----------+----------+----------+----------+----------+----------+----------+
 
 Boot Documentation
 ------------------
@@ -85,8 +76,8 @@ Boot Documentation
 .. toctree::
    :maxdepth: 1
 
-   pre-generated-fip
    boot-flow
+   pre-generated-fip
 
 Board Documentation
 -------------------
@@ -96,12 +87,12 @@ Board Documentation
 
    beelink-gtking
    beelink-gtkingpro
-   jethub-j100
    jethub-j80
+   jethub-j100
+   khadas-vim
    khadas-vim2
-   khadas-vim3l
    khadas-vim3
-   khadas-vim
+   khadas-vim3l
    libretech-ac
    libretech-cc
    nanopi-k2
@@ -115,9 +106,9 @@ Board Documentation
    p212
    q200
    radxa-zero
-   s400
    sei510
    sei610
+   s400
    u200
    wetek-core2
    w400
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
