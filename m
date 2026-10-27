Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7C0606A321
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DL3og0WH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wfqs9PNd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i+PzTuHxZC09uHKR9y+QNJg5Yk7C0sPxlMjTHi74Cgk=; b=DL3og0WHRSYMOSZ3EZofSq/bBA
	tkxMmsT8BiPHuu7mqNF8wkr1VvrgYqgdoFHFC6xghk5xszUhwosrXPgrnfrV2C6O7r/IOdKQX28B1
	xsvS+APEc6cRphMONK8EQzaRGjjlNkXVkT1Ko9R4jtqLwz3mj28YiduWPy5gDEEIedDUdrYioFNnk
	ffAY6DBOY6s+ruaKifo7UhV+dEQI4EP6cjsYeODMr6e85mZs6n5oRp+zfoxFZsJoQQv18WA54Lr4n
	q2HudvMUHbBVelVxyUITmznGaJpaf9JAIYru7fJgAxYJElJ0EV92gERH5kASQjxWB1LiqWEw7/lHP
	kuAiz4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLksF-00000005SEO-0RhI;
	Tue, 27 Oct 2026 17:22:11 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLksD-00000005SDH-0R9S
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 17:22:10 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-157fe9d771bso60517c88.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 10:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121727; cv=none;
        d=google.com; s=arc-20260327;
        b=LPpoqo1cXOujKT2O8RQPBZ9TmCv/zA2yfw0EQDUvwPJlKXaoOfXOEdEB8HaTvyZhbw
         yP1sUhYvDVTl7btX5Kf3OPLZtsahdrWm1GIz9NL40iHeT9POwmBV72yCLmAZK+pIK2Gf
         r0dyYVw6qY4zJTtVE3tDciDSedIV3xNjMyocMlurBq9zQg2SmFB+caWHZZTam7X+TB2g
         iV4SGeV070KMadxEH8Pfq/rNj3T/T+gKtuXV12zdD/BNN2W/zKJK3TEmVkVRhMindHuB
         GSvpE/Old5qDx+T/DOqkJ/Sn0qNlPiv5aoF2NIoDPOYj0F52G5NguFMc+f7ZaqwFJQ2Z
         cfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        fh=jqHvVqCWi+chaE1P4M1kI21FvWTrwkrDjD33JwZhYZw=;
        b=knVlp5n/EezH1WHNPOLKyFSp8U8E3hgxcuyDIHMjt2Y2guAJmXcNhmL9MTeq7CJ+1r
         wy0hBqZXyuzyNzqkuenwze51xjPZwow7g/bRJRHLxv7FOES8yGKikZbptjbYrIT+4j/F
         xflZO8PXS19OIzTUUaIFCitEHZDoQCkcMUUQCwsFvr+qaF2usFzcZO+rb8bgftgL/zbb
         VNTkJjYiic7ln/Gmy+WtMVssEqMZDplVec5z0mOMf6hQN3T7zabIWAWc4p9oyuicKz3S
         RPEEh2tePuS7loUGGSGtX9lJdCM0RQe3k2Rp9pFnd6gMsQ+zCoMF+Dd5TRzH5tyUzeZx
         baVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793121727; x=1793726527; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=Wfqs9PNdjEoBwO8NNfSA/G7pyLZFZxA3cCs2RCadE3+B9lT6PZ6/XM1YxlN3K1qViC
         LfiIOnzORETCP2uGOW2nJFcNwNewHuBgGNmcLAb+vkzP5/BOY+ko/ZipIUbgAsD8mUhO
         UMgC2Htb0pSyaCU/h5b9yUdzkxDOBRSjbMHCdiVsEj5fqdqtvkVs+ZI8fIcjIPCD1x8B
         rZtuVxS8TjVpb/lLLFxfnJ1QT7vQaGYIwn2QVhJHCtrJGN5q1UBBi72p/P920/fyMZVa
         CGz9JRz3jC5WaRtXebBm0taqe7PgTB/z8RCzdWk6eXpPGg2cmKpb91QupvXDzDyKzy7s
         VwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121727; x=1793726527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=z5BkIkSbH3j0dH1zxkU3c6U5wv0eEwq+ouKT5fGRL9tpUHGGRfy1TAE1BpBC/NGFtx
         rkRfRVrvYLyjT2jTaLDSd+p7aChb7bt0oPuXJ3UbInfNDZZSqnqjKKl9zbpqRb7gXgRY
         bKK4QxsNZoMbCePzp2zlB9VxAF7exwOEO4vKNIqmPhukqpy2Cye1voirM9iyZAZL0t+U
         Kw4C+WUWigMYhVrsQt8JbDC6+GuC6sriQ+2DLb0NzfFV8JOkDWk5GltlT2I55HqHJA9d
         NMAbIUMGS4+4n8CcJzQzfx9efAYz5coI421I+DMRlT0Xd200dtbT4xMndlWkk1zq+yT3
         5wpg==
