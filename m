Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98227CAC59A
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Sep 2025 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdKwzheW4ZhkL8QUh5L/qwCPCU5YwjmiudEk337eS8w=; b=ByKLSBqnAuXzjl
	p+x/HYwfY6BWmhBgUCbLEztBmnO30cJ2v5wcHVt0YG6FQT2E8Yz7aoc8tI26jS85TAZJRaWLXb4Xc
	5mWW7Vd2fdm0/7ipHnzx3jVARRCdIfjWi6lr93PQ4Q9+gqjqWId/T8JNN8i0h/qbR4ZMD5jE+/vPK
	wR2nL5XDmVLgdtAOjd4iz8Y1P0zPE2tPHFLojmmfxhhBSCpUINQvSc7Sao0GFYhI8241YylZ9EQuS
	r3qitwuGdJLX3qGIztgqLIIz+G9ntUMb4dszEfnjf9ZBVgez0JiGpHd3Qhiollc4GXKZwkC1xzM7M
	7uxqNpqPg2znHaXunmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXme-00000002RoH-1NSm;
	Fri, 19 Sep 2025 09:52:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXma-00000002Rml-1inq
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Sep 2025 09:52:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45ed646b656so18747705e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Sep 2025 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758275518; x=1758880318; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90CkRn6xqgCSuiiGN92fWBGlZyLVs9LUFtpS7VvzMZc=;
        b=NWtYE16ATr0x7i4NkhUJdetur9p/JNnsIo90GY/uQpsCriAtq4sCyBjc/TU630yJIV
         FL2SmSrtNscQsF1RJKmfVATeF/KUnoiRWe/Mzp3dv+nmEtsBlrvXqvLpJxpICAqxh2M+
         4pXX5tGOc5Pqg6+xK5ISghQVd9GCwxPsVvR/oiZ3fjTu/Extv3toowmkfUNgv5kPvcIT
         wmM490NQWWRUDGj0BTvLDyUqCRKzzbyghncVEb3QgyRL6biPo/EzDH0/qnYH//bFfzFn
         f7L17X4mXNHu35hkYY0E+AEU2eUjrQqNHufYxmNg4aDHjP8s1N7Vl2qdkbx90JqeYu9s
         IPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275518; x=1758880318;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90CkRn6xqgCSuiiGN92fWBGlZyLVs9LUFtpS7VvzMZc=;
        b=PQKLB+ufgKVbE7U3/MHhgkXb/fCkcT5IN1gL0RRFXsj07KRi5wrZugPPKWMIC2nW/Z
         ZLb4EWQqIqlaf+u/ynRChPAwmjhGV2LwMNtf7KKiiscnd8z4rDr2+AFYpU30TAdJNBtk
         EJeu4jGh9IWEx6PmtxjWuK9XCqLwwKQAvioURkxSlx5E3SI2KhxveGMjeQM8nACjTdJg
         07PhARmMcKxUzkFJ1smU9sil0vzefEUUeqLIQDX80QnovTaQ4mlnHvMMYFsuaY6wiRMf
         7XVhdB9EZAcIQR1Z3mPIr+Wgw8dOIBQ0z2bVV1PRE46RJFdddGNJUIIz/Epuh8BvaHr1
         KMzA==
X-Gm-Message-State: AOJu0YwQO9wCYbbLASrHHS97wMmw6xLGt4xngq0lSpKN/zZyl0KnW5NE
	q7p7X6lw1EBzNubRcY5FxVHBpiC8uMpgDTxFhUUWVXqJtU3kcP9Y2YI7o9/yWqSDwVE=
X-Gm-Gg: ASbGncsiHsa3IfVmt84xZ4flQdaK08qbDr0MlERd8sRD2+o6EZWpyNTdMx+J5CNTg6Q
	umqI+18l+YUhvxhq6ceVR2pJsy2boZ6oTMUI1/nRSYZyTQnUpcDfm07dB7LeNLPSEL4pRoougG5
	4kANgLA5eVfiNonlNanVXDzNd/Yd6rMh7I5m2LK2PV34DRR3DYsqw66aHrYywP13zVnI4np2He6
	cjm7weG2o3qH/mwdtsEYbepUrFR/GeUgDwEIFaIBmg1wOMBql0aY/DiOfLaMYZhUdGzFSr4S10Y
	b0GUyUMp0WiyGzas35XMKlIh3IEl+3z7GCV9xZhqKRvfWrqOozkKA+uTn7HjcEzkzY1YYKR5eGS
	8J20bOBW7BKtjue5/7YMZgg==
X-Google-Smtp-Source: AGHT+IFtlGAsHLcjZynA2Pl/WGYGGhzPYoDKnmB8DJOFmQEH6caueLqOVqd3kXjvCLiXRfFUr0z5eQ==
X-Received: by 2002:a05:600c:4f11:b0:45f:27fb:8017 with SMTP id 5b1f17b1804b1-468a10cd520mr18422985e9.5.1758275518279;
        Fri, 19 Sep 2025 02:51:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:636b:57f6:8727:48bb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f320e2000sm81272685e9.1.2025.09.19.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:51:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Chuan Liu
 <chuan.liu@amlogic.com>
Subject: Re: [PATCH] clk: amlogic: fix recent code refactoring
In-Reply-To: <20250918160601.3286872-1-m.szyprowski@samsung.com> (Marek
	Szyprowski's message of "Thu, 18 Sep 2025 18:06:01 +0200")
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com>
	<20250918160601.3286872-1-m.szyprowski@samsung.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Sep 2025 11:51:57 +0200
Message-ID: <1jqzw26a82.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_025200_688694_A62E87C6 
X-CRM114-Status: UNSURE (   8.97  )
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

On Thu 18 Sep 2025 at 18:06, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> refactored some internals in the g12a meson clock driver. Unfortunately
> it introduced a bug in the clock init data, which results in the
> following kernel panic:
>
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:

Thanks a lot for the early testing Marek.
I had no g12b with me to check

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Stephen, would you mind picking this up directly please ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
