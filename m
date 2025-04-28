Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7775C369D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf8YzaA0I5Nen9j3L68mSip9Tce1hg4Lme1wRzwk4RY=; b=h+Ek7AJxpskcWJ
	HQOc6eqIm2XhpO8rkJAFE+X/g9xBkm7dLs9B1k17UHNk6ondSzt9iuQ9PKQ+ABWgAx8S1TugQXWsJ
	RY0ILYapf/Wdv2J+jn2yELeqxzf5bFRMPx325xh/dtmXxfFzUGIxKyWHjKLSTFgYaEvq5eNvWJElh
	rnr1gtT5ilmgiRyfa8ISM7fkE5gapX+k6f4aMwSS5gC6mp9sX+FkdxBuNOOzEcb7NpeR4ChyKw87K
	hpAgS3184088Cu+GyVsE8W5mK7Wv4f7MRSozAlv6QOGA9ez8TYKtT1usip3B+N2VON60SuXX+Xnse
	+cB60bTw0xL6ro+hHlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M2O-00000005qCw-2aNy;
	Mon, 28 Apr 2025 10:48:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LyS-00000005pUq-1JGH;
	Mon, 28 Apr 2025 10:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FDF04A10E;
	Mon, 28 Apr 2025 10:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7B5AC4CEEE;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837071;
	bh=Xlkrt6G0FEKg1HboAv2n4Daxz723vqa07I6qDNDIf/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cv78DjI2Q1y/ahBCts7re/2kae0KY1063OgbwMx6h8YMI9gPwa9KlTKUjgY4Stj59
	 QQCKNDbJeiOVkgXwKLNjyo+kNBEHFsmKYvh/iS5e/57BOl6YIlktymdrbfc3bRarqw
	 1EWvOH52QKJ9PDdmYWylVxMxCx2EKBVZlhj0ACu5/dJTxwsazA9W4fb72spllqUcGz
	 LKpxbAqlVg65mntpYRUSHIck762IN6rs/GleTxnRsBAT/z/Wl68XRFrXNt2OU/c7q6
	 hiE4XDTLDlndi0GXlSVmeocmanah0F9sYMYmI251C1gDbituIWjt1UX+pzM4aW2M18
	 pEgk2VUi5gL6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8375C3ABA1;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Mon, 28 Apr 2025 12:44:29 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0
 board
MIME-Version: 1.0
Message-Id: <20250428-fernsehfee-v2-2-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1095;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=MIe7PtmNs9I3jGf86k4FxS5W7n++ITrjeAkSDcGo2i4=;
 b=JQIGJmDcQaIKoCGqKGZeFqJOtEbcqdf1GapeFkjcfu3MQktin5wLvLjwWR6M3BJUvWsxUfYrp
 COTqXuWSsBPC51m1X21MQ2ud+DY74IGJKMBCehtdkHP3H9myv+fAtNY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034432_375785_99600D6D 
X-CRM114-Status: UNSURE (   6.63  )
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
aXJ5LmNvbS8gIChFbmdsaXNoKQoKQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEou
IE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hbWxvZ2ljLnlhbWwKaW5kZXggMDY0Nzg1MWFlMWY1NWEyN2JmYjE0ODI1MjUzMmJjZjE1Y2E5
MDViZi4uZjZmMDQ1NTI4ZGEzMmNmNDYyNWIzMGRhNTkyNjJjYTIxZGE4NjBlNiAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKQEAg
LTI3LDYgKzI3LDcgQEAgcHJvcGVydGllczoKICAgICAgICAgaXRlbXM6CiAgICAgICAgICAgLSBl
bnVtOgogICAgICAgICAgICAgICAtIG1pbml4LG5lby14OAorICAgICAgICAgICAgICAtIHRjdSxm
ZXJuc2VoZmVlMwogICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244CiAKICAgICAgIC0g
ZGVzY3JpcHRpb246IEJvYXJkcyB3aXRoIHRoZSBBbWxvZ2ljIE1lc29uOG0yIFNvQwoKLS0gCjIu
NDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
