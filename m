Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74CBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Mar 2022 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49v2d8A/Bb4xCXNjwWddCWJinqWW3X/5ECFDt5Q+BG4=; b=vMTpyz4JlJ0hoc
	rh2JBnLWs7djJGm+XtH0kI61VGQJF2p1/hdbCET1tBKp4hi9JqzcS4PUdoRB2HL84mN/Rmi9t1mYS
	pORuV7SFY+htfrW7+tAHdJPWcJaP/D4trNqmTSbOq4GP5vUknf92wKgCImqqUKnD3gVtA3HI5NzKe
	GxycTohJRkUUF53MFMCRxxdEIEv3LHMdOWsVyCVGxrUh4ZUL+VQVwvZaNBIqz9IsC9ZpSsytpYFyt
	BFaBfo4ZKjDn1dOgigYNgXgAX/XUiKjpzKm5d5CifmEAkZmGgzuQPkSVDIKeNK9UIEe+U8xxcJoD0
	sGND4atJoUFS0zQDcNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYw7i-00A6Zi-Pz; Mon, 28 Mar 2022 20:37:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYw7e-00A6Xo-VR
 for linux-amlogic@lists.infradead.org; Mon, 28 Mar 2022 20:37:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id i11so4430356plg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Mar 2022 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ftOkaLxffUNn0UIvFFh85pkRel4UoC8QUOBNdj53Afs=;
 b=CMKKR3lFgackfgTVVWESREwEUx3E+WL7J+TqfQNMRECiHz71yj/VeH6JyZYk0NyDhB
 vToP+xlnxA+ZmPYrusmxo9mH+CT2sh54WumswxVGETHc5hOC70yn6vIL+tl34Pla5K9J
 UN73/vaQJ3lQBFWlX45mH1p1lBRPThJeb2Lp9ZTteOUkLjj591CSWSNdmuU+LnB5lCmU
 4ELWEWErqKVc4wX3Jl1eaa7VO8RIMfZLO1+r6SZA875hDgJTQIsCtExjdExUlVgi3Qtf
 oIn5Hbb5LqIrQPOfcznXNOuCZcEMeSRhuAopNt3mAZR1y9YhzlR8HpVqNBncZSoNoeJD
 9szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ftOkaLxffUNn0UIvFFh85pkRel4UoC8QUOBNdj53Afs=;
 b=c3N+grHPha0BOmZeaUyvPNMwLceheFyneXV6tHkh0j34Jq205LfxgkOuZllCUFVauh
 ReYDVg8wa2YstbaTRBCqnhULMhyCu69rpZhCuFl50WLHqp0UP/60G6Uff8hbh4p/F3eo
 z0Pr6Tndo10Qli7j1j/7vwvexEmm2XXdM5ZamyoZBzsZxw048cDGeQ3crSAytwdggcYe
 nhTlr0TpTZNEJ10/12wZ+uNI+htDFAAGot2hkS6d/s+bjiD6ytg0UvdGPV3GhxfAMxCd
 MfW7kI/9JjR1iha23ctrZcHSYj1CzaKW+LWfJkE2Clv8mj5+xDRhG2tYW2F+5kG8Ejon
 zIjA==
X-Gm-Message-State: AOAM531rxvuG22yY8/RwIMWNcpFKZmpDaUv8XqZ2CViTOBtMjCqkw8Mu
 2C8vtIgsi7kEtw9c0cxfxctJNg==
X-Google-Smtp-Source: ABdhPJzbfjVSjIhRJrOwAxFCzWkGeHwmUnsNPA04svo6SzEJbPLyKsboopfOVOQ9GMFz58BrWkcXQw==
X-Received: by 2002:a17:90b:1d0e:b0:1c9:b74e:494 with SMTP id
 on14-20020a17090b1d0e00b001c9b74e0494mr921905pjb.238.1648499873342; 
 Mon, 28 Mar 2022 13:37:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 k137-20020a633d8f000000b0039800918b00sm10033798pga.77.2022.03.28.13.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 13:37:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lucas Tanure <tanure@linux.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Lucas
 Tanure <tanure@linux.com>
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
Date: Mon, 28 Mar 2022 13:37:52 -0700
Message-ID: <7hee2lu82n.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_133755_117614_C7D847A4 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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

Hi Lucas,

Lucas Tanure <tanure@linux.com> writes:

> The default duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL clock.
>
> So, for 100Khz or less, use 50%H/50%L duty cycle, and
> for the clock above 100Khz, use 40%H/60%L duty cycle.
> That ensures the low period of SCL is always more than
> the minimum required by the specs at any given frequency.

Thanks for the fixes!

This is going to affect all SoCs, so ould you please summarize how your
changes were tested, and on which SoCs & boards?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
