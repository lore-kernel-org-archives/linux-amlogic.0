Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D56606A321
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DxdVvqXE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pNXYbyjt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=66GNm/iImY7X+3xOuswf0ovJNZLr7RNNYsmRvGkLfKg=; b=DxdVvqXEg7UetsFUElEPuimAaF
	gFEGLqUt2ACiEHkek6K25HxC2f+FCqzd42chJ97Ms78vTUGnRnNrEyvMgIBfwU0zferHVEc8Tgjp6
	66kPPZEjngLLEExXxg7pH0u07aN2wXoCuZz1bjHZKa7P4kEdOnj2II7InKTkaiTQ4nIZb+agfK9e9
	/duX+emUurpyTuq89kz64kcX6zr2uIKW7N+Kv4bJHsaxqRFDKqXuUtjkmHNHDlhsx0hA+9Jj051Ss
	5Jrmr2kZymWxxF5HWmV6xfDwJBNVedJDUS4YiAktF13ULs8YPDwHtHKPlAmtofdiZBUPHF6/0SMtM
	oUGuLrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxxU-00000007r7Q-2met;
	Tue, 24 Nov 2026 21:21:48 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxxR-00000007r6Y-0UeC
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 21:21:47 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8b2d14968c9so47918107b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 13:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555304; cv=none;
        d=google.com; s=arc-20260327;
        b=Ct3AWZb7vxjpVq2pk9CMAvueORFU5NiUafzVbGYRc4/wNBx9cbWViRmJiclS8deJdG
         hyrkHQryuxE2N5Um5vXQRdhuSQTEWu9x5SwIp7gSXI+NAl+89aCzDxeuSd6TeVPjRzMA
         mJkFxpvZ1lRpRF1u/8fgUV0rBet8c5Jt+f+0sZiDdLv5kc8PuENyp9/tdN9BhyaMzNE9
         /0hzi0TF2ZP63q4ofZ2zD7wqbfTRqSx9LYGM7VPqVs/PFv2cI6UvIVzgUMKgw92LBIOe
         Beb2kKwBsJGgCcNaDyl2iOQCxRiL9G5hjOZmrPVWUNbK7YxscAepT2J8T3/af0qVj6t9
         Z5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        fh=B5W8ScTlLcdaSc8CXqYF59dR9yQWd3gaB+uEmeCsKmk=;
        b=A2RaiRkM6AJODv5CUQ236yIqrlULeSY071UTkryFAzP+oVpY7Du3PMAAVdlsYDtBuO
         A6OIISQoCIwKx2daynItGDt0vYDXR/xIMMkGKxz7zkTGSitbqt9DaZBPsOV9/2kHSLde
         j0MyUCtEYonrObANDJNnfOBzpsnZZpjhge3z31K5D1zxZXOgUpF/ceQUmaxR6tku+0Qz
         qmXtfRFjEvqn1ZJOojlPdjoI7tc/FxIrTwdZexNc9qhzIvdKUbMpc3n+SH6jtp57Re5A
         IvEw4guyGPdnfysl/9e0apP5TnKyJ5c6Rv54cGeuytBcJZkDDJQdptbQq1Ca31QkbJmM
         zmQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795555304; x=1796160104; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=pNXYbyjtKqLDELiwgdz1Rmi1CbE9r9tUAVMt0CU4BSXP/0GLUnFXWpUIK8jpumsalP
         yWcRPazpjzRgvssf2hqb7O5oZy2WQCigtAVnkw6GSgQehzju7d4p6al1EeuOMxB80BC6
         3Yq3eMkf2JdIcklStbxdniOPgW55QzBgyMOy3sXqmgaZQPQDAHXxjUPc12gU8WgOGx5g
         vXFvNZVqIU9dP53XKFBYs9GxmVaATjX6gEFKIUdy/WPrZbZKxI3YjBPoSICn4u92IHle
         34fF8o4gggMxH4qi/8r0k2K8cdD8IDURuVHe2nfHEWzi5BRN5deQaPDAByW+LBCwtEQg
         SnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555304; x=1796160104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz0XauTGdOgnd6tw9kPNk/ldh50fDY3LEXEPBQT0ngw=;
        b=PZm3nISpk2qZcRSsMJw6pokzQxb79ncnLurFrMFsEoCNnF9puQXGgTs81Jfn9XmII8
         kKZCFDV7hsNFb6STF3XeLNj+hRcuYAVeg9vG5Ni5/pw6VWYYSzD4+WE0Pw3iVCaCbRb+
         F+4hwl5X9vJt3qWbUphWJepB9hjNPAhHSKlvMhGitcVk1ireSnigPEpoBpOmIEhouRQK
         8JxyeDg9RXkIduQ4UhNH4BocawUODRHyvD6EHr7ZlehlUZdde9nA46GUhitR+b+lS9mV
         pNky0K+udcQLSpwIhNVc+q+QSjYa+2sEd4e2TqJrApj7Nk0VYGctW4XrjFYJE2jKoR3I
         Yuaw==
X-Forwarded-Encrypted: i=1; AL+hErF+a8wh2xde3GMaiakFN1FK80xqOz26J3Uis5Wx698hqLWHmk0eqgMs4pMaUwEWwS2zC5mhx2mPPRMs/Zpp@lists.infradead.org
X-Gm-Message-State: APuU4Z/dhoqNsdJ7L7UMrPJpLJi3JZuYK+rUanF5UGOum/mZcmYNDpY5
	XZEYb6w7f7ob4lxCxOboT315tk2vDX8pD4ObQ458kk6Tl1pfnHV/zr3lSfV/p6xmWe0LHBpomtP
	4eDQ0N7EkI0K6zfII+N3YREOr1/kL3k8=
