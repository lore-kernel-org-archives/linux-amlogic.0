Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C523C35FF1
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Mar 2025 23:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pDGtHcDKryN5ntAKB+4jKr8PrdAqL7UCauR5SVBZRY=; b=T9emZX5vPuJTgG
	Jx031R+cxYyIdE4/TVhyoHadCiHPXych+JpRZJ/l+q7sovxHU0N5iXHPmO5IQ+kH9uYWX7CZ+dKbN
	bznFTU5Z/9ZSrhIwWH5uAgxoMVvbBcIV7cY33kMcsKPpp/zhf9xqzWXBhklovg6GilobXzfcj8QqF
	hoRuBVRlYrK+/st0UJ7gdW7CZlV7p8Z4CF2QVqEl3hjSRbrDxb0KIWdAD5j34MCf5E2oHbIh4yJHk
	6bLQD1ZhrFRgq2L8SUoW5sv6BJqvb99tzPEJ/r58vnhCX7nuUBtuT9leS66EN3twzRLH8yzzKAAMJ
	F9e/CDFi0fcnXbFbOAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsriz-0000000CgOR-3iyd;
	Thu, 13 Mar 2025 23:12:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhe-0000000CgFX-18dW;
	Thu, 13 Mar 2025 23:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 983C6A48795;
	Thu, 13 Mar 2025 23:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16169C4CEDD;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907461;
	bh=cXVyoRypaze7f+Lz1yx3qPNU5d4wDrkDtX8Re+XtxgY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=b3PDUsXSUn4yAJcNWG/UXUc0yTU2grWPne5L7CY4r0ziVQNimoEZalJ2v2D1Cnt+N
	 bhKxgn+aVCQC5eOV7Uf3JwFlm/FciXA2d2l6+pUxPGVmXGYzDh1l55RBi5m8CDSfqE
	 DCUgxvG26/YLBE/zb5B5wpt6LtjKQCabjMzo0AbxwoeH6xwc0zuummcpKf0oZ+MgVo
	 5Uyt3g8FLu4pX2d9g8yZcffGUWw5r9s/SXpSyPXasQVnKKaGqpPBAnqDGcEuQw6Ph8
	 KH4+eCerg5HuLf/l1KbNtF7iGJfDsQgz4Vsc+ulpURv6/gb/KUDc2id/+MHRLEOHKS
	 EtFQ5F/A+oJlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067F0C282DE;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Fri, 14 Mar 2025 00:10:58 +0100
Message-Id: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAJm02cC/03MQQ6DIBCF4auYWZcGBlDrqvdoXKAdlUXBADVtD
 HcvtZsu/5eXb4dIwVKErtoh0Gaj9a4EnioYF+NmYvZeGpCj5ojInrP3kZmHZFPdKCHbmiupoPz
 XQJN9HdatL73YmHx4H/QmvutPkfzyp2yCcSbb0QzaqAb1cF19TOTPjhL0OecPNrVgyKMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741907460; l=1015;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cXVyoRypaze7f+Lz1yx3qPNU5d4wDrkDtX8Re+XtxgY=;
 b=EMJcVnU8xlRkgiTfuaF1TgDC/Cipw+ftS76kCrZ0lMvFf5GpTyGf5oOolGy6r7AhJM4pXhZCI
 yQvY8GnkHuzBGf7CLT58q9JRTOPS6BKhzJVs76y6QepwJkvBXX3UV/L
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161102_386125_9D947DF0 
X-CRM114-Status: UNSURE (   8.23  )
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
pGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBmaXggdmVuZG9yIG5h
bWUgaW4gcGF0Y2ggc3ViamVjdHMKLSBmaXggbWlzdGFrZSB0aGF0IG1hZGUgd2lmaSBub3Qgd29y
awotIGFwcGx5IEtyenlzenRvZidzIEFDSyB0byBwYXRjaCAxLzIKLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMzA5LXVnb29zLWFtMy12MS0wLTM4Y2FiNWE0NzI1
YkBwb3N0ZW8ubmV0CgotLS0KSi4gTmV1c2Now6RmZXIgKDIpOgogICAgICBkdC1iaW5kaW5nczog
YXJtOiBhbWxvZ2ljOiBBZGQgVWdvb3MgQU0zCiAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IEFk
ZCBVZ29vcyBBTTMKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9n
aWMueWFtbCB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAgICAg
ICAgICAgICAgIHwgIDEgKwogLi4uL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIz
eC1xMjB4LmR0c2kgfCAgMiArLQogLi4uL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3ht
LXVnb29zLWFtMy5kdHMgfCA5MSArKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5n
ZWQsIDk0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLS0tCmJhc2UtY29tbWl0OiAyMDE0
Yzk1YWZlY2VlM2U3NmNhNGE1Njk1NmE5MzZlMjMyODNmMDViCmNoYW5nZS1pZDogMjAyNTAyMjIt
dWdvb3MtYW0zLWY2NzQxMzg2MDQzNAoKQmVzdCByZWdhcmRzLAotLSAKSi4gTmV1c2Now6RmZXIg
PGoubmVAcG9zdGVvLm5ldD4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
