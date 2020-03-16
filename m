Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD07C0044D
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C9820719
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aBmeEObv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V3fGpkqk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C9820719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6wuRExipaxkIDWBFEX0qkeXz0mfvWtPhK5m2JZV/FY=; b=aBmeEObvI+sNWB
	Kts1n3d/vAEVrx3U4TACPoSskU0IWyBT2mu8+qp4n/+hpMjAFkMsdMQICNd+jtAKdD51uNSXFcvk2
	43x3uH424IsNZ490GcPJK+WkvTeh5LsXEqpxMGNFP2AnpKEjnq6UWZNZAPwkVgEREft9GWL9V23fX
	2Le10VID/NtdLR0Z903a7imKyULjUBzJ5tNJp1XX7ZqSb2OYObSIzuvQUGGFZ9xCSC7uMgGerhMH+
	xYZnFGlWf/Nher3A4lJGugoA2J4AusVuiGPAo5ZeoHhNQVfa7uz3Nkrj+CvdDBtNUOc58M1PpKYi+
	TO//tG04zXZxb5jJp1aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDsrC-0001sw-Rc; Mon, 16 Mar 2020 16:44:50 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDsr4-0001bd-I0
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 16:44:43 +0000
Received: by mail-pl1-x641.google.com with SMTP id b22so8242585pls.12
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2020 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OzTibJtwHWvgkYEqJ0BJY+oA4+jt7ssN/aIUWbaaV84=;
 b=V3fGpkqkFtEjPimrGJV0q10vLHNWAa+tM8qZwtIwuhKOiGhd7jeXVRM0ZgDbMd3sb/
 KIUY0yo3hhvD3juiaq7+p93GnfPlGpDHE6HLf7rOemeDRnHy1wlUaOAt0D3EkTqYBtHX
 CshSpdAmN3y63ZHMJKAvgq+hNO0GWX4KGeKfC+fY9x1+7F0ec8LfaPK435zXsZzqm26k
 0f4EzkvaJmMbOmtE9FmMTAfvbY3suqXSJJVgcrsWLU/BqvybOtn1gJzzUlq2F4pV70lM
 S/qrlksKby46Vd4KIzAKht7gHoh3m/2zIkB9AkWfrZF4fqDIadKPCyHl4GdB/bJNEZPt
 LPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OzTibJtwHWvgkYEqJ0BJY+oA4+jt7ssN/aIUWbaaV84=;
 b=l1+sqbcuc3La/ARYdmIZqawObkVpoqo9/cAYILgVZwt5GJkZQ7zLi5HBfoPDoGbg9G
 sZ0L06xU+GmBar27bdd+f/wI4WM27Y2wlARyv+0WXiw6YRuZs7UdSl68Zx5gf9OSEtRV
 c0jWZMQEF3xf+Cw4KWVskYOf/DMlxaUben7MFRMS92SMY8WpCiiRMRPShJkCEHOP8W7x
 1U74APT3lgaruqCV/6cTgq163bVqP0N3jkwZowiOLSif83v9+Ziy28xPvNQ60Fw/mPW8
 r7LGLCNacZoo/TdEA01F15cLcaFTn4fBrZ99qBWP/3WR4b02T/Ec7qS8KjIJ/OWiVm+v
 LUyA==
X-Gm-Message-State: ANhLgQ3AbZaOs+eWcWmeBYf5mDjLKNHTkkWHSxz88IaWVBFIhVeokxVy
 a8SHvBDK8vy+AiZKLmjeT1wXyw==
X-Google-Smtp-Source: ADFU+vuHs/YqjTagHQi8/SIGIi44ZkuT3e9cdVdLX441TK+A0Z2om/47O08Fbn3La/oetfhgCq1UYQ==
X-Received: by 2002:a17:902:b901:: with SMTP id
 bf1mr59761plb.133.1584377080944; 
 Mon, 16 Mar 2020 09:44:40 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
 by smtp.gmail.com with ESMTPSA id gv7sm332411pjb.16.2020.03.16.09.44.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 09:44:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: meson-g12b-gtking: add initial device-tree
In-Reply-To: <1582985353-83371-3-git-send-email-christianshewitt@gmail.com>
References: <1582985353-83371-1-git-send-email-christianshewitt@gmail.com>
 <1582985353-83371-3-git-send-email-christianshewitt@gmail.com>
Date: Mon, 16 Mar 2020 09:44:39 -0700
Message-ID: <7h36a8w8p4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_094442_594403_C6371413 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
> board with an S922X chip.
>
> - 4GB LPDDR4 RAM
> - 64GB eMMC storage
> - 10/100/1000 Base-T Ethernet
> - AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
> - HDMI 2.1 video
> - S/PDIF optical output
> - Analogue audio output
> - 1x USB 2.0 port
> - 2x USB 3.0 ports
> - IR receiver
> - 1x micro SD card slot
>
> The device-tree is largely based on meson-g12b-ugoos-am6.

It's more than just based on, it's identical (other than compatible
strings and whitespace fixup[1].)

Both of these are based on the W400 ref design, so please make a W400
.dtsi that can be used by both ugoos and this.

Sorry to be a bit picky here, but there's a prolifieration of these
boards out there based on the Amlogic designs with little/no difference,
so I'd like our DTs to reflect that.

Thanks,

Kevin


[1]
$ diff -u arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
--- arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts	2020-03-04 07:06:17.089604752 -0800
+++ arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts	2020-03-16 09:38:06.983705705 -0700
@@ -14,8 +14,8 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "ugoos,am6", "amlogic,g12b";
-	model = "Ugoos AM6";
+	compatible = "azw,gtking", "amlogic,g12b";
+	model = "Beelink GT-King";
 
 	aliases {
 		serial0 = &uart_AO;
@@ -200,7 +200,7 @@
 
 	sound {
 		compatible = "amlogic,axg-sound-card";
-		model = "G12B-UGOOS-AM6";
+		model = "G12B-GTKING";
 		audio-aux-devs = <&tdmout_b>;
 		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
@@ -532,7 +532,7 @@
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		max-speed = <2000000>;
 		clocks = <&wifi32k>;
-	clock-names = "lpo";
+		clock-names = "lpo";
 	};
 };
 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
