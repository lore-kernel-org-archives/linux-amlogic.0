Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170C606A31D
	for <linux-amlogic@archiver.kernel.org>; Sat, 31 Oct 2026 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a973IMQN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4X7Q7N+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IwgwaKFceGolAzVLJI4gmZH9VzibF4lb7ZjILo8g+fo=; b=a973IMQNm1gIw9yXfvk0pet4XQ
	0VvLdij8WgzeCEQ8/y8kcHHGYSpvJ/tA48Z4NkpCYAwWUGo/XOmpByqye99FInJtJ+lCDmx8AS4FB
	TbxMa3hN/mBN0WW2YL0+nMHNfaV3uY0HjT2KZbKgKa6Y3o/u1t1LZIHo/IBrYsqovf0g2vhup40L3
	/RGUbKsgP38iJ4eFUDC9zqt52Gc99LGgUVH0tcYrIu2t63keQN/yGOqKrhQT7+dF0mIuJp/9z0aBi
	0Ta3awhzYGZyfxldIYhY6k/GEeYhMN6qfxncaAEVPXNI6iHkYUFQ7589Kz+5rS6HLTa6kh5KAuAvl
	0qAZgSXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNHfy-0000000Dj1D-2Ylf;
	Sat, 31 Oct 2026 22:35:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNHfx-0000000Dj14-19ua;
	Sat, 31 Oct 2026 22:35:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5382437C6;
	Sat, 31 Oct 2026 22:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F4B1F000C1;
	Sat, 31 Oct 2026 22:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793486147;
	bh=nzQRvCwaYXmtasavKNUZak9W/WcvebGkCSju9XOd+Dk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K4X7Q7N+2GrsDpipIbbihb9skWxgDHXW7LjI7/ryzpj50cqC2lv8Gxo487TdmeH6c
	 9i1RGrSHAc+96kcRxwPRnHL6oRrmpx0vdbI1O1c7GSSzq1zoOeHMqdAafdsSFriJ9a
	 +fZmXrJ7LQ1lYPALpEOdXOS0pPqquUgDpkBA/ZR+xgQTMPfCaqDvTDPHEVa1tZCBHo
	 ZTUvZdoMXq05ic41AAJL63ns1nv1zfjGKr1gptVSoV5VnP4S9zqBEYKu88uwCAufu/
	 yOfyaCi9MoVC/1vlT+pkUF+hsaugr8UwjmJnf2/4pNJ78SypTuqnFLxQqkAHzDaf2p
	 lAbt3CrFhcxXQ==
Date: Sat, 31 Oct 2026 22:35:37 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Rupesh Majhi
 <zoone.rupert@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, Andy
 Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, David
 Lechner <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>,
 Jagath Jog J <jagathjog1996@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jinseob Kim <kimjinseob88@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Remi Buisson
 <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
Message-ID: <20261031223537.1e1c5ad2@jic23-hlaptop>
In-Reply-To: <CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
	<20261027124954.110697-10-zoone.rupert@gmail.com>
	<auDNzWMPy0VQcazt@ashevche-desk.local>
	<CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 18:21:29 +0100
Marco Elver <elver@google.com> wrote:

> On Tue, 27 Oct 2026 at 17:14, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:  
> > > All of drivers/iio now builds without context analysis warnings, so
> > > enable it in every Makefile that builds objects, replacing the entry
> > > for dps310 alone.  
> >
> > ...
> >  
> > > +++ b/drivers/iio/Makefile  
> >  
> > > +CONTEXT_ANALYSIS := y  
> >
> > Can we reduce the churn to only adding it here and do some magic to propagate
> > this recursively, please? I truly believe it's feasible to achieve.  
> 
> Should be:
> 
> subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)

Nice. If nothing else comes up requiring a v5. I'll tweak the
last patch to just do this whilst applying.

Will leave these on the list for a few more days but I
just gave them a spin and they seem to be working well.

Thanks,

Jonathan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
