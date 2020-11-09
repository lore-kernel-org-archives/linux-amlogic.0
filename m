Return-Path: <SRS0=y4a2=EP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2D5C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 23:54:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90ED7206ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2020 23:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xcks/7L7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LBnQhWk2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90ED7206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QQyUPaN8B6oduea/fr4um0QQ6OyvjmgXgXlaJaTz3kE=; b=Xcks/7L7BKZB+DzyLkZIMG3c2
	VIHBv9k1UH/JRi4N6S4LBLOqp0kP/4c8V1mK6jY/nBbMdLIa10XtchFxDWsNZszldFoTWC8Ryg5l+
	gXKBfjG3Un5RT9HBUihG1luuKbm+9MX4T5pNV7GBu7mawz5HRiAIfqB1V+oC+6m/jiJqZKRgK5wj1
	fHZ42cS6kw3C+oAPQzjIMWoC8U31th0jajuaUpQrQvntaHiRsw/5JnCmXOwQoFdxjoWFCejI+Tggf
	nExckAiElfxvwOsNJiBiVEsIi5slyKrlYS5gEYFcYYzuTOtx7OGNenBZFmh1y+duodsaJ99/xjTA/
	dYL5iH1ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcGzT-0000Bu-Jd; Mon, 09 Nov 2020 23:54:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcGzR-0000BR-FB
 for linux-amlogic@lists.infradead.org; Mon, 09 Nov 2020 23:54:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id d142so1279944wmd.4
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2020 15:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CzaTgs0ZCR7YhHypdkhQqgQtrmivItzWonv5EyUQ5Oc=;
 b=LBnQhWk2PIp26EaOoBQE1SC9Bibtn/1uMSMP349l4bjMbQ3zYNk0/rUIHHaFMhdUFL
 UJhHhGHghE9ejI6HL8mmFtKyeznIXHcQkepCmoGxwE0c2Gff1ArduN6cnIyWUTbXmAWp
 CdFkfCem7OzkUrH5rRPohvsocFsS2TJcqSbSadFojGkQ+qKIGcWD9zCU9PrUlxPXDU8Y
 Rj+kVwMYVT0CzMBhDQG3li6MuZN8nXFrAyzHZrSEXqaW09L0E7EUOrCsr/EgqJVsOh1s
 osntovUuiZdjVVzMLGRdIzrKw8u9uU6i2+XkylV+6JR5dIETH7FMVxJNqK1oVMQpFhbe
 t0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CzaTgs0ZCR7YhHypdkhQqgQtrmivItzWonv5EyUQ5Oc=;
 b=Zl/nB38ieyTpha0jg5e6L7hcAgeqeQQqV4slMZOePZsX8JsxRMcugw4vKjV7pkxLxE
 wp9jHAJMXUq3G7lzo6O4HP5JnTZAY2CBLX2PIe8+TPaEArZfBOy8gcmDdyBbP6j4o8cZ
 Edr5hY/nh5mwUElPprrxMTBErk113eqXvctJCIruV3J9Ii6bnHiBBklu+bc2Ck50A50N
 5yFD96sHPweZACtO0jySN/6MghV4VcGFn+FF7CYdIqlBBGl9OywmIGzT9H74Evyo61y4
 hl2eAVwqzjjUojPuZeqWXjJP0nZocXGiE1eGTtWmdgVRV/wHSiYT5XzrjMptMwASE2Gt
 dw4Q==
X-Gm-Message-State: AOAM532H/f6mBHPp54s3gy2H/SDfZlmVIkhGrTgv0Kbojqt+N8j7vuyJ
 oIrliO8ssLORYfT3mxYQJu6AOyCmUait1OiFvxQ=
X-Google-Smtp-Source: ABdhPJxoE6MHorfn0+TD9hfOVTlTZ6AsX52ps0ROo7cFOIcd2S839nHa0a/7fal9YQQ+QsgThQQuug==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr1696097wmb.31.1604966064031; 
 Mon, 09 Nov 2020 15:54:24 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i11sm8025874wrm.1.2020.11.09.15.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 15:54:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Michal Lazo <michal.lazo@mdragon.org>, linux-amlogic@lists.infradead.org
