Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF91C63697
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 22:50:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7431D22202
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 22:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YorffFOt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="REHKISix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7431D22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kv2rObqZ2ZmAAfMYkJv49eSqwa26HzqUII2AhK6oto8=; b=YorffFOtyGep3r/DmCtBxorYr
	fI/zBUqdMxzXU9K1LGKBqQD5VoUX30Qyd4z1P1ORNQFbrCz+c+cSFpunxSeZ7/DDsM7tuDRg6UAsS
	R3SdCYNb4sFmlGqoxXPJO6sLUK+P71NeTuwIw8MQB4ZFnDKu4z/49o4n29ZmFP2NyZgA6w7BCc1d5
	WyBvybAV92+vJpOOLiJMed/3fD7HXRmbHf6awqtH+JZg+rZzPEufUwBJ3qAJhCpX0+3omqBOBfqbB
	sg2s+pyV4Dz8O/wPiYFZAL16PE6leElLaJu3T4SRXRhIn6GBVMsBzNPybdoQHjoc7HoLuMqtFUZQh
	WGtswEkwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf9oG-0005dp-5Y; Tue, 17 Nov 2020 22:50:48 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf9oD-0005d9-MN; Tue, 17 Nov 2020 22:50:46 +0000
Received: by mail-ed1-x542.google.com with SMTP id cq7so24227633edb.4;
 Tue, 17 Nov 2020 14:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wVFMj1y28y9lr6i3Dua9IiKKVDRLL249TgbSSA9JSCo=;
 b=REHKISixART/wrV+ZOVp3ijOYlxb3WgEeV1AGG0ndKx8Vp1KielOgtykVIScLLiILW
 eHQvntNLmDdkKqNHFQ5t/zDYDKnPV02kl9WeYKzCODIjQtae5+aRQrjaAtkIAuc/CAao
 mXcqjOJm8nM++k8Rf4hg6TsSVCjS06iPMVx2yu08U7AXFKeYJyTAcXOj0cgxT+lhPH+S
 foZbO7ZAshb9uO3lzqd9D6FLjzkzFEILKOY+Uz67HmR6eFZIiPGnboNtNNzALtm3Ffky
 pQbsdK56pX2bw0ZDHDhauYB1EJ5+aPw5bWE1sdFw4TD1TuNbWDQgjx/AtW536hK+IIx8
 Yo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wVFMj1y28y9lr6i3Dua9IiKKVDRLL249TgbSSA9JSCo=;
 b=MMFmtsrG0xkr3/Mxit3nobHdpIUkzQsNHlSJiUKxQk+jB5WLrmYjnbIv+UJCHh3coR
 vKq1obVVkMeimSskmLVgFOPtH4xPJNyFr2bLXBDv6qWUFROUEvD4MPUf88kIYrJQhBG/
 aRpQrs7apZvNl2+czNlGMYCBMmMtzI2oG3umYlu+k7knMGH+qUAYyPxQIceVGU0LukzE
 e9gD81yzxiCBB6TF/xLY+dUh2Mj4pL6XhR6WR4KhY2sEFtnsdQsjPv0NCN+cc/2HtpmF
 OvBdcP3fmTVlGy2TZ7tc986Zm78/HjBBQzKXxhwM40lBm5uMsuJWp0Nc9o5mo0B4EHEy
 /vaA==
X-Gm-Message-State: AOAM531TCAK/YSi808reRAjEqdbrjK2bx7G+kbK9i+Y6NlfZ+Szts1lx
 f+K1CZcmv2Ldtg6RENG0z/NMfTLBWtbMa8+x2aE=
X-Google-Smtp-Source: ABdhPJwxnZw7fIrQBMEeIJ22JQkOmnYSBJCCB1bD2WqJ0lVQ2RE3nYgJiV9dfPiwS1OUR85WGbfkhGf+bUYog4KweqA=
X-Received: by 2002:a05:6402:3d9:: with SMTP id
 t25mr23308333edw.338.1605653442816; 
 Tue, 17 Nov 2020 14:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
 <20201115185210.573739-4-martin.blumenstingl@googlemail.com>
 <88c043ba-e7a4-6b4d-f93f-efdf6c525e95@gmail.com>
In-Reply-To: <88c043ba-e7a4-6b4d-f93f-efdf6c525e95@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 17 Nov 2020 23:50:31 +0100
Message-ID: <CAFBinCDM=COSpZLSaqqDwpk48QC-sjASwD9O3VJU_SRgB_H_1A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] net: stmmac: dwmac-meson8b: use picoseconds
 for the RGMII RX delay
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_175045_778164_590AF0E3 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, andrew@lunn.ch,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Florian,

On Tue, Nov 17, 2020 at 7:36 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 11/15/20 10:52 AM, Martin Blumenstingl wrote:
> > Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
> > delay register which allows picoseconds precision. Parse the new
> > "amlogic,rgmii-rx-delay-ps" property or fall back to the old
> > "amlogic,rx-delay-ns".
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
first of all: thanks for reviewing this (and the rest of the series)!

> Maybe also issue a warning when the 'amlogic,rx-delay-ns' property is
> found in addition to the 'amlogic,rgmii-rx-delay-ps'? Up to you how to
> manage existing DTBs being deployed.
none of the upstream DTBs uses amlogic,rx-delay-ns - and I am also not
aware of anything being in use "downstream".
I will add a sentence to the commit description when I re-send this
without RFC, something along those lines: "No upstream DTB uses the
old amlogic,rx-delay-ns (yet). Only include minimalistic logic to fall
back to the old property, without any special validation (for example:
old and new property are given at the same time)"

What do you think?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
