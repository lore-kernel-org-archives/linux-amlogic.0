Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156E9C71148
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jun 2025 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQIXYAHr/uca0B/Jpd6CUSeDCIOxvsX05UTeCfWed/c=; b=pbOTUSShOmdVSg
	1tctBwz5RHSmIkejMKXvFMa4zg8zR2i5Chdb+26GGSmprFwdc+esN4JgTahW5gH0TU4MXen4bbBD8
	X7A2eAvCYRc3P6H+lNI4z5Af6ahIRFDZz1WAz2iCikXvYDjdIT2mPt2PkSLH1EopCi6Ox64JZEcK9
	j2BpUTPedNIM4zuC++GGLN+yJs2IkVGPmFU1Ft0p0vpWoLhPuMkpWiA/082WXwMfbdu+yhCBOOIzM
	LHq+XxTrNlcVl5avAY1y8NI0UwUPUajW5l/wiEw7DPR6Gs4TKLGMNtffbklo1HKRJGLJO8cAnIuaK
	a5C+lXXqQhr73wVxx2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4gX-0000000GWE5-2fwQ;
	Fri, 13 Jun 2025 13:43:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4co-0000000GVUY-2WgQ;
	Fri, 13 Jun 2025 13:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5C47629D7;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82919C4CEF0;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=d4zt0JOBC2hdaumNtVVwuXPV9bmTleS7AL76KtydixI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=orDS8zZiDiEvC5a+Xj68U/brImg3QVNBSWNpgk6qGEmLsw/AI1tiuhPfPDAZjpmiW
	 BYA+lqYM31aNms+BlF8Zbpmj9FeoBX4Yb6QpMtIB/+wU+9AdFogYYVGhBLz5yD3fL5
	 nV0YshzW/JvB+p/57A8rn5ixtyHetU5qmr2QHKPYVlIZASM96n+RO0PjiDnSGx7AGK
	 /4tAFOPTgBXW+mPDpfWtgo/iXa7x/eNgrnwM7O4czC3ZDjJcnQ0zTCmayIIkttqYlx
	 J+lIIUtEADx/EA/PUSrk0o+irqkaAJh4yXHpw48pPbD40fbWN5msgTrCb/poyI6xbD
	 R7p7bTacb8jpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735CEC71136;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Jun 2025 15:39:13 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Message-Id: <20250613-ugoos-am3-v3-1-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=1125;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kZwR93fnBy9N7Bg/HslF5gmhIegfe1/51WU15kA7fXw=;
 b=dd33tXb2gztAfCgLiRlEw/IQQQHH7LtYQY6rjV/dGwaie7Sf3Bs/24sa4q3zEyvnbtipEILxQ
 +B+Tk3SGZRBDguFUxz4AzBcLk1SvJ10VqAaApauwVEK22UxHof8QINI
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
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

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKVGhlIFVnb29zIEFNMyBp
cyBhIHNtYWxsIHNldC10b3AgYm94IGJhc2VkIG9uIHRoZSBBbWxvZ2ljIFM5MTIgU29DLgoKICBo
dHRwczovL3Vnb29zLmNvbS91Z29vcy1hbTMtMTZnCgpBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCgpWMzoKLSBhZGQg
TWFydGluJ3MgUi1iIHRhZwoKVjI6Ci0gZml4IHZlbmRvciBuYW1lIGluIHBhdGNoIHN1YmplY3QK
LSBhZGQgS3J6eXN6dG9mJ3MgQUNLCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hbWxvZ2ljLnlhbWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1s
b2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2lj
LnlhbWwKaW5kZXggMDVlZGYyMmU2YzMwMzY4YmZlZTdiZTYxYmJiNGI2ODJiZmJjMWQ1ZS4uMmEw
OTZlMDYwZWQzZDMwZjI0M2QzOWI0NzgxN2QyYTVhMzYzNjFiMyAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKQEAgLTEzNSw2ICsx
MzUsNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgICAtIG1pbml4LG5lby11OWgKICAgICAg
ICAgICAgICAgLSBuZXhib3gsYTEKICAgICAgICAgICAgICAgLSB0cm9uc21hcnQsdmVnYS1zOTYK
KyAgICAgICAgICAgICAgLSB1Z29vcyxhbTMKICAgICAgICAgICAgICAgLSB2aWRlb3N0cm9uZyxn
eG0ta2lpaS1wcm8KICAgICAgICAgICAgICAgLSB3ZXRlayxjb3JlMgogICAgICAgICAgIC0gY29u
c3Q6IGFtbG9naWMsczkxMgoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
