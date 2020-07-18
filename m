Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44652C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:40:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 120772076A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X6HtR451";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNEe8AGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 120772076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EW8v7d9Zqx3BkSXEVkcOQRXjSl6GhMI/1AHST5jerJc=; b=X6HtR451lozjXETRG4qfwW3qvH
	lg0WGNGy0U7hyKPzst75hf0JVCdsFMco+4vyexp1IuEnuqcl8tvbKTRU6XNPdZNELD7XIY9Wm92Kj
	VDayUHkH9nz7mybayOWBQYlEpQQIxL/Zbgc2GcWLv/rOwaaQNZFG3PuHxlOWzQJFPdGTuK7HFo69Z
	EgDwhhyboCP8vw6m14r/RnNTeOuPPPjXa/v5rJ7BpOeak/tGGExLx93b1p7P8dNROJ2BIJV21hhEq
	V8E5er8IyUpD/yUlUDSt7wUlJBzcx5t1Fmt/x6E//M5K/LGBecN1TtYf28t6z6iVg7xZ6ZWRAT/Ai
	OpdCBEbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfab-0003tU-Qe; Sat, 18 Jul 2020 05:40:49 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfaX-0003sW-QM; Sat, 18 Jul 2020 05:40:46 +0000
Received: by mail-wm1-x342.google.com with SMTP id l2so20445077wmf.0;
 Fri, 17 Jul 2020 22:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pHFn3qli/TjcBYDvPYIZphMr/9QXXE2rgKtRBMGR0ZI=;
 b=ZNEe8AGalV3orNvMIKrPzBzMHPZqcNzooMpw9EXGTVPWf/dHyyk7xaLEQngOcZya/D
 pThmZNBRstvLjKQ6tm4kOiP/1sIOh229jlklB8JcibilNTBrjJc9e3KYMA1+6BFLzWpa
 gLkz1wib73q5Mc75eqngEnfubM/dTp4/7zHe4dwdtRaFLzQFGe+UxqqWfVZqqXZRts+7
 oWvf7g4Cq4q5ssPwTbKzqfDULdOREybSIRkN54yO6yUcoDK9n5uEePTDgPNkeEfML/U0
 Hp2cLap8SdlW1XwjSjiIQySVC/qRDXnlgkMPcgzzozT6Mf0N0hGyLETi+1EwLUb2Cz8O
 NOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pHFn3qli/TjcBYDvPYIZphMr/9QXXE2rgKtRBMGR0ZI=;
 b=Y8oxR0ipZ8VQiWOo/aJ91IIWoh6fo3L2N3Js2rVRn8u+pjPYYzhas3ZzZgGUpNRw4V
 t5D/9/j75D8u8Tz7O9Y4QwOXJhViuX3zACG0QUpl5o6P1QV4qYXFvRaV62Zop3S+FyXl
 6lHO9/wFff+I63m2USpYO9wMrYhESS8TM9RPJgymQfje6Ky6OWFG7uHUHMtJiKOthUE4
 cSVTqoSK2FtJSDTC3jz6THCJYk6IAX9k+3ICCDXEaHNIPP07fPkTag0YXUyVbu89Lgjx
 ypGj+Rh4+tBpTl/FWqNyPyd/xcEA58Wi5CZRqWSp7vsvnJrj8purLT/nfNGkvr/hwVr1
 7ccA==
X-Gm-Message-State: AOAM533R5W0JDR+1lYeei9v3WtQYdfESGLypL7ucgxrJrEvukFelulIt
 lm2t918AQpljmZ+HV6qAMzk=
X-Google-Smtp-Source: ABdhPJz14TbNNNBW+nTTvXOaLTqyKPD9qyFpCxpQurtQUWxPrmzmSQhDYHvM1885ty1C+zFmLOaYTw==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr12739965wmi.85.1595050844672; 
 Fri, 17 Jul 2020 22:40:44 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 59sm19361711wrj.37.2020.07.17.22.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:40:44 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
Date: Sat, 18 Jul 2020 05:40:40 +0000
Message-Id: <20200718054040.3996-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_014045_914926_1E8CEC5F 
X-CRM114-Status: GOOD (  11.61  )
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

Similar to other G12B devices using the W400 dtsi, I see reports of mmc0
tuning errors on VIM3 after a few hours uptime:

[12483.917391] mmc0: tuning execution failed: -5
[30535.551221] mmc0: tuning execution failed: -5
[35359.953671] mmc0: tuning execution failed: -5
[35561.875332] mmc0: tuning execution failed: -5
[61733.348709] mmc0: tuning execution failed: -5

I do not see the same on VIM3L, so remove sd-uhs-sdr50 from the common dtsi
to silence the error, then (re)add it to the VIM3L dts.

Signed-off-by: Chrisitan Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi     | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 27408c10a811..ddfd52b88002 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -293,7 +293,6 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr50;
 	max-frequency = <100000000>;
 
 	non-removable;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index dbbf29a0dbf6..026b21708b07 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -88,6 +88,10 @@
 	status = "okay";
 };
 
+&sd_emmc_a {
+	sd-uhs-sdr50;
+};
+
 &usb {
 	phys = <&usb2_phy0>, <&usb2_phy1>;
 	phy-names = "usb2-phy0", "usb2-phy1";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
