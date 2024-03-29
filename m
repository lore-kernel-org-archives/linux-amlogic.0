Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADB4C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pezxv/HJ95fLEofaKbIulu/BbINDBcucaG182CIi/iE=; b=SA6OGdM244zz6I
	Otge/GXayDMEiqWDBPDfifW9D0YVvXvWorzmGMQskw3GmC6a7CfYdj232Y3wOqAe3wYwO8TcXSoYy
	FGnO8V5PpMRdZtkheSUOKbedy1MfFkewL4/oXxKAO6EOS2pHd6xYlnA0Nu6Z7MVyMfMrP3JGp1tDU
	h/4qsVUC5efQIlMx7gud62MVNHuTbNvM1+f3e/g7G6+4xP6i/zBoiTN6WAAuaFNCzCGgP3chDWROI
	SZiWRwykMvcfVkh7WIJAd8/IT+6zHQwLnLmuqbStONsj8ubyOBNMpj4evHjcvdU0ywn7V6R7L7b7X
	A2cHmETjplSPOn12WUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqANp-00000000BZj-44tO;
	Fri, 29 Mar 2024 11:26:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqANm-00000000BYq-0eXc
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 11:26:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41553f150b9so490895e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711711606; x=1712316406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urQSR8k9rOH+nEhJnDB+ssPUq+9+ZuEfluly8f2j41M=;
        b=vFmytnIpr+L7NLvdOSC03rzokMspI84iVXhXLSU82mr9ha+tks1sKvlppcBhn6z/oc
         iIni1eKT+mBilvjxY9asDP7dUPmeHboSNjVHOrUoOiHLLvvpiY4vUwfsU8H22nJGIH/2
         2taXh1EyXVrsY9jo2Pn8dj+uDSXWDah4mTOnu1iHBvFtg80lzef5n581y3lipGJcjGHC
         /0afSEp02jNGCoc0FXRQi9IvwdnVg1WnJl/KgXQm2CfI35eftkhMZxuXKdfl9Wgla+pD
         vCy6SCMl0zRPhz+IMtV72ZXsFBgSlf62/0EMDi/Ctl5y0iWyy747vXQO/TfyTFwWW+RJ
         v4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711711606; x=1712316406;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urQSR8k9rOH+nEhJnDB+ssPUq+9+ZuEfluly8f2j41M=;
        b=JFPqVE42Av79V179vj0b6p3BAhK4rzHgizqve+7rqWtZyPWvuEI4df10hiVqIYDIYS
         p9XXxR0eqNhL0qX2HaO9Cj6iswIPjOLFxWUNZSPDJKqSyM7xpeSmoq/dQjZNDNEQeJEf
         ZHO0iy0gybV37HViAD4SEbDgdBayFH43BSQi63Msfda1HeOwrh8zlDpkQhf8gTtLy0By
         4gFJCk0sPJnhNdd6ZF8jFXqeXRkJ8S/n82BcTslft2j9Fcpbrt2dEk1XaPnwJvImz0f0
         ARB/0bX7WAn+SIBScuVKGbvjaaQIVmNm0aNLabycpWc06Z6ndhJTQGRxHlR4BOQ2nvlJ
         cXGw==
X-Forwarded-Encrypted: i=1; AJvYcCWWgAoXxEXrsnhMOUQjX6HmKr6to5WkbEcxe0b3KjFYvqzKz2ketM5aPNVDB2x+A7LuutWAhEnsvJnHNa+U6UI+cuMPO+D83lkHJF+r+t1dBEE=
X-Gm-Message-State: AOJu0YxIjkmO4lRnRZQVUSzp8DpzFi6EIoy8EIILJj5Mg44UXhnwoj1m
	PYUUcFiCl1SkHydtYbDogU25ot2mFpIYfflDjnGw53R/+jjZDDfC+9S7ZJal5P0=
X-Google-Smtp-Source: AGHT+IEsa3l7CpsgPVX8Rgmc/Uh9bBz2bb8jJuVTT5cPVRLshmDQEunujRnG/h9yH8ptoWIh5fCf+w==
X-Received: by 2002:a05:600c:1c84:b0:414:8e39:7331 with SMTP id k4-20020a05600c1c8400b004148e397331mr1836350wms.3.1711711606499;
        Fri, 29 Mar 2024 04:26:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f8f5:63d4:de5b:e4de])
        by smtp.googlemail.com with ESMTPSA id k33-20020a05600c1ca100b0041409cabb39sm8227448wms.18.2024.03.29.04.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:26:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, mturquette@baylibre.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, sboyd@kernel.org, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@salutedevices.com, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240328195733.30572-1-ddrokosov@salutedevices.com>
References: <20240328195733.30572-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v1] clk: meson: pll: print out pll name when unable to
 lock it
Message-Id: <171171160568.1289725.2666199134517231048.b4-ty@baylibre.com>
Date: Fri, 29 Mar 2024 12:26:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_042650_321056_54351B03 
X-CRM114-Status: UNSURE (   3.94  )
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

Applied to clk-meson (v6.10/drivers), thanks!

[1/1] clk: meson: pll: print out pll name when unable to lock it
      https://github.com/BayLibre/clk-meson/commit/16182ac30a68

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
