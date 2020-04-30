Return-Path: <SRS0=G+6o=6O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A909C83000
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 01:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECE52082E
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 01:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pciOrMou";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vB4VPh0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ECE52082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Acidn7JdF7JtEHN5fOU5EOOJJ/dHme8JLFZNl/Tr0vw=; b=pciOrMouaCQc/d
	wTCHJZe14e4n0JqGiVW0RAdXLEKF6K0rwXOiqWRnE883ssfTEtq6GL1y/ccj/jxWfGzOAVjFfg9dE
	ihwFKV16E6w9bgsa4TbA/hNYxtKUvPykJCsoCKSRwWtA47EdScsqFhFhj5zJmuKI46xfqkWvbtg13
	/zr0vjBjQInsvQ1SAvUViBvdDLlbti49Snbu15TR+M0dXcGsxf4U849dOjrePBV/2K7ww5ioycPqG
	ig9TwcQ/tc3CQYZyKjuqXpjmszoXTGk+cT4mZY9P9uwOI9sIitmBFxydeGA3i84O2EvkZzyKaFkgZ
	Hn5Uo+BxsOIX1ihTSLqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTyPJ-0005iK-G0; Thu, 30 Apr 2020 01:54:33 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTyPH-0005hs-AI
 for linux-amlogic@lists.infradead.org; Thu, 30 Apr 2020 01:54:32 +0000
Received: by mail-lf1-x142.google.com with SMTP id r17so3394480lff.2
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6IdL3BAcEz7abiV3g4YHEMCO9WXnls6KQ2pdHBxgwww=;
 b=vB4VPh0Syzb1zOX3vCVy9aTmDEvNRDG4JWKAOCurlhM2NNg1xvtsdEt8WjAiN2CVu5
 cgIpLkOscWzQT222s35toq3cpsLZk5HaLa0INMlT8gRS74V9HQhQbrFt5Fmy1YTbmRac
 RLG3pk6JIWjpVcTKCGBS7O13XX5GwqFVtbSthQKNPxBMNdMz5p1qTbuxmKLyXa6I7nJ8
 fBJdvkQO79G7Li/YpzsCygEapfpxxsnMh2q6AslCabuBSQal5qqkUTAS4efcFb0Nvsni
 I6wTJF6uCKkiuEjwF8+1wLqhXTY9A7v7poWjpgwx8y1xs1t5ZRsm/0iLhUiI5/SISr4C
 yIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6IdL3BAcEz7abiV3g4YHEMCO9WXnls6KQ2pdHBxgwww=;
 b=uSkfn3rF4/jKuJ4QcjdYMSoX/dth4i5oiLGYMjGyV/a6rFypNdIGDYu9uWCNcAooB9
 F5BUF40auQlXzocf9Iz1/DCmeu9Be8MYwQwQpaAp5wexsyM1de36DX3effWbt9/oPRmi
 PYafJRBvE0gZxDm6fJOdvqGJTmSmwSJK7xDU+r4waSlH6ycEdR5GKTa0w1BrP4ZzmUu4
 pe0BIIYc1BxLB60gvyNXuHleg52cI7pKu6FIDCBHAefiLPxW7pheXdN6rtwahkJYjsjI
 QVlJXnledJFbmjewikhBsJGqXqZ65+G0agPi09Lz3ofOd8gf1EquQ484lyOhCNhPNLnY
 NCyw==
X-Gm-Message-State: AGi0PuarWchX/3cfOpKm9hxiIn3y5LoNSsFTiPmMoDDOq8tDkHlJbflC
 vHjrL9xi70+6yzC/d+m+5Qo=
X-Google-Smtp-Source: APiQypIBbHrp4/2F2tJ4OpI6yrP0A2W2YCxYGDZG8ts8NryaGS4elN+6cmeSxBdo5jMf7GZu8d1axQ==
X-Received: by 2002:ac2:505a:: with SMTP id a26mr127711lfm.177.1588211669250; 
 Wed, 29 Apr 2020 18:54:29 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x24sm3215886lji.52.2020.04.29.18.54.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Apr 2020 18:54:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH 0/6] arm64: dts: meson-gx: add initial playback support
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20200421163935.775935-1-jbrunet@baylibre.com>
Date: Thu, 30 Apr 2020 05:54:24 +0400
Message-Id: <4F65325B-9B07-4798-869E-7BA0E3E66E13@gmail.com>
References: <20200421163935.775935-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_185431_359969_257D79AE 
X-CRM114-Status: GOOD (  12.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjEgQXByIDIwMjAsIGF0IDg6MzkgcG0sIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPiB3cm90ZToKPiAKPiBUaGlzIHBhdGNoc2V0IGlzIGFkZGluZyB0aGUgYWl1IHN1
cHBvcnQgaW4gRFQgYW5kIHdlbGwgYXMgYmFzaWMgY2FyZAo+IHN1cHBvcnQgZm9yIHRoZSBwMjMw
L3EyMDAgYW5kIGxpYnJldGVjaCBib2FyZHMKPiAKPiBJIHdhcyBob3BpbmcgdG8gcHJvdmlkZSB0
aGUgaW50ZXJuYWwgY29kZWMgc3VwcG9ydCB3aXRoIHRoaXMgc2VyaWVzIGJ1dAo+IHRoaXMgaXMg
c3RpbGwgYmxvY2tlZCBvbiB0aGUgcmVzZXQgZHQtYmluZGluZ3Mgb2YgdGhlIERBQyBbMF0uCj4g
Cj4gU28gZmFyLCB0aGluZ3MgYXJlIGZhaXJseSBzdGFibGUgb24gdGhlc2UgYm9hcmRzLiBJIGhh
dmUgZXhwZXJpZW5jZWQKPiBhIGZldyBnbGl0Y2hlcyBvbiByYXJlIG9jY2FzaW9ucy4gSSBoYXZl
IG5vdCBiZWVuIGFibGUgdG8gcHJlY2lzZWx5IGZvdW5kCj4gb3V0IHdoeS4gSXQgc2VlbXMgdG8g
YmUgbGlua2VkIHRoZSBBSVUgcmVzZXRzIGFuZCA4Y2ggc3VwcG9ydC4gTWF5YmUgbW9yZQo+IGV5
ZXMgKGFuZCBlYXJzKSBvbiB0aGlzIHdpbGwgaGVscC4gSWYgdGhpbmdzIGdldCBhbm5veWluZyBh
bmQgbm8gc29sdXRpb24KPiBpcyBmb3VuZCwgSSdsbCBzdWJtaXQgYSBjaGFuZ2UgdG8gcmVzdHJp
Y3QgdGhlIG91dHB1dCB0byBpMnMgMmNoLgo+IAo+IFswXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIwMDEyMjA5MjUyNi4yNDM2NDIxLTEtamJydW5ldEBiYXlsaWJyZS5jb20KCkkgaGF2
ZSBhIHJlcHJvZHVjaWJsZSB3YXkgdG8gcHJvdm9rZSBvbmUgZ2xpdGNoIHVzaW5nIEtvZGkgYnV0
IHdlIGNhbiB0YWxrCmFib3V0IHRoYXQgb2ZmLWxpc3QuIE92ZXJhbGwgdGhlIHNlcmllcyAoYW5k
IGNoYW5nZXMgaW4gWzBdIGFib3ZlKSB3b3JrCndlbGwgYW5kIGl04oCZcyBncmVhdCB0byBzZWUg
cHJvZ3Jlc3MuCgpUZXN0ZWQtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
