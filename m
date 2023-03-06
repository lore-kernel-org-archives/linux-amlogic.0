Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E27C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=847g+HezpUk+H5y5jnQtG2DBQJKwxShaNW88Ddx9XGY=; b=mgGXpuDFVLHDYp
	gCeRzbTmM5p/REuEi0xBjd3G/Q9Vj2z5070rqK6XOcVC9NfuF0FdYQcB8yEdlTm+c7miulGEYMbDZ
	2DiVB9TSWxSt+O15E+EEPZz354QgMPKnTZH/BWznFh/Hob7QocwsSm40wXCFDSHRMP0Fxu4XYx918
	yFLQFrusXLBDW7r0FbEvn5EztqawQ92IF/jTvTS8w9HcIHAVlf7X8rPHxIfFm5VJsIQUuaYJ4sKtP
	GZ8LhPAQxAAKSsjm/qjxPBnxmQXuniyceOCluRbogoKsxJkI5S5vgtSggKnL+cYSg1/cMzZQtdLLp
	d09IOm3rb0YEInUiMqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjg-00Ee3w-6A; Mon, 06 Mar 2023 19:43:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjT-00Edxi-LQ; Mon, 06 Mar 2023 19:42:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id k10so19468001edk.13;
        Mon, 06 Mar 2023 11:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678131762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Z+GtrP50ClS+yrVjigTcYvahRDjB91lP84G8BhbbLw=;
        b=L5yaZyqQAqAJDW+QUsHCnIdu8qj+PwacftONoG5XVTRfx/PJ7O1YgshZuPgiKFp1PY
         3qhW/g8kVkJ2FHzaZ4aUCEWjAvRguu4sIOV4CXnD0XkP7+DgPg7ItmJXusbaAPqBAJIJ
         QI0mPoG1k7MRXgUHPDh2x4J5ReqXdMyrond9BRwG1QqWjU4iRbsp21q07Z2P161tfygz
         BxtfN9ELSimOnWDRkT/UYbmWlqpn3OdxiLI0tUYBkqE40ran/DS8Hl4r6SEqzrR9R0VC
         bT32W69H7ajDn4B0+FUroE8vQAVhoQPsAJWU8l6L+5Ddt3i4czfXwNjO2mlomBFYT2c8
         WPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z+GtrP50ClS+yrVjigTcYvahRDjB91lP84G8BhbbLw=;
        b=XqtKt965PGhKuXw0wVMSCPHPfjttgp89FWZFoNYuB76aEWN3N7XhdHvT88dA/GEPmT
         U/rQYG3g1zWfBF5YIEwgwhC0IVI9I2BjUo1zqI/4PmVCRUFe7jiOUP9YGYROb11OXUhn
         xsgwYVaSVn0zJcFS7Me4PsoMUeZz5FvnmGHdUBBM4EKzAbPaqvXTOPf0fF9umbSmTzMI
         tFyXfX3Rh4Z//LiZWW6OcqpfdW39c/o1Sj/DRvwpp467Ksoi5ENMqd3+AvTn/+NO+LXH
         NZEHM6f3FtvHrujjVTVtcPAMbupkpPUPorolLViFOATxpL1dZNH48RAA5ywJhmx6Nw5y
         d8Mw==
X-Gm-Message-State: AO0yUKXpGlWn7N8wtZMRNErbE1gsxw/SgfbIxGhxihXsBaQbYO8KHdH7
	Ywn6AL7tIH1h81H9AhOLbDKbmDfN07k=
X-Google-Smtp-Source: AK7set+YhHmTNUp0BxTCGqqhHIHPg4d4XnCf5954Z5j+ADn5+NDGqhQ4XmPoGv6+bBHUthc3E7tgLg==
X-Received: by 2002:aa7:d34a:0:b0:4ab:7f0:1865 with SMTP id m10-20020aa7d34a000000b004ab07f01865mr10886471edr.5.1678131761732;
        Mon, 06 Mar 2023 11:42:41 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c405-5c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c405:5c00::e63])
        by smtp.googlemail.com with ESMTPSA id e19-20020a170906315300b008f2b0c6052csm4951868eje.89.2023.03.06.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:42:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] meson-uart: Use "divide XTAL by 2" bit on G12A
Date: Mon,  6 Mar 2023 20:42:20 +0100
Message-Id: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_114252_237242_BEB32D34 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series improves support for UART attached Bluetooth modules on
Amlogic Meson G12A and newer SoCs. These SoCs also support the "divide
XTAL by 2" bit which (greatly) reduces jitter when generating baud
rates such as 1500000 (which is used by the Bluetooth part of the
RTL8822CS SDIO WiFi and UART Bluetooth combo chip).

Without this the baud rate calculation is based on the XTAL clock
(running at 24MHz) divided by 3 (meaning: 8MHz). 8MHz cannot be divided
with integer division to a 1500000 baud rate. Using the "divide XTAL
by 2" bit however means that we can achieve 1500000 cleanly, without any
jitter.

In future we should allow dynamic switching of these UART controller
internal dividers to pick the best divider automatically for the
requested baud rate. This however still requires the new compatible
string - which is added by this series - to enable the "divide XTAL
by 2" logic on SoCs that support it (G12A and newer).

Changes since v1 at [1]:
- make meson-gx-uart a valid fallback compatible string for the newer
  meson-g12a-uart
- rebased on top of v6.3-rc1


[0] https://lore.kernel.org/linux-bluetooth/3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com/
[1] https://lore.kernel.org/lkml/20230222210425.626474-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (3):
  dt-bindings: serial: amlogic,meson-uart: Add compatible string for
    G12A
  tty: serial: meson: Add a new compatible string for the G12A SoC
  arm64: dts: meson-g12-common: Use the G12A UART compatible string

 .../bindings/serial/amlogic,meson-uart.yaml   | 28 +++++++++++++------
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 15 ++++++----
 drivers/tty/serial/meson_uart.c               |  8 ++++--
 3 files changed, 35 insertions(+), 16 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
