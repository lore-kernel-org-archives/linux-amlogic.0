Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B65C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Nov 2022 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRpH5iP0X/fvwUCdX7V0QUEzot9FwyZR0+0XMMgph2g=; b=KqA+K7b37Mfl74
	8SbGFRkyLjKX6HLShUf+6UujdaMd2XKAj78axW/oTTFZI/qAcoL8ATuBwz8IyQgC3svwtjGlf1SRa
	Ue7StTT2C0sbrJJ4b58KjlD/jvUp3FZZd2PBVCBag8YwE+rXkkfC2Qgarr/mBZPu8Lqs7ZEpv0aGO
	PqIHsN9x5SafJHK7QDul4x4e6HKJNJIaHe2smseQmhAxhCqoyXe7yykEnrFypbp5AiCngrR6A+a0l
	z1QGciIXT55QS2k7r4O3prAT6ncE6rxHa4aMXLjWEAblnQJGwbkB5lwDmTFkFBfRsALwbpvvaSz0I
	+aA3/47Z2Z1dW0iGNH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otXZ4-00H78S-D5; Fri, 11 Nov 2022 17:11:38 +0000
Received: from msg-4.mailo.com ([213.182.54.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otXZ0-00H73r-IQ; Fri, 11 Nov 2022 17:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1668186674; bh=1RIQ/IkEDUmv9IHs9QgFqfOSQHFRaOMUNJ4hAer8V7U=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=i7Ych6tATqnDt3txDGmf4tl2aOt6j5CZYTlZdYNIJWf5jIb9uQuKygWkgFAfZdqt/
	 pYrneCIpfWlMV9VzuVz1ZdUqjO5895K1q/RDvnlQak9uzy2G+RuZRW4GNIOXG9pjr+
	 /MEslRNG8FbBCpBUn7yCQyVWVglS7ckWx9LuL6Ws=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Fri, 11 Nov 2022 18:11:14 +0100 (CET)
X-EA-Auth: V+drH4vY8UWXrgfnZZR7Hc2mA9wgmxew3GLoFUFYAmzIxO1+7Zdb/tpLl6NXQrz5gJPwo7XaSp0gWCF9ff8cCxjJDfF2L6q4
Date: Fri, 11 Nov 2022 22:41:03 +0530
From: Deepak R Varma <drv@mailo.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dan Carpenter <error27@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y26CJ9L52AmPBQYC@qemulion>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <Y2q7tFF7YeX16H20@lunn.ch>
 <Y2tLZaPSUT45TF4f@qemulion>
 <Y2uv56k515cKTXU4@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2uv56k515cKTXU4@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_091134_764383_D177EE66 
X-CRM114-Status: GOOD (  12.70  )
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

On Wed, Nov 09, 2022 at 02:49:27PM +0100, Andrew Lunn wrote:
> On Wed, Nov 09, 2022 at 12:10:37PM +0530, Deepak R Varma wrote:
> > On Tue, Nov 08, 2022 at 09:27:32PM +0100, Andrew Lunn wrote:
>
> Staging drivers for network tend to be USB dongles for WiFi. Some of
> those drivers need throwing away and starting again, others need less
> work. If you are interested in that, i would suggest asking on
> linux-wireless@vger.kernel.org.
>
> Another option might be pi433? The problem with that is, i don't know
> how it fits into the rest of the network stack? Could it maybe fit
> under ieee802154? Or is it just unique and needs to do its own thing?

Hello Andrew,
I looked at the pi433 driver and it appears to be a good starting point. I have
started studying more about the hardware, the RF technology etc. There is a TODO
file with reasonable challenges.

Thank you for the recommendation.

Have a nice weekend!
./drv

>
>       Andrew
>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
