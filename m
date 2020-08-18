Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA16C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 07:43:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8880C207FB
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 07:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tAI59nQG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v5eu+Mpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8880C207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t7uHLj2xk9L+vChXA5VztUQCzE3E1tcd9I1mqYFEAE8=; b=tAI59nQGg2MOnifmK8GRs+hc3
	/wB6Q22xEEnf2v/QBXSqdKqRp3uryoeIF7bCokaqMhpt00jGjXffax8d1sBQzXGaJexPbcetOilEA
	q0fdeJpkxhXQ1ZpbMibkd//N5pb8N1xHKDLSafao11A7V+a/Y3FlZnVYpVswLtVVwuzASaX/M/xl8
	IUCZr2l5k46BZUJVi7CV+bwWiXdFOoWeq0U2VxSXEuJ63xZde2WbXFRIpEHNY/AmJHhgZbmIs9qDU
	ZnwTXR1fXLzZdiDwUTW3ru9UPpH/Wrwz/lXBjG76Tm6tuwNEZebxnNxwIdhOet7ibtzeW1s1Rg1rS
	HACqk1XGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7wGz-0006mA-IA; Tue, 18 Aug 2020 07:43:09 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wGw-0006l4-BI
 for linux-amlogic@lists.infradead.org; Tue, 18 Aug 2020 07:43:08 +0000
Received: by mail-ed1-x542.google.com with SMTP id df16so14488610edb.9
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2020 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=5HsyZsoKjm060rvDSEtMkPqgnArr4sh0YC0G60nxwEw=;
 b=v5eu+Mpm72068/lOHhmx+7+0snWUwsS2OSm5rafXvyvPclnxkdYaV6VTnwuHnqT5DV
 GmirRi54+eP+YFIoHPvyP4IpPf7HMMrBjAsCe4bs1AjABFEvi3qh874d4csbTc+hxEJy
 eTcpzkC+98sfmDYq7lSn2MX2yGNWMhMObIeVUzmIf2wXj9pfC8GlzHAtIJs8zHEFP+Ad
 4YH4/Ua1psV7m15UBDEUHD7xNIzqnO7wJYmhMkWbxn5YEQ3XArtbs7dHMHrwLlUK1H79
 Nc8AY3sxMYBYhln0fupsphsBdLbHEa6ym8FgJxH+A1RmUUp5xTgth+NqLHonMJHZw9NP
 jkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=5HsyZsoKjm060rvDSEtMkPqgnArr4sh0YC0G60nxwEw=;
 b=N5MRGSKMDRZftep/xp7wu3BP2Z6ZlWU8I9JBkGaf1nvmgHsOTu+rqp21kEsSTnPv+S
 GltH4cthh7Hbh94XthFww/9zLdTVujh5OKVkBVEbQ77SHma6l5wBIN4QP+HP4l/oJG/f
 uM9rxWIDZoizQO+ftaVfAHl0gtqVNLwfUu59k7umxaB/1mXGzO0X2Pl1RMI1OGa1GbKy
 qqtFbF0y14gcbhZeT2l1FPe/Axwa/7m2RPaHhkvNem9qmQ046seDPd+sm6WLdXaXxgMU
 ncsleTjGjfCWv6PUpWCzzM/35i9XnR6mn2yZ+SWd4//GepD2o3LOZzU2GzlS/5TX5KPb
 gLjg==
X-Gm-Message-State: AOAM5314cjH/L11CAJORvXhgNoGLguTlh9Lw8JorXXfJU56yOi+3fjYK
 2bLcN3Dn26sk4WlMQMzmPkKoYQ==
X-Google-Smtp-Source: ABdhPJw/ZcBmsBkk7fscjG6qs6aeBLDcAopNw9zkaXwYznIwnEFTqjWTKbfCdy30cuwEP95Pq2wv/g==
X-Received: by 2002:a05:6402:13d4:: with SMTP id
 a20mr19029089edx.161.1597736582979; 
 Tue, 18 Aug 2020 00:43:02 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id h16sm15569920ejf.120.2020.08.18.00.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 00:43:02 -0700 (PDT)
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
 <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
 <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
In-reply-to: <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
Date: Tue, 18 Aug 2020 09:43:01 +0200
Message-ID: <1j1rk4flh6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_034306_580824_81080B50 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


>> > >
>> > > +&i2c3 {
>> > > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
>> > > +       pinctrl-1 = <&tdm_c_din3_a_pins>;
>
> Note: without setting this *pinctrl-1* configuration RTC wake up
> feature works as expected.

As pointed out by Martin, the pinctrl-1 here makes no sense for RTC on
i2c. If the rtc is on an I2C of AO bank, the pinctrl-0 is likely to be
wrong as well.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
