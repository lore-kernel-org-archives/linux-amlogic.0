Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD4CD5BB1
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sW5LHu6ynhLkxLhqGMbyyu6SMPGvgXAH+S3STyOc9r8=; b=KsM3ypo5AZh3AR
	jMj9i8W3ehw+uFxsf0JxZst8ynZK34no1nEqtGvtTROcN72udtyYgRDxnkI5/zxXbDJLMmq8hfz/+
	2JV9ohE8QGk2p1lATZx5LrVG/AfC1eLAHlyHwBFSRmUyGAd9CXuoNkA+6Ul3tuWq6ywvs/xUhtUCm
	5yX8Ac7Jfj41dd5AFZ+Uzs7twxwipA9w+jZaTTpHO/Wao6YD1nd2pptPUH7A6/WICdclUOjePKHKY
	EJPkPPFzcgMLIivOa7ERlkh8PqMIPKzB9Xs/qGmy4O2YjOeqC+uSJhTwyJ8N7PJqzgUO3nCWj++ne
	Aldi32zuVmMUVJjCDvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpOy-00000001hHW-10uv;
	Tue, 26 May 2026 10:52:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpOw-00000001hH2-42in
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 10:52:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01E0A600CB;
	Tue, 26 May 2026 10:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585C01F000E9;
	Tue, 26 May 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792765;
	bh=Gayi9SUsTHaaljxmB0CXDW0V4QlqAg6SFnjFuwGj9ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGo9aFEH/0oVDZm929buzHRtft77VXgPlo5o6gcRnubaGeCSOhPOPJTFVQWf/d9Jq
	 rJJOnLYGNqnWNbXAmQmxMFiV5wtclQWk7/oLkp4LokxrVmzmLJQvcChQ10R2rp4S4E
	 7R+klGoSYtrq9L6kkBfVNcJgf0n/sO9uPn/n4Fp0ljaY5IfCrkdy6HxKImu20BwV23
	 VocvUrtqU4mHw4PHUngvDlRZUfS4nhR/NrjL7OO3aCmqIXUcjyQGLePVSA/DdiUY4h
	 vkytVQS4cWyY99ES+75MTFf7i0kmeD1zDZ+MPbbN8Tx8airHky4tAkXLa7baXogGgS
	 wuasw6KK+xv0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 6/6] arm64: defconfig: Enable
 CONFIG_VIDEO_AMLOGIC_VDEC
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-6-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-6-33bc817f93f4@amlogic.com>
Date: Tue, 26 May 2026 10:52:44 +0000
Message-Id: <20260526105245.585C01F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gQ09ORklHX1ZJREVPX0FN
TE9HSUNfVkRFQyBzZWxlY3RzIE1FU09OX1NNIHdpdGhvdXQgc2F0aXNmeWluZyBpdHMgQVJNNjRf
NEtfUEFHRVMgZGVwZW5kZW5jeSwgY2F1c2luZyBLY29uZmlnIHdhcm5pbmdzIHVuZGVyIENPTVBJ
TEVfVEVTVCBvciB3aGVuIHVzaW5nIDE2Sy82NEsgcGFnZXMuCi0gW0xvd10gQ09ORklHX1ZJREVP
X0FNTE9HSUNfVkRFQyBpcyBpbnNlcnRlZCBtYW51YWxseSBvdXQgb2Ygb3JkZXIgaW4gYXJtNjQg
ZGVmY29uZmlnLgotLQoKY29tbWl0IDQ4MmExMTkyNzEyOGYzZTBhYTZiYTFjZTI1MTdkMjk3MjZh
ZjhmM2IKQXV0aG9yOiBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5jb20+Cgphcm02
NDogZGVmY29uZmlnOiBFbmFibGUgQ09ORklHX1ZJREVPX0FNTE9HSUNfVkRFQwoKVGhpcyBjb21t
aXQgZW5hYmxlcyB0aGUgQW1sb2dpYyBWNEwyIHN0YXRlbGVzcyB2aWRlbyBkZWNvZGVyIGRyaXZl
ciBhcyBhCm1vZHVsZSBpbiB0aGUgYXJtNjQgZGVmY29uZmlnLgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcK
PiBpbmRleCA0NTY3ZjRiMzRmMjkzLi4xNGNhYWMyNGQyMDA5IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQvY29uZmlncy9kZWZjb25maWcKPiArKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29u
ZmlnCj4gQEAgLTkxMyw2ICs5MTMsNyBAQCBDT05GSUdfVjRMX1BMQVRGT1JNX0RSSVZFUlM9eQo+
ICBDT05GSUdfU0RSX1BMQVRGT1JNX0RSSVZFUlM9eQo+ICBDT05GSUdfVjRMX01FTTJNRU1fRFJJ
VkVSUz15Cj4gIENPTkZJR19WSURFT19BTVBISU9OX1ZQVT1tCj4gK0NPTkZJR19WSURFT19BTUxP
R0lDX1ZERUM9bQoKW1NldmVyaXR5OiBMb3ddCkRvZXMgZW5hYmxpbmcgdGhpcyBjb25maWd1cmF0
aW9uIGV4cG9zZSBhIGRlcGVuZGVuY3kgaXNzdWUgaW4gdGhlIGRyaXZlcidzCktjb25maWc/CgpJ
biB0aGUgS2NvbmZpZyBkZWZpbml0aW9uIGZvciBWSURFT19BTUxPR0lDX1ZERUMgaW50cm9kdWNl
ZCBlYXJsaWVyIGluIHRoaXMKcGF0Y2hzZXQsIGl0IHVuY29uZGl0aW9uYWxseSB1c2VzIHNlbGVj
dCBNRVNPTl9TTS4gSG93ZXZlciwgTUVTT05fU00gaGFzIGEKc3RyaWN0IGRlcGVuZGVuY3kgb24g
QVJNNjRfNEtfUEFHRVMuCgpTZWxlY3RpbmcgYSBzeW1ib2wgd2l0aG91dCBtZWV0aW5nIGl0cyBk
ZXBlbmRlbmNpZXMgZm9yY2VzIGl0IG9uLCB3aGljaCBjYW4KdHJpZ2dlciB1bm1ldCBkaXJlY3Qg
ZGVwZW5kZW5jeSB3YXJuaW5ncyBkdXJpbmcgYnVpbGRzIG9uIGFyY2hpdGVjdHVyZXMgb3IKY29u
ZmlndXJhdGlvbnMgd2hlcmUgQVJNNjRfNEtfUEFHRVMgaXMgbm90IG1ldC4gVGhpcyBjYW4gaGFw
cGVuIG9uIG5vbi1BUk02NApDT01QSUxFX1RFU1QgYnVpbGRzIG9yIEFSTTY0IGJ1aWxkcyBjb25m
aWd1cmVkIHdpdGggMTZLIG9yIDY0SyBwYWdlcy4KCkNvdWxkIHRoZSBkcml2ZXIgdXNlIGRlcGVu
ZHMgb24gTUVTT05fU00gaW5zdGVhZCBvZiBzZWxlY3QgdG8gYXZvaWQKYnJlYWtpbmcgYXV0b21h
dGVkIEtjb25maWcgYnVpbGQgdGVzdGluZz8KCltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0IGEg
YnVnLCBidXQgd2FzIHRoaXMgZGVmY29uZmlnIGNoYW5nZSBnZW5lcmF0ZWQgdXNpbmcgbWFrZQpz
YXZlZGVmY29uZmlnPwoKSW4gdGhlIG1lZGlhIHBsYXRmb3JtIEtjb25maWcgaGllcmFyY2h5LCB0
aGUgQW1sb2dpYyBwbGF0Zm9ybSBLY29uZmlnIGlzCmluY2x1ZGVkIGJlZm9yZSB0aGUgQW1waGlv
biBwbGF0Zm9ybSBLY29uZmlnLiBSdW5uaW5nIG1ha2Ugc2F2ZWRlZmNvbmZpZwp3b3VsZCBuYXR1
cmFsbHkgcGxhY2UgQ09ORklHX1ZJREVPX0FNTE9HSUNfVkRFQyBiZWZvcmUKQ09ORklHX1ZJREVP
X0FNUEhJT05fVlBVLgoKTWFudWFsbHkgaW5zZXJ0aW5nIGl0IGFmdGVyIEFtcGhpb24gd2lsbCBj
YXVzZSB1bm5lY2Vzc2FyeSBjaHVybiB0aGUgbmV4dAp0aW1lIG1ha2Ugc2F2ZWRlZmNvbmZpZyBp
cyBleGVjdXRlZC4KCj4gIENPTkZJR19WSURFT19DQURFTkNFX0NTSTJSWD1tCj4gIENPTkZJR19W
SURFT19XQVZFX1ZQVT1tCj4gIENPTkZJR19WSURFT19FNTAxMF9KUEVHX0VOQz1tCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTI2
LWI0LXM0LXZkZWMtdXBzdHJlYW0tdjUtMC0zM2JjODE3ZjkzZjRAYW1sb2dpYy5jb20/cGFydD02
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
