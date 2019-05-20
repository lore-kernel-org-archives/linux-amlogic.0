Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DE7C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD83206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MP4DIdly";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FxhqrGLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD83206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxSv3not3lnPOUIIJvdAmmk9PWVonGmCqjnKQ6UCIZs=; b=MP4DIdlyXv4+Ss
	N5yYTgbwQkUJYR9fkAV3lRXOaqvs0tMHXtJhTvM9AVcHEmskSTzUIlYTdhnbItiKtBven1p4hyVfZ
	8nItjXBaqBjuxcbJPOpr5SZcb97BBMVWHXDf3WZJdBn/Y/+5f2Z77QMVx6HfyFpqh1ocE8I5dcYub
	Ju3MCVLj4vThlqqIyPmZhKyWtitBtqdfaCmR853pFx8C6EJSKUAalZq08eE5gVSXga683axorK/2N
	hcFd03BcYwc9MvPpZWhfOXta75bfOiFeVGpOA1rLqo6nUwtngHcgryUAiTkXA06VKmvf5djvQQ/eE
	pcw7w+R8aIE6uuqcr8ZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmFN-0008EI-26; Mon, 20 May 2019 17:38:49 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmFH-0008Dz-Op
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 17:38:48 +0000
Received: by mail-ot1-x341.google.com with SMTP id r7so13770665otn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m2ldd/M0FLdTJ9wAEQGe7z5FCDWr1SH0YWbEMWe9MZM=;
 b=FxhqrGLOlUJ81o/y0/pdmuMObdiPop1mTrMmvAH0MSclnUFbf7Hzn3MD/mdU+Evlbh
 geE6UnZQz24ZEhh6DMb6gKuaOx138Il0vxz6QGArHBj5NbyLbloif9DcPlQ+5FKUnBQ5
 isFwzBfKsxDk/LBTPH697rd3Q4/eOfIE4glMEg1Dbo4tDFNI+Vr8inrmhpRsncHzMmgb
 MBYqoXWmpL8hXfRklDkXbtnlwE7yn49acH5dfVyMRO2kFfMMpV7cHpe7aPGnUgICVltv
 kETLigMAPAZ/1E5PqjtL7MGRKjjnu5O31BDTKi5UkQoTMkY8PdZ8qaBgvZ4gPw0NFPXZ
 iyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m2ldd/M0FLdTJ9wAEQGe7z5FCDWr1SH0YWbEMWe9MZM=;
 b=gSABOQ86sRXY19UXub3zEoeM7F9RfTahjeuz9sl5Oo/xbwfbqFdaBlpew4juzhik73
 ywsamzikT1nZS7PRJqy5snlaWtCUZDjTv9FWIdXh2mdFwfX2LvGARHgqcOJOIF0cFLtM
 tlUmTC5ffYBvGI6bqJOKqaWk8hWH3T/FLGyzwCBZa31OUsxzP92S5MJSWRMaTpXwfO98
 J7ZP6iYLL9KYl6WalTmzTvxSh7qdjqwL2wPjjKn4a1pbuMLjqtO1S/xMJuftrJEIHI2o
 TJUOGpHrYVwFQxZjbxYKIhW7ycXY5I+SprzanKt1s4v5OqL9MVrAOfO4Tfa77S0SW1wm
 6Qxg==
X-Gm-Message-State: APjAAAVhrYLrd9YkG6UuuUfEEhRLHce6NcVcr1LPD3wMdveKpy7vdlu6
 b7F5WUSAA2RHwvX3jX2x+wuXJThHFIC7aNGxdrZEuyLXagA=
X-Google-Smtp-Source: APXvYqwxeP620JOS9yve8ETKab1BilmFKqx3q7kcUvnXybulQhL0HPoi56dggfDrmtzjdJwI13+OKQ1jctUoAqTZwqI=
X-Received: by 2002:a9d:7c84:: with SMTP id q4mr37792152otn.98.1558373922999; 
 Mon, 20 May 2019 10:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-5-jbrunet@baylibre.com>
In-Reply-To: <20190520131401.11804-5-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:38:32 +0200
Message-ID: <CAFBinCAuPqRtWydk=gbB-H1iMGOR-HbMAo6NnM=6Xyi784LV2Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: meson: u200: add internal network
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_103846_463770_7BB68949 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 3:14 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The u200 is the main mother board for the S905D2. It can provide
> both the internal and external network. However, by default the
> resistance required for the external RGMII bus are not fitted, so
> enable the internal PHY.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
I don't have this board but it looks sane so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
