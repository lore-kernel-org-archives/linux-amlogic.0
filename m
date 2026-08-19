Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC74EC5DF81
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 21:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xo8ErG8MT8A18KPhT+Vjl0VQVnNllcee0RvnJD7ABKU=; b=TEkSxLKYvoa3sB
	f+WQj2878ejJoNoJaS6jVbKRT4g5opb+V4G/0c+fK1V19Y4Bew669HMoPp95LGm96GQYg7jQ2BbLW
	PToPkzCEhwy8E8KVQAI4h2UvxOSvNbsrD0W7Z1iJQ52AXo/zJ4Hqi7cgdwUAVS7NKipb4fvSCqL+S
	iY4nPCMreYmQtW08Fj0pPjOCHL7mArHH9ygQCpgYTLoa7pLpj2iwHHR2h+IRSDMp+pFdGHIJipPfO
	GlU2oHQ5A+xTt3F8XkoWUCpMmKxE+LDsmX5jPE1619qQ5D7ACbx4sHbX6sosJxzBvHIfG7swvLTNa
	6BTUI2BkA3iKj/4hlieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnir-0000000AYQS-2mhO;
	Wed, 19 Aug 2026 21:21:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnip-0000000AYPg-04L6
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 21:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
	b=gNDEQ7Yj7uPQ54t5/YSnKU7vgJwKAHpBXumRH1iQZseluqtnzlzCLtu64c6Gi3enIHvEV1
	ymfY+tGbZzsyTrv0CbiJKGboMlUxQUaZbTEsyq3u7M6gcbbT/j4awdTZC5UBoninSuImsy
	Va4d+9j0CYSrGldwqsjkI0+2ULIKTAM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-JatGR-OwMxGTH9nGntplJg-1; Wed, 19 Aug 2026 17:21:14 -0400
X-MC-Unique: JatGR-OwMxGTH9nGntplJg-1
X-Mimecast-MFC-AGG-ID: JatGR-OwMxGTH9nGntplJg_1787174474
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9372b9db132so22103385a.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Aug 2026 14:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174474; x=1787779274;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
        b=jYHkTTzm3Fc/YLVjmBQ6kPXrxZTwYabIvPW+hvdi6J10GiARirQWgMKFPorfJY8E/v
         aFxk79d8LNgeh25tgbgY17L6WQfTmCKLw/jErnyAqD4554HnZ/OPuZ0vBa5J4wIkdQeo
         HiIP8SyQW0rFPTsYr6jzevi6GIBFaSb04X+Qcnp2qUItH83DJpeW84kn0iTa31TDKbhl
         7Y4a+n7iZ+pCS/fjvX5BCEmsCZoOHIT3+mCRWFst4iGqnQyE/EEzVEjlml6jWdxERyUE
         /qe6IWs9YUnTYbnxv+adBfr0Hryliw40tzSfEkAfgOTK/QNHJcqnfwNpbOpMxwSxPfR5
         B3qw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/FVwK7Er9cdrxzos45+eCh+AeJQ713PsXtygXV3zrKNsiB7mhyH/hQ69TECZmfdRGSsYBt7HzBgJHy2dP@lists.infradead.org
X-Gm-Message-State: AOJu0YywLhllHFv2KyvCBoEy0D718Y2alBxWJPQFATaFJutAIaJZ0T+q
	++2qEyWtY2V0/4FU2l2dR+Bn03kAWwztLRBMFpSmqj4G8DFi2UPF6ZkfxEgj1lyGwLOS6Me2/kY
	jDmJPYzP8ds9xnFH1QA+Un6Xptd/ZPw75cnnGYCXJGKZikgd89YzJFYRrBvMuybNYRqr5NWqj
X-Gm-Gg: AR+sD11op0Gojj/3WvABHervm4rjOh9+xghW7kLOOUJ0aT0ZWdyR+ADUJlJWU+3nQgb
	w96Kx9dGe++E1VNvxDFFs3O8M9e7MQZNpfiPgvxTcG88S8MerDsQE/JEzWK5DP490LFBsvzXZZz
	MF5RZOou66WAzW9TLOkPwIuF1nXKtsjCLA/dRolD0q40bhWJLeW1LJjAQNg+Qb5ocbKcOa+BIBS
	AfVBBgTXCEr43556GaXeXD4rWK2qHjq6c4wBptdxVqme7i91Ojlw+F/PzPo0VFPYKHHFKbLArH3
	kKxkYeFIh2xoMmj8C9wlhr5seErSApOcog4EUt5HGKQaEFlvmeYyHEgzRTxjOGzzVg9TgmVRZxa
	T+/ov1IrMLN1rIsZ8DK6j9fYRfLn8sWWnedM=
X-Received: by 2002:a05:620a:6010:b0:937:139d:592c with SMTP id af79cd13be357-9371e67ddfemr822212085a.38.1787174473979;
        Wed, 19 Aug 2026 14:21:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:937:139d:592c with SMTP id af79cd13be357-9371e67ddfemr822206085a.38.1787174473413;
        Wed, 19 Aug 2026 14:21:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720582980sm222991885a.33.2026.08.19.14.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:21:12 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:21:10 -0400
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
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully
 initialized
Message-ID: <aoYeRqwY3SSZ2xDX@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cl4XSulnEZqfbZiaXeL2KcSfDqIxm8vVQ-hwO3UaF08_1787174474
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142119_137469_FA934384 
X-CRM114-Status: GOOD (  14.06  )
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

On Wed, Aug 19, 2026 at 09:05:15PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> _register_mux() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 667f420c09f1417c ("clk: ti: mux: resolve parent clocks by DT index, not by name")
> Closes: https://lore.kernel.org/CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
