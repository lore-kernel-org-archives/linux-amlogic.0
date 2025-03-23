Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5ABC28B30
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Mar 2025 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdaRRFecuEKD/udvMhLOthayJUeAEAarbwq0x8PFOZU=; b=JEKd/Qf3ECKhf5
	PmokslYvZWfSQ1FoNd7asf+rCJEPthO5cnP2xwLngO28tIoT6hYDalUWvt3HUQMQxOxy5Sy+7nFZ4
	iIEtKNpfFC/VzVctbqPLA8q2Yl4qfcV3Yy2CmUUrnNVrEByufd4IaLRxhT+/EBSTd+HhOAHCHLenQ
	lLiHlr5t1LA1tGYg4DPdriB8hkYvkZVNgvEVsf7W8jFWpseuxU3hBIYhc0k35TGMYIWsLKvS3H5W3
	d9fIop0Jc8OfnTCCh6xjDGxnCwOu+pbgvvcp2mSOelSId3KDjYDyPViPXeiRTYSqbUt+r8qGvtIU3
	OUTc8DJF5v0nMIA2KaDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKcK-00000001Bw4-2fHb;
	Sun, 23 Mar 2025 12:39:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKat-00000001Bm5-3Fus;
	Sun, 23 Mar 2025 12:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3B1B5C5D10;
	Sun, 23 Mar 2025 12:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D3E9C4CEED;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742733502;
	bh=qNL5zaQmZMh2NYS8anqdXQNeU2uo1FCGOXYyuJOoH/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jwGuvTTtJZ9m0jZO5Ew6Cdmj/L0ze5hTuRyFtU8DX7f/cgPEDVu0w5AwiHV/igIXO
	 64qKKIjzMPJ0cqrf7HAtHpiPmKkP+ED2VApK6CfTxOSa8U1Ul2X+VYlWSUYwaRt5Sd
	 WSnZb6thzX0q0JjLXSMAHRXWOmiB3xuPJsWdRhRa2uBLz2tOgf+DDrNWkBXCyTZsTL
	 ymvcJ0zEczgs9sAE4arjM+BASR0c1OnWG2uAb4KLM7zwCZBxafcqd6rjKzOeyp2Nno
	 b61pr7on2SiI6fXd74Zxtf/cPlXg1EpLc1aK8QpTfmo7yGvFSeQ/thl2Qd3neUNvah
	 wBrTHgK7aKpMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3CEC36005;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 23 Mar 2025 13:37:50 +0100
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TC
 Unterhaltungselektronik AG
MIME-Version: 1.0
Message-Id: <20250323-fernsehfee-v1-1-2621341cd37a@posteo.net>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742733500; l=959;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=uaz9m8VjNE4NEygLbUtmBG2+WbjOgy1rPMuQ4WTpnro=;
 b=XWEvZjys42PmDLa1n4FLTA9f2MmzxWu8uLr8Mzx4Mal4ZylyaFFdxjPKN+Az3yww8cB+aEWHj
 WpA+cD9U14/B0t2ta3oMhRBIPPX4SlIOX4/8AZbHcQA/4q2fxIr/B45
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053823_875000_BBD60E20 
X-CRM114-Status: UNSURE (   6.75  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKVEMgVW50ZXJoYWx0dW5n
c2VsZWt0cm9uaWsgaXMgdGhlIGNvbXBhbnkgYmVoaW5kIEZlcm5zZWhmZWUgYnJhbmRlZApzZXQt
dG9wIGJveGVzLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5l
dD4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
CmluZGV4IDUwNzljYTZjZTFkMWU5ZTJiNTIzMTI0MzllNGIxZDQ4YjI2MjIwMGMuLjAwMTlmNjEz
MWJiZmMxMWJhNTVmNWExNWEyMzg4MjVhYmY2NjVhYWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTE0ODQs
NiArMTQ4NCw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0aW9uOiBUb2J5IENo
dXJjaGlsbCBMdGQuCiAgICJedGNzLC4qIjoKICAgICBkZXNjcmlwdGlvbjogU2hlbnpoZW4gQ2l0
eSBUYW5nIENoZW5nIFRlY2hub2xvZ3kgQ28uLCBMdGQuCisgICJedGN1LC4qIjoKKyAgICBkZXNj
cmlwdGlvbjogVEMgVW50ZXJoYWx0dW5nc2VsZWt0cm9uaWsgQUcKICAgIl50ZG8sLioiOgogICAg
IGRlc2NyaXB0aW9uOiBTaGFuZ2FpIFRvcCBEaXNwbGF5IE9wdG9lbGVjdHJvbmljcyBDby4sIEx0
ZAogICAiXnRlYW0tc291cmNlLWRpc3BsYXksLioiOgoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2
NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
