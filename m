Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D917606A31C
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2026 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HmE+G+Ez;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=f6eHaqsz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xYVTJyzifVbIiG1uCke7VGlKxb2bbNeRuvVHF6KWnRE=; b=HmE+G+EzbFHvjCCbNEoBgHKNma
	EkaoT6upVRjmlqYfiVGfnWt74HOmunJ3RXJSaIXlvlECBWtpYeGVIiKLyGu1QwPTmtK/8+JEKfz20
	L/kWoa7njpz/ULKXR4Vk665gFcEh0UF3ye53rUrt6JBFIR5sEsKfQkaB4aWa51+d4RRd+Lrb6JkBU
	3r7GPrhiVrkFkiWb5DjtJKsP8OaVt2S84mcARYQxa3pNTJM/mP9n+E9jKQhKj9jg+vFk3jGTwn6lZ
	JAwHuTdHNVb/7dbSiEt2cTUU9Au8khj1Lflzqb87uyXbRWYM0+2aQp+MdQlITO0il2sh/1cemXQX2
	vksFo9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA1C-0000000GeiW-3rMD;
	Sun, 08 Nov 2026 21:01:38 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA19-0000000Gehd-3qpS
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Nov 2026 21:01:38 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-679aeeddc6bso220503d50.2
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Nov 2026 13:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794171694; cv=none;
        d=google.com; s=arc-20260327;
        b=ARea8RdPqzc9KHZTP/I3hTgaSn9hH7ZAVnbkYy68nsT5Lt0OZwRknji43jD7QrM6EN
         sBnM6FjEA2nTRWN2AqkHsZlSJDyJtanZuUKkGMYpNBqdWzMUTtFN5A2p9zWFCX9Ba/8l
         UCCVwaMFieGupgKzUB7IW4nL1xlSJR1LFljw7vCpWk0ApL3imghvF3LNUZm4LB+nX0L5
         y2dWhZHlfPABKXmwRCLAmz/sBSFrZRPQhVj4vXnv7ok+ggLqbdlhVjivz9lHij14pRBB
         js1sMwUUV+KGxi9G7flMr3f/Bcv1o7xWiIP8PeNKydIcbJJiUcnXLNMBkhR2ud6O+cO4
         2K4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        fh=7irm2likpERIQblvcIQNpRLDk1vVs58qTTS+rGdY4Ps=;
        b=FVrnAhJxSI9OapD0fNGXlZCN6TikqhD40QR/QzxpJFNBpYy9ZHxs3h0wB/ghbG2OXo
         GMWrb3qDTrbsH150ljbiLMJgI6ryexjJBpUtKQa+E0xlnl1QPJXtHvLsNuUumxsSm2Am
         G0ic4D1nitzsyL2L1JT4S40aeyIQp2/iz+K9c1xN+V+j5poboK9+P3V0BJiE6PRKeN0Q
         E3TMhukIkXhr4iTKW3gW2uZyHD0VA5tw7y5CkjbJqD2HXc30b9o1X1ISwZrFPuyfnPow
         4vnaUD6fX2BNkIzzP2NI1n+X6Pi0MrxnXjaYEnvsyH2XLIGLScmsJqoV2gW0Jhf8XmRF
         sdGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794171694; x=1794776494; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=f6eHaqsz54DsVZmholH2Xld6xtX+eIVjU/9KxUR2ifhO2vIDp30xXM73LT7mK8k9/n
         VxPtZU4IGugSaRvpCGgEn7sjziPh01TvGgekNvHr7Zq3cfYw7+rDwtCuamUfo5BKDM3J
         KefUFRfYzL3laRiWwA2TyWg4JtwmrkAyrXpXOrRHUvU2iH2sXL+Xq0w9t9r4dcxkFzK0
         +SBfAVZuhMlPXXyLpe0qO2r3Za6BvWgNVl+c14/VMPIWh7RWPyFjZ7IJiNTVvKLoV/ZF
         msSwwcBbuuNLts+a5X13aOG0tGlcQJTrA5SioBWQkvku7qdD1la+PfLaR5oxnQbwQoK7
         tU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171694; x=1794776494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=xCNkjh+ZDqnMV8gYao3qdi3v3vzb2UbCBkNL6L85PJMkeGG8RZg7tCaTorrDL6LSRs
         Q7Zif55JZ/weZM24Cl7ZJdkIIgbABcUEXHAXk8g8uPxz727L0yPWF7ypcl/zTjOvQMku
         VMtFqSWQJUrEW0IR/EW51Ub1Gk/v4fBVW/gOmsRriyyHFW9sblrZl1zsB1bbacAi2Msn
         bGtSKfxKWAPZpGJN+iT3DjbZf2QA5AWP6xaV7+M8KpXLuMePjqirCpW2wDZAgMHUHq1G
         2I9jRC50LPJV2QSoPnpTgJbdFuRuJVNZ0dlkbGU1nKsDE04WNEzk3bmwdYolDGwTAXxY
         uH5A==
