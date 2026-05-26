Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDFDCD5BD1
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu8220coRD38J3B4WXVTJmONehpnZk57kl77hNtlBow=; b=FY1YuyZIQcHuz/
	d1RxEGHz4tH7jGa5UGO3jo3kRBC3kq7AFJLVGGLU5p33udRkLvQV6mc6IR1/+sS/SjkyKyeA33FH/
	f3WGgjZjEd07jO/3UDyBr0DQLGMrV/NOtIufwfTrA1j/h/TvMwS7gqxOtTKgg+U5OChzA78yiV2r4
	pJHYYbwZrSsV4MGSk9BonSi6l1eyXw55efOTsKKH+B9m658T1z353EsxVj2c6NBNrtkQmiOi7OQLQ
	LC0stjkUQqBosINHLpUADz5cJQMqFcUpeBSjskO5HJsGObobOVZnNKcPTeywaD6m6HGaG0+T30F0K
	ecmLWnBFyF0amhfBZRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRney-00000001S3c-29Qt;
	Tue, 26 May 2026 09:01:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnex-00000001S32-0JeZ
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 09:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5624960121;
	Tue, 26 May 2026 09:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34E21F000E9;
	Tue, 26 May 2026 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786070;
	bh=a8/mZDWg8lAWNyqLHZzmXiC9XhbVjEZnjJMT4quTgn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AkWGGHeOhf6fZ38TToyusK87N8QSXpqD1a7eG1e6G2qlTxDf8CSKGqKOtJSUFIDLO
	 v3nGT+nHyvo/aofAUXNgWR9PIEdjg9kokFx4j9NcqAUG5JedjNes5fM/zlRGToUr21
	 p8btisyEv4IeOjYNmCzEHv1CU2wN3QWWD6MPsZmNuGAHfE6/1udaaWh99yvs7bcpEx
	 CW1HN77rEETetrHSNW3BAoKO7DSOJ8cStwax0Uz8RmXB36Vr6YPAhtNoFZMOJp9vA/
	 5nKhYrIJ1sFVr27n6n/nRHEDQHXgoqsGPcz3FgmXdIVAwi/GPExIi8o7WvJZgfNb18
	 876BmYCyXmFiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 1/6] firmware: meson: sm: Add video
 firmware loading SMC call
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-1-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-1-33bc817f93f4@amlogic.com>
Date: Tue, 26 May 2026 09:01:09 +0000
Message-Id: <20260526090109.B34E21F000E9@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGlkZW50aWZpZXIg
YFNNX0xPQURfVklERU9fRldgIGlzIHVzZWQgaW4gdGhlIGBneGJiX2NoaXAuY21kYCBhcnJheSBi
dXQgaXMgbmV2ZXIgZGVmaW5lZCwgcmVzdWx0aW5nIGluIGEgYnVpbGQgZmFpbHVyZSAoJ3VuZGVj
bGFyZWQgaWRlbnRpZmllcicpLiBUaGUgZml4IGlzIGZvdW5kIGxhdGVyIGluIHRoZSBzZXJpZXMg
aW4gY29tbWl0IDdkYTc3ZGQzOGQyZWE1NmZlN2I1N2UyNDY4NDdiNWNkMTE4ZmQ4NWUgKCdmaXJt
d2FyZTogbWVzb246IHNtOiB2aWRlbyBmaXJtd2FyZSBsb2FkaW5nIHZpYSBzZWN1cmUgbW9uaXRv
cicpLgotLQoKY29tbWl0IDA4NzE0MWU0MTFlNTNmNDAzYWI4YmY1YWE1Y2E1OGEwMGNjOTVmZDQK
QXV0aG9yOiBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5jb20+CgpmaXJtd2FyZTog
bWVzb246IHNtOiBBZGQgdmlkZW8gZmlybXdhcmUgbG9hZGluZyBTTUMgY2FsbAoKVGhpcyBjb21t
aXQgYWRkcyB0aGUgU01fTE9BRF9WSURFT19GVyBjb21tYW5kIHRvIHRoZSBneGJiX2NoaXAgY29t
bWFuZCB0YWJsZQp0byBzdXBwb3J0IGxvYWRpbmcgdmlkZW8gZmlybXdhcmUuCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgYi9kcml2ZXJzL2Zpcm13YXJl
L21lc29uL21lc29uX3NtLmMKPiBpbmRleCAzYWI2N2FhYTllNWRhLi41ZGE2YzY1ZDY4NGEwIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+ICsrKyBiL2Ry
aXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+IEBAIC00Nyw2ICs0Nyw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbWVzb25fc21fY2hpcCBneGJiX2NoaXAgPSB7Cj4gIAkJQ01EKFNNX0dF
VF9DSElQX0lELAkweDgyMDAwMDQ0KSwKPiAgCQlDTUQoU01fQTFfUFdSQ19TRVQsCTB4ODIwMDAw
OTMpLAo+ICAJCUNNRChTTV9BMV9QV1JDX0dFVCwJMHg4MjAwMDA5NSksCj4gKwkJQ01EKFNNX0xP
QURfVklERU9fRlcsCTB4YjIwMDAwMGYpLAoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBjb2Rl
IGNvbXBpbGUgb24gaXRzIG93bj8gSXQgYXBwZWFycyB0aGF0IFNNX0xPQURfVklERU9fRlcgaXMg
dXNlZApoZXJlIGJ1dCBpcyBub3QgZGVjbGFyZWQgeWV0LgoKV2hpbGUgdGhpcyBpcyByZXNvbHZl
ZCBsYXRlciBpbiB0aGUgc2VyaWVzIGJ5IGNvbW1pdAo3ZGE3N2RkMzhkMmVhNTZmZTdiNTdlMjQ2
ODQ3YjVjZDExOGZkODVlIChmaXJtd2FyZTogbWVzb246IHNtOiB2aWRlbwpmaXJtd2FyZSBsb2Fk
aW5nIHZpYSBzZWN1cmUgbW9uaXRvciksIGVhY2ggcGF0Y2ggaW4gYSBzZXJpZXMgbmVlZHMgdG8K
Y29tcGlsZSBzdWNjZXNzZnVsbHkgb24gaXRzIG93biB0byBtYWludGFpbiBiaXNlY3RhYmlsaXR5
LgoKPiAgCQl7IC8qIHNlbnRpbmVsICovIH0sCj4gIAl9LAo+ICB9OwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyNi1iNC1zNC12
ZGVjLXVwc3RyZWFtLXY1LTAtMzNiYzgxN2Y5M2Y0QGFtbG9naWMuY29tP3BhcnQ9MQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
