Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE8C71136
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jun 2025 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Y1+BwNKFAIpl0A3HAbF46eKj+tElwDy2ui4kQz3vho=; b=Tt3TXOxLAaRGiY
	ZrOtvvQujxPGjha83SnZTWBWmyFR9tfnXqjw9DUX4pr4doUz2Q6ES1y+KqiXvMrhT6vpSJ4dF/Kds
	izkNrsGIUdQ67dAIZ0Xyig+43uvoWd2cYlz1wFbuPittaAf2u6UfVakhI+9r4dlupoljkx+7X21Qi
	s78+9WZXLjkLSKjGXpb4ACjYG8wtXqMkbAb7ror+Bqe+T9c8Rvqpw/hq1bSVDEG8EgFq1jSnGaEoY
	7apE80wJHOPsO6nsBSCNu7Y/AK+248/14MBYVOtCXLi5GZfIo1Pw+BzreoP0VyYBWMb6FQO6ZG2j2
	KJlnVkuZc8st6317EeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4io-0000000GXMx-3yC0;
	Fri, 13 Jun 2025 13:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cu-0000000GVV4-2AHk;
	Fri, 13 Jun 2025 13:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=hKgIl3vgVIuGNgvQ6bS/U8xNbS7f3z+TnxopluGWSlo=; b=Ye6ofSHnM/GAGoyBb8x2F5+Z+j
	0dLNiDtrNrN72vYp32ATXoF2PEV5713/lpIDQPcDDgSbB474AdgOMZBJ8xdfMZZws0+HfvTyL97Mo
	0/v+uFnXykj10UvpvQpj+E65P/pWr/GgMJFKlywuaAGGSt8Cv5/vYAbhOxfeieJZHArb4z+oos7hR
	fmx3r8O2g3zw7YpnhyTcSRHCcKl9U7JlJ8R6PjffqTsSAOpM/qIvNQqHhURCmit76J6IwQ31ypQhp
	vqmQOC4bBjjXinKXm+TJuEWht/VxAkEEtETPq2PxCMUiTa8blRAo0RB7hQt43cIxVGD6gUx5hpN9q
	s0A1oF6g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cs-000000030ha-0dvj;
	Fri, 13 Jun 2025 13:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A013F49C0F;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75DD5C4CEE3;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TUGVwajnOOjiDLmdqEmnaNAwAvTZ9sFNr4jWG+i+AQV12yr9SCPBDFOze2o9jJAVT
	 X9gCO/KvfcAuslpctCMpcVp7W+/5PUxGEB8/VlvLLmNMOCbZBNyRaJcQOPjzqm7F99
	 1cPee0ziLQzPgTImlv94CGzf2EPtEMNWMAnsIHrSA9hzDDUiLb+xresJmPdVLaM8gM
	 KAzJc6sxKDJ+vP1pBS0kLaTyiCI6a6U5vtkI5YV9vUuPx0c6QNcB7gAVbVGOkau+o4
	 UfZi3f6k0+9FMNUSgEQxV0UW2NYU7TsYiXpvzd1NISx9Wzb0mMqfViQHJTmFMOjeYj
	 rkX2MZ2wFwAFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D2C71148;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v3 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Fri, 13 Jun 2025 15:39:12 +0200
Message-Id: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAqTGgC/1WMwQ6CMBAFf4X0bM122wJy8j+Mh1IX6EFKWmw0h
 H+34AWP8/JmFhYpOIqsKRYWKLno/JhBngpmBzP2xN0jM0NADYjIX733kZun5F1ZKSHrEpRULP+
 nQJ17763bPfPg4uzDZ08nsa2/ioTLoZIEBy5ra1ptVIW6vU4+zuTPI81syyQ8qEIdVcyqQhSgW
 rBk9Z+6rusXqA2RL94AAAA=
X-Change-ID: 20250222-ugoos-am3-f67413860434
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=1175;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
 b=SxYO8wSB80jUzrAAMi6t4PKUg8Vs2RmSY7vfkjEHbcD44oPU0WnDbBoKTy9Nia6EIglQApBsU
 RAzhx+UYwTsD9W7Tugw9rDB9KnqbqJ+S/TrTRIK6dUcsT0TB8qIFm9B
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_143922_367475_F4F276AD 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaHNldCBhZGRzIGEgZGV2aWNlIHRyZWUgZm9yIFVnb29zIEFNMywgYW4gQW5kcm9p
ZCBUViBib3ggZnJvbQoyMDE4LiBNb3N0IGhhcmR3YXJlIGZ1bmN0aW9uYWxpdHkgaGFzIGJlZW4g
dGVzdGVkLCBhcyBub3RlZCBpbiBwYXRjaCAyLzIuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jD
pGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBSZWJhc2Ugb24gdjYu
MTYtcmMxCi0gQWRkIGEgZmV3IFJldmlld2VkLWJ5IHRhZ3MKLSBMaW5rIHRvIHYyOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMzE0LXVnb29zLWFtMy12Mi0wLTQyMjEwNGIwY2VjNUBw
b3N0ZW8ubmV0CgpDaGFuZ2VzIGluIHYyOgotIGZpeCB2ZW5kb3IgbmFtZSBpbiBwYXRjaCBzdWJq
ZWN0cwotIGZpeCBtaXN0YWtlIHRoYXQgbWFkZSB3aWZpIG5vdCB3b3JrCi0gYXBwbHkgS3J6eXN6
dG9mJ3MgQUNLIHRvIHBhdGNoIDEvMgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNTAzMDktdWdvb3MtYW0zLXYxLTAtMzhjYWI1YTQ3MjViQHBvc3Rlby5uZXQKCi0t
LQpKLiBOZXVzY2jDpGZlciAoMik6CiAgICAgIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6IEFk
ZCBVZ29vcyBBTTMKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogQWRkIFVnb29zIEFNMwoKIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIHwgIDEgKwog
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgMSAr
CiAuLi4vYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4LXEyMHguZHRzaSB8ICAy
ICstCiAuLi4vYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0cyB8
IDkxICsrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQotLS0KYmFzZS1jb21taXQ6IDE5MjcyYjM3YWE0ZjgzY2E1MmJk
ZjljMTZkNWQ4MWJkZDEzNTQ0OTQKY2hhbmdlLWlkOiAyMDI1MDIyMi11Z29vcy1hbTMtZjY3NDEz
ODYwNDM0CgpCZXN0IHJlZ2FyZHMsCi0tIApKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
