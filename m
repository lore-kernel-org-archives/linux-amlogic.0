Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E99EC5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49292199C
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMNsz+4d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DoR1ThEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D49292199C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgQK2bRt9Wz8WihjXhWG+XcJvvt5vtGxIXYPdIEg5yU=; b=iMNsz+4dSV597a
	5qLQZxBvN5zM4C6FaCh+MtX8S6ALIC9akKAhtDhZfJPgh3YUvFmj9PV/1UZevi+sO60NtTN6zNbUr
	8gGXYjTo6gUYh7Nd0TCdj/oRoP6iH/YmZAeRNeQwldLORHi+TKX06KtYza0XAHlHGUqcZaiFMsNmU
	Hq+gl2wYT9whKWmxweVrHfBVgVyDOTsUml0yXqTc8wHHnGUrpHSsw6zcG7YsZkKaNlEdFv0B4ojUo
	EBgq0TsMh+x4sQR/NR0v85CcODc3ZpgXlyuGW/QqoVmnqQta3tNABPnb5D6MKF2ZHJbEk0Dq5+8L8
	S78LXdEdaDuFk6rSi3iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiRoP-0004c8-7J; Tue, 02 Jul 2019 23:03:45 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiRo6-0004Nk-E8; Tue, 02 Jul 2019 23:03:27 +0000
Received: by mail-ot1-x344.google.com with SMTP id z23so236184ote.13;
 Tue, 02 Jul 2019 16:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ByhsgyjfPRCaYRtGVf0X74WgyTuKcSf1bOHMoBSZqlM=;
 b=DoR1ThEgGbjv19cCdz5BE+R5n05F1pnqjFfoBynSpfmBlQXLCSunPFhbew6NEfAxPs
 hvktSZdshjCkXciJetywqYC7halqVs7rQ//KLFsw2G6zRA5AsIWS+MKAiB3BahXdsdnG
 3pcSjZaiZgcd8FrveXvr89fZ0fLQgFuSogZ9Keg4qmRLU/wDp3HL5P22/Mw1kYoZQ5+G
 fuMux96KZ77382ZmWkZNoWLAaBNs9Wxu3z9DmmEm1nfFS9MPhHQDYbiOF++COdVen6EM
 7Bk7sB7xgr9U92H4vgfSCaES5Uuh91WVyRugW9AD2JAN7CGio1F23wG2jEvDRRzT8tfR
 wLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ByhsgyjfPRCaYRtGVf0X74WgyTuKcSf1bOHMoBSZqlM=;
 b=goxWfS9nzmOCjyehVAYFM+aGMrxEG/saYHBoMfieb+gBTbcblJok1SM80RikLg5FwL
 3idQsLnuow4JOCc9yb74q3aHIQr0c2juBA2WF9fdSw8wZL1auKtUrvYdPgvKdcOappBS
 NDAJAmkD0UJrdDSHrUgThbruN+ZN/l5MztAs5cSgJNxt7xDY2Lk5BA9EQXfNwhPwG9h0
 HUS8DtXuIAXzlKhV7vaEn0p5iUb2HZR3dBHobJK170Dv4Jr4a2s+qYqqkEsQjQPX/fGB
 PhC6l4DYeNSL20wy8mDhEdT/N5IfKa41a+xampub3zkIZ92N2xElwX3ADSyQJun+tMd7
 nhMg==
X-Gm-Message-State: APjAAAUWw/7Itw9NhlfRlHunpB6VOpA2EWlMFDDKEUc4F5cHGlUgQFQy
 eBlSJhMHjwQGvTezFyyhC5lEnyrjIB2/WGEZ4vo=
X-Google-Smtp-Source: APXvYqzMU6LhYLtDxe6IzTmM1WolsPD+74qKOzIux1HcUkzeXscSddhWfH+OlTyFXLefL/eH9LreXfId+iDH0UNqUbY=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr4126550otp.6.1562108605726;
 Tue, 02 Jul 2019 16:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-9-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:03:14 +0200
Message-ID: <CAFBinCAwvAb42uitinRr0k_Hkb_cDOc9dygQgg54E5nO69h=fg@mail.gmail.com>
Subject: Re: [RFC/RFT v3 08/14] clk: meson: g12a: expose CPUB clock ID for G12B
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_160326_481011_1B61F92B 
X-CRM114-Status: UNSURE (   6.12  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Expose the CPUB clock id to add DVFS to the second CPU cluster of
> the Amlogic G12B SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
