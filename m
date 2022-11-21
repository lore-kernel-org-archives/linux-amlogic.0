Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75B1C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxC2pRwdwQGq1tqEqyyqIwAEklH2NkelvH0HNY74AF4=; b=n0D+Jj3Y/k5Uhw
	rtYnbLYI4EZKdsaSHTV9aXZzdDyzacfv2iKaIMFLNZJLSbr0pmkTLZzcoOkMimYj4/Kx+tE7Si8bK
	eJQ+VWII4MtdRcpk46K6F7YcLrKpk01SfSqdEMfNoS+0ute0Us0KJrgMBAsAdC3/C9Yr7+yP4syZT
	nLEagl3WZ+ovvYC4Wwz9pvyR2d5a9mmlWmc0tWk6EHpumeHfCEwuILcutREaqftPqWFLx71aYb7UK
	M2UGQbmawlV/qDRocVqv9mU1kdx5O2aAaYye/xg/VTcHvSBlWn5OP1Bdle7T9FXNx3RQKGS1+I03C
	VEGOqpeTBqeXoX3TJVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxA16-00G6ek-E8; Mon, 21 Nov 2022 16:51:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxA14-00G6dn-1g
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 16:51:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A919DB811FC;
	Mon, 21 Nov 2022 16:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02EBC433D6;
	Mon, 21 Nov 2022 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669049487;
	bh=H3MOV+zhDBog7YBuduJdC2EhLMPiAYaQkSwiFUKZo9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSbxPlTV5pOA4HehPMNHk7I8oMAxpCcopMQO/hfAGAuDHjq+NrOJqgiucVhk8EY96
	 Nmh949/Q5VwDmHOHA+q4v/+29dWAyvWacaPXUnH3l85AYf1NSyAX7GPHzLQ+Bg55Sk
	 puAOqI7DORw/x2BO9U84jZI6gOi1HVyQ3DZDtd4V2TQVVBaQwMDNNV3vi1ixmu5h9r
	 1FU5t3AJV++5EFOW00xkLDA30OjaE6twzfh32GTyZrMwplmKQssSgoOniQXeIQmUXI
	 dmlVIhV8TrgaQv7d7UwOWroxLpf/b4F2cE3U1bOV3duM/JS0LHjPYReAQsqbHt9Me7
	 PSZMNqb04c8cA==
Date: Mon, 21 Nov 2022 16:51:21 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y3usiUm1K+5xCWhY@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121150854.3mwczqtbusawho4m@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_085130_252941_3FC41F98 
X-CRM114-Status: GOOD (  20.50  )
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

T24gTW9uLCAyMSBOb3YgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEhlbGxvIExl
ZSwKPiAKPiBPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAxMjozMjoxMFBNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gPiBPbiBGcmksIDE4IE5vdiAyMDIyLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiA+IAo+ID4gPiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgo+ID4gPiAKPiA+ID4gVGhlIHByb2JlIGZ1bmN0aW9uIGRvZXNuJ3QgbWFr
ZSB1c2Ugb2YgdGhlIGkyY19kZXZpY2VfaWQgKiBwYXJhbWV0ZXIgc28gaXQKPiA+ID4gY2FuIGJl
IHRyaXZpYWxseSBjb252ZXJ0ZWQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvbWZkL2toYWRhcy1tY3UuYyB8IDUgKystLS0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IEFmdGVyIGEgd2Vl
ayBvciBzbywgcGxlYXNlIGNvbGxlY3QtdXAgYWxsIHRoZSB0YWdzIHlvdSBoYXZlIHJlY2VpdmVk
Cj4gPiBhbmQgc3VibWl0IGEgcGVyLXN1YnN5c3RlbSBzZXQgZm9yIG1lIHRvIGhvb3ZlciB1cCwg
dGhhbmtzLgo+IAo+IEZvciBtZmQgSSdkIGRvOgo+IAo+IAlnaXQgY2hlY2tvdXQgbWZkL2Zvci1u
ZXh0Cj4gCWI0IGFtIC1QIDQxMy00ODEgMjAyMjExMTgyMjQ1NDAuNjE5Mjc2LTEtdXdlQGtsZWlu
ZS1rb2VuaWcub3JnCj4gCWdpdCBhbSAuLzIwMjIxMTE4X3V3ZV9pMmNfY29tcGxldGVfY29udmVy
c2lvbl90b19pMmNfcHJvYmVfbmV3Lm1ieAo+IAlnaXQgc2VuZC1lbWFpbCAtLXRvIC4uLi4gLS1j
YyAuLi4uIG1mZC9mb3ItbmV4dAoKVGhhdCdzIGp1c3QgY3JhenkgZW5vdWdoIHRvIHdvcmsuCgpU
aGFua3MgZm9yIHRoZSB0aXAuCgo+IHRvIGFjY29tcGxpc2ggdGhhdC4gSSBjYW4gZG8gdGhhdCwg
YnV0IGZlZWwgZnJlZSB0byBkbyBpdCB5b3Vyc2VsZiBhdCBhCj4gbW9tZW50IHRoYXQgc3VpdHMg
eW91IChvZiBjb3Vyc2Ugd2l0aG91dCB0aGUgc2VuZC1lbWFpbCBwYXJ0IGFuZCBtYXliZQo+IGFk
ZGluZyAtbCBhbmQgLXMgdG8gYjQgYW0pLgo+IAo+IEZvciBiYWNrbGlnaHQgdGhlIHBhdGNoIHJh
bmdlIGlzIDU4NS01OTMuCj4gCj4gQ2hlZXJzLAo+IFV3ZQo+IAoKCgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
