Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585B8C282C5
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqCpeaqJAm460IqrYoCDvVYBANgme+pdkZTD6PAg6wg=; b=Yw8Jm9uGtmWlAy
	ZY5vYJz76LBcg0Yyt6OxFHf2M8IU2Lyu7U9yuumsn8euiZ4ruTU0ivTNAvC5ml4T4n0vgHWdlER4+
	90PzeF9gbPWPP1uGhAPwsKYeiWzO2GnRGdMJvnPYbA4uuikwFTA4ignIvus/CamOwXXN8qPwqvaHI
	iTljdwJAA97DJFwdooeiwjZMX3IxIblszUC5zUhvkRJUBFbqZkAWOhlS+3BxTnR+9m2gyAxdOYJvS
	cQhLXW+oamTChPYeESQJ5nzoRtISlQR/Af2Y3vBP6hUFqWn6nvDRfOHZjrPRXr7A4mDnAvJC/jnUS
	llbKVZl88VNbU4s4I3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Sp-0000000CoK3-0MLN;
	Fri, 28 Feb 2025 22:04:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8JQ-0000000Cmef-44XL;
	Fri, 28 Feb 2025 21:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77E245C5CF9;
	Fri, 28 Feb 2025 21:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28DAC4CED6;
	Fri, 28 Feb 2025 21:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779668;
	bh=lPLFh+00xp78235bh44TfGLXIDG+nOh0mclninRKRyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBfYwbSngjDbqOzR37piyYJJcx6t1dyst5pJ6u5QbGRVsI5Wu4tc5qP/SD0Nw0BzE
	 ONw014XSi7UKWKvJdb+MHaHs5D8sKdo5SrTUVqZGEr+QO4F41ztzXcC/Jm/1OqaKab
	 EmwWw91YTylLtqIt4Gi7fjSotl5uiEboYIqoBhAJn8X5A0saOO/GKC7QleUfY1EGmO
	 Gqyy/IRssEDpX5gH4JSQDPpdIOZhujelNTaCFZrdF5nBfriVDUxn0cJ3FWZ/LcgIJ4
	 ghbLoGVGmVgYc+X+cddNHGq6MA6ruxhvVkrmtlB92ltBiHsS4iQr7bh1ZSl5zAGw0M
	 jjnvymy+QCHjA==
Date: Fri, 28 Feb 2025 15:54:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: shuai.li@amlogic.com, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org, zhe.wang@amlogic.com,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, jian.xu@amlogic.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
Message-ID: <174077966526.3761473.14676912177806602380.robh@kernel.org>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
 <20250228-audio_drvier-v3-3-dbfd30507e4c@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250228-audio_drvier-v3-3-dbfd30507e4c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_135429_055464_363481FF 
X-CRM114-Status: UNSURE (   7.85  )
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


On Fri, 28 Feb 2025 16:04:11 +0800, jiebing chen wrote:
> Add the s4 tocodec compatible
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
