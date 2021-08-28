Return-Path: <SRS0=4hoi=NT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8E4C432BE
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 16:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7BD60E93
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 16:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA7BD60E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9k4ATwOjA17iGbpt1Axp25+1tn08uPRQ8b9VGUFELt4=; b=rJuOWOKsM4Y7XI
	1a5zQZElRG+jOJ7ZEIDao0WN7PBNSGR173eE1ULtF5CziH/o0G596HxwxnRW3nMvEMlKTrbrlD5S0
	1WVY+YKeCVdfnaHH4/shbWkJzz0uJBsWw9V90eBV+Lei6JQ0mG4wYCnfLNWEteU5OGUQd4RdY9MGv
	T9DRzwIocoVKE5icgBXAeO4/5aU2tYphBDwLmsXJFvxT+dyeurRsKhflN1TmaU3zdUTnQMHeH0uSt
	XYfn+vOxO6IJoWwXZSb9HTYvbC3sewcHLtLQA4eaco1M3pdajnvQNgZUMNQ9cYVLpRBE7v1rY5pTl
	cSrH2jrVsqVAqUQGzjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK0rc-00ETSx-T7; Sat, 28 Aug 2021 16:07:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK0rM-00ETPo-2v; Sat, 28 Aug 2021 16:07:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id me10so20750337ejb.11;
 Sat, 28 Aug 2021 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LL6/XDkELtJGzj7bv+EahXfdLznXO7JwuHps8bbcfhg=;
 b=IxCiQofbwWRdmlbWjkVYx9X0EwfA39yCRnGNeY1wQV8OrMMlSQWxSls8SpJMz++KMN
 qXEBGA4rb0o4u786EA2smvODJVR/pu2m2Au85UJFLjaA9aedW+LGw+1DZiU2bT2pb2XA
 R8iSXn/xB5WrENK+gXk2EfZTYPq3CZInmY18qzufbFgrOvw7NOa5wWIVKgsnX+gfYPgp
 VKXeZfubEYmLnF6CEVopa/vYmHqVOilZuXIfInX8N2S1BZkmqOE4cd+dSmWV4sdhJeUR
 K4f3we13o6+kHoJleAleDR3KNs3gLhTmFxmhzlJ8pIowJqL53kq5azuBv0pwWdt2y3ps
 d9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LL6/XDkELtJGzj7bv+EahXfdLznXO7JwuHps8bbcfhg=;
 b=gcDF9muLX/LVF1RRpwqwNg7q0swkFAtVxsGTV/MGGQN6bTSL4yi7CYz8fI9GqCumiC
 bBBSS6/n8dK8hw/GT/XWCNk9XukxE9VfYyj46UYzCoNhKqYq3veWI4UBqzlqqsZCiJas
 wFBxVe+n7hD66xpw1f898bLo+hTr7LIreL98mBw2ffEZvTsGS4gt6OapJzM9S+xxh0mj
 LrsB7eZ/zVuQWJ/Agkeb5ioNpozbMtFycROO2rc6QpQQJ3Dcu0WWfi+a+G458k91ns/9
 LUET3mdfAkvefQAq9a6UnGbifyj9s7UxDmzXKD2gXP5lWkrlLIOuB9eoJXTX5O5PWbIO
 5toA==
X-Gm-Message-State: AOAM530HTAZxzL/KXVB84Q2I/hy3Pn6ot9iH05Rp24IYeq7JQqZgBvUE
 yEWyB27kALFiuLbjcJRoKXTswl3hLYThMchK3TUhqdFAlDo=
X-Google-Smtp-Source: ABdhPJyPZVzHL76lGJOroGS4GEkuoeintMbGC3iDT8wzVLyfCWlNhiw7RFWxKmQZ7hYxPdW7PTXctCG+cmMAPDPpHeM=
X-Received: by 2002:a17:906:369a:: with SMTP id
 a26mr15801598ejc.539.1630166826553; 
 Sat, 28 Aug 2021 09:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-5-linux.amoon@gmail.com>
In-Reply-To: <20210817041548.1276-5-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 28 Aug 2021 18:06:55 +0200
Message-ID: <CAFBinCDDASbbwBWdPnzq4352yepamD-ziG09Ki=BvjZ9xMLXdQ@mail.gmail.com>
Subject: Re: [PATCHv3 4/6] arm64: dts: amlogic: odroidc2: use vbus-supply for
 power source for usb nodes
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_090708_236683_813960B0 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Anand,

On Tue, Aug 17, 2021 at 6:18 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Use vbus-supply instead of phy-supply as power source for dwc2
> nodes. Drop vbus-supply for usb0 node, as it will handle later.
This is more of a question than a review comment:
Do you think that the USB power setup on Odroid-C1 and Odroid-C2 is
different or the same?
On Odroid-C1 we know that only the PWREN signal which goes to the
Micro-USB connector is configurable while VBUS for the USB host ports
is always enabled.

> Fixes: e841ec956e53 ("ARM64: dts: meson-gxbb-odroidc2:
>        fix usb1 power supply")
>
most Linux commits which I have seen don't use a blank line here
Also I think it's recommended not to break the "Fixes" tag into
multiple lines, even if the text is long
see [0] for example


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=425bec0032f59eeee12520085cd054fac09cc66e

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
