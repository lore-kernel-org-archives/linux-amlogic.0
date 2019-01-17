Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5CDC43612
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:30:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8C020859
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZk/WeQZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cJbpJ3L9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8C020859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U28OxmaX1u8BD4IjPwwmE9idcMgC7gwFdldxxT+yD3w=; b=NZk/WeQZNenHMU
	ITwMhwMHJQjiSsqn1U9LeJXdIVTW9DK87YgwdVpLpuz4W7+J1w+jNac3rgDG3OaB1Ms7NB+e2hyim
	8G5hQTVwnlXuKxmkTbLayxURPh/WDjUPMJ4GoyvhtADG85ME6LcKhFeB4qCpcn0GNgo1NZD7fOwcG
	1KCVac/+phGEU2j2E9eRicicAiwMZQmtWOQhwnO0zxqSpnSCYp+C21bU9EdSzsie3oTbQC3NBX+cF
	90oCdi7CqawqRn9xeItJ8qiPEJP9vhjfIrwbgcJxt7Y5lYrxbB/pyjNjqvt2ncqSu9iI6Z2CzqbnA
	JVYUQT/iAxWiG3CFu8uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDMW-0000eD-1p; Thu, 17 Jan 2019 19:30:00 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDMT-0000dV-2C
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 19:29:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id r136so5303067pfc.6
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 11:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=3dshRIG+2f6C+rvGnJ0kvOuf5GTBMF5cF1JvTu1eArA=;
 b=cJbpJ3L9wi6nUjSuIh0jwnJRMsbGKTa+04R7PHv+vTa6O7aNop//t3hZbWc2kqwBBQ
 yBJE1TfwQ9YtiF3xyWUJU1WSqbiBsj9kHfMulDcgyyTqcI7L23GLpzizjZyYRLe7MZ9s
 4EZpHuEyQ1hdC2aVV/K46aax3IXEUuSe5OdAj/SUxuz2eLSsQJnAO5j7f7PsvcmQJffo
 Fy6Uj3N153zwOrvSGVQHxS4DL+UDhlwgKu95OjxuC7WAXl1iL1e6FC6Lag8cFswOKBH0
 lYmjMQW2hq1NqMXLFfCmZDj0yz5NLkkinDBON/wd7VYWWwK3VS59SwaYCOC9q9rofZy7
 eHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3dshRIG+2f6C+rvGnJ0kvOuf5GTBMF5cF1JvTu1eArA=;
 b=XTDUfeRkLExwkU9aYUH9ffIal6NqiZpnPaxyJJgYA9qmwBZxubbP4Ws4mklvmKqWoo
 n+jBM465551W0+dTZuwIfvehijLBSe5xG+aQEzq658M6WnAjLh0VI//xZb9x69ReXXxa
 RAsHiJVMLW4XfDTpLpyW1zd6bnuBFN9wnxbDj4Nzig2K+c87AY1khqcvoGHXLqQ7triv
 kRtC5a/xwMa07cCXU4B9fzFeAw7fciedfoE1nBwWaDbEknsznT8aeaNYnYysmTwHsjq8
 V47gtXE8MJs1/XSmDZVgQ+tAjpqZ5m8szhXWQfyC+kylOooytO7Ew8xBmhmJ9s+7c6qK
 VPDw==
X-Gm-Message-State: AJcUukcoQ50DA6S/F4ENgMeM7PLrdbC8GzthVMw78l9nSej9i449JucP
 /uNJIhbtpO6fJUtwVUMGcarJcAyMn3E=
X-Google-Smtp-Source: ALg8bN7xb06EjQ5DcmhvoTgqEzW4Rf6yorqRMYkFRiFMpnGC9cjaZ9qvyfAg9AOTBhvvPWKL+seW/g==
X-Received: by 2002:a62:520b:: with SMTP id g11mr16435329pfb.53.1547753395919; 
 Thu, 17 Jan 2019 11:29:55 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id s79sm4155736pgs.50.2019.01.17.11.29.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 11:29:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add bindings for the Meson-AXG
 SoC Reset Controller
In-Reply-To: <alpine.DEB.2.21.1901161112090.1655@nanos.tec.linutronix.de>
References: <20171110084650.31325-1-yixun.lan@amlogic.com>
 <alpine.DEB.2.21.1811121115520.14703@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1901161112090.1655@nanos.tec.linutronix.de>
Date: Thu, 17 Jan 2019 11:29:54 -0800
Message-ID: <7hbm4fccb1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_112957_153208_2689401E 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: , Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[ + Jianxin since Yixun is no longer at Amlogic ]

Thomas Gleixner <tglx@linutronix.de> writes:

> On Mon, 12 Nov 2018, Thomas Gleixner wrote:
>
> Gentle ping.
>
>> Yixun,
>> 
>> On Fri, 10 Nov 2017, Yixun Lan wrote:
>> 
>> > +/*
>> > + *
>> > + * Copyright (c) 2016 BayLibre, SAS.
>> > + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> > + *
>> > + * Copyright (c) 2017 Amlogic, inc.
>> > + * Author: Yixun Lan <yixun.lan@amlogic.com>
>> > + *
>> > + * SPDX-License-Identifier: (GPL-2.0+ OR BSD)
>> 
>> There are two things wrong:
>> 
>>   1) The placement. See Documentation/process/license-rules.rst
>> 
>>   2) BSD is not a valid license id. You really have to decide which BSD
>>      variant to use.
>> 
>> Please get that fixed as especially #2 is broken. The goal of using SPDX is
>> to provide reliable license information for compliance tools.
>
> This still is broken:
>
> # scripts/spdxcheck.py include/dt-bindings/
> include/dt-bindings/reset/amlogic,meson-axg-reset.h: 9:41 Invalid License ID: BSD

Jianxin, can you fix this and clarify which BSD license was intended by
Amlogic?

If this isn't fixed soon, I will cleanup and remove the BSD part and
Amlogic can clarify with a subsequent patch.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
