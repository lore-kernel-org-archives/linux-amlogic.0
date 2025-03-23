Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F53C28B30
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Mar 2025 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qwt+TBz56DCy57+A09nSdfhx6crYDQmMFXC2mLC164w=; b=d7n4Jb52WVygQh
	VMca8grFkh2sFXDaH01ZTJtMBHb4XsNXiX5DNqqbSlxNLLIW7Yl0ds/c7SuQifchi0xLcDWt+Gch2
	Y1M5IOiLvsxeB7NQoHBEQkc5qDFxsJLn5Zmq+8fDqu89ZBuI1J09VzK2L38djIk4I8CHw8p0BxUX5
	EWcGQQoirMRSyvRYP6c9128+KF2z0RlvpU5eChvhtBxSykl/KFgMn+bjAKTRRTnGjiGYALrZ42twx
	7JzPWzftuIuqcY/9/xzVkToJwb2FXapCWNKGZM5nQ8KAhlf/3uKdGIwDj71xKhNBGmlIlh6ZbuhlC
	wWZrMkWbOR0xRwyWvEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKdy-00000001CDp-2zNj;
	Sun, 23 Mar 2025 12:41:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKat-00000001Bm4-3Jc3;
	Sun, 23 Mar 2025 12:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DFA65C5D0B;
	Sun, 23 Mar 2025 12:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C6A9C4CEE2;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742733502;
	bh=jd9wYHpyu6ZnNxDkrFxMFeP4lePw1I2neHhddWVkDjo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ttew/u6nQgjsmZc1H9mSur13NYjaBgIn/ReJVcimK3/wybUxVdwjM+4wEHv6fXxy7
	 41Azx/0Crxal6TbG2QQSK7seb3qVxRoOqMohF+VdrA7LwxcUmBlQmF6L93enqmsEKT
	 /J4fd6wk+/R+ysOrgjgjM/Yk00vsWJT4KGNQ7DpGZd4BFCIzLX4o8bYhxuY1Wzrd7G
	 Y1Fi5w0w4NLZ4FKC2z/d5RcpfkG6KWoC1OkjmWPIAFUyReMHOiXFkQawmt0JOe1wwL
	 SFo3J3FMzl7HYh+KE/wq7If7jAwL/WC7aJLsOLm1+hujELvwg5ogLO4EmzpTBb/35j
	 Bvr4bY11Zk3TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24762C36002;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/3] Board support for Fernsehfee 3.0
Date: Sun, 23 Mar 2025 13:37:49 +0100
Message-Id: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ0A4GcC/x3MQQqAIBRF0a3IHydoIlFbiQZmz/wTC4UIxL0nD
 c/g3koFmVFoEZUyHi58pQ49CPLRpROSj24a1WiV0VYG5FQQAyB36xBmo7ybQD24MwK//2zdWvs
 Ay4jP+1wAAAA=
X-Change-ID: 20250315-fernsehfee-b5aef930ca7e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742733500; l=1063;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=jd9wYHpyu6ZnNxDkrFxMFeP4lePw1I2neHhddWVkDjo=;
 b=AMu+SEgV81icPPkhvIuoyn3r3e/kUZ9XHrbb3+w4UrKlZvVcnjOaV72cWbnRxz1Tq+ff46kXf
 HnZqH8mi1+GCDMiKMW7SNQtuKWKX4QVY/VSCHW+Icx2oN8iNGjFWRtI
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053823_867941_AE15234F 
X-CRM114-Status: UNSURE (   7.21  )
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
eTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KLS0tCkouIE5ldXNjaMOkZmVyICgz
KToKICAgICAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogQWRkIFRDIFVudGVyaGFsdHVu
Z3NlbGVrdHJvbmlrIEFHCiAgICAgIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6IEFkZCBUQ1Ug
RmVybnNlaGZlZSAzLjAgYm9hcmQKICAgICAgQVJNOiBkdHM6IGFtbG9naWM6IEFkZCBUQ1UgRmVy
bnNlaGZlZSAzLjAKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9n
aWMueWFtbCB8ICAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbCAgICAgICB8ICAgMiArCiBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAg
ICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uOC1m
ZXJuc2VoZmVlMy5kdHMgICB8IDIxOSArKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtL2Jv
b3QvZHRzL2FtbG9naWMvbWVzb244LmR0c2kgICAgICAgICAgICAgIHwgIDE4ICsrCiA1IGZpbGVz
IGNoYW5nZWQsIDI0MSBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogNDcwMWYzM2ExMDcw
MmQ1ZmM1NzdjMzI0MzRlYjYyYWRkZTBhMWFlMQpjaGFuZ2UtaWQ6IDIwMjUwMzE1LWZlcm5zZWhm
ZWUtYjVhZWY5MzBjYTdlCgpCZXN0IHJlZ2FyZHMsCi0tIApKLiBOZXVzY2jDpGZlciA8ai5uZUBw
b3N0ZW8ubmV0PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
