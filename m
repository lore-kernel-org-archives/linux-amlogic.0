Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C1DC28B2F
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Mar 2025 13:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x5tyYJtCqu3UHfTGxcTYg1SC6zL4ZA1FOsjzXHTrQVU=; b=XgLvky7sQKy2Px
	705nPLIPqPfqbAE3nVnCW9zwzX18G7sJ6Q2TYHnVceIN+iLusyvwF8ETcxGIxpIR+wcaHoRJkXO6d
	x9BbyKM34xO2ZIv0oD7ALwDDBtM431ruW3LECAgLXbKUkgsfPX8vbKnb03+Nhncxn5BdeYPuc9NzJ
	bEnP69KcLCnVzvgqU1gbebvYtU2mAOQ1Hz8y2LQn3jwRSYsKLL/2MzAjBE9JMCNepNNwnJhD8VYfv
	e/kFHUe6LoTxp5VTajWvmZ1iN34hFMHlCj3lLrF0czpV9ANW3ChAVwOMGI1Qs1DK+/LOw1nn4JlCa
	zOYvfjcldZS9cExBObpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW6-00000000YfP-36Bh;
	Sun, 09 Mar 2025 13:16:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW3-00000000YeE-3y7D;
	Sun, 09 Mar 2025 13:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE733A45BBD;
	Sun,  9 Mar 2025 13:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A0B5C4CEE3;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741526185;
	bh=sXGqpc3WKcfHqTQx4M6yghIZTgooBtjzDEElH3FLBmo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hK+y3wETfKuUaCbc/hMQ8VWmNA/RPIW66r4GEJ5NzoFph2CRWlzYtC9XR3rBFEdWA
	 FRXEJr4I1Or77IuIgs3NLOw8kiUXLmcxHOoiG7FkwGnrlYna245iPHBVtS9xDbQI1K
	 JIxMMnzhJft/NThTkXnqVIBu4BQmsc/B2T7wYbdy6obRSE/quqeBIzUJJ2J05tHiL2
	 rGGtNNtAJ2s4dpG24Jpmpw76AAl/gQMSAbODx+jvdx81/U8gFlZjGYy4xcfQAQLonf
	 9nQRynQo/vQCmc1GKmcFs7sG04vwWYbTYpsT2k9pKwjUr7oKC/Cf9DG4bgZNOA+KVv
	 z8A74AN9QDAXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE41C28B2F;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Sun, 09 Mar 2025 14:16:19 +0100
Message-Id: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKOUzWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMj3dL0/Pxi3cRcY900M3MTQ2MLMwMTYxMloPqCotS0zAqwWdGxtbU
 AG099b1sAAAA=
X-Change-ID: 20250222-ugoos-am3-f67413860434
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741526184; l=789;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=sXGqpc3WKcfHqTQx4M6yghIZTgooBtjzDEElH3FLBmo=;
 b=KFqgJkbT9NIujlHGhFm/rVdGXRHTo5NcLMkJr6gLnbrM7M1MDwvekKDXH18GNow11O+DpCkYj
 KQdztzgUsbIC5N0WLj5HCSQuZdReN4kdb5XFmeI1g1pTIBmbYrG4Hfk
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_061628_071488_080C0940 
X-CRM114-Status: UNSURE (   7.67  )
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
pGZlciA8ai5uZUBwb3N0ZW8ubmV0PgotLS0KSi4gTmV1c2Now6RmZXIgKDIpOgogICAgICBkdC1i
aW5kaW5nczogYXJtOiBhbWxvZ2ljOiBBZGQgT2dvb3MgQU0zCiAgICAgIGFybTY0OiBkdHM6IGFt
bG9naWM6IEFkZCBPZ29vcyBBTTMKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FtbG9naWMueWFtbCB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtl
ZmlsZSAgICAgICAgICAgICAgIHwgIDEgKwogLi4uL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tZ3gtcDIzeC1xMjB4LmR0c2kgfCAgMiArLQogLi4uL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZ3htLXVnb29zLWFtMy5kdHMgfCA5NSArKysrKysrKysrKysrKysrKysrKysrCiA0IGZp
bGVzIGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLS0tCmJhc2UtY29t
bWl0OiAyMDE0Yzk1YWZlY2VlM2U3NmNhNGE1Njk1NmE5MzZlMjMyODNmMDViCmNoYW5nZS1pZDog
MjAyNTAyMjItdWdvb3MtYW0zLWY2NzQxMzg2MDQzNAoKQmVzdCByZWdhcmRzLAotLSAKSi4gTmV1
c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
