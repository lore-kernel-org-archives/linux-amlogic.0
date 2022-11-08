Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82810C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Nov 2022 09:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j98xwuHbM8MhvL7sEvk92+21ko2HyRbqyDSWvj35QkM=; b=uPgSGN9LPrhzjZ
	effKCcjUM+EQ/Msppz2aCoKEv9LT9h2PnMS2OKM2Yx3cYyk1ActVpFhzOUk6iG/NIbPlXtWZVg4aJ
	uJ0d4GtUoZ5YmQM8oaw95PcrBeABe0ZSrvnA2jHOUvSNBz0Xh1ctB8HMYmsPxJYtGExOK7NBjwQI1
	BZPGyfWswTDCdzmBKdocD/lD7kRkB/BLq6SjAdEMf3zahuQiaRh6RlD+FwVUxEsElN1Nkj7WbriI/
	QJa4MKwh6DtV1TB3ECWfi6ryG505QHpaK7/xJFKRzimL5BSeqZA9fhqU6Oi7lhCR9TGF+F8InC8If
	tfLkQxujovrPtPEHh5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLBl-004CvV-A2; Tue, 08 Nov 2022 09:46:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLBi-004Cpz-Jj; Tue, 08 Nov 2022 09:46:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id bs21so20067042wrb.4;
        Tue, 08 Nov 2022 01:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5IgkeQmSxEG1HaPKm+nMukRSPWOYNkhN02jAR5oCCE=;
        b=hezLi6sT4lRvroGT/dZOxWO8QJQl7HtGGdEeklPbIsTUo5Ej1iJ7EAs3lPtSFluUuh
         E7PFq3+gd15YoXaGCWAU41s7C0LBWt0kd+4k+q/+k3PXqUZrQ5nSdGoy0NIa/eckmY+i
         A9gb5ebUP5yJFyjjBFeWNxbQbI31Qho8pZqoDsnicVQVIHihQZ5Fa76rWf5x3HqZgMn4
         78uUewQeRQBxQNNZCOybuGYxfwsLCldVjIRxCNf87ejoN1nDKujNJrEa6pVFYzj30h3L
         iICueYSj52+m0urr3vZVSldPzQ216KPiezqqE3s3Gc9gWaqqNWRIImJABL3AGRWcQADe
         srqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5IgkeQmSxEG1HaPKm+nMukRSPWOYNkhN02jAR5oCCE=;
        b=r/BT3RH9mLyi5NS1lhbJXI9LS4YW2xDwmshUs7vipawsnVUN68pvXyHwd3UPLmEXB4
         BG9ZbmFFQxLRnSZ54srUuZvQ3ePHS1hX1enA2zSsU0aqRHJtmOtOhHDBnXA23ODnyBSu
         KXiPFr5gJCJ+O/TU717ZoqM+Uj2R7OpRVRxOvhsAnbAxhTU0jzcO4E7lK6pAnA+gXrd7
         4MZ3ZlgoPHyCDWfykeeOJ+HNFSGZNUDmdN9/8i6mtwQcDbcuUFOPbN2oC2PxQrgKn/Tj
         C97/ALEFGU+zOXuzvSbOigrvFM5cpKuUfU2jCVOIv2sZ7YmqQIpiRmjI4weiZDKsCflB
         LyTQ==
X-Gm-Message-State: ACrzQf03gJ/EHlUZj9HRSNrQT5rKSA7GYY7/31C5T397nEmewRk0yxpz
	8RKljmdDhXly9xVAPAUs0Ds=
X-Google-Smtp-Source: AMsMyM5IZKYCnOmlHMEgK799dgzKIDWJt0m+zOxQXKffBaJo4gDQj8fc+whAJY8algsbapvM3hN5FA==
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id f17-20020adfe911000000b0023673b7e668mr34305141wrm.96.1667900789237;
        Tue, 08 Nov 2022 01:46:29 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a1c544f000000b003cf483ee8e0sm13565499wmi.24.2022.11.08.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 01:46:28 -0800 (PST)
Date: Tue, 8 Nov 2022 12:46:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Deepak R Varma <drv@mailo.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: patches for staging:media drivers
Message-ID: <Y2olcaNp3xkRRK7j@kadam>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <bf7dc5f6-acf3-73f0-b73b-d5707152190b@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf7dc5f6-acf3-73f0-b73b-d5707152190b@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_014634_671953_4C258D8F 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, Nov 08, 2022 at 10:35:54AM +0100, Hans Verkuil wrote:
> 
> I don't mind taking patches for media staging drivers as long as:
> 
> 1) they are not for atomisp, and
> 2) they are not for deprecated drivers (drivers/staging/media/deprecated/)
> 

This is unrelated but I somehow misread an email and thought we were
going to create a drivers/deprecated/ directory.  I still think that's a
good idea for future deprecated drivers.  We normally put them in
staging/ but it's not really the ideal place for them.

regards,
dan carpenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
