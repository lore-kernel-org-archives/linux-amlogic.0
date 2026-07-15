Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED98C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n61O6cl2B9NN3wBq1nQO12hwi9EfRTyjivPe7HfXAX4=; b=U79gWigO7O2Oan
	BGSS4z18CDfMSaLHFJ/CU/w3b7GKd2TGKvYj8CiTzFYxcMwI0z3QwKhzCfqgcZ8cAPhfbO/YiQAEo
	fq5+nOTtw0MHJajb/xfOlyE1Y2gJXIUQkWhIo/BE4F/6XF+WpeiG0FcDndJkKI0dAsSDTYxj0gxvD
	eAmjXU6XzGifQaKBFy8Ex+TBWBSgP9RZSQeLb/m6aqWtecyF5Qqj5RvhvfiAQ+lv08zMROLu9XPqw
	ktNIwu1UzHrHn/2wzS3OR0DxfqmufS6MWQKrruu1dpOuIwjpxCA3pDATbeUBkRaSdxdHysRsdNWtp
	eV7/3nJCbt1th/Pc0A2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk41C-0000000Fdxd-1pYD;
	Wed, 15 Jul 2026 18:07:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk41B-0000000FdxG-1icD
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:07:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D96861878;
	Wed, 15 Jul 2026 18:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AE41F000E9;
	Wed, 15 Jul 2026 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138856;
	bh=RWzn+8Z/UFihm5XoL5tzbY4Myth2k9CFGLJ3QgA8pR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f5MayrPOJ+Dwzm1b8oPsL074Do5HPgFn4CWZJNz1RgQXN105IOopyDOswCaBX2KAl
	 /J5T2llrsQeZmwMGqo/vkFxz75+jnY+E13EdISu9HlwRx7wrEbRu5HxenCK8XtJPsB
	 ppSHXntXO9Hq7rr6V10+GUeFavN6P6vBkCHgeUO1pVtY67W9AG7Cvf1ej/vnDZyi95
	 9NeAscdehAWlbJ3jKsN1EOuWSl4uHCQscSMKvxCxhXEsWwVEhkT52sKgq7dqTT7EsL
	 G7TMZczkIC5GiW4CTTKdlmcdco1KQd0nA0ncXERHQmtYMhubNzbfObERwkRRzBni7H
	 BKmQVT9W2lm3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] media: ov2740: remove NULL reg_write callback
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev, ojeda@kernel.org, neil.armstrong@linaro.org, linux-rtc@vger.kernel.org, Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20260715175229.24672-9-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-9-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:07:34 +0000
Message-Id: <20260715180734.91AE41F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBUaGlzIGZpZWxkIGlzIGFscmVhZHkgaW5pdGlhbGl6ZWQgdG8gTlVMTCwgc28gdGhlcmUgaXMg
bm8gcmVhc29uIHRvCj4gd3JpdGUgaXQgYWdhaW4uCj4gCj4gVGhpcyBwcmV2ZW50cyBpdCBmcm9t
IGFwcGVhcmluZyB3aGlsZSBncmVwcGluZyBmb3IgcmVnX3dyaXRlIGluIHRoZQo+IGZ1dHVyZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBMaW5rIE1hdXZlIDxsaW5rbWF1dmVAbGlua21hdXZlLmZyPgoK
U2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBs
b29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA3MTUxNzUyMjkuMjQ2NzItMS1saW5rbWF1dmVAbGlua21hdXZlLmZy
P3BhcnQ9OAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
