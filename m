Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB96CD3427
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2026 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jJkOgGEWefD42zucb7+0huVHYA/YYWkG24UE4b0jBU=; b=EPKNWx4OLNh22f
	JwGOlt+2WYZE5UQT+sTyAVc/q0F+2AW2ne9RRFCWxL3kHN3AkTatYsZKJxzl24oZ8cxqs+ekqpMC7
	sy1heLeBxxXHLlBQRPPb5BtGc/2wlTqiJ1ShmbxdY10x+Ipu84LsfTD87h/eOO0dx4wj7fpxWqs+p
	Rn/TFCI0tv+hMDwTex3ucgWf3ej+tVX70+wQ9h5RfJi026LTvokF8VbTe+xOIrck3O9isrZUXUBhf
	hIBhqGaQvqBpZ0L2eynz4SykrvltW7P3lT7wwV0Lc5FtSXU9MYY97omru+dRfi6WFE/Gx0r73Nwi+
	8CSQNnDAK6e4IAI2Io/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyEg-00000003p0x-0ZB3;
	Thu, 07 May 2026 12:53:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyEe-00000003p0i-3Xql;
	Thu, 07 May 2026 12:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 002F960181;
	Thu,  7 May 2026 12:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0272BC2BCB2;
	Thu,  7 May 2026 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158427;
	bh=NDq1yRkDTD9n1Z9MRjKoR/KHoPrasWXZhi/Utqu0UcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N1jGAtff4iiwWK8TKDqlW/GLbEyNu3o3HVgehLHfvadTuXxf0BrWwQYQlSTGU0kWc
	 NRSJH4ZQ9uNyjB5ig8ciNzDaG6IDvDP2IoCHLirfjtUhdGxA03Pwwj6F9mSmDUz5LV
	 +Ll2TquOmBdV1ZWPAFpUHRQ6158JRSd6XZ4VYB2vvsDzZnHCUimBCuFLIUad5x+BaT
	 nbN9iG1eXcXzbe8UKNtLfDju67QwMZ3r2a24adutuhe9CDmdlOYdx9TZJ6JQOT7Cbq
	 3H2ETgluYKH8BwEQW2QtaDyPMzqkMdnE6NZkWsA8omTUdQfmtZdnl6aIDq46kZWVZ6
	 nzmsj+38KEQYg==
From: Lee Jones <lee@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-1-447114a28f2d@aliel.fr>
References: <20260421-add-mcu-fan-khadas-vim4-v4-1-447114a28f2d@aliel.fr>
Subject: Re: (subset) [PATCH v4 1/8] dt-bindings: mfd: khadas: Add new
 compatible for Khadas VIM4 MCU
Message-Id: <177815842272.1844364.17432398965217021542.b4-ty@b4>
Date: Thu, 07 May 2026 13:53:42 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMSBBcHIgMjAyNiAxMzo0OToxOCArMDIwMCwgUm9uYWxkIENsYXZlYXUgd3JvdGU6
Cj4gVGhlIEtoYWRhcyBWSU00IE1DVSByZWdpc3RlciBpcyBzbGlnaHRseSBkaWZmZXJlbnQKPiBm
cm9tIHByZXZpb3VzIGJvYXJkcycgTUNVLgo+IFRoaXMgYm9hcmQgYWxzbyBmZWF0dXJlcyBhIHN3
aXRjaGFibGUgcG93ZXIgc291cmNlIGZvciBpdHMgZmFuLgoKQXBwbGllZCwgdGhhbmtzIQoKWzEv
OF0gZHQtYmluZGluZ3M6IG1mZDoga2hhZGFzOiBBZGQgbmV3IGNvbXBhdGlibGUgZm9yIEtoYWRh
cyBWSU00IE1DVQogICAgICBjb21taXQ6IGExMDg3OGU2OTk1NjdkODgyNjcyMDBhZmRiMTY1MTA3
NTY3ZTAyODcKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
