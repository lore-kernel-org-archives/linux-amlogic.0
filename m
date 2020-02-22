Return-Path: <SRS0=iFsO=4K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76ADC35666
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 19:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD81520702
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 19:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pLkaPof8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VVA+Y0w2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD81520702
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmeMXEQ4HQIkD4Bj4nXEDNv2j+VIRvfH1NDChfBWJfE=; b=pLkaPof8CIwZMM
	lpLWjXCl87r+kSF1LEzDGpXgls6VAaZKof8EU48Wy2Gr2mEYHwaqMNwKurjagSukJmRUQpwvpucx0
	5afBr59RO5qqQgS3QlI82PluPWvV//IqZohPKs0nKIHxK3ibzppUXQcz64nUbpEgAxJblE0ecWbqf
	MidX+PDQ93UiJXpvoGDrd4kSSe6VxjE8XBQ4q30EJm2JWdsgGdnL1DvAeVNvNxisiM+GZcBAwlo7j
	eV5uBBBVsGtt/LtAXQeak6SoPRclReUb7pvDtuGGQoO2WNB+AvXqfOMEW2dGXlJFtHzW5qowSoWUN
	v9jtO9EcX47bctfj9fzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5aWP-000327-SJ; Sat, 22 Feb 2020 19:33:05 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5aWH-0002va-L8; Sat, 22 Feb 2020 19:32:58 +0000
Received: by mail-ed1-x544.google.com with SMTP id p3so6797107edx.7;
 Sat, 22 Feb 2020 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abOo/01onxmCrl2+HYFGD4dtsZsCLfGBQC3tyHMZjis=;
 b=VVA+Y0w2cTzdFoO/atz+136TaD3pxtmudXz5C974oxFGSuVuye4uBLm4qLRipvyvov
 qIN4c/bWLfPMqXqWgV301z5bAYGmkahHY2wN/vwxRWeHdML97rpGAipSHtswTjK7F9Ux
 N9V9n3PCg97usS9WmJMO5+zMabE2ZMcu/vMjC14pWNNE//T2NNt1WX/pP2QA0sx6Ylun
 SY5sMJ2s1d3hXWFGYNoqRr6ih6wcvO8ubyo3eExk9clA8G9jriHTdaFppv1TApjRMINX
 gUlsX9eExM3ic02lxpue7imTI97AKYJAQhYUYYyEHiJCoox7GC3foF0L4X+fAn4r5PZJ
 Lfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abOo/01onxmCrl2+HYFGD4dtsZsCLfGBQC3tyHMZjis=;
 b=AaED02dduSvEkqsJ76XAs6YcVTAo14t05I13xX0C7sJEaW+AQs5cAS04g8YIwrDJW6
 NH8Cs5jrsx0ugqHKUDvx5Ypu1TQXLyiwHLwHNyhGPSeWvPKdKPFWRMpMEigAnh8rm3tg
 oq6IpvxuqObz8+0Dc21H6J2ngiVvnz3VvlgnwXzagPKvQd9GveoiQjK/c4TWA/Tki71D
 pIdE7aOCV6Mt2Vmj9AT/bSDzfZ9Vdc+1wYSjL/SSOgM5VGRfUM6QkdTQ/Ia1UzGpv2VS
 oJg1yGAu3LTnDvnnUKBM9ERypatwmoFaU2PKN0RdM3NHGFNiAy7R7XN8OpgBIteq5J80
 t5fQ==
X-Gm-Message-State: APjAAAUwqGwtcv8JD5eH7sfEhNJaJJkZbM5zjDDZ8bunzX7Hb6ldyG+N
 6wiW7aWAUJZSG3u/14emRZeza7DM4FxyXxCX3Xw=
X-Google-Smtp-Source: APXvYqwSDLn063dC13fCS2x5o5KSt+86sLTD3VApIdIahY8Td3TAnjcZDxUtKhOk4AFeH5hrqEFUhOchgc+A2h2gJIQ=
X-Received: by 2002:a05:6402:3c6:: with SMTP id
 t6mr37429429edw.110.1582399975292; 
 Sat, 22 Feb 2020 11:32:55 -0800 (PST)
MIME-Version: 1.0
References: <202002230135.WpIL6nAs%lkp@intel.com>
 <20200222170154.GA119396@e50d7db646c3>
In-Reply-To: <20200222170154.GA119396@e50d7db646c3>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Feb 2020 20:32:44 +0100
Message-ID: <CAFBinCAveBrxYDH-SQpbYjF8rdzR5vDPOvXdzWyZyUG5A_-X3A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fix semicolon.cocci warnings
To: kbuild test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_113257_718103_5C4F7DDE 
X-CRM114-Status: UNSURE (   6.17  )
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
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Feb 22, 2020 at 6:02 PM kbuild test robot <lkp@intel.com> wrote:
>
> From: kbuild test robot <lkp@intel.com>
>
> sound/soc/meson/aiu-encoder-i2s.c:129:2-3: Unneeded semicolon
>
>
>  Remove unneeded semicolon.
>
> Generated by: scripts/coccinelle/misc/semicolon.cocci
>
> Fixes: 3e25c44598aa ("ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC families")
> CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: kbuild test robot <lkp@intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

and also (as reply to my original patch yesterday):
Reported-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
