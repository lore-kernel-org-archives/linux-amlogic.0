Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4471BC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNRtSybDtfX0SmWK55UlUnYjh9weMESaB8jI9IG6YT4=; b=Uvu3yW8GT0scAf
	WAnWFkN8Mk7GTCojzdcY2WxzO4FxkH1GoC0419abpjJPo3+n5uHLrIFrMcXASDfN0zGubrQ4xC7ky
	LVu0k9aiOF4lpzPrK3E1cfobXnozu5/700t7xFKk5DeBtDUr3o1cSTNzaBJxCgdnbf9ITqvKeG0dX
	WQStWVBAK/D/d17buqrN1p/wJgf+4nU3zjaDMh8KTKo0MQQcptjwq8WNvGAmNVfkIDffUrsnF8Wne
	yHdAWeSRGNMg0sUe87m6lmGmC8v0r0Z0ehaohK+2vJhZuxhz/aS8LEWmcRn9NsZlYkHVczQOfQdMG
	8s3Syo6PwTWZaulyw3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5yJ-00DXbC-15; Mon, 21 Nov 2022 12:32:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5yF-00DXZC-G0
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 12:32:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2574DB80F00;
	Mon, 21 Nov 2022 12:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A1DC433D7;
	Mon, 21 Nov 2022 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669033936;
	bh=nM/4PXXiiRvTy1GwbBTLsZNqf/mkb0cxsfzWdyrKLuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nhZW6hE1AF39SD/Dtf7lp7mQBXmDsmnKxhwr0z7f382S8mkRk8YpZPhHtXIxQlpF4
	 +wypXwBfaDSVKN3J/KEme3UycWecRQ+AB6ul2U7HFZ34nWkHYPKkLP0IaGjfIqjpzo
	 f5G8fp+R5J9EY9QcSugkcTSERNFapiSi2LAZq6e0zuNo5Ea7ZiqNdi0PbXMKg2rdrK
	 ifx+ST6Vtuscn6oEcRq446Vq/Av3hqC9OhQ1CacWEdkDV3T/OMUJ5bx/0mOKvLxxKC
	 ml0a0cCcHtjm6tcYg5DvNBGg6mH88QHJNxuy1r9F859j4h69e3WSjdHg3jtOeUh/Ds
	 ndw9gjAgV0yuw==
Date: Mon, 21 Nov 2022 12:32:10 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-i2c@vger.kernel.org, kernel@pengutronix.de,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y3tvypIDVdCYxAVB@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-432-uwe@kleine-koenig.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043219_697352_F60EE8A2 
X-CRM114-Status: GOOD (  11.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOCBOb3YgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEZyb206IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gVGhl
IHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3QgbWFrZSB1c2Ugb2YgdGhlIGkyY19kZXZpY2VfaWQgKiBw
YXJhbWV0ZXIgc28gaXQKPiBjYW4gYmUgdHJpdmlhbGx5IGNvbnZlcnRlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
Pgo+IC0tLQo+ICBkcml2ZXJzL21mZC9raGFkYXMtbWN1LmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpBZnRlciBhIHdlZWsgb3Ig
c28sIHBsZWFzZSBjb2xsZWN0LXVwIGFsbCB0aGUgdGFncyB5b3UgaGF2ZSByZWNlaXZlZAphbmQg
c3VibWl0IGEgcGVyLXN1YnN5c3RlbSBzZXQgZm9yIG1lIHRvIGhvb3ZlciB1cCwgdGhhbmtzLgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