Subject: Re: How to fix pcie ranges for nvidia GFX card
In-Reply-To: <CAFW1BFwi9nXW3ZZjK2pH2JUPh9Xj0PdM61+4sOY-YjA=i-AwEQ@mail.gmail.com>
References: <CAFW1BFwi9nXW3ZZjK2pH2JUPh9Xj0PdM61+4sOY-YjA=i-AwEQ@mail.gmail.com>
Date: Mon, 09 Nov 2020 15:54:20 -0800
Message-ID: <7ho8k6ulw3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_185425_542381_3844DEFC 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Michal Lazo <michal.lazo@mdragon.org> writes:

> Hello
> I have khadas vim3 with nvidia PCIe card
> Anybody has an idea how to fix pcie ranges so we can have nvidia gpu working?

Can you try this patch[1]?  Neil found this issue and we were testing
locally, but hadn't yet submitted a fix.  If this works, we'll get a
formal patch upstream.

Hope that helps,

Kevin

[1]
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..0a220fb10841 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -134,8 +134,8 @@ pcie: pcie@fc000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
-				  0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
+			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00400000
+				  0x82000000 0 0xfca00000 0x0 0xfca00000 0 0x1600000>;
 
 			clocks = <&clkc CLKID_PCIE_PHY
 				  &clkc CLKID_PCIE_COMB

> This is what I get in dmesg
>
> [    1.548188] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
> limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
> Gb/s with 8.0 GT/s PCIe x8 link)
> [    1.562742] pci 0000:01:00.0: vgaarb: VGA device added:
> decodes=io+mem,owns=none,locks=none
> [    1.571028] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
> [    1.576944] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
> [    1.583263] pci 0000:01:00.1: Max Payload Size set to 256 (was 128, max 256)
> [    1.622407] pci 0000:00:00.0: BAR 9: no space for [mem size 0x0c000000 pref]
> [    1.623803] pci 0000:00:00.0: BAR 9: failed to assign [mem size
> 0x0c000000 pref]
> [    1.631136] pci 0000:00:00.0: BAR 8: assigned [mem 0xfc800000-0xfdffffff]
> [    1.637861] pci 0000:00:00.0: BAR 6: assigned [mem
> 0xfc700000-0xfc70ffff pref]
> [    1.645033] pci 0000:00:00.0: BAR 7: assigned [io  0x1000-0x1fff]
> [    1.651070] pci 0000:01:00.0: BAR 1: no space for [mem size
> 0x08000000 64bit pref]
> [    1.658576] pci 0000:01:00.0: BAR 1: failed to assign [mem size
> 0x08000000 64bit pref]
> [    1.666410] pci 0000:01:00.0: BAR 3: no space for [mem size
> 0x02000000 64bit pref]
> [    1.673913] pci 0000:01:00.0: BAR 3: failed to assign [mem size
> 0x02000000 64bit pref]
> [    1.681763] pci 0000:01:00.0: BAR 0: assigned [mem 0xfd000000-0xfdffffff]
> [    1.688500] pci 0000:01:00.0: BAR 6: assigned [mem
> 0xfc800000-0xfc87ffff pref]
> [    1.695648] pci 0000:01:00.1: BAR 0: assigned [mem 0xfc880000-0xfc883fff]
> [    1.702385] pci 0000:01:00.0: BAR 5: assigned [io  0x1000-0x107f]
> [    1.708426] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    1.713592] pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
> [    1.719626] pci 0000:00:00.0:   bridge window [mem 0xfc800000-0xfdffffff]
>
>
> And this is what we use right now to setup ranges
> https://github.com/chewitt/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi#L137
>
>
> Any idea how to properly set up ranges ?
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
