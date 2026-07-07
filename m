Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798A0C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrL6981GxDQkGyxy/mHnKzZMCrlAtnLKDuEgQvByx1A=; b=AbKMca0sKOPr67
	0eKrCgTlEf0X2Hs3ClOJxkBXRZ/RCxWD+1XPpikLL+mR7Xz2fJHQVMyfxPpOBbtiOj9oYl7YZv0Qq
	29O+8JxT8teVZvY83T3+lz5gquKDxswUeMlSihvlZmNAdgTp7nCqH6dLqzYsF/IUdrZp0NxLhg+bK
	8zYHNyLQL2B+2MnVHTO8elDGnyqO3a5HWimqqpplw6nCrbAgai+FDm2icwOno5+ZloWu8e0MAVf0g
	8k38NSOWWQhRd0b8R16SQ9QUgoTUpL1Swlc7uvushVuIGDhfMNtyf8qHQENKLRsx9/63Lo6VQz9AJ
	ZSDL5ICHvIX4G05cMxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgup1-0000000DtEE-0Q0q;
	Tue, 07 Jul 2026 01:42:03 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguoy-0000000DtDV-1uD9
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 01:42:01 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-80c8c9ae040so37812877b3.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 18:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388519; x=1783993319; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxSEXtq2OoVITHSnzD5ij/K70XiUpTHdNjgIOzqv/PQ=;
        b=SKya9JJ6YrdbWUgv3Mjm65ddD3/JwN8w44fwlja9TilMZUyYSGTlJYBCTGohpmyfBq
         lyr6V501B7IdWLSakVM5jDA16QApMSkdHA8hlk2HKa7KGgfORYnydcn+CI+OIR5cqTrU
         TyACZ9vPk1YYYxcCZBQS3ZKGoPmQM4Y5+dPSMo6aw/XFVdIhDA2UL5Kbx/2AaMWGGUg+
         M2cxqK0UhJq9ZVbzzY/akOX3D6gq6jyEK9JLNKmCWIKUG3U9/wKa+erPfxupcWcf/8p8
         LF1U/sdEQjrnx1/3n4HW4ytQusYsScwEU2NA6nhblbui3s5d5dZxmHeoi4nwDzxMciER
         3h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388519; x=1783993319;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxSEXtq2OoVITHSnzD5ij/K70XiUpTHdNjgIOzqv/PQ=;
        b=XIkNwGlNcmTO+ioa7bc9a7KRcF7+1dzl1vE3psO9JQuZrPp9dCuKHcZIPU/CVrabqN
         8qNbrbMn8XTQvwgSuLFJUt6JDNKZ9IB20Re2NXZcuOdj49il/xiA3DXejRHJDwE4OVIa
         65w6qcwHYD7/33FdSX4VrshgYgEZMqUdyRWkEgb0ab6swGXI0u1qPtaplJimEc7Q4GtH
         QtI57XD0AuU55Xsti0aJwR4e3V5wiTX5YXQHHKbr0jZDdXlqbaKD8SNKm2ebkThq3xXE
         Ulkj542U5DPkSn4XVrKfvrl1XTAXcXDUo8ZhNUdyDwlEEg4TSM2V+8HVFnJuYEWlPq+A
         mIQA==
X-Forwarded-Encrypted: i=1; AHgh+Rphy1rbYFZsGfI2rQaDjHRUHEYTLbVHMM0pmcO84pBPB/uCMIXE2AtkHICxtVDaPGFu5GLgj9zdmZG+agp7@lists.infradead.org
X-Gm-Message-State: AOJu0YygVmjaO3Y0GxQxagfCDJVwJT/1x262LE2vT+Nd0egzI+9QfQ7y
	FZkCMhzpScqmVBe+FyehJoWvgC0GcE4s8jBi/2VSgLDGOc6L6fDFT2zE
X-Gm-Gg: AfdE7cmNjH22SOVM3cQAwIvkXA8u6saOctpxxNS508RtxR4ITfl7mj91oEsuH/2iBxb
	A2SwfmmWzydmw9m2K+5R6BWGlG1JHTPXtu5NNuu5jGXyNL3hH9kY+76qoRmydTjNdY8OwilkkPq
	mmC4pFqnNLVTFIEIZvh5EyHl3Rttj6GASZaZc9CIW6PdgWjD+BR4TYs7ANj3TQczO0+dUtq0K3+
	Vy6OewqXthoKgWyZV0Ug1gCk1QuvIFpyCew15/iHjxPFiCUDDKb0xDgN78tIE5V5a3JrxWlqliD
	i5RRlN3DiWYFEHdbOQhK3WSm5fU4WOMnKibAuio3qsOGnjYe2TQGAZrrX5RmuOrDmh/O2YR+7V/
	grnnAHkCZyEbjFirQ/ym9eZ4857zrAy40jBPRSOovPhFzaNipT5PuYsBjnXa9zwCjL8St4yPvA/
	xsOG6WKpYpdCd59sgqjoi5L17qbFfRMyxkyCyxuSXejdVZuiiIxYrTTAxi4Ug4iw7MwfEekguKo
	K/Ql/1BXPEVzRh41Pe9u0uT4OC8yeSYG9dvEhbM
X-Received: by 2002:a05:690c:6011:b0:814:3d9f:c0a4 with SMTP id 00721157ae682-81be2d83024mr25576387b3.55.1783388519217;
        Mon, 06 Jul 2026 18:41:59 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af512e7sm64629477b3.24.2026.07.06.18.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 18:41:58 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 20:41:38 -0500
Message-Id: <DJRYGM1TBAY8.39KCXCXTQC5Z7@gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: <neil.armstrong@linaro.org>, <linux-amlogic@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707012424.1661733-1-ethantidmore06@gmail.com>
 <20260707013437.27DA61F000E9@smtp.kernel.org>
In-Reply-To: <20260707013437.27DA61F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_184200_586738_F3E8259B 
X-CRM114-Status: UNSURE (   8.05  )
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

On Mon Jul 6, 2026 at 8:34 PM CDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch modifies the error path to purportedly free the `aiu-formatter` resource by jumping to the `err` label, referencing commit 83b83024cdbfd. However, the `aiu-formatter` allocation and cleanup code (specifically `gx_formatter_create` and `gx_formatter_free`) does not exist in the codebase at this revision. The patch is a "ghost fix" attempting to resolve a resource leak for a feature that is missing in this tree.
> --

This bug exists in linux-next. The AI is using the mainline.

--
Thanks,
ET
https://github.com/sponsors/ethantidmore

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
