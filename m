Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9917DC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:20:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BEB20855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKXmUmI3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QC4t6mv5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BEB20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mqVzcVwSwFqWNZImaZRi5Pr5C6chWeviqoMlfxN/lA=; b=kKXmUmI3OuOnf1
	a3OjFRlMYgIroxjg9Ds8gagfWvHfzfWTj25mG5cMvzZpGgIyCDoujTDtmmE8B+GQar+YK4E0hDIsL
	GOfYx7AJCH3wFKU4S/x6yS8MXnAQDh/V6piaBkZjrKd8hlFCiaV18zNQD8Jj9UXpoVcV37AuMVY5p
	TC6aMwNMKjge/Ol7ycwaM4jRjr3CPAbWfiXO6m8H6eyjgiSmJmgHg/g1vfRSmLhEdl+XudV2EDs64
	lWIYAQoaWYIS5iKoGHg5bjy02ZvF42KKy9d0bPawYGKxUXobBkYAsiFGT/+5ZsyjP4PFzMNUkNyZl
	TA11K5BzPnJn4CTNGomg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkF5c-0006x8-17; Thu, 17 Jan 2019 21:20:40 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkF5Y-0006wh-Ef
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 21:20:38 +0000
Received: by mail-ot1-x344.google.com with SMTP id u16so12476167otk.8
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 13:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogy6xz8UHuvcLvCW7Q7NOZfiiBOXpv3rBQwAFzf/+KA=;
 b=QC4t6mv5clBrgJeb5yOqPcQvERHHSxayfB+G0Vc4TstrM4tU4AfZIlz1XeOQS8Gzq5
 fhLg2NJxUFfgr9hewjStmoJFfA/lCOCA/hWmSB+bckHP0QsZFRAVf9ZGWnYdLi1ZhS//
 ywyWtHG3xex3kEXDbmqr0PG6mXMOYtaqTMKkrgksvMSQrB90l8bvlRui/ujMeqQ1GSt3
 C5pKKOoo+Hd8z3kctEdT3cUIyVD/wk//txsRnnD2p8eNl7wWNE6oK5PdL/2hQaqL9SMZ
 tR8C1W6EO1JyBJYQ7u7tOLMotLy5ljXgZOSaQXn7k5jn2hS931+SsdosZUOtmkXmxnqA
 cu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogy6xz8UHuvcLvCW7Q7NOZfiiBOXpv3rBQwAFzf/+KA=;
 b=T1y7uxJJn/JVhOpVs5TpOTARQpnuRVlFpUp0aBi2sfH4c5x0W9F6k/HdIHOfgkyrIZ
 8ViuZz2eSw/MLoUGyiaSadAZ8PEQPeS/0qAajB78vkUH1Kqa0g7hUtznlQ7VVe6Ub63a
 +3MI2OBSjjKVNvclz4xlbBxxo39+ntwTEJvntiYogXbqzPn137AxBqXDSaV8aUoBb1rP
 cW7Z57kvuIh7+Zjyyln+nrUFrJwbjmGsjWWyOqya4QSMzxIg/pAn++RD77MU05oiZZhI
 9imNOzpfYb6AsBdRczxJ3PyqZvNm9QA9cck1gUCb9AYZPjfV2RYY/ADiyd078qayfimZ
 FNSA==
X-Gm-Message-State: AJcUukdeHpbNgptIJP95oWSQGgjkZCdkgdWidqnZxselmzZ/T5oKzWHs
 mUyXsDOH8qdUwL46nudb5k/HjvjkvWSlWvdodYQ0ig==
X-Google-Smtp-Source: ALg8bN6zst1xaYMIOyQa7NlrqiKzfcgl9QtzmKCH5E70P+hJyxC4aj13MrXwTJggDhix1GJAP580g9IvFG5B1TNqkb8=
X-Received: by 2002:a9d:491e:: with SMTP id e30mr10306229otf.131.1547760034647; 
 Thu, 17 Jan 2019 13:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
 <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
In-Reply-To: <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 22:20:23 +0100
Message-ID: <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_132036_546751_E27FC274 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > OK, but we had incorrect documentation in the past. did you check this
> > with someone from Amlogic?
> >
> > I'm curious because there seem to be two different approaches here:
> > 1) hiubus name and offsets are being fixed within this patch
> > 2) aobus is being dropped here and re-introduced with a different name later
> > on
> >
>
> because hiu exist and aobus does not, for which both the name and size was
> wrong
>
> > approach 1) can also be used for the "rti" region (at least in my
> > opinion, the patch doesn't explain why it can't be done):
>
> THe patch remove aobus (instead of fixing name and size) because, of the
> multiple region documented covered by this 'made region', I did not anticipate
> which one will be required and I did not want to add them all.
>
> Better to add them as needed, which is want I done for pinctrl as you pointed
> out
>
> > rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> > (both values can be found in mesong12a.dtsi from
> > buildroot_openlinux_kernel_4.9_fbdev_20180706)
>
> RTI is added here:
> https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
>
> I don't really understand the problem ? result is the same
the actual problem is "me" as I have conflicting information:
- Amlogic's buildroot kernel (for G12A) uses similar bus definitions
as the GX SoCs (for which there are public datasheets) - this is how
Jianxin added it to meson-g12a.dtsi originally
- this patch does it different - but cannot check if this is correct
(no public datasheet is available for G12A or AXG) nor do I have a
"big picture" of upcoming changes

Cc'ing Jianxin: can you please review Jerome's patch and give some
more details on the memory map on G12A so further contributions can be
reviewed easier?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
