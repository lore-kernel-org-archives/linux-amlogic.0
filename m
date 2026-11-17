Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BC606A32A
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MNnuP1Pv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT9/RG+r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S4dRdbi3O0w1bGHZcBeHXdWLEuFmc4fcXpe1nwdLlX4=; b=MNnuP1Pvkcdpg6Dtg8tpz5QKvm
	0qm0qoosxhGZZgotY7nY8//mJYYcaHd05HALZqXT+i0mbhTB5cJbZvQvQqfnhsSAhTxC3DYjFVGet
	2SbRxPl6e4NOmld2+EWPs2I+MQnpakiJ52JVOhH1ZrypOki0YN4OHzrWShjgxoNd8QYcUaeZCWdLF
	d1A5t2hUU0JhHBFhSF33W8ArLT9zzotmSsgYh7D5/9I6sD7UvYOjBSeJuxrrcK77UpPqY1o5f9uKi
	y8R0P67fjDLrvtwgGbifgv94M+XgFMfgY0YLuS0MEGj/PQ6tQUs/BP1ELGyi7Vb2VOTktMf2R6Ico
	8ctyJPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP1c-00000006vyH-1Z11;
	Tue, 17 Nov 2026 19:39:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP1a-00000006vxL-1Whq;
	Tue, 17 Nov 2026 19:39:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ACE54050E;
	Tue, 17 Nov 2026 19:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CCD1F000C4;
	Tue, 17 Nov 2026 19:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944365;
	bh=rj4/yU3Ef/aUBJSMi8YMnFqrbci/YNnHa0upd+SN5Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hT9/RG+rRpEkT4IozMC9bRCUWb1qS6zd0zGYzfgDt+wCgo0mUHwzwqyfDC28ATCO+
	 s8hhus94B7ztUYtOLqnNC6QczFLVS0pxPVfCA3QVyXO6V9RFdC78s5GfhDI2VWybVJ
	 qW3Xf1lVp8PJRADcEHqMnRGQ/xlcvo4MeDW5aSL0o3c2BYZyc8ki64SMrgNns/22I3
	 2T/ZQSKR4s5YgfghsicCsVGq0cpyAQZlvKzZ1yYK5Rln0mreLDZucosu6eP/SynHx+
	 pjSW3YVQRxpZN8MZXMwAr9tg6IuuU8XItLnkEafEnPz3Cs7KXMtXBEvyltcPvIqiUM
	 Qk2kc1TPV0pNw==
Message-ID: <sashiko-outbox-219508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl:
 Add hdmi-phy child node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-3-9e0ac931381c@aliel.fr>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-3-9e0ac931381c@aliel.fr>
