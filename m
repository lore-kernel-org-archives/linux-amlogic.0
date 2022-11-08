Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0929C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Nov 2022 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEiLkgxFrw8NlivU6L68HAdKcFS8pnzD0QDQAlNBCpk=; b=iL8dBkj0ne5wVt
	EPcBTdvWajpS51x7PLULD5FcS0bsvr1Ba78Q0fSRfWdCDphAOxS+PLnd96xoOnTQvlMEiXmhPvgY0
	lhaDltwFnNOkLwOyRJ0R4yBmcVboLCr9KkyhtFF+imQEm8xwEi5C+NNe64YTmy2qhtslPaU97xgYN
	8TNEWZhqfiYXUyd8X+LhGng+xkim+/+fz33BfWPOvEVcREtUKAIOlbq1wOYFFGGJMOwdheYd13uom
	gXWgquDT5z1Oewp87+BinoTMNFPcy+RB4sGhc2U6Js7hr3MJi+WtdLnNbKW/rhGqWajohhiUlWM9R
	e7438DoL1/o7tgRZDmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJgp-003ZYR-Qd; Tue, 08 Nov 2022 08:10:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJgk-003ZUi-Se; Tue, 08 Nov 2022 08:10:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id k8so19712411wrh.1;
        Tue, 08 Nov 2022 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4QtVwIE3iZ0eHUBerHEnwY8Oj652LtFgZcRYLE4Yt4=;
        b=DkgSIIBu+pZGOaqX8BayQHmLJe8c/9VaQWRuMrnAyGSf4M4P1Ut5+8SUUcU9m9I7zb
         zuP/tqO/wSuU3QlJrg0wtSqMtZMDKNpURwmCwLIBEwm/yj6LjGUdPeh4aNhFE00IkKkj
         be6mIbgXgLyF09oyq76hHVG/XfxG3rPOvTyRaNG6LcUJlgl6QxRKCyMflID9josFKbCZ
         pBgNd4pujg5xyUvyZjC+dvnbWmEOrqbP6dI7Jz4kqApMpJNVk74kncPP5tiz0AOSCqR8
         FjaJeNxg80RGj977KQbeXdarNhLnDEBAgBs6ZcAh02fckQT8/GhiEXsscSGhcIul6C0o
         jHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4QtVwIE3iZ0eHUBerHEnwY8Oj652LtFgZcRYLE4Yt4=;
        b=s7o6LfpcdnXFhzmdRBoJa0anvJvjbwlka2gqlaRAUOlyuUTJ8xqtNB6bJw7AblJrHX
         aDu29iNRPfSuaieZgx2+ISL5j9dDrQQ0h1ClGOgg6W7YKSGR3TDuh9GHFy5YQUrxOUZJ
         UoPexMdiaj0jN/4aQpchhdZrXJEBbwZhnDKFXJarTv9I/d0ltoVmWgfKiaU/zxxf9jDY
         elP0ez7VZIlVdYttlSkL73IN21dqm5GKlySzPdyKxzFYDKv8fOebW1uawt0PWkUMjs+U
         vRN6NrbEKSml0ks+6KAmKXURu+99eMN1Y0hrExzocsMTwLAhi0nOjvF3fNopizSh+xk4
         iQyw==
X-Gm-Message-State: ACrzQf3lxdsEwRN4MKKX0ERIyzqUg4uWb82xBz2loDPLlNggXsqyp93P
	tbt99euHhDPwqyh40TDcEzo=
X-Google-Smtp-Source: AMsMyM4kUvDPIy5Y848LkhbCiK8D3HDVHquXnAcIQWaFpwuBVc2yEvuVjN5j8IAtFHnVw1tRkghoLg==
X-Received: by 2002:a5d:5c0f:0:b0:236:c429:361a with SMTP id cc15-20020a5d5c0f000000b00236c429361amr30800977wrb.475.1667895024558;
        Tue, 08 Nov 2022 00:10:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b0023662245d3csm9451993wru.95.2022.11.08.00.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 00:10:24 -0800 (PST)
Date: Tue, 8 Nov 2022 11:10:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Deepak R Varma <drv@mailo.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y2oO7fU4whKr+3hb@kadam>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_001030_950169_135488A5 
X-CRM114-Status: GOOD (  23.03  )
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

On Mon, Nov 07, 2022 at 06:29:30PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 06/11/2022 11:52, Deepak R Varma wrote:
> > Greetings to all.
> > My name is Deepak R Varma and I was part of the recent Outreachy internship
> > round. I learned during this program that patches for the media drivers were
> > prohibited to be included in the Outreachy effort due to lack of bandwidth for
> > the maintainers to respond on those.
> > 
> > The Outreachy round is now over but I am continuing to work on code improvement
> > and changes. I would like to know if it is okay for me to now identify
> > opportunities in the media drivers and send patch proposal for your kind
> > consideration. I intend to send couple of Coccinelle identified code
> > improvements as patches.
> > 
> > Please let me know.
> 
> I won't say no but since the media maintainers will need to apply them,
> the problem is the same.

Yeah.  Me either.  Those rules are for Outreachy so they don't apply to
anyone else, but at the same time no one is going to Ack your patches
without seeing them and especially for a subsystem they don't maintain.

I always try to think about if maintainers will want my patches.  Like
I sometimes see people returning -1 instead of -ENOMEM but, you know,
unless it reaches user space it's not technically a bug.  You can't go
around fixing everyone's bad taste.  But everyone likes bug fixes.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
