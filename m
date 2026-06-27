Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCEAC43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dftA9EqjIzGcgBWGg9RfgkDvwQJTExoY+2c0ASBHLZY=; b=c0o3R4ysSnLviP3cocd+VceozV
	q/HZPhjlo3Kyyr3RkVonZzhjDvcPTMCSxyB56yKIM2RnaT6CsUmx51H3GVnmfoE3bOpFEdBcGy+wu
	Q0R0QSyfZoHZpxcCvLOVU2FJpshLlG/4FNpnwZk14pLg6UBEmnnjSKCaNsLMa9B4m5ehgixLP1BpW
	kxzLglNoocVafzkHzBAGILJRxM4O7o6PEVkIppJmQqnbLaFUrWT3vfRSaYIPKM16w8MlgMB2KaQog
	vOjBTmMr0tDJgOW6eEwwmeGnD6pKP+wniyUVIfZ723SsWlQQh2k0pLQhwSDrnpTcGJYMxHjguDg5F
	oJhbELNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTq4-0000000CXoJ-0AwJ;
	Sat, 27 Jun 2026 14:16:56 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTq0-0000000CXnn-2HKV
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 14:16:54 +0000
Date: Sat, 27 Jun 2026 13:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1782569806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qPuDYKdwvZSZbJFKpqDaIAHRtZG5G1aWy+PB5mHHpok=;
	b=gT58mlhsqP4+uwQrQkq1uJ/P1liYsrE+IgIj4wlDn4MaNfgtYG494jophxL+qP6n1GGta4
	FkhtAegIuIRq6hMEqTlxN5aupnIjgpbw98mw38bEyMbPH3tSxbTz3WrCCXGXU9Vjcta5Ff
	4MpK7cAelJjRhWIp7SfX91QrSseyLTIcIfm3WfAwUvTipLiQEJrhTFoQMU6oNG3FiaDcF9
	q1BWIOVouumBO5iaIqdu+lIah1E7knT/vJmnhgXDR70EiewbpgSA/05sYluB2OnA396nPi
	DZ7E2OHMDFdUx7QIaUtvubHhog6rCxv1uHQhXjHxLkLAMklzkLif4Lo8o/Xg5Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Christian Hewitt <christianshewitt@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
References: <20260627125030.808058-1-christianshewitt@gmail.com>
In-Reply-To: <20260627125030.808058-1-christianshewitt@gmail.com>
Message-ID: <thanni.i9bbkrc1oza2@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_071653_088193_0BDDEFDA 
X-CRM114-Status: UNSURE (   6.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

On Sat, 27 Jun 2026 12:50, Christian Hewitt <christianshewitt@gmail.com> wrote:
>The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
>AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent:
>it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
>producing the "machine gun noise" buffer underrun - on start when switching
>outputs, and on stop when playback ends. The latter is audible on devices
>with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>
>The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
>both enable and disable (audio_hw_958_enable), and when reconfiguring
>(audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
>reset before enabling the DCU on start, and after disabling it on stop.
>
>Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
>Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

You may have forgotten to add Martin's R-b here.

Best regards,
Ferass

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
