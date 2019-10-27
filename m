Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57755CA9EBD
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D04421D7F
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PiB/d3WG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="J1puDYWl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D04421D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lSGoGIbQJCIqukbpmvZDH+B2qg7F02PSH23y2N2nmuY=; b=PiB/d3WGpoqaU4
	bv4tvQLcQvf9/T00ft6Cp1Az9dM8GjcW5dw67gegce3Oa5a+4i3sPaTj2M6CutMSMUWbXoDDBzuob
	FA3sBE0uX2VDJkty5pjlw64fS5ct0TvjlIkOQN5gj9s6TENeK9Th2almDYqzVxXfXXKFfvzoRcBX1
	j18Hoq42aLoaWpIopdkVX9FFcVB5PGkMcHjayknoPG8vvFuubI3u25pHvuNepVDAW+0Inc8deDoTp
	pGdoK5hB1V/WlWFt+VEA+J6nLgW9tklP/Eb7thuRYJmsmqA2ALR7TxSHGzpF9cJGyclaos0NX6/tV
	ks64SuaPUHQ5w3jDr/fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlFB-0006CV-Dw; Sun, 27 Oct 2019 16:18:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlF8-0006Bk-Sz; Sun, 27 Oct 2019 16:18:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id r141so6674196wme.4;
 Sun, 27 Oct 2019 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fzxJHdWe3FCszZKpIfTnAoSqGWjqpiAHUUSq7m5VVx4=;
 b=J1puDYWlQm8AmK/pphEqz3Tmiwv+jP4W/murkGnYs+HHoegmq7/3IEgAn2E5ZO93Sx
 BQuNtFthdu93/m09qB/qiUX+2Nk71lhUnadCGqIuTzBjKUppvjxBxIQtnzAWPdaGC+jL
 swavw60rQxN5LvewsVpVK+aRqeGIVOdOpwCieY3foNi2HbxPbzzbIcbozdYTiPx3zwwI
 guqi2UEL5D31jdF4In8QohisZQaYjgXrUbW81Vb0hHf8JK1eNbVo/zeON0TlviWjIo+y
 54IzN9HCFevVnM1CPiuXgvvAkobz7LSCiuPFAqibsLfubC1XegW0Vd+ziy/XfXp8DT8z
 qGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fzxJHdWe3FCszZKpIfTnAoSqGWjqpiAHUUSq7m5VVx4=;
 b=NTwWsYNuGjy50EkRpUiHHGKN2/WKMOr+hsmwkfA/pNVNc2x8XwznuO+0sKxgzTUYK3
 yOqw+IvBJEdEbNPQZ0qKuUlpBVcHSsHT+dEoUveQvC131KZMY8i5LgtH6R5cIO7fssQs
 8xXunYOepB52pNc8sACA9335K5y7v8V0uJUWAQBo5s/ePw3ZhwuCVLG0KnfjEGEHcMWS
 H0LOsIctiFQKWA+GHtPg7lPStfjS+X7+pkP1J2+GB5j14MHWFV3nT91BnzPsDRBc/Mu/
 3wqlu1xLOgEvsBAlCuhZcEPw4k+hnMZ2nG3KraTMkgFOQ7yGojaFxyuf1hKsypYcyzzw
 6N1Q==
X-Gm-Message-State: APjAAAXPFHy1fMHPYGa9Phpu2EMLYgffCC5Qowv+xIBAmFJ+UiRQ+dmv
 +NSMaMEPksQmL+y7M1Xv6H0=
X-Google-Smtp-Source: APXvYqxArGQ2A5p0zyY9Lwm4fMAnRlV3pFBQpHzOz3hdCU27iLZp3shZOqLi87k185MCm7c/ed5U3w==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr12464869wmb.95.1572193092324; 
 Sun, 27 Oct 2019 09:18:12 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j14sm9585014wrj.35.2019.10.27.09.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:18:10 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
Date: Sun, 27 Oct 2019 17:18:00 +0100
Message-Id: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_091814_966487_71B9A165 
X-CRM114-Status: GOOD (  13.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

So far the HHI clock controller has been providing the XTAL clock on
Amlogic Meson8/Meson8b/Meson8m2 SoCs.
This is not correct because the XTAL is actually a crystal on the
boards and the SoC has a dedicated input for it.

This updates the dt-bindings of the HHI clock controller and defines
a fixed-clock in meson.dtsi (along with switching everything over to
use this clock).
The clock driver needs three updates to use this:
- patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
  the explicit reference to CLKID_XTAL while at the same time making
  the code much easier (thanks to Neil for providing this new method
  as part of the G12A CPU clock bringup!)
- patch #3 ensures that the clock driver doesn't rely on it's internal
  XTAL clock while not losing support for older .dtbs that don't have
  the XTAL clock input yet
- with patch #4 the clock controller's own XTAL clock is not registered
  anymore when a clock input is provided via OF

This series is a functional no-op. It's main goal is to better represent
how the actual hardware looks like.


Changes since v1 at [0]:
- add Rob's Reviewed-by to the dt-bindings patch
- check that "xtal" clock is actually passed via OF instead of checking
  that there's any parent at all (which in the worst case may not be the
  xtal clock) as suggested by Jerome
  

[0] https://patchwork.kernel.org/cover/11155515/


Martin Blumenstingl (5):
  dt-bindings: clock: meson8b: add the clock inputs
  clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
  clk: meson: meson8b: change references to the XTAL clock to use the
    name
  clk: meson: meson8b: don't register the XTAL clock when provided via
    OF
  ARM: dts: meson: provide the XTAL clock using a fixed-clock

 .../bindings/clock/amlogic,meson8b-clkc.txt   |   5 +
 arch/arm/boot/dts/meson.dtsi                  |   7 ++
 arch/arm/boot/dts/meson6.dtsi                 |   7 --
 arch/arm/boot/dts/meson8.dtsi                 |  15 +--
 arch/arm/boot/dts/meson8b-ec100.dts           |   2 +-
 arch/arm/boot/dts/meson8b-mxq.dts             |   2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts        |   2 +-
 arch/arm/boot/dts/meson8b.dtsi                |  15 +--
 drivers/clk/meson/meson8b.c                   | 106 +++++++++---------
 9 files changed, 87 insertions(+), 74 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
