Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9EEC5B572
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 21:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbPDB0R7JadjUCHzECFwDuwiPy/HL3bUzAJqNbfIOjs=; b=OlJ/7PpydvXiv4
	APkhOXLfLHtshUa4RUewRqFRiYxTD8gXdHQ+HP+2XeiCt9/NbBDS+75JlpVOLz2xpxkjI+JnFEncs
	iXGX4k19f850D8xOJf22vB+627N3pBtNYABYXKODs6zJDErprHSGNpa8twbwy9l7HamTUnUSk78XU
	u/UomsdS+/aItYSbljnhuX3J8HwgrXULbs5MMvY3pCw0TWmMBHrYYed137G1lnm+utIZeVRZOX9Pt
	2YoYNVLFfyAUnn85ZF6TpNGinMaEf1fIsphxWCn74xQ1uJyPDn7AuB0QsWjhwQHdReZfNGVibg6YV
	bY+9GOtxo0MWHbIGM48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnjt-0000000AYeD-47IP;
	Wed, 19 Aug 2026 21:22:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnjr-0000000AYdd-1gtx
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 21:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
	b=RE5VTG3KPs1CYT5imkvkp6vZdKRrbnBSpA99awsj15XAUnSTMvSgPjZg2P7e7ei5ndfG1T
	9+diIQLTiSsn5UJjnh890Z6HsNkO6yk3HpJA0OoKcMR4bVKvlKTrQb3tuaROdXv6nQ7YHO
	jc+nS1zS7YC3e87KaxNrFc/BGMwpL80=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-i2yJ2OcbMn-rUzDTcw2bTQ-1; Wed, 19 Aug 2026 17:22:21 -0400
X-MC-Unique: i2yJ2OcbMn-rUzDTcw2bTQ-1
X-Mimecast-MFC-AGG-ID: i2yJ2OcbMn-rUzDTcw2bTQ_1787174540
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so28054561cf.3
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174540; x=1787779340;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
        b=dGTI48XfZVM9pHjSC0GtQ2oATPAsGqPiyE5wTemrbmLTfrMS+CvGyVYe42/ii+kH3y
         znOVAPkKsb+g5e7CGerccW5ZQGSm+kpdeVetghy7feML3htNSwZWDg5hSE7F9Sy3kCwi
         k32TuB/XuQPNmu3t7sImhgRI4fmNJdThc3+yJ+8jnShXPDCx+pRx5t5T9l/5e8j2kQ6f
         7wr4pBRiX4YHczCyEJ+t4tj7nhU14LNoPT4Za86lcSznVV+4E1oExeIkU3jqFIc6NIlK
         4sg3pb4rjmOlmBMQ0aWiGutZm85sSyGXlsF4mI4IY9McEdZfAGYvvUSR5P2wQzfvKv6t
         2UgA==
X-Forwarded-Encrypted: i=1; AHgh+RpRA7AmrlNKZBEQuoVjNyaLZ8nph3SPQh7wyAyVtiS36U5X0qe4uRPnEehAY1boB4gdY1yfQaXgRPi5XRAs@lists.infradead.org
X-Gm-Message-State: AOJu0YyuLx8mjW1VmzvoLeh20D1VN+hQ4MpEpIHwcKPV/DMfWcglC55n
	BZuG758qeHtSKCrPADv4CLfSGyQLjn6e2ZyCi4d68Wxh57BDkQFUxrFj7yA/qiC9zOzRcWo1/dy
	N+DIBtE7kSTz2e9LbH7eGA96yum886HgbTRTQBeS2DqUMcthG10gPWlcuS43Bpvkyoou4edR8
X-Gm-Gg: AR+sD10NTqtETfMfsl3sC+QPt5DMMczBOwcDDH6B44FEMK+ubJ5WNTwb9rVipXM+SYY
	lEv8Zdese/dBTe9+hS5MabSI+MTGs9pii0g3RGc465CA9Go63wTmwCu9Aq5peWPqLrLcLzX1hcu
	nnMfK+ou+VdfFLkg1ROSQVbuZZzvwcffl6CKf8xpBgPK0a9bQHzhLgMomxHx+pU5l3o+NXwQht8
	f1rlVr9PgjA+wju1uRrc6Nmh9Vbrv2WvSQHGkYb3rSKmOlZhSvce1ALZaQYVy9D7dMwne1qJJg2
	SpOOf/dnp/Qw7+0Fmg+2no4pu8tvv17dBjR/1GQiKMnRdL2aAj0G8q3xhpN/X+g60TUpjyv0goI
	JIYPXVxtJXZGlXp0I3t7JiVjceSIAgVuQybw=
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71525011cf.42.1787174540398;
        Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71524431cf.42.1787174539914;
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b36fsm18734791cf.5.2026.08.19.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeifWtRNoksCoR@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UWJywUzOedTc6SxUzWoJkrjhCVYANk7v9iqizmx7Dmg_1787174540
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142223_517790_A5D75DBE 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