X-Forwarded-Encrypted: i=1; AL+hErEIEtW3Whj3fGYF7Pb+UbD+mUkCxU6XcfikG6TzQLNl7nTpN1PHlzYEGwvFOQoNbj22/HUHNfLAUcaBK0wc@lists.infradead.org
X-Gm-Message-State: APuU4Z8j1/G/qE5IaEOUJHcLffvRVlqTKdRkbe5UkzDPbvfHGrRdeQfh
	SiMzJUx1tVt69OvioOJVA5S9hO1aEbAi37BtZoGGGZPmG+7R/2D1sROYXwtVDSPHo2ZaMgeMVnI
	t0RmHlCLkRrapl4IMVCNbnyKcJohlzek=
X-Gm-Gg: AYBFou2TDxknHL90wZ6dSvP7zGrTSqAOAK9d4eZURH53sQIxtXWXl348sy/yCjt+5+q
	O1snCB5NnxG24IfRtELjGhMGgBmQgXy01/zqjOcgH07tP0ZmgP7MjN7QixgI5vPk902+t7VKjyq
	w5G5hanmMlVc+X/bhEqu3V0fSqoE0TJTGvhV5zaxLm2DoIiz7ha1Lt4YWYzZmwS7x6to9zi+khx
	2ZFDgcJXVOsEogIuLWSDwRRd/bHS1fE/CVlrdcqp1WHXAHOsmd86X+LNZB44H5uDQILHqVF/VjV
	c70NsKhaEIbz7B2toiytbCkTYhMk6tmwpPiE+jaiNon3ZVTTtVijBMrTv6hv9CWyp2lwuMUbD8A
	dM1SE6beumFyyVEzOtLXuSA/ljq64UNIRKWHQnzqgLiZy2VbPcAb4OXM/mSmT+zy7bnxHsToSWG
	p5p5wJGJiytLAligg=
X-Received: by 2002:a05:690e:4386:b0:67a:3678:e323 with SMTP id
 956f58d0204a3-67c3d9d34aamr703099d50.38.1794171693858; Sun, 08 Nov 2026
 13:01:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