Date: Tue, 17 Nov 2026 19:39:24 +0000
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IHNvYzog
YW1sb2dpYzogdW53aWVsZHkgY29uZGl0aW9uYWxzIGluCiAgbWVzb24tZ3gtaGhpLXN5c2N0cmwu
eWFtbAotLQoKY29tbWl0IDI5MjJjYWU4YzQ3ZTg3ZDZhMGZkNzFlOTFlNGEwNzY5MGU0ZDBmNjYK
QXV0aG9yOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCmR0LWJp
bmRpbmdzOiBzb2M6IGFtbG9naWM6IG1lc29uLWd4LWhoaS1zeXNjdHJsOiBBZGQgaGRtaS1waHkg
Y2hpbGQgbm9kZQoKVGhpcyBjb21taXQgYWRkcyBhbiBvcHRpb25hbCBoZG1pLXBoeSBjaGlsZCBu
b2RlIHRvIHRoZSBBbWxvZ2ljIE1lc29uCnN5c3RlbSBjb250cm9sbGVyIGJpbmRpbmcgZm9yIGFt
bG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0cmwgYW5kIGZvcmJpZHMgaXQKb24gdGhlIG90aGVyIHN5
c3RlbSBjb250cm9sbGVyIHZhcmlhbnRzLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9hbWxvZ2ljL2FtbG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0
cmwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvYW1sb2dpYy9h
bWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsLnlhbWwKPiBpbmRleCAyODVlZGFjNGMwODIxLi45
N2U0NzU5MmFmZjJlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb2MvYW1sb2dpYy9hbWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsLnlhbWwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2FtbG9naWMvYW1sb2dpYyxt
ZXNvbi1neC1oaGktc3lzY3RybC55YW1sCj4gQEAgLTM2LDYgKzM2LDkgQEAgcHJvcGVydGllczoK
PiAgICBwaHk6Cj4gICAgICB0eXBlOiBvYmplY3QKPiAgCj4gKyAgaGRtaS1waHk6Cj4gKyAgICAk
cmVmOiAvc2NoZW1hcy9waHkvYW1sb2dpYyxtZXNvbi1oZG1pLXR4LXBoeS55YW1sCj4gKwo+ICBh
bGxPZjoKPiAgICAtIGlmOgo+ICAgICAgICBwcm9wZXJ0aWVzOgo+IEBAIC01MCw2ICs1Myw3IEBA
IGFsbE9mOgo+ICAKPiAgICAgICAgICBwaW5jdHJsOiBmYWxzZQo+ICAgICAgICAgIHBoeTogZmFs
c2UKPiArICAgICAgICBoZG1pLXBoeTogZmFsc2UKPiAgCj4gICAgLSBpZjoKPiAgICAgICAgcHJv
cGVydGllczoKPiBAQCAtODAsNiArODQsNyBAQCBhbGxPZjoKPiAgCj4gICAgICAgICAgcG93ZXIt
Y29udHJvbGxlcjogZmFsc2UKPiAgICAgICAgICBwaHk6IGZhbHNlCj4gKyAgICAgICAgaGRtaS1w
aHk6IGZhbHNlCj4gIAo+ICAgIC0gaWY6Cj4gICAgICAgIHByb3BlcnRpZXM6Cj4gQEAgLTEwNCw2
ICsxMDksNyBAQCBhbGxPZjoKPiAgICAgICAgICAgIG9uZU9mOgo+ICAgICAgICAgICAgICAtICRy
ZWY6IC9zY2hlbWFzL3BoeS9hbWxvZ2ljLGcxMmEtbWlwaS1kcGh5LWFuYWxvZy55YW1sCj4gICAg
ICAgICAgICAgIC0gJHJlZjogL3NjaGVtYXMvcGh5L2FtbG9naWMsbWVzb24tYXhnLW1pcGktcGNp
ZS1hbmFsb2cueWFtbAo+ICsgICAgICAgIGhkbWktcGh5OiBmYWxzZQoKW1NldmVyaXR5OiBMb3dd
CldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gc3BsaXQgdGhlc2Ugc3lzdGVtIGNvbnRyb2xsZXIgdmFy
aWFudHMgaW50bwpzZXBhcmF0ZSBzY2hlbWEgZG9jdW1lbnRzIGluc3RlYWQgb2YgYWRkaW5nIG1v
cmUgcGVyLWNvbXBhdGlibGUKZXhjbHVzaW9ucyBoZXJlPwoKVGhpcyBzY2hlbWEgY292ZXJzIGZp
dmUgc3lzdGVtIGNvbnRyb2xsZXIgY29tcGF0aWJsZXMgYWNyb3NzIGRpZmZlcmVudCBTb0MKZmFt
aWxpZXMgYW5kIHJlZ2lzdGVyIGJsb2NrcyAoSEhJIGFuZCBBTyksIHdoZXJlIG5lYXJseSBldmVy
eSBjaGlsZCBub2RlCnByb3BlcnR5IChjbG9jay1jb250cm9sbGVyLCBwb3dlci1jb250cm9sbGVy
LCBwaW5jdHJsLCBwaHksIGFuZCBub3cKaGRtaS1waHkpIGRpZmZlcnMgYWNyb3NzIHZhcmlhbnRz
IGFuZCBoYXMgdG8gYmUgb3ZlcnJpZGRlbiBvciBmb3JiaWRkZW4gaW4Kb3ZlcmxhcHBpbmcgYWxs
T2YgaWYtdGhlbiBicmFuY2hlcy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTctbWVzb24tZHJtLWNyZWF0ZS1oZG1pdHgtcGh5
LXYxLTAtOWUwYWM5MzEzODFjQGFsaWVsLmZyP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
