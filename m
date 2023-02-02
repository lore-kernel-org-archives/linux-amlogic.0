Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C9C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91fr8vNJPf9mtbpWgwjHYfizfbKHvKNN/kzm3hAetzY=; b=lrz3KTt3XNn+SH
	R9urC4EHjKek1IukCnkyXsiUAh6kmlqEadvAKgAQ5b4gGb5I+DEfPCYNWg002U/0x3dx6h8GkMkoK
	7bVi7krapRnu2n0zJIZAbqBsU9uSQpItos+16rwggXCY+XpU7qf5WXLzfF31zPe/Lkbn0wvgzMhNZ
	DiGK+DQfdR2AUwj3CV3PHZ8diHaYgRy5RZhze5AIWpxDEzuPQ+w9GaIyCgqhQFYjJZGxeDSBd1vSI
	BydRYrXQMz10TZaUnS3+P+EhnrwoYt2fIDS8drM61dPQaEDFYcJumVCGviAocZuw/8Q3a27DXEE5m
	QAgfwTmIYT+IDjvmVufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYfv-00FmoD-8r; Thu, 02 Feb 2023 12:26:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYfs-00Fmlo-EU
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 12:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675340801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+u8VFxD7A4IUSzsKSNfKdOYZFxseMRQ9PUPTVzHGxo=;
	b=ZihNjJSnprqeVtRsSQnslXL5+snFCek505vmtOwZGmZiSLzOT2DlNS+gEyCC5fVs1fUEQa
	baz+Kwtz4My1ZqfIpzgQeVkdOsAjl1lEEx9ths2jBFJO7iffzisi6lPz9SU6TdpSjjFnae
	uy5z1gEPn/zU2OLqpeae/iTNosugVNY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-gN8slsGIOCCa5cL3u_Ntfw-1; Thu, 02 Feb 2023 07:26:40 -0500
X-MC-Unique: gN8slsGIOCCa5cL3u_Ntfw-1
Received: by mail-qt1-f197.google.com with SMTP id l3-20020a05622a174300b003b9b6101f65so859547qtk.11
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 04:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+u8VFxD7A4IUSzsKSNfKdOYZFxseMRQ9PUPTVzHGxo=;
        b=co4V+0hBwX2aSWv3nwFzxPZ4orPLTT58f/U2SzCeEaWkmByilSown8u+E4++pzg6eg
         TYLbNsmmJj4BAWc1hUhk40+vUrfkqHz7MCuP/viWP4gWysvoVfgRp9rMaFuG/18/Invf
         zc/WR2ECVE+k7j4MlrMU2pnHISdS+mC23nTxNncScVK+iOMr8hoIzRB8dohz+GMtMEn8
         G/2IbQoUADYNAHqmfBPAlwcIv/Jj5DEQ0nlnCCfnkC+61R1Nf0YBVEdZ96OfyXix23MO
         McxQeHvqP5vXoK6M3ynZ7aV5vmuI0d+cRzTDVATiIufZzlDvPqITsFVZcoDHgYZ+FkA3
         fSyA==
X-Gm-Message-State: AO0yUKUm8zQdClldCLM0GvlF9S5Cf/EDGMUfciJw44GnnInfEkQ3ijsq
	fjoqzTHROU1FouOoQCB7kG3XdpZeQ1VhjbTGgAJrVkZUKN2C/VVlxr9WNiR8EYvQfwtQjsSNhV2
	SXNUp2Rwd/OTG1nN+woAb0IbDcGIrMLQ=
X-Received: by 2002:ac8:7fc3:0:b0:3b6:35cb:b944 with SMTP id b3-20020ac87fc3000000b003b635cbb944mr10825570qtk.2.1675340799872;
        Thu, 02 Feb 2023 04:26:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9bQ7bVnPTqGd+Gqz4c6owsIHZmePFnDh7PI2yagwN/Wh/3IHDjxpyr3/Byx6/CP33Ao4BxLQ==
X-Received: by 2002:ac8:7fc3:0:b0:3b6:35cb:b944 with SMTP id b3-20020ac87fc3000000b003b635cbb944mr10825435qtk.2.1675340798800;
        Thu, 02 Feb 2023 04:26:38 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-28.dyn.eolo.it. [146.241.113.28])
        by smtp.gmail.com with ESMTPSA id b25-20020ac844d9000000b003b82cb8748dsm11178885qto.96.2023.02.02.04.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:26:38 -0800 (PST)
Message-ID: <037f01ade9686fc213bbf3b2d04d90bbc786ea08.camel@redhat.com>
Subject: Re: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
From: Paolo Abeni <pabeni@redhat.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>,  Kevin Hao <haokexin@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King - ARM Linux
 <linux@armlinux.org.uk>, David Miller <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>,  "ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Chris Healy <cphealy@gmail.com>
Date: Thu, 02 Feb 2023 13:26:34 +0100
In-Reply-To: <83e1e852-303b-2460-9034-ce1f91445f47@gmail.com>
References: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
	 <20230131215528.7a791a54@kernel.org> <Y9pfBpoZ4cezf6Bb@pek-khao-d2>
	 <20230201210754.143357c5@kernel.org>
	 <83e1e852-303b-2460-9034-ce1f91445f47@gmail.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_042644_584333_37BF539F 
X-CRM114-Status: GOOD (  14.04  )
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

On Thu, 2023-02-02 at 07:30 +0100, Heiner Kallweit wrote:
> On 02.02.2023 06:07, Jakub Kicinski wrote:
> > On Wed, 1 Feb 2023 20:45:58 +0800 Kevin Hao wrote:
> > > The "Fixes" tag is used to specify the commit causing regression
> > > instead of patch prerequisite.
> > 
> > Indeed, what's the tag for the commit where the problem can be first
> > observed? All the way back to:
> > 
> > Fixes: 7334b3e47aee ("net: phy: Add Meson GXL Internal PHY driver")
> > 
> > ?
> 
> The issue popped up with:
> d853d145ea3e ("net: phy: add an option to disable EEE advertisement")
> 
> This commit added MMD register access to the generic configuration
> path in phylib.

Please post a v2 with an update Fixes tag, and ev, referencing the pre-
requisite  in the the commit message itself, thanks!

Paolo


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
