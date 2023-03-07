Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFF4C6FA99
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 22:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RlWtCFu5PHtdzke/6bPq7NY0nwFw1WJrJpvGwImb/Jo=; b=DSbTksMMzgQVah
	x2I3ZpxT7+9gcxvapEjoGxFHGp4S/No0YEq6n6Y0YmHyCV4PvEZchVsasYi8t1VvPlGYruaTF1lG+
	KPne2662OVj1WAC4zwyuOgnlDxv14f7u3YQzONgcre72LgPFWRr9SBtJiD40CKkkoTbB/QESnVTHB
	Q7mMmPdqX5yXzIIc3MANWYJVVdiNNVM2U+/NtNcFbgk+D9lXvN6n9ZzRfgRplMsO8HY5db5Sk1x27
	CWPRgo3VljUE+Z974FQQwztz8yIXzQ0cbz4DGuQrqR/FEINRvjnnYNhdsEkuyTd2j6LCjVZUPYrx2
	hBys4PYqqMa1XQp5vrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfmG-002f6W-7i; Tue, 07 Mar 2023 22:27:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZflx-002ezt-DJ; Tue, 07 Mar 2023 22:27:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id j11so38954654edq.4;
        Tue, 07 Mar 2023 14:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678228021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gjcCprh0YtfA6Dnk0t8C1b7TfZOQ0dz/8SnTGInkFw=;
        b=GX5tKBTUsIR1Y3f5WlAlOygrvh+AjgsTKfFdsV7j8TjOfzu0KDs1huN4yai3/K4+xV
         lLuyCyS4mhgtbXMUf/mhycv6ttOCbPvsWfDL/+Jq39lzsmsvVJTfNSmjEhzEkBzxO1JC
         +KgOysHLqNB4zgqjqI/XypqKidEGESmCUr7CklJsULGF5bugnyfUpgLbi5KKoYalOMuo
         X9kSmaV+RWFZ4SzjBhzWpA8Om5u/CQ8T2kgwUz5nH20C1zEMMzALEq9oA4po/+CUKDrE
         S8KrBg6/NB6KsnPkxR1nmTEgoOkLzCwvW441q825numITyeG8TGOM/9qVwoBq3xa1FfP
         KdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678228021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gjcCprh0YtfA6Dnk0t8C1b7TfZOQ0dz/8SnTGInkFw=;
        b=79bvaYlZ0sK8Fheg/O8VHUR0EjgPV9cfdblLQG8L/PDt4duxRCMnd7lDszwCjLh1wy
         8wCWCTiM0pUbFlZ/nXjevepTswDnl+xq4czUnKW6NMJbQ8sl2LGzGw1Pvg/fdgpN8XU5
         0rV60VdIvSkMOheQrqKBTlkGM9EKYet4049Pch6GnZDNYDzQHspKD1mFlbb7a34pYOlA
         R/bgRu+3H/lsW2arqk3dQAEJ75bIK9SEjswN4rgfldUp8CNycaJloK30AHMicH+3pzb+
         SR4/j5ISMhotMBFhcel9PxFbRmPOL1s+d0O4ly7AOz4Dm5dxkkDrpV/ONHQWkPoa/bPM
         SIHQ==
X-Gm-Message-State: AO0yUKUsnNUh8h3xt1K+c7kB/md4qZ/xNRuAMvWLkbeGnODSo6MDQDxZ
	lpjRbebu8B9bPvp4gD09Rq8q9VF45Kg=
X-Google-Smtp-Source: AK7set+1wRh2vgznuNAkSHl6cmRUMN6CNrWvNayb33+wDRXF+1iPXKb/NZPh5Uroj+Zs8Mmntku6nQ==
X-Received: by 2002:a17:906:dac3:b0:8a9:fa2f:e440 with SMTP id xi3-20020a170906dac300b008a9fa2fe440mr21240590ejb.55.1678228021589;
        Tue, 07 Mar 2023 14:27:01 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c485-ef00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c485:ef00::e63])
        by smtp.googlemail.com with ESMTPSA id t19-20020a170906065300b008be996c1630sm6669412ejb.39.2023.03.07.14.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:27:01 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/3] meson-uart: Use "divide XTAL by 2" bit on G12A
Date: Tue,  7 Mar 2023 23:26:48 +0100
Message-Id: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_142705_476008_B0C3ED0C 
X-CRM114-Status: GOOD (  12.58  )
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

Changes since v2 at [2]:
- simplify the dt-bindings patch as suggested by Krzysztof Kozlowski
  (thank you!) which actually uncovers an unwanted change


[0] https://lore.kernel.org/linux-bluetooth/3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com/
[1] https://lore.kernel.org/lkml/20230222210425.626474-1-martin.blumenstingl@googlemail.com/
[2] https://lore.kernel.org/lkml/20230306194223.1869814-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (3):
  dt-bindings: serial: amlogic,meson-uart: Add compatible string for
    G12A
  tty: serial: meson: Add a new compatible string for the G12A SoC
  arm64: dts: meson-g12-common: Use the G12A UART compatible string

 .../bindings/serial/amlogic,meson-uart.yaml       |  9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 ++++++++++-----
 drivers/tty/serial/meson_uart.c                   |  8 ++++++--
 3 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
