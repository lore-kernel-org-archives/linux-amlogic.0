Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833FAC43217
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Nov 2022 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdLfkIKFCeTYtq91q7uy101gjfs4GJFLneG3Na8LUcA=; b=YC2URKHNKU4Dvt
	xnw+N2eEUinonCTqBgoFzGWrOsPaYS8Ml+b8Szv7KRTS3OzuH4TRU7zkamccE4FeQdbHhoiMKYjIu
	1jg5cMIH/gOyRGMzMbRqtLmkAID5job+fwMQnvWCpYYOjl8b6ryVxVr3mdWzFhH3RdF9FZ09znmzW
	8bNl7EGQWFDkB+U4yhs+p1lEUzh6pY2afS4c4S89FC5GMHCK1N54obQ+Huk7P6O1jDaCcc18KgQ2P
	m2rG+wqsui+76pJvKGlsNteaZHF7QqoMMdrsLWVXlCkxzRfnZWYes+D4RpbsoRtwSeqFhry5JrUEV
	QfA2fY0IOAhtJ38UGHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osL1Y-0046Xa-MA; Tue, 08 Nov 2022 09:36:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osL1V-0046Vr-Gb; Tue, 08 Nov 2022 09:36:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE2F614B1;
	Tue,  8 Nov 2022 09:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D30C433D6;
	Tue,  8 Nov 2022 09:35:55 +0000 (UTC)
Message-ID: <bf7dc5f6-acf3-73f0-b73b-d5707152190b@xs4all.nl>
Date: Tue, 8 Nov 2022 10:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: patches for staging:media drivers
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org> <Y2oO7fU4whKr+3hb@kadam>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Y2oO7fU4whKr+3hb@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_013601_614687_B38210BE 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Deepak,

On 11/8/22 09:10, Dan Carpenter wrote:
> On Mon, Nov 07, 2022 at 06:29:30PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 06/11/2022 11:52, Deepak R Varma wrote:
>>> Greetings to all.
>>> My name is Deepak R Varma and I was part of the recent Outreachy internship
>>> round. I learned during this program that patches for the media drivers were
>>> prohibited to be included in the Outreachy effort due to lack of bandwidth for
>>> the maintainers to respond on those.
>>>
>>> The Outreachy round is now over but I am continuing to work on code improvement
>>> and changes. I would like to know if it is okay for me to now identify
>>> opportunities in the media drivers and send patch proposal for your kind
>>> consideration. I intend to send couple of Coccinelle identified code
>>> improvements as patches.
>>>
>>> Please let me know.
>>
>> I won't say no but since the media maintainers will need to apply them,
>> the problem is the same.
> 
> Yeah.  Me either.  Those rules are for Outreachy so they don't apply to
> anyone else, but at the same time no one is going to Ack your patches
> without seeing them and especially for a subsystem they don't maintain.
> 
> I always try to think about if maintainers will want my patches.  Like
> I sometimes see people returning -1 instead of -ENOMEM but, you know,
> unless it reaches user space it's not technically a bug.  You can't go
> around fixing everyone's bad taste.  But everyone likes bug fixes.
> 
> regards,
> dan carpenter
> 

I don't mind taking patches for media staging drivers as long as:

1) they are not for atomisp, and
2) they are not for deprecated drivers (drivers/staging/media/deprecated/)

Regards,

	Hans

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
