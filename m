Return-Path: <SRS0=Uhi5=E6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC72C56201
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2020 14:53:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4FD220715
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2020 14:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZLizLat";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsWfmB+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4FD220715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=or4Wegh7CXnwX6hVnsPsAtOJmHXA55TgTPKArFMgsjY=; b=MZLizLatmuwo0926AqNpC5vwpP
	UG0PJQVnRU9sBUTTH129m/NcZENdhw1d5SmXiReoH05xhGL0q1WO59A6ZyUrJgIPjSr0cishKtNz7
	+c97ZQ2aJq3hai5X3jVXO3QMCmA85eDKzmci28ZvvE/33mR7GU9Uo6G/IwxVy6Pr83Lgts+hcL1T9
	2mD/wDMF2KG9pod2sW71a7s1zQeonNcIbfj8Lvcw3fDs4WNNoLs2Goi/7DZGX1+0abslGR1E1PIdQ
	K7x/ZKV4LCSSn3Yy0lu5a7stVpL837/j9LDMmKRBZ/pteBvzYlyORNQQlV+NV0Lnhy8zlFLM4pISV
	8AjjuDng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khZhW-0006ZZ-5Z; Tue, 24 Nov 2020 14:53:50 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZhR-0006Xs-AX; Tue, 24 Nov 2020 14:53:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id s13so3143717wmh.4;
 Tue, 24 Nov 2020 06:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U85Rj/DRPt7jatgyQvBV2N/elTeJi8YB+AB1/+8bH98=;
 b=BsWfmB+fF8m5306hgWRxHXjKleQcreC92v8fefHpo9f6djstFLrwU6ffb7ajMN1JDI
 NS+DowqTq3C1G4VABHtnEAPRhTFmdA7s8fty4kY7pauWFqgI7nFnbjD7dtjY3Rik2SIN
 xs64HE+hVe/Khp4PzxeWMg8F2HRM38WXkdpX447gmp9HElsK68hB+ly7cS6fIilzHE7Q
 TLAmLWSPuaH3SHAAJxREjliPH6Poeu3/NUGnk9z/dZCWJprpYQ2kasXgxfbxtv07LNdL
 W4SwiSMPuomApTprge70sAjvjmKF8fGH6Ti7jEeXOQCTJC6TCDt19sHS5oWpku0dNIJ+
 pshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U85Rj/DRPt7jatgyQvBV2N/elTeJi8YB+AB1/+8bH98=;
 b=MMrfeXp16VfUXgFH0hyZH4xfAIXq4YyANs6uX5F0e0jvwWxY/3IoRJ07ADMv6ricIG
 ZFqVAaC2Z7U2O1DPZMhrZI0/3PTxRaTqK2OTWWnVKTmBG0cP/nV/mQFRZg8Po0Rw1m5M
 v8+saXiUQoQ/ErZBrgoLFjlKKllfX0uH2RqHZeHNIPe4ExdmicSIwbwFMvzNV8VglSzA
 FbT68hW3pZ/kweUhRrbMERPwNmNJpuDTBkTuhEbsXE2O8h1MiPZgod/+GawRPS0eg562
 sVRneZ7Yo8vFl2OuJQ07LuLTFRXgYgNS08nyjfmqKQtffkWIJBrffjq4S+Yjh5BAvMfp
 XXDQ==
X-Gm-Message-State: AOAM532GlG4Y17Ou39uia5UZogVN2R6BBd+8ncC0pywd6PPCResAX8Cy
 8hqsyb9OGw20Wr2vyzxXrXau56nJBL8=
X-Google-Smtp-Source: ABdhPJwEb0GTsAOC546Ms4Bn278hN/6nwa844FnwPV9Yu6zqQzYMCmJ4XtRlCyJlF/MlNDNwkbSqOw==
X-Received: by 2002:a1c:3d05:: with SMTP id k5mr5042689wma.151.1606229623776; 
 Tue, 24 Nov 2020 06:53:43 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u23sm5749930wmc.32.2020.11.24.06.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:53:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add rtc aliases to meson-khadas-vim3.dtsi
Date: Tue, 24 Nov 2020 14:53:38 +0000
Message-Id: <20201124145338.17137-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_095345_380928_02A2A49E 
X-CRM114-Status: GOOD (  14.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Tweak the node name to make it aliasable, then add aliases for the
on-board RTC chip and meson-vrtc timer so they probe as rtc0 and
rtc1 respectively.

before:

VIM3:~ # dmesg | grep rtc
[    3.622530] meson-vrtc ff8000a8.rtc: registered as rtc0
[    3.622574] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:03 UTC (3)
[    3.646936] rtc-hym8563 0-0051: no valid clock/calendar values available
[    3.647125] rtc-hym8563 0-0051: registered as rtc1
[    3.852382] rtc-hym8563 0-0051: no valid clock/calendar values available

after:

VIM3:~ # dmesg | grep rtc
[    3.583735] meson-vrtc ff8000a8.rtc: registered as rtc1
[    3.633888] rtc-hym8563 0-0051: no valid clock/calendar values available
[    3.634120] rtc-hym8563 0-0051: registered as rtc0
[    3.635250] rtc-hym8563 0-0051: no valid clock/calendar values available
[    3.635267] rtc-hym8563 0-0051: hctosys: unable to read the hardware clock
[    3.852632] rtc-hym8563 0-0051: no valid clock/calendar values available

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 69e6c03a787c..8f8656262ae7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -14,6 +14,8 @@
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
 	};
 
 	chosen {
@@ -333,7 +335,7 @@
 		#gpio-cells = <2>;
 	};
 
-	rtc@51 {
+	rtc: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
 		#clock-cells = <0>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
