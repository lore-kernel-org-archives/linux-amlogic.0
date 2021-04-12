Return-Path: <SRS0=YxYw=JJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CACDC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 12:48:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A177461263
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 12:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A177461263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/EzjPp7cehYylgeLNtCmv6RVxiucTOiWgKJco0nz90=; b=LJw9C3Jvm3YY8DbZlWpXi9blf
	tfn/NQR4rRsj3c/S9jjItx8by3nMPARKWKMsU82CfGJo39Vr4k3dfIdByLl0/9K0aIV00q7V1lO2w
	NHTZc2O4uzJHuOMGbCaawkVcDFYjp2YN7OQ92iJ+//7sRao9BrSKsQ3mGABpQeIuUYBAiMoVfznCD
	5aXMP5N416o7h7Ut5jC13DdOYiutU8o9s9g/EkhhSw0qbIcaxH1F8h5UEu3wz7ew9NEwfcfvaypp5
	mhrXzmhkoSTdfebE/uHgsRu6xkfbnH/UFe3hhZG2uYWR1GJSmL2pIXrLQFoNPdd9gkOPj58MX74ji
	3H5iGi/Rg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVvzZ-006kGW-JT; Mon, 12 Apr 2021 12:48:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvzU-006kEL-R5
 for linux-amlogic@desiato.infradead.org; Mon, 12 Apr 2021 12:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Zzn8PLES8svA7U4ivqAg78EhvER0rJvp6i6dRwiQrRU=; b=tmk7L5RfCiMibV6pwmqDHwMFt4
 NpD9sv+z7MQbXjFBiTbR/PZVfPEZj+lRnQRv8bTlf3IwVwALRi58bdIVv19VkSxJCFETnmXpzt8A2
 Ftm/fnCw2u3W2IHAZ7QOyJvF9FX0bKLkC6MMCUXUjMfQ18HSSrOaSGrElXtIBKnPT37jcU1T2gvIi
 RXV5o5EnWvEEC+DedAuSOk20M4RVnG4ZdJ82iCWRFtmHAFTHyYtw5fseTNAKsm947YW4ervAlghyx
 gVG7cmDeBd2smNpiwcx9jEbijtQz21tr4mlA29GKgiHYMqeZJWJGjPq2JT9EUJ2GFOey2wm6rcly9
 Wo3EeHNg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvzR-006Eb1-Cz
 for linux-amlogic@lists.infradead.org; Mon, 12 Apr 2021 12:48:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c15so3851556wro.13
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Apr 2021 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zzn8PLES8svA7U4ivqAg78EhvER0rJvp6i6dRwiQrRU=;
 b=0vF+qUbUyHuLYS0tOOZ2JC0sSS5+/Pg6RfJqDnCalNLMowGquE9SnNrWV3F9oMZPnx
 22l7O36faYtp0YsQI9AWg1Flud4AeAPR3J0guqRfUWqNCd6ReTkvp+qOUM+AuA+E2Lde
 +cWmxL+4hXGMApCJwp4EXBuNMaApciVcycVoG6qoBVB/NgWg6ln0klUfqTUaOHRpub3u
 Bg2JFXQYQYJ9NQJDce+Pq0OZgzgZoHnPjZLxf22VxnOnipYc99owUVbti+UkDOdEGxbX
 BdxGAPd2LKgh4T3n9BRQkKdM6/N2vV9F2lKWG4GIbN+D9wTdveLptyHcIv2kLceV3XKO
 HJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Zzn8PLES8svA7U4ivqAg78EhvER0rJvp6i6dRwiQrRU=;
 b=sZQ/DTdHRHDMFqKJ569CvpY37Ca+gdnrsBjbrvR+7c0bZ8ABafSAX7m5lmXUJf2MM0
 2rsFsr2uEykRH/s8aJ000ZcqI3pe0nnlTbFQPNc6Vld6+6LleY6wOtY71VDme3hTQ5rD
 tanUb1UmZkz2XImmgvZQeU/AiYYFk2mzF73JOFvMxZgBZrYjK3iiBpwmhQMXAuc4enIn
 tTjJFEkzrWldTZEg7lzB2bUKL4V1rCyVBkbL1qVUhRg1c2GN+8zeU5NYBvp6JjgoYNne
 006ywhBnP399g5edMfhx9YWVWMnw3bFauqvk+ggnYgdhD+woGmD0BV9VNA3zB8D7SjLv
 W+aw==
