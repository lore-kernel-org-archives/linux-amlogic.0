Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84209C5DF81
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9UqOY8VrMCmkGmdJakfDwc0ynNSoolNZxhed1x9DJI=; b=j72QLooDyeUYJb
	xWv3TVpamBTN6BPVLLg7L8NVCvNuTrtLmb+NWeD3VHQKBM43Slks32fFveRgLUonSzMCEbvzO1M3d
	w2ONbuL06fYvduhkhNLGtoAxl6PLqccpZxvC72dkvfoNhPEDEg1jD1tV/j/DzTYSwxaC3NwZu6jdH
	NHAdZ1c9QFCV0TeT+2q0dZ/4Q5J/JrxM65jdEz54qBz9eAHKCGJXO3ksj3Byhu7hQ5aGE6fH4X3+g
	caYAxiLhMYCQq4GvxhpVtEtCcZig02lwvyCdpSWVNI3xOmXfEAi/81aEeOaYm/JCBiVGflclyLzIU
	qVlHlGgDfzq77XqbqEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnkJ-0000000AYld-1Fc5;
	Wed, 19 Aug 2026 21:22:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnkF-0000000AYk9-2DhR
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 21:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
	b=FvuNhPZTAZ2PK28rYi8GxEQfyEKF0XI1qEUvdUQXbGT4vGPnWyxOxCJTq3st7qU6ez8wBL
	Hnln3RsYuhExec2GI9L8GVKKpx/JWuZrcHYgDyjH0HTTNnq5FIUM9RTti6SkZZ798JqbnQ
	m1QZhgcU/W9olbrWcXVkV4pZhLgHlug=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-niVOYqxVMaeyQEWZtINkNg-1; Wed, 19 Aug 2026 17:22:45 -0400
X-MC-Unique: niVOYqxVMaeyQEWZtINkNg-1
X-Mimecast-MFC-AGG-ID: niVOYqxVMaeyQEWZtINkNg_1787174564
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90a60102d6eso16759186d6.3
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Aug 2026 14:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174564; x=1787779364;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
        b=eFrQ1M3cgKqYfpT1KaiPZdD6LvqBAtg3HmAyXYAdfhWjlfeRhlX2XpisuQuwBhVoly
         SSVFbVPz2ckYM8AUYcTcaslglFjYFaXoOKrZ5agdNvaZPsKtsfm5902mQkJ/xpB/cwrK
         03BOnbhzdZKJsjWoFJ4a4jXw8RnROqVuepbsox2bnXR8s6r/5ohnDGh6XX+Rr7o2gU0U
         riqLY++JOnIVHcxiyNfIyU3UwKtW25p0PpwaGdl7YzDC7tDbQvbw8NGl8+6rzFnTqn19
         Zu9Dfifu1jGlKXbNVhdIOuWre/THnSp0ksUOlCQCBVcEStdvkru2KnAE2XrN5tm6u1CX
         prfA==
X-Forwarded-Encrypted: i=1; AHgh+RrXsJUrGpe97NfbzdOf11Gd+8PyeiAxFGeLARYLbL8W5C2xNa00GI5JiuOwINPNU4+xQgp14X2mMcLxSuxK@lists.infradead.org
X-Gm-Message-State: AFuF++lCj9HQ2wHEbgFQFDKNo7qO57ljD0j2xDfqwWxbvzLQdl8QkKQe
	NGh8+emWW8GgRNFo4UV/pfSP5PHx6ZoZ0+EbS8f0BmOIT0wdTdrIht8xAhuPmErvSQRPrPW1cMF
	EJzh9z825NxffD1IWeX8dUrRlS45NmhztunudzuITdsJd6lV+1nmjx9h+chnLRooFas/sLI5p
X-Gm-Gg: AR+sD13VbeblFSf8beKR/Lq045IUZp7uX71xuPK/lqWXzlmUNTNK5/2pklKudPvZUdt
	rLFRlhd7ckZs6mJ20fDib8tgT2LpEvvn+hZvEUb0Wb/N64cJOPSMFl1FFSwlFiz+ug6RrSVIgRy
	4YCTFi9SYgYskreDIh3Jed9C/yUSMNfPqv9zKD2muyZh5laQ0whRwLJXNw3zFLdeiMJ22uqetd3
	NNO97WTS78kEGct4lDCdbMiSCYbyfczy/mSgiFYLmaHhSbPBWs/tTzKKyUgqMJX5EMGm64IGQIv
	9Myp+selcP8/YeUsksKts1BhzvrZi488nIRDjeUmQYUKCwtOEVSmeTmIYIkGhvtZFMCmYCEbaTD
	KmOergnTwlXBHV9aoU9Iv6fBXluiuSfTaYcM=
X-Received: by 2002:ad4:5dcd:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c5eaabae3mr79736336d6.23.1787174564246;
        Wed, 19 Aug 2026 14:22:44 -0700 (PDT)
X-Received: by 2002:ad4:5dcd:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c5eaabae3mr79735276d6.23.1787174563736;
        Wed, 19 Aug 2026 14:22:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eee16e0sm23636866d6.17.2026.08.19.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:43 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:41 -0400
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
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
Message-ID: <aoYeoSnvf5-l69lE@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S4vndrA9xf3KN6IeeMkFle411eEctPGEfPcFPOci9sY_1787174564
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142247_634551_C7F8FA1E 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Aug 19, 2026 at 09:05:18PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> adf4377_clk_register() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 60e5448ddbec2dc2 ("iio: frequency: adf4377: add clk provider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