In-Reply-To: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:01:23 +0100
X-Gm-Features: AclHuK-YI1_ZLeM-O06Jf1zbjFaiV_faZLy9KmuFTZNRq2F63vw1avnq47JKnuI
Message-ID: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130136_006353_AEE3AF07 
X-CRM114-Status: GOOD (  13.49  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmFsZXJpbywKCk9uIFdlZCwgT2N0IDIxLCAyMDI2IGF0IDExOjUy4oCvUE0gVmFsZXJpbyBT
ZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4gd3JvdGU6ClsuLi5dCj4gQEAgLTg1LDkgKzg1LDkg
QEAgc3RhdGljIHZvaWQgZ3hfZm9ybWF0dGVyX2RldGFjaChzdHJ1Y3QgZ3hfZm9ybWF0dGVyICpm
b3JtYXR0ZXIpCj4gICAgICAgICBpZiAoIXRzKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4K
PiAtICAgICAgIG11dGV4X2xvY2soJnRzLT5sb2NrKTsKPiArICAgICAgIHNwaW5fbG9ja19pcnEo
JnRzLT5sb2NrKTsKPiAgICAgICAgIGxpc3RfZGVsKCZmb3JtYXR0ZXItPmxpc3QpOwo+IC0gICAg
ICAgbXV0ZXhfdW5sb2NrKCZ0cy0+bG9jayk7Cj4gKyAgICAgICBzcGluX3VubG9ja19pcnEoJnRz
LT5sb2NrKTsKPgo+ICAgICAgICAgZ3hfZm9ybWF0dGVyX2Rpc2FibGUoZm9ybWF0dGVyKTsKVGhl
IGRvY3VtZW50YXRpb24gYmVsb3cgc3RhdGVzIHRoYXQgLT5vcHMtPmRpc2FibGUgaXMgY2FsbGVk
IHdpdGggdGhlIGxvY2sgaGVsZC4KZ3hfc3RyZWFtX3N0b3AoKSBkb2VzIGNhbGwgaXQgd2l0aCB0
aGUgbG9ja3MgaGVsZCBidXQKZ3hfZm9ybWF0dGVyX2RldGFjaCBoZXJlIGRvZXNuJ3QuCgpJdCBk
b2Vzbid0IHNlZW0gdG8gYmUgcHJvYmxlbWF0aWMgeWV0IGJlY2F1c2UgYWl1LWZvcm1hdHRlci1p
MnMuYwpkb2Vzbid0IHJlZ2lzdGVyIGEgLT5kaXNhYmxlIGNhbGxiYWNrLgpDYW4geW91IHBsZWFz
ZSBzdGlsbCBsb29rIGludG8gd2hldGhlciB0aGlzIGlzIGEgcHJvYmxlbT8KCkFsc28gZm9yIGEg
ZnV0dXJlIHBhdGNoIChub3QgdGhpcyBidWdmaXggYW55bW9yZSkgaXQgd291bGQgYmUgZ3JlYXQg
dG8KaGF2ZSBsb2NrZGVwX2Fzc2VydF9oZWxkIHZhbGlkYXRlIHRoYXQgdGhlIGxvY2sgaGFzIGJl
ZW4gdGFrZW4gKGluc2lkZQotPmVuYWJsZSwgLT5kaXNhYmxlIGFuZCAtPnByZXBhcmUpLgoKWy4u
Ll0KPiAgc3RydWN0IGd4X2Zvcm1hdHRlcl9vcHMgewo+ICAgICAgICAgc3RydWN0IGd4X3N0cmVh
bSAqKCpnZXRfc3RyZWFtKShzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdyk7Cj4gKyAgICAg
ICAvKgo+ICsgICAgICAgICogRm9sbG93aW5nIGZ1bmN0aW9ucyBhcmUgY2FsbGVkIHdpdGggZ3hf
c3RyZWFtLT5sb2NrIGhlbGQgYW5kIGxvY2FsCj4gKyAgICAgICAgKiBJUlFzIGRpc2FibGVkIHNv
IHRoZXkgbXVzdCBub3Qgc2xlZXAuCj4gKyAgICAgICAgKi8KPiAgICAgICAgIHZvaWQgKCplbmFi
bGUpKHN0cnVjdCByZWdtYXAgKm1hcCk7Cj4gICAgICAgICB2b2lkICgqZGlzYWJsZSkoc3RydWN0
IHJlZ21hcCAqbWFwKTsKPiAgICAgICAgIGludCAoKnByZXBhcmUpKHN0cnVjdCByZWdtYXAgKm1h
cCwKCgpUaGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
