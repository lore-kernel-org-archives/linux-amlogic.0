Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EA5C28CC5
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 13:40:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4990D20684
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 13:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKPXqctv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4990D20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeiIfrvKlpKRw3awAmFGniiKxWTLgt3FOyvbl1kgMt4=; b=XKPXqctvRAaQhz
	dppAR9mV0hYI17GJQEaPdtIkoezZlC/AO0STeFlEBm7+M7JZbJV5YA7LqLAuT4n8KZpBuWUSkSaxo
	AiBYirlp2TqZ/tXmya/HlowvCyMGPGFFaMT4fe8TlShw8KB5RaPoIwsg1nO7jmmvjFQCTJPXVnTcH
	MIX3YTlEnrE74F9pzyNkYHQMIuzrvdKoEEEXEidQXLkMqYSsRg/rDodqhofmJZNhA+uPb0WJCaHMj
	cXDc5kVoUegfo75YqGriJ7Cj95EBD7AwaPIOVKDEYcozgGWmXPyEnBepZ2E9Se7bM91KNzQFVWzyp
	o9QvVdJBVdkLM8XpMOwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYW8u-0002Y4-UI; Wed, 05 Jun 2019 13:39:52 +0000
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYW8r-0002Wx-BY; Wed, 05 Jun 2019 13:39:51 +0000
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9]
 ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
 by smtp-cloud7.xs4all.net with ESMTPA
 id YW8ihmUzN3qlsYW8mhgRsz; Wed, 05 Jun 2019 15:39:44 +0200
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
To: Maxime Jourdan <mjourdan@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
 <20190531093126.26956-3-mjourdan@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
Date: Wed, 5 Jun 2019 15:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190531093126.26956-3-mjourdan@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfL/7ZtmqqJer1hsK60jgZcgv+ioTMnBw2zhprc8Tz/bSylE8VX716nESUCWjidOuDf++DgPrGp2TlmKV5m4/D8Uig0rBNJDhyiYnBcNPYN0uSWQYEbqc
 iGPqk330/IS2JJurKbAu7zb5CiKZnIF0mh86cRmofiHBhEJpBAvfw+b2ZhBs0791Ti17gyoh1Kb1p+cj8jTcxar9xMevoSncdv+OcQj7vqP9QX3QDu1/V0fw
 Cjr+Ss9igdPPnCorYJa7CRHkI6LmnZ26jdOuCy2C6GkXKAf6SVG242m4NBWVYP0O4wS3q/QhCD+1UWVihM8BdbN/2RhSH4G9kgp/0oZGV2jvYX76BzgVgyQM
 1q1rGgIaYu252pObFB0QHBhd2nxcVRaflTFhSv6QNXOwWqdAiETXCVJ/B0HTr9Zb3/OltbHHB5mo7rrQFCdu4xf/8mCX8/0vgOTTUdDKpLfpCU08YO4blDdv
 NPpTQMBErTJOwzpD4/R0i6O6lfR0ZIdtbTcCA/VXx8Y+UVRAB9QwVtn9tGLSYyVWjHd7l+TzvFNZ1fbTVjPTIO5NewY9QQCybH3da4oeZ0GBkwCazm3iLiJB
 guYMTtfR7IUQGlSU2YYVcJJwj/gLClyKMlV6r5DU4Dhs+Kd2kVHTL950rjCC6IKKR7yKnEsKMoShErTrTGGsWxPZPexQf2CbHAjql8hY9QJT1rTSoMwjdDPD
 c0iwon8trQ0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_063949_551053_816DF43E 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Maxime,

I am wondering if this flag shouldn't be inverted: you set
V4L2_FMT_FLAG_DYN_RESOLUTION if dynamic resolution is supported,
otherwise it isn't.

Can all the existing mainlined codec drivers handle midstream
resolution changes?

s5p-mfc, venus and mediatek can, but I see no SOURCE_CHANGE event in
the coda drivers, so I suspect that that can't handle this.

Philipp, what is the status of the coda driver for dynamic resolution
changes?

Another reason is that AFAIK all encoders are of the fixed resolution
type.

And a final reason is that usually flags should indicate the presence
of a feature, not the absence.

Regards,

	Hans

On 5/31/19 11:31 AM, Maxime Jourdan wrote:
> When a v4l2 driver exposes V4L2_EVENT_SOURCE_CHANGE, some (usually
> OUTPUT) formats may not be able to trigger this event.
> 
> For instance, MPEG2 on Amlogic hardware does not support resolution
> switching on the fly, and a decode session must operate at a set
> resolution defined before the decoding start.
> 
> Add a enum_fmt format flag to tag those specific formats.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 6 ++++++
>  include/uapi/linux/videodev2.h                   | 5 +++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 822d6730e7d2..b11448a1848b 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -127,6 +127,12 @@ one until ``EINVAL`` is returned.
>        - This format is not native to the device but emulated through
>  	software (usually libv4l2), where possible try to use a native
>  	format instead for better performance.
> +    * - ``V4L2_FMT_FLAG_FIXED_RESOLUTION``
> +      - 0x0004
> +      - Dynamic resolution switching is not supported for this format,
> +        even if the event ``V4L2_EVENT_SOURCE_CHANGE`` is supported by
> +        the device.
> +
>  
>  
>  Return Value
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..9b0a7f82dd92 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -768,8 +768,9 @@ struct v4l2_fmtdesc {
>  	__u32		    reserved[4];
>  };
>  
> -#define V4L2_FMT_FLAG_COMPRESSED 0x0001
> -#define V4L2_FMT_FLAG_EMULATED   0x0002
> +#define V4L2_FMT_FLAG_COMPRESSED	0x0001
> +#define V4L2_FMT_FLAG_EMULATED		0x0002
> +#define V4L2_FMT_FLAG_FIXED_RESOLUTION	0x0004
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
