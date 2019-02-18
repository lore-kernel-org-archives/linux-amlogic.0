Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DC4C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 12:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 156F521773
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 12:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q65DA4rP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 156F521773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMBwmFZ5pQjYhdAI/++mKjWTxaymLzhQC/3zPzer4y8=; b=Q65DA4rP254ht2
	ojLg2GKSrIcE9gpqYF9smrcm88gL5UEuDB4IQnR052VTKw2Zla/0eR7Bj+nm+cbW3ZMdZOc5TmTeL
	c5KkUvz76NMXa5Zh3JarLWH/Z80U9ChoL5A5GR8HVL917ekhk/wlovtZgi7f+xNRyBCmkDk9ITrvl
	zmC06y+erpW0C3bGUrhTrBvbZsMT27rUEgXErFlIXDc4BQevEWORyCxlfkC7vPPMcjAWvcE58Z3/h
	M3N2X0/S9h3pBVgY/UMALnYWuPAL9R5kuWLnHS4mQg1sgcnRTGBdyEFspm9V0qPISyMaxkHETzH+b
	WRPKwTS+azAKOqTu8/ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvi7Y-0001Pw-AI; Mon, 18 Feb 2019 12:34:04 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvi7U-0001PS-R4
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 12:34:02 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Lpxdr-1ha0YD1IM3-00fl6Y; Mon, 18
 Feb 2019 13:33:50 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
Date: Mon, 18 Feb 2019 13:33:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
X-Provags-ID: V03:K1:8c+HqiBoJBrIQeQX/19t3YjhO6yQX5DAB5GdRe4J7W130EI23tv
 mOLj5bOgwAEcxTVHiRICFHU69M/rV8de/VmUUSCihgDBIx0iUxBomu6xxv7HKQzxOYuKe6h
 Mw63qJwmBbnTAZ9SKzGm7n5xlsjzqOCqm409hnQf9EFo4a7zI5G/hmPu0FE05sEx52Brq/1
 MBKTHbpkd6Oy0RL6jLwoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ufo7HcGBFig=:FTmEGsA3gc4cBvO6g14IvN
 O2slUDqNgN28IXeFA7o7bM5DvtHtbafdRn+1xBtnCZM0mPvTsNU2gEkkXoAyvZ2iYKC5bAzvE
 MLAiCwgpTdAbMN/yPwBMKLIZ70OXKENpTyg1e4S5D0f3l6v2OahEx/IYOa2gtQNt9ZMQb+Rpm
 Gm/UmzGG+CqVabVdSN7ItN+eE9+liDkSQ95LsYBdFUQJpmec9+AT2L+bNCV24LOaKJJbZtNw+
 bWYQgE5GB003aXBs/o+/i7mS2Hw1Nc7saInEmgROGB5k1YuPYHnln+Z0IxkntCExFF6+lF5YU
 9j0g9Ul3sOIV3BdGqljikJTa4i3T15K+27FIWRD8nLgCrGtndZkh8NllwoOYzlpmxsJ1JOhSS
 pr2eK5L+LrECW/1+H/ek0kW3F64QJGseyj5Dc0KOFOaY+d1jQ9fPvUIKpGG2bNY4mu/SdpjQ+
 VjcDWVslC5sLuOlbAIcWqwAx6QB/HU28Rtc256T3fol75h6D13NFI3bx/+MzPsM3tssdlzhil
 JbFuJ7IUY4vqsPcU4NHKypxTZPQtIbQffn2fOeZJ37SFKqW+ebctnwRm24QxZo+1SscB+w/Dj
 f2W3qHNHn9lHNbrClJkW4NeOZBeDsZbQKXBq/Ln8Srtypv799qUwtATL8nlkvVZcb01JvnBXR
 Eu7h3NbeUeOkV4e18lj/e+OKkvMei14X51KN9ozqopeYrgczggXxJh+85LDe1iUqtenqhNYHP
 TEystsiqUYUvsjSD+dE5FKoOaV+UB+PNFD6sEfJ+A4ID8gIHxuL+Fcf8QYu2z2YsCiUHpHGqL
 dRYhPsKOSDcnmkSxsqB837LtS6FWeqxpbEHlQT/WghGWaXDAK1p9zN4pyG90WykQ7R5C0Vvah
 wpq+X5rhgj3Jg3r8oFSGvEOexogA4SKXHjqQOCrPlpQDKVK56lP+uqyAFUmRwdvxG9e5vZsL/
 Ww79x10ALHw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_043401_175846_3C6B50D3 
X-CRM114-Status: UNSURE (   5.54  )
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
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgoKaSByZWNvZ25pemUgdGhlIGZvbGxvd2luIG9uIG15IGV0aGVybmV0IHN0YXRzOgoKwqDC
oMKgwqAgdGhyZXNob2xkOiAxCsKgwqDCoMKgIHR4X3BrdF9uOiAxNDU3MzI1CsKgwqDCoMKgIHJ4
X3BrdF9uOiA1MDIyNDA1CsKgwqDCoMKgIG5vcm1hbF9pcnFfbjogNjcxNzM4CsKgwqDCoMKgIHJ4
X25vcm1hbF9pcnFfbjogNjA2NTczCsKgwqDCoMKgIG5hcGlfcG9sbDogNzg0NDM5CsKgwqDCoMKg
IHR4X25vcm1hbF9pcnFfbjogNjEwNjEKwqDCoMKgwqAgdHhfY2xlYW46IDc4NDQzOQrCoMKgwqDC
oCB0eF9zZXRfaWNfYml0OiA1ODI5MwrCoMKgwqDCoCBpcnFfcmVjZWl2ZV9wbXRfaXJxX246IDAK
wqDCoMKgwqAgbW1jX3R4X2lycV9uOiAwCsKgwqDCoMKgIG1tY19yeF9pcnFfbjogMArCoMKgwqDC
oCBtbWNfcnhfY3N1bV9vZmZsb2FkX2lycV9uOiAwCi0+IMKgIMKgwqAgaXJxX3R4X3BhdGhfaW5f
bHBpX21vZGVfbjogMzgyMDM3Ci0+wqAgwqDCoMKgIGlycV90eF9wYXRoX2V4aXRfbHBpX21vZGVf
bjogMzgyMDIxCgoKSXMgdGhpcyBub3JtYWwgPwoKCnJlZ2FyZHMsClNpbW9uCgoKCkFtIDE4LjAy
LjIwMTkgdW0gMDk6NDUgc2NocmllYiBKb3NlIEFicmV1Ogo+IE9uIDIvMTgvMjAxOSA4OjQyIEFN
LCBKb3NlIEFicmV1IHdyb3RlOgo+PiBPbiAyLzE3LzIwMTkgMjo0OCBQTSwgTWFydGluIEJsdW1l
bnN0aW5nbCB3cm90ZToKPj4+IEpvc2UsIGlzIG15IGNvbW1hbmQgZm9yIGRpc2FibGluZyBvZmZs
b2FkaW5nIGNvcnJlY3Q/Cj4+IFllcywgSSB0aGluayBzby4gV2hhdCBhYm91dCBOSUMgc3RhdGlz
dGljcyBhbmQgbG9ncyA/ICgiZXRodG9vbAo+PiAtUyBldGgwIiwgImRtZXNnIHwgZ3JlcCAtaSBz
dG1tYWMiKQo+IEFuZCwgImlmY29uZmlnIGV0aDAiIGFmdGVyIHJ1bm5pbmcgdGhlIHRlc3QuCj4K
Pj4gVGhhbmtzLAo+PiBKb3NlIE1pZ3VlbCBBYnJldQo+PgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
