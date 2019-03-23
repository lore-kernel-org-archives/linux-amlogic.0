Return-Path: <SRS0=10CR=R2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D87C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC07E218E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 09:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tL/aHMlQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eaoi+4VT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC07E218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWxHsremL87rRc0frbl7iWJDllFV6ZoxKrETrR/rFCQ=; b=tL/aHMlQldnwOd
	VtH0o5iJtiNGmD0QyJWtkDzNHuE4SNxTuR++iWnXgsYNGJunIySy2kZOeA4rxcoPudNAMxWnAaQ2A
	ykIe5/bC/wOD8OP1IAcguwqlfC4aMsZCRgqV21GwyzAjR/zUXdIBUJwg6iN+Bz5Mmno4OuyRccTcX
	I7EDfXLJafVCx1FwdjXK/sVr4U39ihybcBaPGdPKL5r3cyNGP4DYjE9oGfn71RaYoPS7hTqpvM9Gw
	iqPM0g3KhPOk+Mgnb2PZqSUKhvkPffC86Lp2i2mgr3TocLsO4ez2eqdkVEDWwzweRky4SGUjJ0GeK
	RoRKFJOFAEhZZmY6IkLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7dNf-0002RQ-QY; Sat, 23 Mar 2019 09:55:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7dNX-0002Ie-0G
 for linux-amlogic@lists.infradead.org; Sat, 23 Mar 2019 09:55:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id g12so4837196wrm.5
 for <linux-amlogic@lists.infradead.org>; Sat, 23 Mar 2019 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=JM4qLmyqXI9ppIvoMALQtWz9jrINBuzbmUFLvlyIlXs=;
 b=eaoi+4VTSHow1StChlzuH4TDeb1l87i+7cx17QpCWK+H9iRABRmR7RX7CaWzKMGAfl
 h5Q1/5afp5+KBCpwSSHHoyhbBjt+PC/72c1vyXSwkmsrVjaSrDkaxX0INBKJFtLXmern
 1Gvyy+9UB+7xadd2yxAph/IGHy519R2pahiSwcp19waMuEunpC5zApbaX8zM8xbo2Llz
 L+hLZonXU7QGz1wcgb9Rp2lMYHNdAGlQOHw72VvWOhZMNZNE49bOVVzl0ofSCCucRgG7
 eL6tyC09I/izyKHICkva7q2/mwrcEJVrV+v4OlE1z28z4AzJNDSMe67mV/o5YKosmdC9
 DQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=JM4qLmyqXI9ppIvoMALQtWz9jrINBuzbmUFLvlyIlXs=;
 b=QKz5iafUHFOZC7o65l6l9dzXEmdm871I57J+AxWNR9LmpYLtp1ND3EHQ0nECXin10g
 QceOG23DrMaGO3oT+NuchztYfOQAfrhowzo41zo6Wb1EaVorH1WkHARBJLJu+GNloZe5
 LXdyye0XlNMgI/2I5mCGoUs12rSSFvN7dwOr6xK0Q9q8heUYPVX+ImTBknaOFeUfxedj
 Pvmwaa+fYlghEuG/Fh74SLthrqviEPk9mNmvng01jrq1l8lRuWfLmIveasmDI+6gbAiB
 xwnBY2S8PddSTYcMi8qIIO7tCyJWRzUj/c9/gFytVmis8PAPD05F9cPWJSZCFtQrqwB+
 I0JA==
X-Gm-Message-State: APjAAAWWhmu34r9DO/SGPsX922HjldwaFfJ29LI+vHfbVcOt5DqZvbUu
 Ok8I0sS+hTwCJTbH5rkZe8BucqloB87jUQ==
X-Google-Smtp-Source: APXvYqwR4HgC8huANOv4HaD9eDdX2uaAhRZOcO1xRJ1RTHkFpIBNJO6xSZLdcygL1iL5Ty8GUEou5w==
X-Received: by 2002:adf:9103:: with SMTP id j3mr9236460wrj.236.1553334948844; 
 Sat, 23 Mar 2019 02:55:48 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d6sm10817120wrx.62.2019.03.23.02.55.48
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 23 Mar 2019 02:55:48 -0700 (PDT)
Message-ID: <5C9602A3.6010607@baylibre.com>
Date: Sat, 23 Mar 2019 10:55:47 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/8] arm64: dts: g12a: Add peripherals
References: <20190318095851.4062-1-narmstrong@baylibre.com>
 <7h5zsa33yu.fsf@baylibre.com>
In-Reply-To: <7h5zsa33yu.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_025551_041183_C8AEE85A 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 23/03/2019 00:05, Kevin Hilman a =E9crit :
> Neil Armstrong <narmstrong@baylibre.com> writes:
> =

>> Add following peripherals :
>> - AO Clock + Reset Controller
>> - Pinctrl
>> - UARTs
>> - SAR-ADC
>> - USB
>> - Mali GPU
>>
>> USB depends on the PCIE clock and missing Reset bindings.
> =

> I left this one out for now.
> =

>> SARADC bindings is merged.
> =

> And this one, as it depends on new clock IDs.  I need a stable tag for
> those.
> =

>> USB bindings has been reviewed, but not merged yet.
> =

> Also depends on a reset patch for the IDs used.  This was just merged by
> Phillip, but I need a stable tag before I can merg this.
> =

>> Mali GPU bindings are still in review.
> =

> I've left the Mali nodes out for now also.
> =

> IOW, I queued patches 1-5/8 (branch: v5.2/dt64), and will wait on the
> others until their dependencies are cleared up and/or I have stable tags
> to use.

Ok, Thanks

> =

> In the future, please note all the out-of-tree dependencies for the
> series.

Sure, I'll add more dependencies details on the v3 cover letter.

Neil

> =

> Thanks,
> =

> Kevin
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
