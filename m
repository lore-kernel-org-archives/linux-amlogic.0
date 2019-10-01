Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C7AECE589
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 09:40:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C434215EA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 09:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t5TQ/EK4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TpvppLf8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C434215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sVy4TCAOAkvLYSdH6/onORLnvTMlRjGzGru1AMGGR0g=; b=t5TQ/EK4e7Nx9Wm99jRvEgjDob
	Ns6LWX9W08n+OSIiK/C2tyKPBC+NkZONJ8GdBe695vXOF0zMjcmHcl8uC6MmEEi452Hr7N/RunmFP
	hQCFw3wI+dXDwQsQBnObIPIbttCsWPqbzezbthQCcOZx/fhBTyqVh+2hYgseIgzM/m/cYHRh3JSCY
	0G0LpREFP3w5ogceIC3kbmLCvdvu8OXkDcti7m7d9KP6PeLBVBprcOJwZzVOzZ05NwbI11yN2r+xX
	++kUpcX+xAX62xUoR6OmhEncBMDzxWJ7kZmKvtUcRNbbzTR/Tck9Oa6vNVJGqLrWY3Jm+JX26mqAq
	8gv0JiNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFEdw-0004g0-77; Tue, 01 Oct 2019 09:40:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFEds-0004eh-5q
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 09:40:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id q17so14613933wrx.10
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=UzvLIkrTSi/epemgPJ8AXmPaJAGF16PPZin3f/2spag=;
 b=TpvppLf8WLWVp9DomSHJfRS+c1F4tZNVBDGJDc6uMvD3qLIjsRJ9isqzG7ARg31F7H
 WuCIZ0QihSFQA7WGB0e6Hmwy/vxTte+2fmlwPIpi/Bt7RBmN47RkGoUX/cEiNqE+BgzH
 trM9KE0xmDwnDrzjlxZ6MELCU1aDjLYWc2puO1IeukTMI1wmD1xAnADamSFNmx1qILUB
 O+zCVNDAARLMyP20ieMb5WFhecLROs+VxAlOMyrjgw43gct9EExlSRU5M2Ie9Z6IT0Ec
 aaV6huX2lmCtKVDrBHY+oB6eMt4ustgfcvLM2QRfRdTTkgjpTAglRn6/tdTB6S2mkg88
 +QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=UzvLIkrTSi/epemgPJ8AXmPaJAGF16PPZin3f/2spag=;
 b=DinGwIiNgUl+A3s4mkIEGsiwKnLUV5p/3vAWQDZYBy2rpUaELIPAfzlDLoOUPsi6zP
 Q0n66SBiaHp0js6s3ZeOWAu4fT2jKkO+5Ef6dwVroGteNriNrf0FbRKFiVCoJIcv1fH7
 +Asc10jlhgTMTysCQiLZnihnOsbM2O4dgapV/jyaKhPDHKEjXqhVovGHiYjMqoAZAayi
 DsVtptNjCfIUDnfud39E4D4pwhlhaysAaU/fmJXKUTaEUvFLcJaXdJS/oeK2Obmconl6
 1mnmqN6/nHQapVJTcnguGXEuxvy++g10d3bIv7LGIhn4/JpolVDXRe/19K7qzFXTCdcb
 Z7vQ==
X-Gm-Message-State: APjAAAXoysv84HYB4OsppMvcd1MKaqwvOXiMxmsbDqlLNs8BzTAmkIBD
 bE9BFvV5LUV5hvXK3gf9B2V1wQ==
X-Google-Smtp-Source: APXvYqwyIWVUUG6BoVZAuEAlFBkPxd97wknxy9fL/CaSJF8Tr2znTOAsBGffEVJ4FW38j9dZAwkJfA==
X-Received: by 2002:adf:e64e:: with SMTP id b14mr18036441wrn.16.1569922822301; 
 Tue, 01 Oct 2019 02:40:22 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b5sm1925895wmj.18.2019.10.01.02.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 02:40:21 -0700 (PDT)
References: <20190905135040.6635-1-jbrunet@baylibre.com>
 <1567693618.3958.4.camel@pengutronix.de>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] reset: meson-audio-arb: add sm1 support
In-reply-to: <1567693618.3958.4.camel@pengutronix.de>
Date: Tue, 01 Oct 2019 11:40:20 +0200
Message-ID: <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_024024_216584_598DF10B 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 05 Sep 2019 at 16:26, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> On Thu, 2019-09-05 at 15:50 +0200, Jerome Brunet wrote:
>> This patchset adds the new arb reset lines for the sm1 SoC family
>> It has been tested on the sei610 platform.
>> 
>> Changes since v1 [0]:
>> * Fix the mistake on the number of reset as reported by Phililpp (thx)
>> 
>> [0]:  https://lkml.kernel.org/r/20190820094625.13455-1-jbrunet@baylibre.com
>> 
>> Jerome Brunet (2):
>>   reset: dt-bindings: meson: update arb bindings for sm1
>>   reset: meson-audio-arb: add sm1 support
>> 
>>  .../reset/amlogic,meson-axg-audio-arb.txt     |  3 +-
>>  drivers/reset/reset-meson-audio-arb.c         | 43 +++++++++++++++++--
>>  .../reset/amlogic,meson-axg-audio-arb.h       |  2 +
>>  3 files changed, 44 insertions(+), 4 deletions(-)
>
> Thank you, both applied to reset/next.

Hi Philipp,

Looks like this patchset missed v5.4-rc1.
Could you provide a tag with the bindings to Kevin so we can use the IDs
in DT until the next merge window ?

Thx
Regards

Jerome

>
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
