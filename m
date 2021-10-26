Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47202C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 16:22:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5DE660187
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 16:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5DE660187
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBaAltMOyJpqu45XCp0ElA5ljVmAqHy8lOUpjyDynlQ=; b=J68ws0aEGNSdXr
	cDfIaPBtksnNHKJuFa+0hvAGHAkZOKlwvnsrlo91We6Y4Lg1STF0HKAF4iPOYH7+mGzNdqX9R6ysF
	5nETdRUborltBKkJ0psvPjV/KDa2sR5PEI8bRvfDM4S1+Vzv8ZBCu/JRte1ccSP1PCmZ7yrXjVaiM
	AcR0BvIWQtaF6Er9EcbnDlu3cp4f6ZyXBQgKnGKWKjEYya8D20SbagK7/VSQow2Dw8F0If2FlUJsY
	omqtfkiJR9EPfHYAujfTCld58L4i/BjfQam6wCwnZtvOKewjOZPn8bLTiPYrZLhbYFtoXC9ieQ3HI
	3UC0ONSlT8PuLl2KuaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfPDB-002SU4-AN; Tue, 26 Oct 2021 16:22:05 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfPD5-002SPA-5V; Tue, 26 Oct 2021 16:22:03 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Hdxsl4kRtzQjhc;
 Tue, 26 Oct 2021 18:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1635265304; bh=uMuyU+nblW
 yVFduTcrnnzEZiwTLee7LI2fdTkp+K+rE=; b=AuYEvUoKNGf+SNM3Yye5eWWqSx
 TmosFFU43pS1GssQnibZ9knawQb5KcR6hIl2NHZeKzHF2yjHwzBU3i63ZvC3fpNx
 tQ7NRoirlYCbm5JYV0QSAkegEccCetYHQBnaFLIwXyqVEorCd41lAyfxdAtDysOM
 kcsICK5ZX/XxKYtb7z65jPMdtUtJsqcl6OID2pESY4JvGbOSJ+zJNpQiQw6DpWxD
 bFNiTqbfKZY5898oldQ/BjmTd8K6st5n+tLYCIOVNLgjvWKqggNNWbFP1deNZU/V
 D2imDtTFuoddpkCufCZ2O5pC66JG7Bj/iYDIANHERZED5J7kq6XPQ7ZFqgdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635265305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt+PN7MxBqSh24kKMsH8OfBDuHBm2LuH1qJNjt8mCw8=;
 b=id3/Ht7mGot68SU5CeVGyN4cXmkECh17+DYHZeO4n0x7upnKIfPHBibJjUe9ptmz39yMAZ
 /0xqQG33cY2w2NMl/QCYrgdMcjKJAUWdbo/UGXqIxMV40q4dEWRyjZuUT4lGg239ZIQRJW
 4j6YhgSKz6B1hXCrCFyWOIFgkPZryEzPdiTJP7WYSQCCfhMqhrJ93sPfGi2shQORTKT2Bl
 Jw5gpmlX61XO3nIejv5bpCCoLMwyk7AJphaBlgUbzwsshrI0+dxeKovsC8Syd6kjv8r5MC
 XVcFX+yY4W7yzK49IAn2oNu2beymwGlO86RmR32UUl2prgctuKKfCYQfiPfeFA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: meson-g12: Fix thermal-zones
 indent
Date: Tue, 26 Oct 2021 18:21:41 +0200
Message-ID: <5508780.DvuYhMxLoT@natsu>
In-Reply-To: <fd76f9e2-f3e1-8520-7569-2390edaa538e@baylibre.com>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
 <20211023214856.30097-2-alexander.stein@mailbox.org>
 <fd76f9e2-f3e1-8520-7569-2390edaa538e@baylibre.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4D70C1838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_092159_424991_32592F0B 
X-CRM114-Status: GOOD (  15.37  )
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

Hello,

Am Dienstag, 26. Oktober 2021, 09:27:42 CEST schrieb Neil Armstrong:
> On 23/10/2021 23:48, Alexander Stein wrote:
> > This node is currently at /soc/thermal-zones, but the later introduced
> > bindings in commit 1202a442a31f ("dt-bindings: thermal: Add yaml bindings
> > for thermal zones") put this at /thermal-zones.
> > Fix dtb_check warning by moving the thermal-zones node to /
> > 
> > Fixes: e7251ed74ef7 ("arm64: dts: meson: g12: Add minimal thermal zone")
> > Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> > ---
> > I admit I'm a bit unsure about the 'Fixes' tag as at the time when those
> > thermal-zones were added there was no schema present. So there was no bug
> > at the time of writing. I'm ok either way.
> 
> I'm also unsure about it, either you list all commits that must be present
> for the fix to be applied, or remove it since it's not a bug.

Alright, I'll remove the Fixes tag then and send a v2 with your Reviewed-By 
for patches 3 & 4.

Best regards,
Alexander



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
