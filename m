Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C429C369D3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rydi+KDgf2CYJbWeVyCWF7et75tWKx12m6dk45lZRhY=; b=PCumw/UFfQy6K4
	SSmzrSHHA7ePXbh5da95GoCIchjUTDeX6EdsyWugZzXZY0wfor7PDmzwP7cmbyGewjt6QGMvwKB3T
	ZrapVfr1dcnvlSHPTayeWyC8PNx20aDkBK88xhJiNAeTmLnyK2uXS0L70cyTZLCenqshhbi+kC12B
	OihGzb5jd0oodY6zcQ5VHzVT8Kq9H7Tfkr+F7d4h+fBlljFNDnvUuJ9HWEC7qKff3/8LbTzR8kMGP
	D7/lqpN1Y19aEh9pWsguTdmRAWefuD3Uq+pw5gCz1SZ4CsQnPCcRoEnrBvPPTLUGdPqO3u29WuMck
	5tSOcq76ToIvas5GywsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M6H-00000005qwW-3IJ0;
	Mon, 28 Apr 2025 10:52:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LyS-00000005pUp-1Z4P;
	Mon, 28 Apr 2025 10:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BA7E5C5A09;
	Mon, 28 Apr 2025 10:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA6E7C4CEE4;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837070;
	bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=heTRi+KnPNW2vy0rLctBRjFgRRBAennRpA8uIGdIiQhBNfvdzvqU6DnSTx1Zp4aFv
	 TbYJag4bmzfvMg7TCShf9Wda8Mqd1/ZKQOFIVyCS5F0GsnBNvBI9goB7dYul1tltN/
	 61rvK4ioEBvMCl7VN3aGW9PAojxwK0QT7YJfzWiPdFIfxNlTPhK9z6TlfKkZYDU+7T
	 5Jg+d2eKCk7EJ+jE5dmO3E2LGhNGSZd5AJpnHmgk9d8ltqXuaAjkBP2P06cCgaPm6/
	 JElbMQvL7w9txpTdN/eRb/CzMV6mKDCZLPsHaG6kccIIY8BGk5ejXsderrw7gHU8/9
	 wkQhQsNZoVspw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F57C369D3;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/4] Board support for Fernsehfee 3.0
Date: Mon, 28 Apr 2025 12:44:27 +0200
Message-Id: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAtcD2gC/03MTQ7CIBiE4as031oMP2KjK+9husB2EDbQACGah
 ruLjQuX7yTzbJSRPDJdh40Sqs8+hh7yMNDsTHiC+aU3SS41V0IzixQynAXYQxvYi+KzGUH9sCZ
 Y/9qx+9Tb+Vxieu92Fd/1x0j1z1TBOJNnKdRJzIsazW2NuSAeAwpNrbUPE2O1saUAAAA=
X-Change-ID: 20250315-fernsehfee-b5aef930ca7e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1421;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
 b=sloiws7PjerztavFOh+WRSwUGtcJ8z57ukYOGobwKBpWoMWMkPQdnhNLJFGvr24RatYRu5di8
 GLTh5fOlEknAphpjgeeMJ/wjmSSrkPR/7ufDGiz/ou72uuoN0GwH3MD
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034432_519940_58D2C8FE 
X-CRM114-Status: UNSURE (   7.64  )
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

RmVybnNlaGZlZVsxXSAoIlRWIGZhaXJ5IikgaXMgYSBmYW1pbHkgb2Ygc2V0LXRvcCBib3hlcyBt
YXJrZXRlZCBhcwphZC1ibG9ja2luZyBhcHBsaWFuY2VzLiBUaGlzIHBhdGNoc2V0IGFkZHMgYm9h
cmQgc3VwcG9ydCBpbiB0aGUgZm9ybSBvZgphIGRldmljZSB0cmVlIGZvciB0aGUgdGhpcmQgZ2Vu
ZXJhdGlvbiwgRmVybnNlaGZlZSAzLjAuCgpbMV06IGh0dHBzOi8vZmVybnNlaGZlZS5kZS8gKEdl
cm1hbiksIGh0dHBzOi8vd3d3LnRlbGVmYWlyeS5jb20vIChFbmdsaXNoKQoKU2lnbmVkLW9mZi1i
eTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0g
QXBwbHkgQUNLcyBmcm9tIEtyenlzenRvZiBLb3psb3dza2kgYW5kIFItYiBmcm9tIE5laWwgQXJt
c3Ryb25nIGFuZCBNYXJ0aW4gQmx1bWVuc3RpbmdsCi0gTmV3IHBhdGNoIDQvNCB0byBkZXNjcmli
ZSBQTUlDIHJlZ3VsYXRvcnMsIGFmdGVyIGRpc2N1c3Npb24gd2l0aCBNYXJ0aW4gQmx1bWVuc3Rp
bmdsCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDMyMy1mZXJu
c2VoZmVlLXYxLTAtMjYyMTM0MWNkMzdhQHBvc3Rlby5uZXQKCi0tLQpKLiBOZXVzY2jDpGZlciAo
NCk6CiAgICAgIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBUQyBVbnRlcmhhbHR1
bmdzZWxla3Ryb25payBBRwogICAgICBkdC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBBZGQgVENV
IEZlcm5zZWhmZWUgMy4wIGJvYXJkCiAgICAgIEFSTTogZHRzOiBhbWxvZ2ljOiBBZGQgVENVIEZl
cm5zZWhmZWUgMy4wCiAgICAgIEFSTTogZHRzOiBhbWxvZ2ljOiBtZXNvbjgtZmVybnNlaGZlZTM6
IERlc2NyaWJlIHJlZ3VsYXRvcnMKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FtbG9naWMueWFtbCB8ICAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbCAgICAgICB8ICAgMiArCiBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL01h
a2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2lj
L21lc29uOC1mZXJuc2VoZmVlMy5kdHMgICB8IDMwNiArKysrKysrKysrKysrKysrKysrKysKIGFy
Y2gvYXJtL2Jvb3QvZHRzL2FtbG9naWMvbWVzb244LmR0c2kgICAgICAgICAgICAgIHwgIDE4ICsr
CiA1IGZpbGVzIGNoYW5nZWQsIDMyOCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogOWM4
YmQ3NTM3OGQ3MGNkNjA4N2Q1MDNlYjgzMTdkMWVlYTY3MTY0YQpjaGFuZ2UtaWQ6IDIwMjUwMzE1
LWZlcm5zZWhmZWUtYjVhZWY5MzBjYTdlCgpCZXN0IHJlZ2FyZHMsCi0tIApKLiBOZXVzY2jDpGZl
ciA8ai5uZUBwb3N0ZW8ubmV0PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
