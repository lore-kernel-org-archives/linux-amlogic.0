Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4361606A325
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KyAn4R3j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUPf5e6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MtOOJ+Hj7ySkQiG5IDPQQd4W696dbqHrsYSOu8/eMlQ=; b=KyAn4R3jFOQP8tP2VBj3TohM+w
	V/wyGCidyx/aNW8nK1zi6bzZqzUqcIA2h/Y7Fv0L3oKy/8/gJ11P2HJ5tGXgWJgoP/FCCVbI6qrmG
	hnJKR3/p/47f/nhB+Bw5ZY1Y7GYarB5gjcvmKRVSOdyKnOG5UxG5IJ4UIGGla4omlp17bsqRo77qH
	ORSv/JuN4RFWE6M3pGGp/d015k3iANzhU4QLRH/2O3jGYM+wxRdwm+zY3/R2LFeXpD3zRQK4o93QR
	Wapf13+1+HY9gIms/ERdx87jfRaCW2qv0vSqZ6lwkpYWu+fIqySHze7/4797JZ6N9vxgGQxFVBHXy
	HalTTc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTGu-0000000E73v-2vEE;
	Sun, 01 Nov 2026 10:58:44 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTGr-0000000E728-0XW6
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 10:58:42 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso15523321fa.2
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530719; x=1794135519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=BUPf5e6YY9Z92eedD1jQs3gR8fNSza/Gy4uwKf62Xp8P6kx7nCp1RzB4h1UM8LicI3
         pTGAKV5etUIYMK9Zi1Ccph72Cckr0VNwSLLRFRRyi+I3LPrjTASuioIovgJ+TQ5/ZNxj
         umXWkrqWZrI1pIsxY/qi6zCc07h4s0COmC2DJ+LV7qtSuN0wUCz93xdJ8Ks4gdsje3oM
         LFeBgTmqMflZYL4ELPITZ9CU2VWRTX4KEI9VbWv7+Ir9PnSpPUl8MDF2VMqLbq0ThRIA
         C8X6ImbvX9tTQTsg3lKgfDDgrGvSLdcL53W16hZFDUEaxx9nIQoj+vd+Z5sDW4QhziWc
         nMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530719; x=1794135519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=rZGwDoOQw8MU7dOjMjWzNdvN3zs5qTmZYaj7OM8ijZzdxlTk1CSuTYZFWF8voEHy12
         mOg/3CuwY9nXPjzG3QDTK8gWW2pY7r7iP8UrCvCq8iUd5haDm02dI4FzGaPiIUHoftLC
         95Z92yCSh23iN+wtFh9sNtyIMUX1vGTURnk6aU6DsApz+Sz4ADqkjT1ZFzSoTbXgKwYC
         ErD/JYhDv/vtie6kX9bjBH/nUhwVyyPyqzfMCakbXPpYI+nQPqaKIBBXB79f3zRsoKAZ
         zMF13MMJyY0KgG2gwGrXcYVSNnuHN4grgp/cb385waudeQWyWbJFtqDXwk/RAmp60jzb
         6ClQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCE51mHTCrIZI1oaSWK4LvEgUj0ZtpBuTJ4mjh1YZV1bzYPDtItRmZnlQegl3ppdRlk1+ET+PVn+9QVAr6@lists.infradead.org
X-Gm-Message-State: AFq9FYLbP2q93xhqRXIPX/YX+dCJuGpIqzdAtQJ7FTunnGRc4KRg/D2Z
	AkL9dzBoWjcT2AJ/vGZU17kXUwwZo8i6PRRAHBLsa6Kqm+qW+hXwZCV4
X-Gm-Gg: AYBFou3IFZCzGmEFaMlhXDVAteGfkZX3RUkrsLv7BLKNpM2ClxVVcSwTQtmPz7FIMzO
	s5Pc6wc2ERabNqbPH74BQPtgTNbXp+dJKikAju5cLGSSSef7LBribU5d4BtcAnKhEfhDR/rUvT6
	NV+qXlFBtSpsHpeefSkUiXv47n6lYK5j3rXqEDGn3i+KpwIrPEOSmRkPE8hqA5R3Ev6NevfUe2H
	wbaia3I6UXRkiNtNxouBtUtOs7ondHjRqOHCAiQUqmsHtypS9NAvlj6dIDMagIPI0QNjICcr7XS
	IpWogbrqFnImGYTIiWkIagixiOn8PInr7nfrzHCmicR2shGJjpbJqsRf1qbArsfMsW6AEu/TlME
	OHtMVCjD5mYJMrhDLlPPZUvTa3IDBGoFuOxhzMbayhYaAr96mZ/c7JbUx0Lm1X+fKm7GF2Esod7
	rveDxe3wpakbqwtAW5N7dd3E/X4+ixeASTdrDIlLa6pd7xMRBNK4B7UipSERGkIxea/adyYBllz
	NaIFCx/+twzo6RbMja4XFtdvfsViVXjEYBQHSd117zFEsHY/vbxY/wQTNQJsuZ2834GF7D8iRHJ
	ujWT/ZfMfXNze/wmCSLrtA7+mK9JkIVxjEiQWtUNzGVXQKfQAGlTOw/Ac7oh+SabAuAkj6A03Tk
	p08iw3iw38CXjJu4FJfiygvv1qJ4igWU7/vtd3Q==
X-Received: by 2002:a05:651c:1474:b0:3ac:330c:518c with SMTP id 38308e7fff4ca-3acb7a827f8mr15638971fa.19.1793530718404;
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Received: from yantra.. (nekmmqtbv463r5fvgny-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5462:a993:5223:791e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf1b726sm16613131fa.32.2026.11.01.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Sun,  1 Nov 2026 12:58:32 +0200
Message-ID: <20261101105832.55605-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101033018.05897c08@jic23-hlaptop>
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261101033018.05897c08@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_025841_181833_52C00AE3 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 03:30:18 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Please take a look and check I didn't mess it up.

Diff is fine. Built drivers/iio with clang 23 allmodconfig: no
warnings, and a dropped unlock is still caught.

Subject line got lost though. It should be "iio: enable context
analysis for all drivers".

CONTEXT_ANALYSIS_dps310.o := y in pressure/Makefile can go now too.
I can send a follow-up.

Jinseob Kim's Tested-by didn't make it in:
https://lore.kernel.org/linux-iio/CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com/

Rupesh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
