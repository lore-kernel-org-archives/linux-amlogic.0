Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E7CC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 06:55:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40C661278
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 06:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40C661278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oHQK9pGfY8M3DaWZlctejmYKsC3n3MUDBnyW7nPO31A=; b=molUFlDIYs+xP6ZpUfiXX2//P
	oHllqilfWs6ae+hMSTmnlMwqipr5/DAXJGsPkx24rdAsDJrQuDmqIB09tkIt/r7guVjXH1N2Hj/GQ
	PUOM0cT0LOHfKz+ddKnzW0CU5gtKUy6zMXCq9f03qcBDhT/sf7OxgZFobUrodzoLUQ9annRiUA9hu
	oL5yiR827iZclo7lxK5Iv6A1OFtmJoVyhX91eKo5/opezb4cIY8apXWhGwQpyXB386CQPX7egX3/u
	IIPJ1a16L3FtVFLHlhTFvlQWEHiKXwPWznq1d9OyWOUawNLEikFvWBgUe1tFTjaRG2uGI9PKNIqa/
	M8aHFHK0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWCx4-008RZr-8k; Tue, 13 Apr 2021 06:55:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCwy-008RYt-0k
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 06:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pmLiaOjr490uvmvaEk+9GZCVX7L+f8AX4Yb8w/vK2wU=; b=wf5NF1U1Rv7YLFxGmD+RuD6+8v
 Nc3hdFgionGnJX0Eq7fxUNq+GX2KJj2SooObXuSZaDySdgHbSQLXFJ57IlD0CKzOxJ2TzC+wXghMP
 AWW34xDV7rN/VQKJlyK2I9+cSm9tlGqg6j38hvLvgpONHmsWijtTEvJ876g1S0lA00BAH06iEQ2Tm
 j6VgeWSWiC7ATbmPQrO0xEsQrtZot7BiQQ2Mw+685yDYLiKoe8y2mMAEn9NIQtINl95S7VB2OKI0m
 L/COllnkqnLWDVYKR3Wcpirins8oTgxa36/lFunOtE4ohJC0MwnaMcRmpAG47llivFm1OeUfMwhyq
 B5eM9zDw==;
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCwu-006mT3-Mi
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 06:55:02 +0000
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AwHZfk6n4K7+29Y6IxAZYFs5SH8TpDfLd3DAb?=
 =?us-ascii?q?vn1ZSRFFG/GwvcrGpoV56TbfjjENVHY83e2RIaXoex/h3LN8/IV5B9afdSb8vm?=
 =?us-ascii?q?/AFutfxKvkhwbtAijvstNavJ0BT4FbBMfrBVZ3yeb2iTPUL/8FwN2KtJ+lnv3f?=
 =?us-ascii?q?yXAFd25XQppt5Qt4FQqXe3ceLGJ7LKE0G5aG6s1MqyDIQwVzUu2AGnIHU+Lfzu?=
 =?us-ascii?q?ekqLvaZ3c9dnwawTjLqTup7bLgeiLouisjbw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,218,1613430000"; d="scan'208";a="378481933"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 08:54:53 +0200
Date: Tue, 13 Apr 2021 08:54:53 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mitali Borkar <mitaliborkar810@gmail.com>
cc: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 outreachy-kernel@googlegroups.com, linux-amlogic@lists.infradead.org, 
 mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Subject: [PATCH v2] staging: media: meson:
 vdec: declare u32 as static const appropriately
In-Reply-To: <YHU56OM+C2zY34VP@kali>
Message-ID: <alpine.DEB.2.22.394.2104130853520.2850@hadrien>
References: <YHU56OM+C2zY34VP@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_235501_049430_4E8AF151 
X-CRM114-Status: GOOD (  21.51  )
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



On Tue, 13 Apr 2021, Mitali Borkar wrote:

> Declared 32 bit unsigned int as static constant inside a function
> appropriately.

I don't think that the description matches what is done.  Perhaps all the
meaning is intended to be in the word "appropriately", but that is not
very clear.  The message makes it looks like static const is the new part,
but it is already there.

julia

>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>
> Changes from v1:- Rectified the mistake by declaring u32 as static const
> properly.
>
>  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index ea86e9e1c447..80141b89a9f6 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_h264 *h264 = sess->priv;
>  	u32 mb_width, mb_height, mb_total;
> -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
> -	static const u32[] canvas4 = { 24, 0 };
> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> +	static const u32 canvas4[] = { 24, 0 };
>
>  	amvdec_set_canvases(sess, canvas3, canvas4);
>
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHU56OM%2BC2zY34VP%40kali.
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
