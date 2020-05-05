Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EC8C47247
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 16:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAFA206A4
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 16:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1oVSU0s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jhf/ev2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAFA206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fW4c1LmqvEVwrLt5bHGRv82/uplME21lReUqIJPcwg8=; b=E1oVSU0s9wU2zn2E7NrIjG6Itf
	aLuRHLcZEwCzsWNFlHhOt4lWNfC8XoX19zygPdvD8KNYBzEeRPVV+Ayy6tNRmliCF126tg5yfEtnR
	YBxTKWN23Zy7BzMiIwHZL/DWIV/ty9DOE85hp+zmN61ctP56S1da5p5FWBbqzcK7eTjlC6FroZE9i
	xkqKqQ51vDtYJygKM/yMlJ8RvZXbA7MHcRKPkA+QhUjQoJq/vS3fgbxcom7855Zihz7jT9QBTRAKV
	Oh6wvtPOQeMTuVcme4YhrKDYXWiaim3GH9BCyHj1YtgP8TiVmkyALZcLxXMi/g3HZHe1v3ykqWXKt
	Otwa1VbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW02a-0003rz-Uf; Tue, 05 May 2020 16:03:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW02X-0003q8-Sc
 for linux-amlogic@lists.infradead.org; Tue, 05 May 2020 16:03:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x17so3408824wrt.5
 for <linux-amlogic@lists.infradead.org>; Tue, 05 May 2020 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=WtK4lkmxnuhqEL9MrdcXhTfMNLOEAuXiB2K70MvxivQ=;
 b=jhf/ev2c6iw3kTKkuaHqt6K4MiAHE95gM/VMkGmkMy+1xVoC1C1srH4mjYfLKfiwj9
 QdBNBqN0VlqRJ6UftTdKvMgWwled4xICnR+2wXelpBOapwoAzxgZSXsoT6XqOP3NcUkz
 8ORS2G76S8L/l9BTqQ92Uy0p9apMWqRa5wMrYFmuelsG/wC1ObVGRhozgwoZuiXVBoDi
 jEk7PunDCTgVrVx+77wQmUA7B+C0fAhYUQZLEZbGqEl6+ssYRG9feTErxv1ZiRr5RFWI
 PeC8XVG8YyNqm3ZY1OX/nYjKT1sU/wB9xXE/zV05YJdrlHRm0a6mQIjNgwNiR4pQ6TcG
 SIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=WtK4lkmxnuhqEL9MrdcXhTfMNLOEAuXiB2K70MvxivQ=;
 b=PBZOFB/kSmGkL6PC9MG40CipRvB7BX285k12iPhCCspZGol4m0Gd7amFAe7DWBiP9P
 a1OjbTpERBDSD6xJRaewZXfZQD5SYTXxgNF0Ut6kxxefghmcAX3rvpsqM5gY+JrHcq6O
 tja1f+zImK5sO6eUQ7kZh3qaIixx6YWzQU0TCM78KoYWd92UoFaa70qk0MT5Df84aO/E
 0l4YG8y1oD3oxArKl7hZtNbSbxZXXGkC6xLGPk4JTcMuqxabofm5FiMbkNWPxIgur5NG
 VX3S0JKEDE0qaUKKl5YL4GtAmBAOTlg699hOIAIGFfz0yyDAqniR5E64PsX1g0hoKlGP
 /ngg==
X-Gm-Message-State: AGi0PubXbAH8wDF06EQtS+qax13RPU9Tll/1znbC2uczkYVQs54p0yxg
 IJ0CIDgESXsXKdoQ8YaURdbQIw==
X-Google-Smtp-Source: APiQypLDKu7PhMfACG24kQblVht1fU8mNlGHDOGopmyrRM8TnNb3LogjoedLdmRhbaRi9Y10ma9g2A==
X-Received: by 2002:adf:decb:: with SMTP id i11mr3434250wrn.172.1588694603453; 
 Tue, 05 May 2020 09:03:23 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id 1sm4612446wmi.0.2020.05.05.09.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:03:22 -0700 (PDT)
References: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com>
 <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ulf.hansson@linaro.org
Subject: Re: clk: clk_register is deprecated
In-reply-to: <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com>
Date: Tue, 05 May 2020 18:03:21 +0200
Message-ID: <1j368egyie.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_090325_924835_821FC853 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 04 May 2020 at 19:16, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-04-30 05:24:41)
>> Hi Stephen,
>> 
>> We have a question regarding drivers which register clocks in CCF and
>> later need to use these clocks.
>> 
>> So far, these drivers had been using clk_register() to get a 'struct
>> clk*' they could later use with the linux/clk.h API.
>> 
>> Now that this clk_register() is deprecated in favor of
>> clk_hw_register(), how are these driver supposed to get the per-user
>> "struct clk*" they need ?
>> 
>> In this mmc thread [0] Martin proposed to go through a provider. I think
>> it is overkill, especially for a device which will not provide its clocks
>> to any other device.
>> 
>> They other way available is "hw->clk". I suspect it is not recommended
>> to do so, is it ?
>> 
>> If not, what would be the recommended way to get the "struct clk*" from
>> a newly registered "struct clk_hw *" ? Should we add something new to
>> clk-provider.h API ?
>> 
>
> Yes we should add a clk_hw_get_clk() API that takes a device pointer and
> a string name, mirroring the clk_get() API but cutting out the part
> where we have to go through the provider to find it.

We will try to propose something for clk_hw_get_clk() soon.
If we do so, could we "UN-deprecate" clk_register() and make it a
wrapper around clk_hw_register() and clk_hw_get_clk() ?

It would make it easier on drivers which both register and use clocks.

To get a short term solution for Martin and his MMC driver:
-  If the above wrapper is OK and we commit on doing it soon, would you
   also be OK for martin to use clk_register() in his MMC driver (now) ?

-  If not, could we use clk_hw->clk until  we have clk_hw_get_clk() in
   CCF ?

>
> This is so that one day in "the future" we can remove hw->clk and make
> that an internal detail that struct clk_hw can't see because we go
> through the clk_hw::clk_core pointer instead.

Yes, I know it is your secret plan ... ;)




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