X-Forwarded-Encrypted: i=1; AKwUvByfbKNowgL2IhTWFR714okV3o17KxVHQEz9HCttqscesWkVPxfHqpFElmmaqQMRo21oATTqLJ0/pdl2cS4C@lists.infradead.org
X-Gm-Message-State: AFq9FYIYdLjn0dYrzE1j98jO79NNgn8qRYO7JzQq+9DAJb7rAsR/ka6b
	BFEYQnLy4HPtI6aJKqZHONI+ImKUQEmtqWx+Th1e2zX1snq1zaL9g75JDnhY3CbY2LXp3U/rUWr
	Y5vICGm7MTrGuZx5/b7t3ljAniSYD67Nwr8XjVzS9
X-Gm-Gg: AYBFou38v8vZGQT6oywRk43UefLIWTWMHpikunYkrGIBYRJ1/iXYjQwJ0AV1/+CA9tQ
	NXSO+fk/oi/7Bjh4YOAZOxhEf3M3lLt7eshIo0U5OQyspPaZVJfUMeoww1yog1UN60YnQ1PB7sn
	ZU5rubFLcdk+XtgUNLzpPf6VRXb0kuMZEk0B8DDNGbwYzZAd+Jas8cGCK2JxwXQoAwsO93hREwP
	1Ada1xvPKcok7zDRG84SvNWtqmAXnC60eEoWhyBkXws7vaImLQxVsHietbfwBiH9l5YOszXR0nd
	eaX3Cc+2ZVWGXYUo+v5yU7/L7ypMQ5GTq5AmNcPbtHwBfOFgoUv83JG2F4GD6HY8I1UueiRZ3Vu
	tv59IY8Pf9LKS4r7++iQUNaIxVAGe8Yj5favUrHby+4JSw/RjehKhJjj+LWhMkL82CLVYWA2cGC
	EGD7Q7BaUcX7g=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id
 a92af1059eb24-199363a356emr13049111c88.17.1793121726447; Tue, 27 Oct 2026
 10:22:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-10-zoone.rupert@gmail.com> <auDNzWMPy0VQcazt@ashevche-desk.local>
In-Reply-To: <auDNzWMPy0VQcazt@ashevche-desk.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 18:21:29 +0100
X-Gm-Features: AclHuK8orvmEUb-f7W0Au_t0jJZW6yeRJKoPRMRQ-D7ejg8oB9UAKvhykKBG7IM
Message-ID: <CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Lechner <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, 
	Jagath Jog J <jagathjog1996@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_102209_149212_99A73B91 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 17:14, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:
> > All of drivers/iio now builds without context analysis warnings, so
> > enable it in every Makefile that builds objects, replacing the entry
> > for dps310 alone.
>
> ...
>
> > +++ b/drivers/iio/Makefile
>
> > +CONTEXT_ANALYSIS := y
>
> Can we reduce the churn to only adding it here and do some magic to propagate
> this recursively, please? I truly believe it's feasible to achieve.

Should be:

subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
