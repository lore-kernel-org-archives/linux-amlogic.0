Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C5CA1013
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJGzBBkke2GcOtfjK+ZeqmTyZsC1vywKtwxYRsOrjoM=; b=o2Hf3AFm39HAd9
	3imkVSWkUaRGK7ml8/jsAc7cSpRy0mTKOLUTY+dMsbTRlIO8fq91X8f1cbzygovrn/MyE3Jr/XEGH
	2hmZ8sJN65UxB9fc4870Y6QMoYjcTu/3fywGHrw+SwNOhoRngDZqK+eWKfxUwyK3lQd+pu8JIj2QT
	akbyXyg7pAOClWSL6nqEdFuiv0nDoDmgZKeoZbr7WSWsrV+3XYtgMjDsROU56ef2QIV9XWdVVNFkz
	lrEctGDnBrKw6VZ6UO3a4Ygqa7PzTno1IPbF58sW8+eMviWVaYoQpPlq8IcspjLOxmBAUixy8LPWQ
	jrPeItppbNCywgzY83pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG2U-0000000E5IS-3mTf;
	Thu, 04 Sep 2025 19:54:34 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCcm-0000000Cnb8-02gb
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 16:15:49 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71d603b60cbso11680327b3.1
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757002547; x=1757607347; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uo0RISLwmkgLCYh2IN11pINVWBVogTF0MXL6fRzX8kM=;
        b=f190ykHtJz6EfRr91T9VW1prlWLdyV61JFPP2cFr77bwGKMgP34cohBoUOpX56Utym
         VklKstsMOBRGqhhOv+WFsgABQ0pN3ZjiN8gdyyd4YQrmrbi3DUGJGJZ9gflf3D4ZuhYY
         RIah1Gn5mvnRGf0XDo0ZMxs2MRSihYEd8MGSuDEAZpt+vua1rQUZ68WsAAuc4L9KHwuS
         f8vx7SPg29WGTwBHvJ1K16TS+40MJiigtk5DzxuOx5s9TMBSZTYOit5mso3IgupGe3vU
         ZYfhdWAe/SFHb5B4RkB5GaMK3dJt7Q84MskOiOj4TNAPMoskKIymxFJXK1KEWH2MqQxf
         3hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757002547; x=1757607347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uo0RISLwmkgLCYh2IN11pINVWBVogTF0MXL6fRzX8kM=;
        b=GVIPJBPIzbmbvSrYsFTHJAq5kisv/68K2FJoKC17HKERp1SI05HlzgFfUw+YW25UM6
         685LqvawN5oz3av0W07JqwKyGFqiUagmh3Ht8wgnp1ybB3O5+ZaXIHwcpA7W+PhZ/g2y
         47/RaejGCvqi0wx6WwYG4O931sliFQcEiBH87EXB2wcBGUJonQZB0pzxSZA+3qTIDCRU
         fbrQWC8F45oUmrinP8F7C1aeED04u1SI8WXVLZfKyYLY2NUsQ3nNzUmMVZEgIGipAraX
         qllzvAAIprLZkEZnenhdSWwojAuqsOCIlF5qlGlz2rgzDizaHL+hba/AKyBz2sQIKITb
         ++Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWrQuYI2FOKUfxhiFt95EetoN32XbUbdfFFhBXtOtQ38vSXpS3JGx07udM2pxTNoN1gHUgD5aexV1m6YULO@lists.infradead.org
X-Gm-Message-State: AOJu0YxYDaoJGjvZh/aVVeSfZa30YlmC7QmTtlrcSN6ioPBC8yMWkbM7
	gRiAG7VBt70zm7GRTPMnjzUN9c8dwjY6W4VVyQaMW9rljd+uSNkSzQloXb3/S5MvLgSx+Q6gktE
	nYJYf0ohHhsFOWzQ6dRg2FXk5oK31TohF2C9idqEFCQ==
X-Gm-Gg: ASbGncvwjjjdFVbPqs/uV+SoN9fsxyrIVS2f8035PwVUGv4XI0X8m9FvIbWVd7GNnRr
	l3kSty47pkYPWCCSA1krm5i1d47ZhPMCU6/XnHIwLjqzBE9Dc2G49ZphBfGhRwo36lKOTL/B3ov
	96Kwl3jRDuiMSAu6/vxUnEEb0GiRaS3JiYFzt9YfLw8bAkBcbxL8qLIHdkEBD+NyBqSIK+0Atux
	GsHutPk
X-Google-Smtp-Source: AGHT+IGSXAOQmOoToso0IfgUWvRUsTdb+WXo9AwnFjKjAqk7EZwQu7nr5DaxVSxNz2rwNfbQNvsp9DSe55yaj+5joiM=
X-Received: by 2002:a05:690c:3602:b0:71f:efa8:587a with SMTP id
 00721157ae682-7227656b2e1mr198475327b3.44.1757002546924; Thu, 04 Sep 2025
 09:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
 <20250822-pm-s6-s7-s7d-v1-1-82e3f3aff327@amlogic.com> <cce649b1-511b-4895-84be-2c85e748cfa8@kernel.org>
In-Reply-To: <cce649b1-511b-4895-84be-2c85e748cfa8@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Sep 2025 18:15:10 +0200
X-Gm-Features: Ac12FXzPPHOEhHKW5z-O62jRJm47PZ-fsc3O4NGHgJmoH8G2XEru5vbAJkJqx1g
Message-ID: <CAPDyKFrE8CafoKDkdHQKf=yxJjNcJUu9vFrpAASQYXhtUg6cVA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: power: add Amlogic S6 S7 S7D power domains
To: xianwei.zhao@amlogic.com, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_091548_051795_1D51C1F9 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, 4 Sept 2025 at 13:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/08/2025 07:39, Xianwei Zhao via B4 Relay wrote:
> > From: "hongyu.chen1" <hongyu.chen1@amlogic.com>
> >
> > Add devicetree binding document and related header file for
> > Amlogic S6 S7 S7D secure power domains.
> >
> > Signed-off-by: hongyu.chen1 <hongyu.chen1@amlogic.com>
> > Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > ---
> >  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 +++
> >  include/dt-bindings/power/amlogic,s6-pwrc.h        | 29 ++++++++++++++++++++++
> >  include/dt-bindings/power/amlogic,s7-pwrc.h        | 20 +++++++++++++++
> >  include/dt-bindings/power/amlogic,s7d-pwrc.h       | 27 ++++++++++++++++++++
> >  4 files changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> > index 15d74138baa3..12b71688dd34 100644
> > --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> > +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> > @@ -24,6 +24,9 @@ properties:
> >        - amlogic,a5-pwrc
> >        - amlogic,c3-pwrc
> >        - amlogic,t7-pwrc
> > +      - amlogic,s6-pwrc
> > +      - amlogic,s7-pwrc
> > +      - amlogic,s7d-pwrc
>
>
> If there is going to be new version:
> Please keep alphabetical order.

I have just applied this, so please send a fixup patch on-top.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
