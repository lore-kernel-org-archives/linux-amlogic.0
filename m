Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C873EC9833E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Szkjy9j8cdhTI0XXUVY5tgvBab+w+yEmjacOkYqnRGU=; b=wKAAG+8GVxZDQR
	jT/kZC+A9DoEiwCKXgUmVEHKgOi6rnQt84OKdUFvrNflbEdu8WYlTSMPqXaK4vraypg67cDmcxPiC
	0gkZGIkewgSVzNXMjOaC1d5ujLac5GEofmNnPYiQxprKwm1nuOPV6Ypq5k4tA6eIQuT2iXtHZRmrl
	9boo7uRK4/E/Gwr033Jeryfx4+7tWAqYLrfGndOw7+mh2Vo0xEM74nsGTrGhdGJ0cW2tU4Y9AzCBP
	9xSAah7Pxb58pv0wdWvxWJcHvyzIqlGZitc0oM6GhK0M05JRqeeEEa71g0uHX9GRqRptQ3uLTrbcG
	AnjX7NdgVA+sj9IGjs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB842-00000000Hg5-1QNW;
	Mon, 28 Sep 2026 09:54:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB840-00000000Hfn-3PpZ;
	Mon, 28 Sep 2026 09:54:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C38CA600CB;
	Mon, 28 Sep 2026 09:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B5C1F000FF;
	Mon, 28 Sep 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589263;
	bh=w2RS/xxMW4j685aSXnFhy/xzBc7bDP8enBoN/0ACKJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V6UgGT3CwHGxbXbyaMm95Dd2M0CFYObVt+NXiWGsFTlgNyvSbWHgXO7aWe26u4Ysn
	 HzwHZRNKIv6FJ3NBppiWG8pOmbimiifGTh+LiYoDYBOtE2MGNw61EspchSys3XtvT6
	 2rrvzdUGVI9VyvUamONwZzizucrdTCDxSYrYXWMJt76W34hdZojhu+x4Ui/ZFRo2Kr
	 1yA93pP+W62cMq66RTnV0RrLlqm8NhKGN3OZG2iR6elSwOTjaJx3D6bucCJJV2vyaC
	 RIhpixdNKImcpWr1/0xSyplSB37d/LuhfpMrID1UxgkIRixgJpSml3YfpTXiIBBKYR
	 Jka52ZRFXJ2ew==
Date: Mon, 28 Sep 2026 11:54:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
Message-ID: <20260928-native-hornet-of-luxury-81edcc@quoll>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-1-a760312c076c@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922-audin-v3-1-a760312c076c@baylibre.com>
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

On Tue, Sep 22, 2026 at 06:00:46PM +0200, Valerio Setti wrote:
> AUDIN provides I2S audio input support to the Meson GX platforms
> (GXBB/GXL).
> 
> Note: GXBB and GXL are not known to differ so the driver binds on the
> 'amlogic,gx-audin' fallback.

What the driver does is usually less relevant. Here, completely
irrelevant. Explain the compatibility between hardware.

OTOH, you cannot have family compatibles (clearly documented and
explained on every beginners talk), so what is the GX?

And I already asked for this:
https://lore.kernel.org/all/20260913-inventive-millipede-of-certainty-dd58ce@quoll/

We have it extensively documented - in tree, in talks, in existing
examples - how this is handled.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
