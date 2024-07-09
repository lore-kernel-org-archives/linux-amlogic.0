Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C56C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sZyK2jI14JyHEfWWbvd0v8g0mbr4sn8+JMkERSR1oFg=; b=qaw8w0T8TNMHb0
	Vu5p3bur4+PbWRT/XHDCHKex9MXzn8mKz0CC6WHUlGgh9iu4MBSKRNsEJ8BrihkoPR0Kwxk/7Jo3w
	9EuMsi88DtkOn/AcITjWDgINxsgsvBGLVdkwqvQ39HuWjfMQBTJsuj5hWlhqym+Ej15c2RU9FayxX
	rlueRswE0vdeq27MKyE10dfhagJmmZlRj9eXlg4XvWIa9DCcsdG0tRx7f11J42oOoij6ktxpqyDaE
	orcCNnS9FIFIq0+Pc0Ys/DAM02+DPXWXrEVGGKLmFURH+dfv7xnNZX9kV0d5gXtD/rOVcYgfTMB+d
	co1+9W/AWjUWu4wkmKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6Wx-00000006T7s-2znd;
	Tue, 09 Jul 2024 08:48:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6WV-00000006SvS-08J3;
	Tue, 09 Jul 2024 08:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47F68CE0E6C;
	Tue,  9 Jul 2024 08:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 647AAC3277B;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720514908;
	bh=7xFWmZqAPbwyctuy8n9YTTEtQ0XcaDLndPTpjsgRAmo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fsw5n2+cgbOJwHCO9O0LChToWDSnmiexSSrfTlCowlnGCL/KCF88GSG6pkbmAsgsb
	 DbUDtiVKARGWxWZ20DVgF/paxqI2L+JksDvsX7povhSoO0NS+QYvpAKS0gpwhiyYGA
	 VszWkZO+sZhI7ZWavfiSJ800pH0XoSvMx5GKj8FXNmWUZtupwfObo/NVWw7BG1hMH7
	 fs3D8lbwxV1gdTYzA+hmSYy5XnpMDkkp8bpM1Ikn24LWMpZaDHcKV4qStFirkRSJ65
	 tyilWCcoIvVDG4jMYD0jZ7zGLftIMvjhmd2ovVSkRW74ZJkp06vmHfkreFzN1pnRU2
	 6cTaPIjepLziA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D01C3DA41;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Watchdog: support for Amlogic SoC A4/A5
Date: Tue, 09 Jul 2024 16:48:24 +0800
Message-Id: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFj5jGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNL3UQT3UTT+PLEkuSMlPx0XeNkCxPDpKRU8yRDMyWgpoKi1LTMCrC
 B0bG1tQCGKsOqYAAAAA==
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Huqiang Qin <huqiang.qin@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720514906; l=641;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=7xFWmZqAPbwyctuy8n9YTTEtQ0XcaDLndPTpjsgRAmo=;
 b=bGg4Jsddpfot2LQfW1JXBFEn1k0C3vVF6gJD+SLpLPT8OdvLjTJ1uEeHADGXVrplXYvbcQMaJ
 7+HMC6RuKKKBx+uBAp0e/2t85lsGv0ukBn6d25g+ug2ZhZy2D8WIg0X
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_014831_301626_62947156 
X-CRM114-Status: UNSURE (   6.97  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add watchdog for Amlogic A4/A5 SoC. 
A5's watchdog is the same as A4's.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Huqiang Qin (2):
      dt-bindings: watchdog: add support for Amlogic A4 SoCs
      arm64: dts: amlogic: add watchdog node for A4 SoCs

 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml        | 1 +
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi                  | 6 ++++++
 2 files changed, 7 insertions(+)
---
base-commit: 338c92a5d1956f1841f84b86923087676d1d0cea
change-id: 20240709-a4-a5_watchdog-3c841bbe7b16

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
