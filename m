Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17299C10F15
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ecy95RxLkeYWVNJ6bNa0QfQjmHkrXUj6oIoLJlzgdEo=; b=0cqOIDnxnXg9qr
	/10jFOPkYoxLBrpNTbN7KvUSdLRI7q2ruw7GNcfyo/jM8kuX7bPcra3pq+PXR/HihvxjlVGaYdlk7
	9IeAivShCJ3QS9O0zpHJTiiFftGPLNa0if3LBoonFuIKazlU1x0oIgg0IWwyIMvMD2VahNsV2+5yX
	dtOd979fiIdjTnpjYg7Wj5u9u1RUAGVDSul1EVUwwE+YkIg7c///wLFbrS0cTt75CDE+xIK85JlZ8
	TT8JqPHVn2wg+dCXXkU13Cl+dFFPFak1ixMEFy/CkSwLD2MdG7gN1E/JoPkmA/g5MflJ/2U0ztnwJ
	bGY2sBAiV1uaKK9tmmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZsF-00000003hHs-0kXj;
	Wed, 24 Apr 2024 10:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZsC-00000003hF3-0Air;
	Wed, 24 Apr 2024 10:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=KgnsjfnRuDtEP0iffaOgxkDPWzpSTeCG29kYBJaYLak=; b=gHEWpBKZ+8VY241HOVY19Deih9
	vAuAZtD8Ksq5QqLfe7B++gicJzH0N52ev0UV3SrnVvi2+xM+Gw/NZVQMvaDX/XkdPwS6TQSlACcGr
	4g/tWwaqkKUrdpUpHbmzx2Esu/RhCHysQI/mZCjjbsZ/SHmi7zl9+rOP3QtZXbcGBn84YCtaAfeyY
	I6cZFr3YpmenM5K+thwNCO+PnxQNCiDEYYNAeeKKE8JXh1/1TtRKXh0YU3thizrPh/STWuRu7gvEg
	ZV8akPOL764VlVqNJmhk65YL2Q9UkLnvPzWNWTAC0vfH3CEmyC31eP4HhpK4PYc1WVe+T/r7ViF0y
	8+3xeQLg==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZs4-0000000EM85-09dU;
	Wed, 24 Apr 2024 10:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D509CCE140C;
	Wed, 24 Apr 2024 10:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAB86C113CE;
	Wed, 24 Apr 2024 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713954525;
	bh=GMt3bHr/0bLk2xq/2azl7lpbQ/7wyhQOM8zaZNjnyJ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Mh81jwmxMovy0OOvzxvZ3w7Y0d/WIPjl2pNSl+nmG4gIG/7DUoex6Sx+quipcrhpc
	 QlQR1lAPchfdDzH9EU/QMarHrJfjw8tt7VHxv00Yt8J1U9WVdVx3Ca7WF3T/D8ShuQ
	 zJ/dmnD8+S5P2m+214u3a0IZOOGxIVJTIQVxBJkOxvk1YM8ADZumsHd+yE1TFqRgwa
	 8YFEYL+YorFgO4FDyCsmfLa8RDVZSpyMI7mz5VPvcBmua0LjwWwXkRu/yHLcN2i2uo
	 ZB62PrwvE+EN7BGS6w1iGdXLhM9R6IhVd+ncWwruXDmdcOO4sp+ns7xpv72xgc26Wa
	 wEZjBgQAf+fpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD730C4345F;
	Wed, 24 Apr 2024 10:28:44 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] Add support for Amlogic S4 PWM
Date: Wed, 24 Apr 2024 18:28:33 +0800
Message-Id: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANHeKGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIxMDEyMT3WIT3YLyXF2jFHMDS0sLs+TE1FQloOKCotS0zAqwQdGxtbUAPQl
 xMVgAAAA=
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713954523; l=576;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=GMt3bHr/0bLk2xq/2azl7lpbQ/7wyhQOM8zaZNjnyJ0=;
 b=TJKESOCW+E486eRlzDgVjMM/9EfdVstKhuRksh8I/7CdeV2Sshl9LaATqxJ4K0X9H8NWr9d1G
 j4Gd58lMfR6D3a73YnsRiP73TFBL96sadimEK3pE0IWTOHeowhjLA4j
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_112900_550031_34130865 
X-CRM114-Status: UNSURE (   5.32  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for Amlogic S4 PWM and related device nodes.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Junyi Zhao (2):
      pwm: meson: Add support for Amlogic S4 PWM
      arm64: dts: amlogic: Add Amlogic S4 PWM

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 207 ++++++++++++++++++++++++++++++
 drivers/pwm/pwm-meson.c                   |  37 ++++++
 2 files changed, 244 insertions(+)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240424-s4-pwm-2d709986caee

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
