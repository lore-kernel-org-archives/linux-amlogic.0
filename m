Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C574DCA5FF0
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2026 04:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxB/IkZsUhmE+poYkN4lt3dSOK/YFweDA3GmwYa1m8s=; b=CQkeAv4RcrsFye
	L/zNHH79yFWDFfbZJ3wsXMBt4XnU6ZG1qTc76bSAZBfNUcrzG7uRiZwjWYW3msN6kvVix/TGIU6f2
	bYLxr6zGTOSuvJlhvgkoC0kfDbhGvtg2NDHzy+ForFZj0fsQio57v/yCT+BARsZJjM4aBXTMHbLG+
	380hJqrRyDGGDAF+NVHdd1oAV9I44Ad886BNiAuyWSuGmNqSI3fCLs/gCbM8BxatwQ+6UHEqMMK1v
	hXhSyCiPrdf1ubu7kd25m5Mny0l/+Mkepv+UoPKcj0Aj55KtMg8dHbHM7pzPEYvnNQa07fiXwNiYu
	dWfQ8kAc/BQNa1K3wNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwoJ-000000000wL-2Jkl;
	Tue, 06 Oct 2026 04:29:51 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwoG-000000000vf-3xRq;
	Tue, 06 Oct 2026 04:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791260981; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=FjS0TW+EogxwysMgu43M48cHmsunBJV755U8qj0eLoU2xnt446vHXJ6k+RxMC20Vfqz5IT8gzykGZwoGU56+TLI5S9Z4kKktRcaITgkfg1o3XiNagma7Bv+ZpIC3JFeUBNU3Q2KYt7W8G0Frw50ruDfW5KHMUNWhJkhUiOx5ltE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791260981; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HLJZx8skdSTkwlOQto9p1gF7ZlGkvsinMZLCxnN3xic=; 
	b=dmtHOwLwAq6uxsjTH+CH78o7lADM2C97jXMCVm1bChwUk9fbfjzz1fWV+VnRQbho0GyPXtk2/nrEhExYAkGVCeUdRQGffzxshUd/INSMsikFDq24qVB0YeArXJbMHQuTGJuZMxpMyR4owkStSXkMjZbNW1LwM100osj2pJLz2dE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791260981;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=HLJZx8skdSTkwlOQto9p1gF7ZlGkvsinMZLCxnN3xic=;
	b=KHEEUrMgJFfGYQ1NsPIxFV4bAdKT5pkGcmGxFGBfEtQ08bZri839n+6QsOikLcMY
	Ii6hMK5SN0EX90ScsBLRPpQYDy6phg93mwMxE/vNmXsjNX3elPBGNssD/JGZdpvsRAH
	APXH7iJwNcmxZaArpg0+nRPbPnyAxaquHK8FxMJk=
Received: by smtp.zoho.eu with SMTPS id 1791260979404351.6587551574256;
	Tue, 6 Oct 2026 06:29:39 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
In-Reply-To: <20261006041733.8C4081F000FF@smtp.kernel.org>
References: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
 <20261006041733.8C4081F000FF@smtp.kernel.org>
Date: Tue, 06 Oct 2026 07:29:02 +0300
Message-ID: <179126094299.1095177.4869656735733059341@iav.lv>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_212949_268316_8064709B 
X-CRM114-Status: UNSURE (   5.72  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 06 Oct 2026 04:17:33 +0000, sashiko-bot@kernel.org wrote:
> Without an explicit pinctrl-0 property in the fan0 node, will the fan
> tachometer silently fail to read the fan speed (always reporting 0) on systems
> where the bootloader leaves GPIOX_7 configured as an alternate function (such
> as uart_b_rx or pwm_f_x) instead of a GPIO input?

Checked on the board: with GPIOX_7 muxed to uart_b_rx, the interrupt
counts edges as it does with the pin as GPIO (452 vs 445 in 5 s).
U-Boot leaves the pin as GPIO. The PHY interrupt on this board is
described the same way, without pinctrl.

Igor

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
