Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8376C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6937520855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dzGZUx9E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Jwl2b/hX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6937520855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cj9Bz/rStgv7hoHS6xjoRVTQOs50EGSlSOUqw6dnWeo=; b=dzGZUx9EU/A38B
	z1PgqRzDojfUHO6cDNjFnYwkQMWdSVg0w65oTvFOL7eCdaCsG+iI3IaFpvdjf7Qv9peKOkkFKpQH7
	SYvrMAS4DZ5EBTjIiXELRhAI0gFmAAItOFM+LHMk3Zd3B4KduYaUSiGpQflOReWaJJxuwroRREF0p
	EQUY1e6EKzizPu8T9eIUWjhe85CIyAq/vpfqZjQkNt0EZ3k3GnOWASbbjddcU6paSMQCbnin+BRry
	fGCj5ab6YcSyN8oI/+mxUElFYVSoPEIPGvdJY3ciG13/Vedy50MIxdSKJ053/3XiPl+BEXor9XVS0
	NXEM+mzYLUle7I6Mv1jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkEIK-0006KJ-NV; Thu, 17 Jan 2019 20:29:44 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkEID-0006AD-VJ; Thu, 17 Jan 2019 20:29:43 +0000
Received: by mail-ot1-x341.google.com with SMTP id s13so12372081otq.4;
 Thu, 17 Jan 2019 12:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i82TH7hCxk5Levy+QB6cTBDP+CTZhfBIWC9RRoSGdOc=;
 b=Jwl2b/hXvvvbE64VvNJ16w+TGhdRC4ejQl8SrrTMusD7CBuqHeG6SpIyq5BxmDifeg
 YIyZGdkp/cIrorPUN9GAfg5T1ENTOFoEpsGNCgweRIVjj8Vg5yLj2sz5oVBHmWmmljRJ
 UZ+YN9o26P9yZN/0+RhRD929dHSo1vONsGdvyuUbaaAGU71qcTlr8hdUAicrorBetMa/
 l+49u7HB0hoCzhLBYHIwqWU8ocfcy72gr3Lw9ptarxYojyMcrvH/Ia2iNaQK8QFSRpZV
 ijm/hZh5/+gsNRrJFyLb8UTw++wvabddSTp5/DFETqWXizaXN7EDpJD5lBNS5oUChGSK
 prEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i82TH7hCxk5Levy+QB6cTBDP+CTZhfBIWC9RRoSGdOc=;
 b=BW7UxiWLHs9JCXKPT8FaJMVP63x9Zup4g20lpWIRFQXsyZVvHdKkoXfBadSPv7FWSK
 //rdW1QwE7BkPdnZrK/VXVnDwlmnd8c/4cIXJiWqHFCz9LrHYsrfuJW0Zux/DvOUHDYN
 8KqLMgmMakr5QlE8HDTdVqfEERRplSMukE816Ia7onnrPRzEoFM8wX3E1AHH7/zSUCgA
 r/6PZlZNd883IJ3LgdImfLwCiOYu1Mz/AYGNzRC1aC21pxa7ZLsf6aQXOUHr4zldEAJ3
 aj2EeLLzX9ajprGYUwBIZo9x5tE12wMpMJcOpRed6VUIMqscTBBRaHZss6GF1i9i68nY
 GsfA==
X-Gm-Message-State: AJcUukf1xEWK9qlJoO6y8EAcujE0eiZyK7Vi/dasoudY6R4Iq5Q2JLXi
 uqwiButvCzsasSERkSl229kG1Tn4b3NwN+90yjk=
X-Google-Smtp-Source: ALg8bN4SovvT8myPJj7oBOgj20t/EczRvqvxfCAoCz7PCtUppVB5+ywGYd+acgJdAPVcO5Ys5cGGyPhCkSBO0FORh/k=
X-Received: by 2002:a05:6830:2115:: with SMTP id
 i21mr10107656otc.237.1547756974995; 
 Thu, 17 Jan 2019 12:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20190112130649.23838-1-martin.blumenstingl@googlemail.com>
 <7hk1j3av3x.fsf@baylibre.com>
In-Reply-To: <7hk1j3av3x.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 21:29:24 +0100
Message-ID: <CAFBinCDfbHgCEyieqageo7mxqSAxb6Hp+m7asDoR=FuK=UD8Jw@mail.gmail.com>
Subject: Re: [PATCH 0/6] ARM: dts: meson: chip temperature (hwmon) support
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_122938_728977_0A305901 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Thu, Jan 17, 2019 at 9:26 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > Now that the Meson SAR ADC driver can get the chip temperature on
> > Meson8, Meson8b and Meson8m2 (see [0]) we can add the missing bits to
> > the .dts{,i} and enable iio-hwmon for all boards where this could be
> > tested successfully.
> >
> > This was successfully tested on multiple boards:
> > - Meson8b Odroid-C1 (me)
> > - Meson8b EC-100 (me)
> > - Meson8m2 M8S (not upstream yet, me)
> > - Meson8m2 MXIII-Plus (an earlier version of this series, Oleg Ivanov)
> >
> > compile-time dependencies:
> > - none
>
> This seems to depend on your HHI series, which I held off on last cycle
> and you said you were planning to resend.
ouch, indeed

is it OK for you if I re-send this series with the HHI patch included
here - or do you want to have it separately?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
