Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67052C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 19:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Daf2NaAiTP90wx1ZUtjelLX+UFDMuclSirKMk671USk=; b=GHCCbTuAlV7z4i
	g1dnAGmkAsWprV2xoZkW3cM63jx217M9IVEPiGaz8mnWzmoTV8SKNz5LWFe6dprLueSzxFUkItf4T
	bcf8DtExAskrRJShfyGCGlxIsuiTfNZCf16gTP8oPhT6oe9K/TCo3v+i1rqfYb6cUh/aYaoniScV/
	8aCMpVl/y4sF7UJMepQDSSch1/5MrmMMvB+DYWTPpawhkk35tgf7k0s63gG+IZeE+kVPdpSJHIoLb
	Pk80t7tbwi2+BtMZHNYlB1JNn1d1NAFxZMfBc1JCE8U2wZIiRlerwmbDC6DgXNynDWCxAOvCTSEZb
	kHDDx4GGiujfvj+kLucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlwS0-00000006FRh-0DpJ;
	Sun, 17 Mar 2024 19:45:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlwRw-00000006FQf-1DsB;
	Sun, 17 Mar 2024 19:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 495AE60ADA;
	Sun, 17 Mar 2024 19:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55260C433C7;
	Sun, 17 Mar 2024 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710704738;
	bh=hkVeux51Cmhvp7Xg3Iab1zpv0mwTLFU+W3UsYrIQPaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dltRHZ8b/HGv9D1TGsihU+XD5kgo7B+JJEUXHnQQDEiDeYKbO7oS2ou3j2gTFCkeX
	 cIFHfIjZzp5+2Kcn5zBqJCnZkHaJHF1YzR0qjzRi7LvCXXjaa6p0pmi1+UlFwr5wks
	 /6wf1Vb7f6rPfBqtMEnBG6cdfdXPw8ACFUXfEAcRJYy5cwDwn7A7oBRuE3XbYuhAmO
	 cD6fhw4Jbr26lPRJgnSoSKnY7odLk8NISMo24Z6u4icPmc8F2q4yGfMItGFeFLP5bD
	 HIvKVZClMT+EZxJLdjgVXqb9KkaocIHZvyI0klslGICo71sObO8zV5a8NM3xFed+MT
	 4wbyLiD1wYf+A==
Date: Sun, 17 Mar 2024 13:45:34 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	kernel@salutedevices.com
Subject: Re: [PATCH 22/25] ASoC: dt-bindings: meson: introduce link-name
 optional property
Message-ID: <20240317194534.GA2093375-robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-23-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-23-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_124540_403562_8A35B71D 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, Mar 15, 2024 at 02:21:58AM +0300, Jan Dakinevich wrote:
> From: Dmitry Rokosov <ddrokosov@salutedevices.com>
> 
> The 'link-name' property is an optional DT property that allows for the
> customization of the name associated with the DAI link and PCM stream.
> This functionality mirrors the approach commonly utilized in Qualcomm
> audio cards, providing flexibility in DAI naming conventions for
> improved system integration and userspace experience.
> 
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

This needs your S-o-b as well.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
