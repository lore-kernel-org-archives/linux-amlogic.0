Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DDBC28B30
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Mar 2025 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tawWl4UZBHUrCRPvhgMcnF2XLdwrk797kvDWYOfRLGQ=; b=i/eYwCcaHp+gKZ
	0pH35h7ERn0csv2MT+uDZF0XRS+QZiwgdLrBs7YAx9pQPLoD2UkAh9MpOOB1tctbPZBW3MBAw0Xnb
	jc9cJ0VHcuC/oDInl6dhdHA+cQEnuwaVdaXMaMfycSAf1sG5VgWpT+P7hstpymlg97d4qVOyeGhBN
	NCTyaMoWZJrEGZlGEH1oqAMuoUw2QQL7DuHFAKUZvbgnBxvMj3Kxn4c0S19pF3I1/IZvL39J7+YeD
	oRVm+wD9oDWPagNjdjwDsFz/mdzAZqYfaABmiPqPn/BNCvid6hX6KsPZ2NOCRUF621I3lBV1nSyEq
	oPRtk44EAmjrh4NpPWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKfd-00000001CSq-3HWP;
	Sun, 23 Mar 2025 12:43:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKau-00000001BmM-1QJD;
	Sun, 23 Mar 2025 12:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D7B8435CB;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BEB1C4AF09;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742733502;
	bh=DR7zJgdee++dv14xQ+dPhz4iEUH6k4tcSVxNuNHr0oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FEwcKSMV4fmnQEwkMOlxHhoNpJwzQ0XlHpANJpSC2s1qrPeEBWfbkWSaLkm2l0Xnj
	 mgh6V49Ocx7VDQZogxLUdL9DNbu22x9HjGzf/qghR6C/O73P2m17rlub0Be51z4B8a
	 LziCUGhgQdP84XrrrH7Lecqa355lEF3TJviRKUs/DTQBQRghiz/cN527VQVFwJfqij
	 PpQFwu6L38RnD6figtqobu9AbnwsPMHS5XWYWteOK1bKEbSOsL8voWVCWxNCZcnua9
	 TpEzBvwa/ip/1XOoEAwNqu5qTp1FPm9ylDtgpMHBlHYwC2i7WDGYtDSu1ppqJUtSsP
	 0x7vaUZAIkg9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB86C28B30;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 23 Mar 2025 13:37:51 +0100
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0
 board
MIME-Version: 1.0
Message-Id: <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742733500; l=960;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=mrc3J8ytO/NiLhShyV41MfY6uhH+27AuqX1jMo8Sw34=;
 b=JIcizXwOKzMDmAcqEevcbaltakZu6TXCOFfO84zrLK4aNuIbn53bU4TPJqHkwiTu5Jd8xkxwL
 pgYiXOhP+FSBWRi5BZ9wJ5qw/AuURqMzwarOcqJ34hvQofeE3x2vvV0
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053824_396155_D7D15449 
X-CRM114-Status: UNSURE (   7.05  )
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKRmVybnNlaGZlZSAoIlRW
IGZhaXJ5IikgMy4wIGlzIGEgc2V0LXRvcCBib3ggd2l0aCBIRE1JIGlucHV0IGFuZCBvdXRwdXQK
cG9ydHMuIEl0IG9yaWdpbmFsbHkgcmFuIEFuZHJvaWQgNC40IGFuZCBhIExpbnV4IDMuMTAga2Vy
bmVsLgoKICBodHRwczovL2Zlcm5zZWhmZWUuZGUvICAoR2VybWFuKQogIGh0dHBzOi8vdGVsZWZh
aXJ5LmNvbS8gIChFbmdsaXNoKQoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVA
cG9zdGVvLm5ldD4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2Ft
bG9naWMueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAppbmRl
eCAwNjQ3ODUxYWUxZjU1YTI3YmZiMTQ4MjUyNTMyYmNmMTVjYTkwNWJmLi5mNmYwNDU1MjhkYTMy
Y2Y0NjI1YjMwZGE1OTI2MmNhMjFkYTg2MGU2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbApAQCAtMjcsNiArMjcsNyBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgICBpdGVtczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAg
IC0gbWluaXgsbmVvLXg4CisgICAgICAgICAgICAgIC0gdGN1LGZlcm5zZWhmZWUzCiAgICAgICAg
ICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjgKIAogICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRz
IHdpdGggdGhlIEFtbG9naWMgTWVzb244bTIgU29DCgotLSAKMi40OC4wLnJjMS4yMTkuZ2I2YjY3
NTdkNzcyCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
