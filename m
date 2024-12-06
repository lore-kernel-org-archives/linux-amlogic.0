Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21460E77173
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2024 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tuoglb6X7ZFT153n1sFFpekOInWI3gDXqXHCQqcKG+Y=; b=NhDQoZ3Gjg5sJf
	PrdN9EC7LoyQDJAbYqD8BZCDCjzduHoyNA1W9CWc7G6VRPK3H0ZbojRZohSxjUV4C2LX5wstHHDID
	Eb9nGm5OykjmmtCjAcGqSO7K0Y8p75lxx404zpcQsmlx2Qj38+2Ca4GK4cAUCyRmmAPZyUBhB9hjk
	CikD85fScPASBKGGWbVqmf9YrCEj6VmN2/Ucl/+01q8ZVTpKGSG90PBUDxAS/MrDEClgcr6LSYEBy
	hQ5DMKdhn9lpYHs+SeZ/PoU4J1gtPtiu6lULoKBBfwIKBXzqmHCEtnbRXAqq/Kh90eBQB1vcrW1yb
	qp9FVbClCtfyrWzknWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJapK-000000025Pp-3T2T;
	Fri, 06 Dec 2024 16:05:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaoI-000000025Ce-2W3K
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Dec 2024 16:04:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tJaoE-0005lP-Ai; Fri, 06 Dec 2024 17:04:02 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tJaoB-0021SN-0o;
	Fri, 06 Dec 2024 17:04:00 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tJaoB-000Bg5-32;
	Fri, 06 Dec 2024 17:03:59 +0100
Message-ID: <036d3c0e721947002dc598aef2b65d48967ab52e.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] Add support for A1 SoC in auxiliary reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 06 Dec 2024 17:03:59 +0100
In-Reply-To: <20241112230056.1406222-1-jan.dakinevich@salutedevices.com>
References: <20241112230056.1406222-1-jan.dakinevich@salutedevices.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_080406_633814_65EED35C 
X-CRM114-Status: UNSURE (   7.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mi, 2024-11-13 at 02:00 +0300, Jan Dakinevich wrote:
> This was a part of series [1]. Comparing to original series, reset functionality
> on top of 'audio-vad' clock controller also is added.
> 
> Links:
>   [1] https://lore.kernel.org/all/20240913121152.817575-1-jan.dakinevich@salutedevices.com/
> 
> Jan Dakinevich (2):
>   dt-bindings: reset: add bindings for A1 SoC audio reset controller
>   reset: amlogic: add support for A1 SoC in auxiliary reset driver
[...]

Applied to reset/next, thanks!

[1/2] dt-bindings: reset: add bindings for A1 SoC audio reset
controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3465a696bd93
[2/2] reset: amlogic: add support for A1 SoC in auxiliary reset driver
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3d99f9231bed

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
