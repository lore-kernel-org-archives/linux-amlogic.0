Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA7EC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:42:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D9D206D8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRuVqdrK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms0KGcSE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82D9D206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MxIUYavBQxJFNM4oCuxTG0F3mIuU5WYvZlo8Co1Pg60=; b=XRuVqdrKYbcbV4sCad+7thrh0v
	dJb/MDvAQBEDEE2tz3M02CjGBKTNo82LwXJVXyF8kUbEaTQIRGCnqYby/CtqcFFJ9vFSu9kGj6xvn
	3ocJU6R8ooXdQ5+nCizMypb797spynD5jXy6M4BtNMT5qDkeiemyb4knjuPq5E9Wp7XHo/oFe/+rF
	rWHlD7CO6pBAYnUMpXfQA/7W/aiYXPzrMKvoFEOSiNdaRMhD6z1BCukw2ExupshuUXhTgOstRhyFB
	tjIY7KDXWIapq/sWC6+cXVpVVz/JRhwBgZtMLMSUSUE803EboSFoRTmFtXl3zBKIAHH4i1aEhiD0t
	7MxMVKJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYD7-0004cd-5o; Mon, 16 Nov 2020 06:41:57 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYD3-0004bu-Jt; Mon, 16 Nov 2020 06:41:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id 23so17386135wrc.8;
 Sun, 15 Nov 2020 22:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8abYbNHeOAKQO+ZnwqKzB6uY0HVsB9/O47UXrKWrphc=;
 b=ms0KGcSEoD6prNcUVV6jXCA5mwD5UL1h/dM/06oqjlm2pib1Qm4MGGYgmubv10K5rD
 OOTfTd5AW2vT/MJmB/ewnwIXD5jdKknpKHk05AYL4hx3G/Y6N94Lnc4qxRZG1+JG7M4n
 E/Rj7K2vPCw8ty0ag89sHgrtLQOkWDCRW/yulZpG+uGCrrljHsivpUMvj3SQsGQ0VgRU
 OEBrA2FOwUL0ETHeuydj4BadVgHk4pSE50kNiRaKvAjejzrYUUbZ+WgQjpjQOL15ogra
 8Euo67DgEkw4xJpCIDwwE1AtwQfT+0xBJTVhThy+z5+i+0a7yyYyGb5HtV8Sx5cUZoye
 czow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8abYbNHeOAKQO+ZnwqKzB6uY0HVsB9/O47UXrKWrphc=;
 b=ZDHGT4eeln/ES99We5VXrsPNFd9ZrOEYWXM47bmbiw0bRXXlATmhTB56lVSdm2LNsk
 HAKT6YtpMkmiczXmJfQsh+6FbMdVzJrEMPX8WB8Eq1NKYFWm5/4+wSZ93q/7tkshZ4BQ
 8s6kcIgrMxJAsU5Y6HN2xDKoY3RJRT/2dhLRhylSkSgvfjv0h8U3rGUxoZP299Kyj+3j
 r72GR+Xv7+M4AZRYeGJgf4MM0IFIVIr1+8a7ft5RYIxINrxtBOI72NZz2RrRW7JARMW3
 5mHUahB5bksq4HPVqLQWzk/Y9W+Otu7OLHkticLt6cw+62zYFyADh+TTNu1zOUHyRSsK
 KAFw==
X-Gm-Message-State: AOAM533ELf1B5tswQlkP9pLNZZQmDiHDEhwxf+qCauz7N3td/piBohhR
 scijVhs17a7wVGLGE6DNVIs=
X-Google-Smtp-Source: ABdhPJzN0JvWNHwbBHX8nxXHawQXm8cIFplFzvAQL5EiogeRN+gqI26t/xG8oPw4S+m57psA1CPsGA==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr18535487wrt.38.1605508912575; 
 Sun, 15 Nov 2020 22:41:52 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r8sm21262631wrq.14.2020.11.15.22.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:41:51 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: enable rtc node on Khadas VIM1/VIM2 boards
Date: Mon, 16 Nov 2020 06:41:47 +0000
Message-Id: <20201116064147.12062-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_014153_748587_581CDE8F 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: Artem Lapkin <art@khadas.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the rtc node on VIM1/VIM2 boards so users can simply attach a power
cell and use the on-board RTC without modifying the device-tree.

Cold boot with no cell attached is gracefully handled:

VIM2:~ # dmesg | grep rtc
[    7.716150] rtc-hym8563 1-0051: no valid clock/calendar values available
[    7.716957] rtc-hym8563 1-0051: registered as rtc0
[    7.729850] rtc-hym8563 1-0051: no valid clock/calendar values available
[    7.729877] rtc-hym8563 1-0051: hctosys: unable to read the hardware clock
[    8.126768] rtc-hym8563 1-0051: no valid clock/calendar values available

Warm boot (and any boot with cell attached) recalls stored values resulting
in consistently faster (re)boot times:

VIM2:~ # dmesg | grep rtc
[    7.441671] rtc-hym8563 1-0051: registered as rtc0
[    7.442663] rtc-hym8563 1-0051: setting system clock to 2020-11-16T05:49:59 UTC (1605505799)

Suggested-by: Artem Lapkin <art@khadas.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---

This supersedes other recent attempts by Art to make the same change [0]
and [1] which were rejected for lack of justification for the change and
leaving comments behind. I have been using the same changes in my own
tree for a while.

Christian

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20200925033017.1790973-8-art@khadas.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/patch/20200925033017.1790973-9-art@khadas.com/

 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d0..638a5992d760 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -97,8 +97,7 @@
 	pinctrl-names = "default";
 
 	rtc: rtc@51 {
-		/* has to be enabled manually when a battery is connected: */
-		status = "disabled";
+		status = "okay";
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..da000c10b945 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -228,8 +228,7 @@
 	pinctrl-names = "default";
 
 	rtc: rtc@51 {
-		/* has to be enabled manually when a battery is connected: */
-		status = "disabled";
+		status = "okay";
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
 		#clock-cells = <0>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
