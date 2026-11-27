Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D491606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=smogCj6X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7XR97pU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=An+RSgwSoC23vkSzRhoLCVe/8HRO1Bi/1hQz2E5Oua0=; b=smogCj6XnqRxTsiceZZpVBa4Xq
	6MloD+GWJOJCseTfZMF/XGde/p2Ns/45bPM0Kjuzj5GjlvG8Ty1fo7Jdw1s3/tVI5icJWvrjsZvvL
	ky0/bAMajDGbKXnzbPDEHPYz7ZuqZoCKxrPh0gp8n2p7434aEn3yaNLEElfd/+0874w9iCnXEluXr
	+71cPz5V2SO+xjTjb8XIgWev4mJ27wfntCRLhtjtitYx9IPGlsk+g+Etovt06cEuQ6ONv6AKqmBA1
	Q1mrbWEsynR/CEscKJs1SuPyJjquAYQZSPr7W3mRZefaSTp/mqHoOMgeQh2EJEiuA8aakrESBFDy7
	ZmZugjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs7v-0000000FPds-1Bu5;
	Fri, 27 Nov 2026 09:20:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs7u-0000000FPdG-0w18
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 09:20:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6602E6244A;
	Fri, 27 Nov 2026 09:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C871F00893;
	Fri, 27 Nov 2026 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771217;
	bh=y/NG1FSwHBbc0nUUF5aO57OLyJ1BvD+9ME8Dae08+30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7XR97pUple7qnioazrI/KqFukqaqENgbTLazJ4JihS+pbhzBiogSQ/u0D8pklUcU
	 jE+1l0h1GfFtpjB9aLyaqoadZuw9aIRkPDCZgg2p4nARQMoeuCZ7GCLyktxlUe/iqx
	 hnHtSvXat9NDrhOjUIpdOcvw9XK2AXqJCFfsXFk6WDl57km7WloXHoTG6yI1V0akHU
	 n/iPrwcCuWwFPhRJzJVmFOOenxVO/xcDxCcFyG1QMn+Sox1ECV9D4mxNpd2qKufN1B
	 psIZk+Cz9vjzg54+Nl0Ii0n2PZyfR6xj6vwpfSqU6x7wBFvFiexlfF/r0klfmgjW8Z
	 BMMX/6q+/H3hQ==
Message-ID: <sashiko-outbox-236963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC:dt-bindings:clock: Add audio power domain for
 S4 soc
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261127-clock_audio-v1-2-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
 <20261127-clock_audio-v1-2-cf3ccf6b2bf0@amlogic.com>
Date: Fri, 27 Nov 2026 09:20:16 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IGNsb2Nr
OiBheGctYXVkaW8tY2xrYzogY29tbWl0IG1lc3NhZ2Ugb21pdHMgbmV3IFM0CiAgY29tcGF0aWJs
ZQotLQoKY29tbWl0IDYyMzE1ZWNkNjNjOWI0NWIzNjkzZWZmYmY1YWUwMjI3YTJiMzFhZjMKQXV0
aG9yOiBKaWViaW5nIENoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4KCj4gQVNvQzpkdC1i
aW5kaW5nczpjbG9jazogQWRkIGF1ZGlvIHBvd2VyIGRvbWFpbiBmb3IgUzQgc29jCj4KPiBUaGUg
YXVkaW8gcG93ZXIgZG9tYWluIGhhcyBiZWVuIGZvdW5kIG9uIFM0IGRldmljZS4KPiBJdCBtdXN0
IGJlIGVuYWJsZWQgcHJpb3IgdG8gYXVkaW8gb3BlcmF0aW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEppZWJpbmcgQ2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29tPgoKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYXhnLWF1ZGlv
LWNsa2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxv
Z2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwKPiBpbmRleCBmZDc5ODJkZDRjZWFiLi43NWRkYWY4ZDgw
OTE3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxheGctYXVkaW8tY2xrYy55YW1sCj4gQEAgLTIw
LDYgKzIwLDcgQEAgcHJvcGVydGllczoKPiAgICAgIGVudW06Cj4gICAgICAgIC0gYW1sb2dpYyxh
eGctYXVkaW8tY2xrYwo+ICAgICAgICAtIGFtbG9naWMsZzEyYS1hdWRpby1jbGtjCj4gKyAgICAg
IC0gYW1sb2dpYyxzNC1hdWRpby1jbGtjCj4gICAgICAgIC0gYW1sb2dpYyxzbTEtYXVkaW8tY2xr
YwoKWyAuLi4gXQoKPiBAQCAtMTE1LDYgKzExOSw3IEBAIGFsbE9mOgo+ICAgICAgICAgICAgY29u
dGFpbnM6Cj4gICAgICAgICAgICAgIGVudW06Cj4gICAgICAgICAgICAgICAgLSBhbWxvZ2ljLGcx
MmEtYXVkaW8tY2xrYwo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxzNC1hdWRpby1jbGtjCj4g
ICAgICAgICAgICAgICAgLSBhbWxvZ2ljLHNtMS1hdWRpby1jbGtjCj4gICAgICB0aGVuOgo+ICAg
ICAgICByZXF1aXJlZDoKCltTZXZlcml0eTogTG93XQpJbiBhZGRpdGlvbiB0byBhZGRpbmcgcG93
ZXItZG9tYWlucywgdGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHRoZQphbWxvZ2ljLHM0LWF1ZGlvLWNs
a2MgY29tcGF0aWJsZSBzdHJpbmcgYW5kIGFkZHMgaXQgdG8gdGhlICNyZXNldC1jZWxscwpyZXF1
aXJlbWVudCwgd2hpY2ggdGhlIGNvbW1pdCB0aXRsZSBhbmQgbWVzc2FnZSBkbyBub3QgbWVudGlv
bi4gIEFsc28sCnRoZSBzdWJqZWN0IHByZWZpeCAiQVNvQzpkdC1iaW5kaW5nczpjbG9jazoiIHBy
ZXBlbmRzICJBU29DOiIgdG8gYSBjbG9jawpiaW5kaW5nIGFuZCBvbWl0cyBzcGFjZXMgYWZ0ZXIg
dGhlIGNvbG9ucyBpbnN0ZWFkIG9mIHVzaW5nCiJkdC1iaW5kaW5nczogY2xvY2s6Ii4KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEx
MjctY2xvY2tfYXVkaW8tdjEtMC1jZjNjY2Y2YjJiZjBAYW1sb2dpYy5jb20/cGFydD0yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
