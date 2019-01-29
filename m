Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB78C169C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 10:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 998D420869
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 10:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YQvViyme"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 998D420869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7h816afaCoUHTcYQYb5RO77Z555wGERdHjP71cp92QY=; b=YQvViymegeDQYT
	leBStfjZZs9/9ztkttnCVbHIB0f+k3s8ALksDacI6jNA7bqy7h3N8JIkP6EyeLI4Ju2T+L1bAw5wM
	v4/84RLG+xubdyoG2BMjJqmHjE8uAGeADNdYpG4OfsUrVA1iniSSsVW1bsiu18CFFAgndcY3/vUTF
	jw0C3K1AFdtijy5UY+GcGj1zjcor3NwnesfIjj/sztDHO9JZyAoRYrAxPcsoqhhza3MJ83r+uwZwV
	Qf9bo6HDx3jW1CEf4RJxLbn00jFSzUHp+VUrNj4lhbI9LBTDB38nPGB/Unz9hFdISFLHyuL641NIp
	36n/hVPUUKgW2LZ/PhuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goQdE-0003FT-U5; Tue, 29 Jan 2019 10:28:40 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goQdB-0003Et-RK
 for linux-amlogic@lists.infradead.org; Tue, 29 Jan 2019 10:28:39 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pjQC2GzQz1r9sn;
 Tue, 29 Jan 2019 11:28:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pjQC1cTqz1r2HQ;
 Tue, 29 Jan 2019 11:28:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id PIvFh4anostM; Tue, 29 Jan 2019 11:28:34 +0100 (CET)
X-Auth-Info: geeH6Aft7moTz/zH+sSNI7OTQx8J1bREzSXm4M2UU7g=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 29 Jan 2019 11:28:34 +0100 (CET)
Date: Tue, 29 Jan 2019 11:28:32 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH u-boot 04/11] video: Add Meson Video Processing Unit Driver
Message-ID: <20190129112832.7ac6d5b1@crub>
In-Reply-To: <bcbb5e37-d57b-47b5-4f24-58dad577c919@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-5-narmstrong@baylibre.com>
 <20190128205611.46598f8a@crub>
 <bcbb5e37-d57b-47b5-4f24-58dad577c919@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_022838_041609_9C767044 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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
Cc: mjourdan@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org, Jorge Ramire-Ortiz <jramirez@baylibre.com>,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, 29 Jan 2019 09:26:58 +0100
Neil Armstrong narmstrong@baylibre.com wrote:
...
> > Some define values are not aligned by tab here.  
> 
> Thanks for reviewing,
> 
> I'll fix it.

Thanks!

> Do you mind if I push this serie via the amlogic custodian ?

I'm okay if you push via amlogic tree.

--
Anatolij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
