Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF67C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 11:48:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89318613AB
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 11:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89318613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cTHKkZnRtQSx3b0TXWYytf+NCTJB2TNAQXEblWAEFKk=; b=A3ICrzWgF702F7c8RDTw3H+L0
	1GWe5r361V/gwPEhgWOD6iFS9amAE7bdEkp7gNcY8E3U3KwbfdysLvnBwZeBPBfNmxRQ+oHLCsypJ
	shPprH/4HzfJKlclLUtJZhwUf2U6DqtSUXwTPdQw723GXs6hoi6MVxjXPrrfxh8tt+pZlT4J8PzMA
	AisWWDcxyAoXVy04Lj2jWML9yjOsm0u0BZpEgRWZu7PyEC+N3AuketoDjc4Tj2ghGgQ3ftOuc6Hbk
	DAUU/kM2JvS2LeHnqK1lcOFHqnNjVrKyP4jIKRTv2vERJIWQmsvN+YpkIkKehHnUM9G2fTRcoeAbr
	jTpNPnutw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWHVw-0097bE-Ex; Tue, 13 Apr 2021 11:47:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWHLx-0095TK-VV
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 11:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jEUsARIo0JqIZNXOI5Z7E9R8FXqpJXDcunTU6TakZCI=; b=B5rbdq5IGH4GvYU7kjWvGmTrz/
 ByCRUgwIz8EI6DLDELVI594DHOVnxLsHiLFpA3So281wWr/nyV+uw1/CaFUK3sca3PIakAmuGx6NY
 ct4O4hQPhanv7KJPBls7IRCf0+OM5YrX0dxCwTrq5tB8Ydd+dFcX1YrtQ2Hn9+L6SokqCAKSGV5sB
 istxjPtSpckJdkwPjekqbfUT9KtnFL/0E4InTyNOgGyAY7EUyjvTTRQv2APgff+gMFScNfhzU9qv3
 zpmzjYOLjZZb0unjF0rULhMyMSDbO/mEkoRHhSomR0viwotihGS5+SMJnMIlXUUkOVoxn5NHw26NF
 z009kK7g==;
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWHLu-006ygw-Ri
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 11:37:08 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id WHLZl2arGgIC3WHLdlK9yi; Tue, 13 Apr 2021 13:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1618313819; bh=jEUsARIo0JqIZNXOI5Z7E9R8FXqpJXDcunTU6TakZCI=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=FJjeQgCcrWefEKdYcTCPe0sXNHegTK5THWBZmsWQag211egilwQ1JWKk/5wbq54rJ
 2vBT/bL+WCyJuYI6pthfbMWFg0PrkjwVnpOdOhPrFMhFPNYNv0mWDfgEfhdBJCScWC
 z9U4ExtvcOdnZSc2WBbHbyEaVyTV/5NXL69lTArDwB8aesSRIx7weJsmaZ+k03XSKB
 0l8Q/gJVKnTqFjptYp3yX9goLXZX8nG+UzARnmuwaOJTHd1RPLV8dnp8zfDgyRuW5u
 7nCpAIftktP4Jf7KIWIAnNA+wMFGOVjyvKVtbd75jFR6nbhu1Pz/mwGFZORTbHtShp
 8wYUYyi6k7PLA==
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
To: Mitali Borkar <mitaliborkar810@gmail.com>,
 martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
References: <YHU56OM+C2zY34VP@kali>
 <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl> <YHV734NB4flpFjbF@kali>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <69ffded9-548f-7595-8333-aebedae38de3@xs4all.nl>
Date: Tue, 13 Apr 2021 13:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHV734NB4flpFjbF@kali>
Content-Language: en-US
X-CMAE-Envelope: MS4xfBrAWRFULFyzrMwuXAr8Edg0IHLgsOAWxz9vm67BceqYT5KtpoJkstULGPzKJz439fksL/vvNLimI/2gGi8RO0WV+4keMKsPyVvdd63EHY0MeGKgutgC
 pgjT3Z96R6s4I8htah7RLuo9P3apfswKmmLJxVu1nLWVfPcLvdU3lP9dD0kCwWpwjm4jp2aDY7KAZ6rf9joucnExbJFQ5gjUVz5rxpDiv9FASOqAWJaY0WpA
 txDRMJeLKUFWhV9U/8pRAcuLpu7M5bvHyad7DgMVbDL3EiYk11z9bVU7EYvAfKUBE8LtNKK3PuIS+ntiXGUmrvhj4Y+BsIB2ONFTBM0y1GZu5UlKWAIqBVcv
 roUWo/UKEvKCtpx4cDUkIjacc/q/uF2t2V8C9rvm3sCLxtWtV75JvJLPQPpJ5Ewa+3p7cX/P955+7zN12JPYXMDLH9I3mohrhdLNxtfAB1YWWdJ/R+H5Nih3
 LE47ZSj9PTmuujS/kb8zbFvUtzXENpQ5T6nOwnI5lGhjwrnzAmg/bLuJPC0UpWlBhs2B6bQIajt8q06bS6LibM932mCYhzOyn2oFigUtik9bJM7n7OOdN2++
 aj6QIEXKySeT2+66c6WSW1+pif3EBvOPcxWwpSVT71uwYfPLZIo9MPnEGDfXJljcSko=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_043707_051122_2E92FDCA 
X-CRM114-Status: GOOD (  17.43  )
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

On 13/04/2021 13:09, Mitali Borkar wrote:
> On Tue, Apr 13, 2021 at 09:26:01AM +0200, Hans Verkuil wrote:
>> On 13/04/2021 08:27, Mitali Borkar wrote:
>>> Declared 32 bit unsigned int as static constant inside a function
>>> appropriately.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
>>> ---
>>>
>>> Changes from v1:- Rectified the mistake by declaring u32 as static const
>>> properly.
>>>
>>>  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
>>> index ea86e9e1c447..80141b89a9f6 100644
>>> --- a/drivers/staging/media/meson/vdec/codec_h264.c
>>> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
>>> @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
>>>  	struct amvdec_core *core = sess->core;
>>>  	struct codec_h264 *h264 = sess->priv;
>>>  	u32 mb_width, mb_height, mb_total;
>>> -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
>>> -	static const u32[] canvas4 = { 24, 0 };
>>> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
>>> +	static const u32 canvas4[] = { 24, 0 };
>>
>> This is a patch on top of your previous (v1) patch. That won't work
>> since the v1 is not merged, you need to make a patch against the current
>> mainline code.
>>
> But Sir, since I have made changes in the code, and committed them, now,
> if I open that file, it will contain those changes. Then should I
> rewrite the patch body more accurately? 

You only committed the v1 change in your own repository, it's not in the
upstream repository. And the patches you post must be against the upstream
repository, not your own.

'git rebase -i' can be your friend here, it makes it easy to fold the
second patch into the first, and then you only have to post the final
version.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
>>
>>>  
>>>  	amvdec_set_canvases(sess, canvas3, canvas4);
>>>  
>>>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
