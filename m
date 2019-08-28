Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28687C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 08:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A3D2053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 08:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mag1v++o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BRdtncww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A3D2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcZvRYA3o11us6kbXjnq7XWQ1vPMSUK0YAYSo277MoU=; b=mag1v++o17YM5+
	8+oCOPdjl+iX5+6ij/6kl2KaiZNEML5cnFJKhBrUHJXYGx/280cXfpddpbiWW/aqVDVxgty/UnbuH
	U/0i70RMj9EQm8n7WaGzbWXqlYOW6Z8XUFu4c7Xu+9IYT2czxq2gA33Nas8jn2IjxwQnE1FMVE1Lg
	lSgu8pDQd16NIlx61tyXbcd1ga6oU9Y4MxpZbAwvoNeRoO21TbE0NBUwiPpfeYafAa1fnL4AK6q9G
	h5q3SkByOp4Ydg6sNHlOoAEaIsmy8rvHHEUhCUzt2EyTc3gJhzVZNxcgZv7fkCshHQrPrqLIMvdRO
	LnypAO2tzke7f2zci75w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2svE-0006kK-R6; Wed, 28 Aug 2019 08:03:16 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2svC-0006jd-5D
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 08:03:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id l2so1798700wmg.0
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=20Jn2+dCC+I8w6FtFfD0vbMvlgqMeEqx0r5JGNJSXvw=;
 b=BRdtncww57yR+oh9ioHww1AygNYE9lSkqU2mG//XHwzTsagVjR4YsA8HZLgV0wx8f7
 MGD8CF1vTBltWRC04ALXWMJqPiuhNcXA/dhIWF5i2SqNeYztB0T8jnz2K4A6VzLd+ddc
 YEpKr2fG5TixL2Xdu17BHvZgY600WF8v6JoftyobJhEdPNmnGwssFAydMClk+OSjNdH2
 /htwt76aoWHuRaxE0qDXMFOwIZwwxCT8fPe129GAv6C3axxfjNmENgSKz8MMSU5skxWO
 kFSMKYMxXvF+2P8J0wsa+XECHfZG9888WhVvnCG/iRlUy9lIbkqUYzBAiy/dd1pHDumy
 gjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=20Jn2+dCC+I8w6FtFfD0vbMvlgqMeEqx0r5JGNJSXvw=;
 b=p7Uv/2q7LO9m/K1IiClxJU+4nGSI03BNPoNCeupOXbJedrfrwjgub+LtvWQTaBFyC0
 DsvQaxdNDmRIBkkgOnP9FEr+otPk6+mkteQUuGtc7O1ba+3VDDWOudzM1RqS+Peb8K8a
 XcEH1DJq8AD/g43b50gwacCrfjWsx6wv+NBNaLNoQAJsDRXfMlJ7Z/nMayd5dKTFD0yt
 GGQVwiM33YLRGrRAZskNPll0176ydtiFPXsXzzo1lnSXrOslQW22/Fj+qWhcSpj8GSRf
 t7m2TACRVCDg2ysZ0P9T4hdkMJyF2f62unUm5txih1UR8hBw1cYf9hVqnmZEL9xTH8Ge
 DMzg==
X-Gm-Message-State: APjAAAVh3ttZzfvhwQc84D8RdSEMQi+NpUQ2+FxqsDo90fOnTbwWyPrq
 siyxBJX1dEFo4iV91/mNSMJC7w==
X-Google-Smtp-Source: APXvYqxmqwViJF2WTLIOMiRFCef/fmmO9N41vOJh+ND/giymLdwj+196F+O+dvCn+JoNQAz/G4CsdA==
X-Received: by 2002:a05:600c:352:: with SMTP id
 u18mr3102630wmd.141.1566979392301; 
 Wed, 28 Aug 2019 01:03:12 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a11sm1330229wrx.59.2019.08.28.01.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 01:03:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add tdm resets
In-Reply-To: <7hh862tbt2.fsf@baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com>
 <7hh862tbt2.fsf@baylibre.com>
Date: Wed, 28 Aug 2019 10:03:10 +0200
Message-ID: <1j4l217m4h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_010314_196228_D91C6723 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 27 Aug 2019 at 16:42, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> This patchset adds the dedicated reset of the tdm formatters which
>> have been added on the g12a SoC family. Using these help with the channel
>> mapping when the formatter uses more than 1 i2s lane.
>
> Because I forgot^W waited on this, we did the meson-g12a-common split,
> so this no longer applies cleanly.  Could you rebase this on current v5.4/dt64
> and I'll queue it for v5.4/dt64.

Acutally it was already not applying when I sent this v1 ...
.. which is why I sent a v2 [0] ;)

[0]: https://lkml.kernel.org/r/20190823154432.16268-1-jbrunet@baylibre.com

>
>> Kevin, please note that to build, this patchset depends on the new reset
>> bindings of the audio clock controller. I've prepared a tag for you [0]
>>
>> [0]: git://github.com/BayLibre/clk-meson.git - clk-meson-dt-v5.4-2
>
> Thanks for the tag.  This is now included in v5.4/dt64.
>
> Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
