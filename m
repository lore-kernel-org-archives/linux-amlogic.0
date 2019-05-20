Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88154C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6829921743
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kna1vm+Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NdQOnzKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6829921743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vtktSyf5jcty2nM23S/hRftPKNhZHjAFeFYXZ84c1w=; b=kna1vm+YIaZZDj
	OuIQtwG2O6fOw2430FOEAsPbfhReghyNZul3tG2R+XTlvTyrMF8TPQgZMDOEPkXK4NipRGf/nbHTe
	egftV0zQ1YhmfMfHkpp8hsKQAtq8ndXDz7YIm01BnFkNaMqEWS+1uCa0itk0A/0w2PWoR4nWyUxmD
	e4ebdqRbj1MPIIIWDe+mY4iwoqrhwpO01zBexHKPH+jaCyanTbOPzoeRJG6ysIdRuF0AhW6fJkarj
	g9RMHJVSoPjjqZPIII6z0ymxXiiEmHnst47XHeRQ6ZDXA0TgNg+dCKkxvXJhtD9S/4VSEGTDbdSye
	+CzacFyRLv/qho4W9ARA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmz3-0006fm-3m; Mon, 20 May 2019 18:26:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmyu-0006YS-9N
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 18:25:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id e15so15720705wrs.4
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=sdtwsXgqa/NDq4JZO/qTIK4aUEyBtvxUvqlGly1nriI=;
 b=NdQOnzKz6heoK6zaciWzqf3ePB2ECiG3nRuCSbEsXZu76sa2AL2Ldo+j/m6TP3/JHA
 36eF8VzFXeFWRa74x2Z6KsjgEDTyxSPRbHm6Z5FxSBhEwsOjLDj8OhcwHg49SPBdhYTU
 Jpzy0aZ+floKjG2FR4g9i7rFFQ8nlulhSX1e29HrELIhby0knGJWen/07yz8jtQL03b3
 HtNlPO3AQnmgFaHZGqFCt4Hx0QvEaSY1EzKQR3AZfhNRyHdDb0CxitDCXs8GSkmcgPNP
 SB4V8z/Eja5I0pVC9c6IhdT9RYTk1cyRDCkYqAbgVNL2L4n5RFPVTOTphS+INj+7srT7
 Abiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=sdtwsXgqa/NDq4JZO/qTIK4aUEyBtvxUvqlGly1nriI=;
 b=gTeb30+CZkqtNaw+wW6TM/Ry6n/RakWdL6eRbGyNslzRF3RlpgOd0AZ+WI+3Jv2Dk6
 Qo5upm8rRiIksUQYfxqZYwHfV7Cysltayg/cAcMS94LBUs/Pi4Fm8f3DXrWPv8XePWYi
 n9g2AqiGYjSicFYLbUJfo7FLkSHrgrlSNtvMbeAqaRB/J+cIJF1GgOPDTn1Bm1A1vNef
 kYFRp69CsHh19Y3KGW9GZF4w5OYjRcmdIXNjvbJl0RdfLTMvW7CYRdT9uG5bYm49LUT7
 YWiniXhNEx4jHqOcF2Fkzfu1ZbbksWGgTlLvAjrDjoHyo+U052zAFX8HVnjvJTdRnCIf
 nUGA==
X-Gm-Message-State: APjAAAWRO45A/x16G3Qpz4cLFi3s1byfIsUERjwSHLrqlfV5q0FMlZqE
 9e0u7Awx6qkdbc0/0xMRjTw94g==
X-Google-Smtp-Source: APXvYqzF2++lQ5ZuxocUnfANpanLa7uAQ0+FDIAeGsP5M2LB9AUNt0qLR81E1CVhrpDpPpXwwrLa0A==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr11774775wrs.280.1558376750654; 
 Mon, 20 May 2019 11:25:50 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id j28sm28737171wrd.64.2019.05.20.11.25.49
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 11:25:50 -0700 (PDT)
Message-ID: <5CE2F12D.3040303@baylibre.com>
Date: Mon, 20 May 2019 20:25:49 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] irqchip: irq-meson-gpio: update with SPDX Licence
 identifier
References: <20190520140310.29635-1-narmstrong@baylibre.com>
 <alpine.DEB.2.21.1905202001270.1635@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1905202001270.1635@nanos.tec.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_112552_328450_74D2E5D2 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: marc.zyngier@arm.com, linux-amlogic@lists.infradead.org,
 jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 20/05/2019 20:02, Thomas Gleixner a =E9crit :
> On Mon, 20 May 2019, Neil Armstrong wrote:
> =

>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/irqchip/irq-meson-gpio.c | 15 +--------------
>>  1 file changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meso=
n-gpio.c
>> index 7b531fd075b8..d83244ea0959 100644
>> --- a/drivers/irqchip/irq-meson-gpio.c
>> +++ b/drivers/irqchip/irq-meson-gpio.c
>> @@ -1,22 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0+
> =

> + ????
> =

>>  /*
>>   * Copyright (c) 2015 Endless Mobile, Inc.
>>   * Author: Carlo Caione <carlo@endlessm.com>
>>   * Copyright (c) 2016 BayLibre, SAS.
>>   * Author: Jerome Brunet <jbrunet@baylibre.com>
>> - *
>> - * This program is free software; you can redistribute it and/or modify
>> - * it under the terms of version 2 of the GNU General Public License as
>> - * published by the Free Software Foundation.
> =

> I really can't spot a 'or any later version' text here ....

Exact, will re-spin, thanks for reviewing !

It was all blurry after 54 SPDX updates !

Neil

> =

>> - * This program is distributed in the hope that it will be useful, but
>> - * WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> - * General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program; if not, see <http://www.gnu.org/licenses/>.
>> - * The full GNU General Public License is included in this distribution
>> - * in the file called COPYING.
>>   */
>>  =

>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> -- =

>> 2.21.0
>>
>>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