X-Gm-Message-State: AOAM530a7RjgFZzSc4x/I5MR+YF2mqKuSurjfVrjBfTUSigr5WjHoxOw
 PlQKQbUhykAVGJuwDS5eUc6JrVE+gZOLGGAf
X-Google-Smtp-Source: ABdhPJyXby6kkuJjgYWXL1ZMazbjd2Zw/pmMGFu02jqpqnXMu6wbepEENYIPpUq6GqhgcJPIrhsVSw==
X-Received: by 2002:adf:f504:: with SMTP id q4mr15535673wro.304.1618231707158; 
 Mon, 12 Apr 2021 05:48:27 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4c21:b00e:ff79:bf20?
 ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id j30sm17868537wrj.62.2021.04.12.05.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 05:48:26 -0700 (PDT)
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
To: Mitali Borkar <mitaliborkar810@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
References: <YHIDufKhTEeuxyl5@kali>
 <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl> <YHRA9i+BjveJOUvn@kali>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6107204d-f1a3-0888-ef3b-88520d786fa1@baylibre.com>
Date: Mon, 12 Apr 2021 14:48:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHRA9i+BjveJOUvn@kali>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_054829_475560_67C3D8F5 
X-CRM114-Status: GOOD (  16.60  )
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

On 12/04/2021 14:45, Mitali Borkar wrote:
> On Mon, Apr 12, 2021 at 11:17:22AM +0200, Hans Verkuil wrote:
>> On 10/04/2021 21:59, Mitali Borkar wrote:
>>> Declared 32 bit unsigned int as static constant inside a function and
>>> replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
>>> This indicates the value of canvas indexes will remain constant throughout execution.
>>> Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
>>> u32 reg_name as it will contain data/registry bases to write static
>>> const indexes declared above and will keep track of of contiguos
>>> registers after each reg_base.
>>> This makes code look better, neater. It improves readability.
>>>
>>> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
>>> ---
>>>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
>>
>> Also change drivers/staging/media/meson/vdec/codec_h264.c.
>>
>> It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().
>>
> I have done chnages in codec_h264.c Now, should I send that as new
> patch?

Yes please,

Neil

> 
>> Regards,
>>
>> 	Hans
>>
>>>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
>>>  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
>>>  3 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
>>> index 21e93a13356c..861d8584f22f 100644
>>> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
>>> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
>>> @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>>>  	struct amvdec_core *core = sess->core;
>>>  	struct codec_mpeg12 *mpeg12;
>>>  	int ret;
>>> +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
>>> +	static const u32 canvas2[] = { 8, 0 }
>>>  
>>>  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
>>>  	if (!mpeg12)
>>> @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>>>  		goto free_mpeg12;
>>>  	}
>>>  
>>> -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
>>> -				  (u32[]){ 8, 0 });
>>> +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
>>>  	if (ret)
>>>  		goto free_workspace;
>>>  
>>> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
>>> index 7f07a9175815..df5c27266c44 100644
>>> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
>>> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
>>> @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
>>>  }
>>>  
>>>  int amvdec_set_canvases(struct amvdec_session *sess,
>>> -			u32 reg_base[], u32 reg_num[])
>>> +			const u32 reg_base[], const u32 reg_num[])
>>>  {
>>>  	struct v4l2_m2m_buffer *buf;
>>>  	u32 pixfmt = sess->pixfmt_cap;
>>> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
>>> index cfaed52ab526..ace8897c34fe 100644
>>> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
>>> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
>>> @@ -17,7 +17,7 @@
>>>   * @reg_num: number of contiguous registers after each reg_base (including it)
>>>   */
>>>  int amvdec_set_canvases(struct amvdec_session *sess,
>>> -			u32 reg_base[], u32 reg_num[]);
>>> +			const u32 reg_base[], const u32 reg_num[]);
>>>  
>>>  /* Helpers to read/write to the various IPs (DOS, PARSER) */
>>>  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
>>>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