X-Gm-Gg: AZFdTZci6+IwLVWkk3lIwxt5yu0nW8wIwH5I0mLUNgTZGYX3LJCZSEiRKiBGwLKG3/h
	H2rAfaME1woH85BUbSyd0z9zckpxg4xlUGJ4Duboyhu5bSp2xo3XP1CxDZug2mdwy3O9tRgiy0R
	F0e5rQpOgxxapWiMCDw36uQtzXxNewzj7lFkLFnFraMiSpWqPVrSYNgt71hiv5wuVVvJ7DlrPrb
	rrkaN+VnbBDJ7hDjEBL4SXGWO8NcCKa8HGgK5rLYWSful9BxBNQGQlxUoutY1dX0iRlWeouNjo+
	nblPZEznz4mkrnGKzthUAPGQYCKOKvS5XqQGA+QJbkm1JqBhrr92oSsIb3G2xKWmZSt2aXRcu3n
	3SkDGrXkBP539n3IR3qcB9pxUHWXRLcQrtvj1d44goQkXJ1RRQDwtRXAhQw3ikJGlNlE1vA==
X-Received: by 2002:a05:690c:6213:b0:8b4:dd2b:10dd with SMTP id
 00721157ae682-8b52050f0demr45322637b3.64.1795555303828; Tue, 24 Nov 2026
 13:21:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com> <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
In-Reply-To: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:21:33 +0100
X-Gm-Features: Aa3M54qIikBwR4PI-ZQunVxuxoqfwLNl1dfjIK5NjVa_KqUN1kcswl51cnQYi_s
Message-ID: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_132145_165841_9A02B959 
X-CRM114-Status: GOOD (  16.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTcsIDIwMjYgYXQgMTI6MDbigK9BTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIDExLzE1LzI2IDEwOjI4IFBNLCBNYXJ0aW4gQmx1
bWVuc3RpbmdsIHdyb3RlOgo+ID4gT24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBW
YWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+IFsuLi5dCj4gPj4g
KyAgICAgICBpZiAoZ3hfY2FyZF9jcHVfaWRlbnRpZnkoZGFpX2xpbmstPmNwdXMsIERUX1BSRUZJ
WCAiZ3hiYi1hdWRpbiIsICJGSUZPIikpCj4gPj4gKyAgICAgICAgICAgICAgIHJldHVybiBtZXNv
bl9jYXJkX3NldF9mZV9saW5rKGNhcmQsIGRhaV9saW5rLCBucCwgZmFsc2UpOwo+ID4gSSBzdWdn
ZXN0IHVzaW5nIHRoZSAiYXVkaW4iIHByZWZpeC4gQUlVIC8gYXVkaW4gc2VlbSBjbG9zZSBlbm91
Z2ggb24KPiA+IGFsbCBzdXBwb3J0ZWQgU29DcyB0aGF0IHdlIGRvbid0IG5lZWQgYSBTb0MgZ2Vu
ZXJhdGlvbiBwcmVmaXggIGluCj4gPiB0aGVyZSB0byBoYW5kbGUgdGhpcyBkaWZmZXJlbnRseS4K
Pgo+IERvIHlvdSBtZWFuIHVzaW5nICJtZXNvbixhdWRpbiIgaW5zdGVhZCBvZiAibWVzb24sZ3hi
Yi1hdWRpbiIgZm9yIHRoZQo+IGNvbXBhdGlibGU/Cj4gSWYgc28gSSdtIG5vdCBzdXJlIHRoaXMg
aXMgYWxsb3dlZCBub3dhZGF5cy4gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZAo+ICJtZXNvbixhaXUi
IGlzIGEgc29ydCBvZiBsZWdhY3kgbmFtaW5nLiAnd3JpdGluZy1iaW5pZGluZ3MucnN0JyBzYXlz
Cj4KPiAgICAiRE8gdXNlIGEgU29DLXNwZWNpZmljIGNvbXBhdGlibGUgZm9yIGFsbCBTb0MgZGV2
aWNlcyBbLi4uXSIKTGV0IG1lIHVzZSBhbiBleGFtcGxlIGFzIEkgcmVhbGl6ZSB0aGF0IEkgd2Fz
bid0IHZlcnkgY2xlYXI6CiAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGd4YmItYXVkaW4iLCAiYW1s
b2dpYyxhdWRpbiI7CkRvZXMgZnVsZmlsbCB0aGUgY3JpdGVyaWEgKGFzIGZhciBhcyBJIHVuZGVy
c3RhbmQgaXQpLgpXaGF0IGRvZXNuJ3Qgd29yayBpcyAiYW1sb2dpYyxhdWRpbiIgYWxvbmUuCgpU
aGUgR1hMIGV4YW1wbGUgdGhlbiB3b3VsZCBiZToKICBjb21wYXRpYmxlID0gImFtbG9naWMsZ3hs
LWF1ZGluIiwgImFtbG9naWMsZ3hiYi1hdWRpbiIsICJhbWxvZ2ljLGF1ZGluIjsKCkFuZCBmb3Ig
TWVzb244LzhiIChzb3JyeSwgSSBkaWRuJ3QgZ2V0IGFyb3VuZCB0byB0ZXN0aW5nKSBJIHdvdWxk
IHRoZW4gdXNlOgogIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjgtYXVkaW4iLCAiYW1sb2dp
YyxhdWRpbiI7CiAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOGItYXVkaW4iLCAiYW1sb2dp
YyxtZXNvbjgtYXVkaW4iLCAiYW1sb2dpYyxhdWRpbiI7CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
