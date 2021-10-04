Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83995C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4256C61381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4256C61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mod4mKUQK9bLGY36kAuYChwefghlKZhRr5VByTfO9lw=; b=x9nW23i2dAf1hS
	L8EJ1+h4whJc4fCWICwQxJczWLJdnl7TjFi4PdNYJoGNJt7TRTjgf7mea1xCrZmJVC6LnrG2HTCCA
	y5tOnyqgcOKjPNcZWkhSTDohXGIBhNN4eyvsfmoFfCDEeM39TCy23Se2SByNfKPxfZJ57rIDjNSqe
	OTV0eqymtncmFhXc9Eas/+sEpTSmxYaxQftvBWV5UgxoEIaP2XfUShp6dPcLVxlhjXBgL0+XPa59B
	9lKoEVVq29Qik7r13dfWnlyMllpukU7t1aFaH8cZIs7MhwQ90NWB0j4p0DK8yQRLIOYxJ0Fg9cRCg
	PhSvYnL7gch97sC0Sa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXRTr-007Iba-EO; Mon, 04 Oct 2021 17:10:23 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXRTQ-007ISm-F8
 for linux-amlogic@lists.infradead.org; Mon, 04 Oct 2021 17:09:59 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so22451636otq.7
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Oct 2021 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LT/usi9lkR3sxtPUnMf6oj+ko7WPUt1cJEJz7aELEAo=;
 b=jNuv2yE4UDv7zGbLnC2X1DrfpOfR8QizEEldj8AquaCs840VPybNgrzpOcTJLOxZLL
 gev/rFYMXb3z+cFMG6ii2ghnm6O5QaqVbwHJ9llCxcDBtjFYNZQarwwXHbWXYCHN6ElC
 LTZhRUcdXejtslpouNHiBUSt7haJ+D4guB3wPz3eC+UJRz5wzpauSt6uk5f21oRdO4YA
 oLgI0rBXgfVhMNMMq7js8RUgKXxEU6X5J7FXA6mQ4Jk+3NkiK5+VXJUlW+CUeKGASXga
 rM+viVi03SyWBRKqsI5+OpK4VTNZmXAqDoZljKbJocM9KUOuzl0zuUiiFQlBzvA/VN59
 ps/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LT/usi9lkR3sxtPUnMf6oj+ko7WPUt1cJEJz7aELEAo=;
 b=lMTBdBmQeuWz/g3kOek12kaN1jGV/zF3g4HQRxel36oc/3om2iXEWrz49pVLzvjDTR
 eZG3ix2EBZeJhbz3ba1HXRjygt/7bNkm+NWvm5kFT/UYWtamkqQ3UZBMVzJLODOMhInO
 8FtaRD38ZLX5+FKhm6sra9+Og9n8rKxN/i1cV9U8DC+1HJGYGwV1vpBJ0HquRZ6rmK2b
 vAPhW5StvcAiAqXBLFugf3TzC0LH3A3Q/42BVIqqvdaA5BXuS7SMRj4F1SheEdnKhj1m
 Bw/xPKKazL8TVoDtXsaD94uR22Iy8y5fM83OygA8CfxDbuLhY6MLx2zqe0beTf5zeqIa
 2iVg==
X-Gm-Message-State: AOAM531yL9Jo1lo2OwpMldkkj3mCYqigxtIaaPFFeGLvNU936Uh3cVwT
 treecrrlAdTixLK9TJ91oENcyg==
X-Google-Smtp-Source: ABdhPJzEmh/NKBdy8hoxnATcd8pF8gWRDODmc1r6BgMBZmL6hXXJa1N0WCnzDsSXHlXfIOtJrhfxgQ==
X-Received: by 2002:a9d:604:: with SMTP id 4mr10538659otn.204.1633367394493;
 Mon, 04 Oct 2021 10:09:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id f2sm2822824oia.44.2021.10.04.10.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:09:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-remoteproc@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: (subset) [PATCH] remoteproc: meson-mx-ao-arc: fix a bit test
Date: Mon,  4 Oct 2021 12:09:53 -0500
Message-Id: <163336738469.343640.8547254698960330092.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004105257.GA27301@kili>
References: <20211004105257.GA27301@kili>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_100956_540166_B657D1AF 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, 4 Oct 2021 13:52:57 +0300, Dan Carpenter wrote:
> The MESON_AO_RPROC_SRAM_USABLE_BITS macro is used like this:
> 
>         if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
>                 dev_err(dev, "SRAM address contains unusable bits\n");
> 
> The problem is that "->sram_pa" is type phys_addr_t which is potentially
> 64 bits.  That means the MESON_AO_RPROC_SRAM_USABLE_BITS macro needs to
> be a 64 bit type as well to ensure that high 32 bits are cleared.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: meson-mx-ao-arc: fix a bit test
      commit: faf88ed1c083017d1f4478f45c4f375e7a3f8bdc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
