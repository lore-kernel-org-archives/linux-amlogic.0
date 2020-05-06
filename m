Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F417C28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 15:05:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EFAB2076D
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 15:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ftx/5wRi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="txKcDb32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EFAB2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2rs+oJRuslzCS8KyvaQ0qBEKOODzcCFW6gxz6ptB8D8=; b=ftx/5wRii2LFAJX8lL05wh9sff
	Sl3RIH1GdGED1cCKjNBg7Sj02gPDf5r611eIEReHg5jaispqY8F7IxQzYlXx4FRBEI8ckP3CWHjwb
	BpQ6tdt9tkws/jq9x9/dNMe+QqRna+VPQu0ZVZL6FKDhz8MxEiVutLauy+nO+kwbutc7C1fcBOGfM
	O0+80WS7rCojNQqfnR/lhUh+83gooLvvt1H2spJCwk74CYGzX5AR0X6SOzLGz56I/080QkekBVZcC
	RCnsaSn0gp+IQnYxrsxgZqJofxx+8osCRHCC1Yhle6c3bFI4ynptRvTTgu+0KReXKqZt0lUcFTn0h
	zQxAm6oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWLbe-0003Dl-JA; Wed, 06 May 2020 15:05:06 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWLba-0002CH-LY
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 15:05:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id z8so2620833wrw.3
 for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2020 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=IuVcDPvx/ramQ3zgx5WYrUfz2fWdPILVO++V7pmfrS8=;
 b=txKcDb32BBdVGQiu/JSUT4iXWdPuDxSBJVjxDRf3vU4+HoPDbeWhhoo+oJFxtOemOD
 UZj4tggxE6K9/fd9SXk9yTySnXLwAnQkHCS6BjbgJ4aTW7kFC8qHc0QY6qCBqbXt9hAd
 zY0P6u9KYkb9GWGT2bQdT8HEVhx6tHPVgaYwyUy4GcZCMEku2/7tSWpQdeqMHWRRt7zj
 Co5kFG54iSUfz5FdbaHqoAbOD7hy5oljSsaHKiu3mJVOfpHg4o6vEk5n99Kq4mZG0Oa2
 z7i32QdI6B9Ogu1m1RSLDcuTFxp+XR6DV0DK27zZMtkekdQXjFnAuCGW3gTBBqxMPuok
 WhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=IuVcDPvx/ramQ3zgx5WYrUfz2fWdPILVO++V7pmfrS8=;
 b=ceQGwUf33NZytlQ6jbrzX1TWy+x5lmAUAA//WsUqUlSKeqmRgIg9wO/0eVn/QxZXYB
 Xhs9oeQLM4O6P4Dl6IetxTv015YJvGR2hoYHxlwiElQ/MxHFeeiBRzI5DTcXEpi7U9dL
 zzecoFRW4Q7fZOjuTJtgnZmsIfntsLfrm2/tlNiHmLdSsCkBl2Z1RCzEAATJqRqrgIgO
 irYO7950H6jVBgKQNfDqTnSEIbryh1LeKtf7Ih1E4N9CEvxEsZZIGkNEJivOZguVhEsg
 wuTsUhviLWEPjFxGbwQA2wgWkyGZeqX0//z3beNQA+q9iXVLJwemK+MeQ40/RvVCHZIm
 MINw==
X-Gm-Message-State: AGi0PuYnm3vCRoX9dZdASE2pg9KcqBWUxMpMn0eR8rDXe1+FPfy5dsvi
 rzHnKsy+AOLC5BAewcC3uRUM6Q==
X-Google-Smtp-Source: APiQypKJ78dHmdgL4QTF8E5sQrqBVtdAFbIvwh1I0kw41IMKqMhStQAsPmRkliHyLMs/wye/16BEVg==
X-Received: by 2002:a5d:4801:: with SMTP id l1mr9559567wrq.235.1588777499375; 
 Wed, 06 May 2020 08:04:59 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id a12sm3191550wro.68.2020.05.06.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 08:04:58 -0700 (PDT)
References: <20200122092526.2436421-1-jbrunet@baylibre.com>
 <6f661498f58c6a519095d0657413f4b89d3ef21e.camel@pengutronix.de>
 <1jimi2tqsn.fsf@starbuckisacylon.baylibre.com>
 <1jy2q5f9zc.fsf@starbuckisacylon.baylibre.com>
 <05e51534c3d6284f555fd262b666c94d12cbd010.camel@pengutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] dt-bindings: reset: meson: add gxl internal dac reset
In-reply-to: <05e51534c3d6284f555fd262b666c94d12cbd010.camel@pengutronix.de>
Date: Wed, 06 May 2020 17:04:57 +0200
Message-ID: <1jv9l9f6jq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_080502_823049_0053B08C 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 06 May 2020 at 16:54, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> On Wed, 2020-05-06 at 15:50 +0200, Jerome Brunet wrote:
>> On Tue 14 Apr 2020 at 10:28, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> 
>> > On Thu 23 Jan 2020 at 11:13, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>> > 
>> > > On Wed, 2020-01-22 at 10:25 +0100, Jerome Brunet wrote:
>> > > > Add the reset line of the internal DAC found on the amlogic gxl SoC family
>> > > > 
>> > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > > > ---
>> > > >  include/dt-bindings/reset/amlogic,meson-gxbb-reset.h | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > > 
>> > > > diff --git a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
>> > > > index ea5058618863..883bfd3bcbad 100644
>> > > > --- a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
>> > > > +++ b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
>> > > > @@ -69,7 +69,7 @@
>> > > >  #define RESET_SYS_CPU_L2		58
>> > > >  #define RESET_SYS_CPU_P			59
>> > > >  #define RESET_SYS_CPU_MBIST		60
>> > > > -/*					61	*/
>> > > > +#define RESET_ACODEC			61
>> > > >  /*					62	*/
>> > > >  /*					63	*/
>> > > >  /*	RESET2					*/
>> > > 
>> > > Thank you, applied to reset/next.
>> > 
>> > Hi Philip,
>> > 
>> > It seems reset/next has not made it to v5.7-rc1
>> > 
>> > Would it be possible to provide an immutable branch with this change, or
>> > maybe let Kevin apply this change through the amlogic tree ?
>> > 
>> > It would allow us to progress on some DT changes during this new cycle.
>> > 
>> > Thanks
>> > Jerome
>> 
>> Hi Philip, how can we move forward on this ?
>
> Sorry for the delay, I have missed the last window. I've now created an
> immutable branch:
>
>   git://git.pengutronix.de/pza/linux.git reset/meson-gxl-dac

Thx !

>
> which I will be included in the next reset pull request.
>
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
