Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6423C3B198
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB122086A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYzG9zSb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n4dLxQPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABB122086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zfp/SGqU0OZsYnJKdMaVXKOX2hXq4gHV2hgdcZHvTCU=; b=ZYzG9zSbueJsU5cmRGA3hpN93m
	IMEzCClBLfvQG65qHOdlkb+O640WMRRAgSlnHd0vS6cS7XSdSss1uwDDl4kZ1l0J50HhQnH8VfvQc
	xSY1L5+04LKoYqfgIxTEK2RuKe7QxdrA96j3BodoY1y0yu3x9CLvdUiNfmW022/lW4MpPVkUuc05s
	sYbhU3eC45d2VWlvpWeK5suAyfNhhoFWSWiAINhOE+SXRJD/6S5kaBuvRTjdNu92y84qOy3hK37vD
	L+ZGx9+B+Bi71eAT9PYGRmALy5G+A5UiHhf4BeBw3C559WCjgY5hJkccilv6Q+cYnFY9IrZ1eqQ4C
	Z7+G9LzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2apQ-0008Qm-Jz; Fri, 14 Feb 2020 13:16:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2apO-0008PO-Fx
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 13:16:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id w12so10867788wrt.2
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=dttGVPvYe+0DFSlsyRJJUIcITjzQToEc+jk1zM06Pt4=;
 b=n4dLxQPN0JhQQXTz6SAWnhIsES9PG/QVSp0Dyca5BW5cpCWum4eN99uqSXNHYL7Enn
 +dQ6hjLXyzNN+qRU6P8ZQ3bymeC05amrV2ZQs/Oru8U9C/TTUrBI0e7s1j31+6c0lBlB
 X50KMfhdpCPfu63obK7Sgb6H6mVprmx1vYdIUpn1TSeCMXVI0PiitAaY/f+5+fHwDg3V
 l5+gFxyYCqkIhi+K84UgNZ5lyLXjnNjI2x6z7PmmTgecaZchzZWhTuT761DMKg4ESnYa
 AxfmDuOlpYhvctS4KcMy0He5uS0OxyE9fDBB+PVucONar1gJtmNqOQJANF+zrODomHHX
 SOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=dttGVPvYe+0DFSlsyRJJUIcITjzQToEc+jk1zM06Pt4=;
 b=TOxKqeEJ8VeI7KgerDFXxFFWiQ6dj74KmgGUW76YkaTHLVzqDcuM63CGGP9JPt3nkV
 JjpkRSefLwrMcowSCJHXxISyPRZCOSj+00QJUtuVfLR8ZUL1Ob3kCsJp2wmMKcC8WwVP
 AI6s7JnJn6vo3zrP8Nni/YCjDxeqrQxPFwfpqIJ9hut74R7sS4sMvsIV3qEQ0Eb7f7YM
 FG+JsvPQlJ2TkOSTu1RYPn5/aD/Ka7vvE4HZVqd/Ww889CdbCpPPc9XYH7Y7MQIP02nW
 hyVrSUIZ5xmuM/MXO3NmGNc7t/r0iTNSCZOn+qHb0+nha6Ky5ndHrrJMbb2QDrkNpbK4
 aJmg==
X-Gm-Message-State: APjAAAWSF8GMtZYQUEn8gnpO2/dUVdRpS6bvtIeWrV+k3K4I8tygmf2I
 nTpJsciD6Nph2TC05KogCnxI1g==
X-Google-Smtp-Source: APXvYqwJkUMkAB0wiz7MQgXQAaFjzRStc5erCu+G50eOFaOD6CBvB6S541TCYfW4sox+swqm82Pg5A==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr3995329wra.8.1581686171959;
 Fri, 14 Feb 2020 05:16:11 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s23sm7147787wra.15.2020.02.14.05.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:16:11 -0800 (PST)
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-6-jbrunet@baylibre.com>
 <20200213182157.GJ4333@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/9] ASoC: meson: aiu: add hdmi codec control support
In-reply-to: <20200213182157.GJ4333@sirena.org.uk>
Date: Fri, 14 Feb 2020 14:16:10 +0100
Message-ID: <1j36bdfgx1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_051618_538014_2E0B5792 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 13 Feb 2020 at 19:21, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 13, 2020 at 04:51:55PM +0100, Jerome Brunet wrote:
>
>> +int aiu_add_component(struct device *dev,
>> +		      const struct snd_soc_component_driver *component_driver,
>> +		      struct snd_soc_dai_driver *dai_drv,
>> +		      int num_dai,
>> +		      const char *debugfs_prefix)
>> +{
>> +	struct snd_soc_component *component;
>> +
>> +	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
>> +	if (!component)
>> +		return -ENOMEM;
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +	component->debugfs_prefix = debugfs_prefix;
>> +#endif
>
> You really shouldn't be doing this as it could conflict with something
> the machine driver wants to do however it's probably not going to be an
> issue in practice as it's not like there's going to be multiple SoCs in
> the card at once and if there were there'd doubltess be other issues.

I'm not sure I understand (and I'd prefer to :) )

As you said before, initially the there was supposed to be a 1:1 mapping
between device and component. The component name is directly derived
from the device name, and the debugfs directory is created from component name.

I would have preferred to use snd_soc_register_component() directly, but
with multiple components from the same device I got:

debugfs: Directory 'c1105400.audio-controller' with parent 'AWESOME-CARD' already present!
debugfs: Directory 'c1105400.audio-controller' with parent 'AWESOME-CARD' already present!

I copied the code above from other direct users of
snd_soc_add_component() (soc-generic-dmaengine-pcm.c and
stm32_adfsdm.c). I suppose they had the same name collision issue.

Instead of addressing the debugfs side effect, maybe  we could just make
sure that each component name is unique within ASoC ? I'd be happy submit
something if you think this can helpful.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
