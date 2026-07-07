Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA25AC44506
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZrXQYJAs1nunvTXDeQ7Wm35EAUvggUqGHYs9ewDP+0=; b=vffXOsks8eiOK6
	GjDkLJDkdx/pFtsbfboMw0fqVcEyGBbZO/bu7BoK6/10ux0K4rQudNo/p4BUtGSljY3Ax4BBhZU8Y
	8JR20L9yTsr2+8KDTmQ9cDs4c6qSJJ+PGwQ9dDx6sn7K7nZ+BJcg1isCMu5pR1tQrkVPleKn5dzqE
	cnt7ohoTq4BhdmSEd8xQId+ZV/IbuydGuZ6HUUqsBYOeg9whHZtxVg0PoqCDXuNY/hsHxJR+ITpIn
	VQW+YNJUNi0AgdZSyVMXJ0WMVs+OcVXHHpq8D+SishezI+DnVj7SF92WER/SxbXmJuqSbqj4vk47N
	vpI/NdrhpoiBLqdValYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WX-0000000F7Sh-0Awg;
	Tue, 07 Jul 2026 14:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WU-0000000F7Qm-19Pl
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 14:11:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B862360018;
	Tue,  7 Jul 2026 14:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8C11F000E9;
	Tue,  7 Jul 2026 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433501;
	bh=cJaCu3Jw52AiZ+LxMPFERxVwD1Nes7fUxaczBwh3T6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEFfCV8plDwefkSgToR9MrKDDNLnMPJFSrntnFY54/pwPAgoVIHUA54P4xMazqHqL
	 GrZzFzDALdf3oQnX0cZF2w01B4UvkfWga+5bS/kCdIwWw3n+l5Uw93Gq/Y21w6zxLN
	 3hXbHqZJeu0gp7640gZhay46cbj5zyWjMjuvGlxnI+MMcbUBGcObSLmVQhJG1BWJVY
	 oqC6Tzg419k08v/VC4vbm8kxt5/j4bSpR8gKvT1u3Dn4EWjZT9PZuiScgWHjfsgpmX
	 qcoPppoIii8VsSraIIy9xbIbeFc54EVDU9Fhh8vJ/sZVkaOUuECkhYNaPCCFid3ajg
	 O5PkbJ6fnEQMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 7/7] net: stmmac: qcom-ethqos: add support
 for sa8255p
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:11:40 +0000
Message-Id: <20260707141140.CA8C11F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gTWlzc2luZyByZWpl
Y3Rpb24gb2YgdW5zdXBwb3J0ZWQgUkdNSUkgUEhZIG1vZGVzIGluIGV0aHFvc19zY21pX3NldHVw
KCkKLS0KCmNvbW1pdCBjMzQzY2I4ZDM1OWUxNjQ4M2YzNTRmODliMjdmMmNkOWUzNTA1ODUwCkF1
dGhvcjogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNv
bW0uY29tPgoKbmV0OiBzdG1tYWM6IHFjb20tZXRocW9zOiBhZGQgc3VwcG9ydCBmb3Igc2E4MjU1
cAoKVGhpcyBjb21taXQgZXh0ZW5kcyB0aGUgcWNvbS1ldGhxb3MgZHJpdmVyIHRvIHN1cHBvcnQg
dGhlIHNhODI1NXAgbW9kZWwsCndoaWNoIGhhbmRsZXMgcG93ZXIgbWFuYWdlbWVudCBpbiBmaXJt
d2FyZSBvdmVyIFNDTUkuIEl0IGFkZHMgYSBuZXcgZW1hYwpkYXRhIHZhcmlhbnQgYW5kIGEgc2Vw
YXJhdGUgc2V0dXAgY2FsbGJhY2suCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+IGluZGV4IGYzNzk1NzBmODA2
ODAuLjQ3MTc1NjcwYTMyNjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKWyAuLi4gXQo+IEBAIC03NDks
NiArNzc1LDYyIEBAIHN0YXRpYyBpbnQgZXRocW9zX2hsb3Nfc2V0dXAoc3RydWN0IHFjb21fZXRo
cW9zICpldGhxb3MsCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIGNvbnN0IGNoYXIg
KmNvbnN0IGV0aHFvc19zY21pX3BkX25hbWVzW10gPSB7ICJjb3JlIiwgIm1kaW8iIH07Cj4gKwo+
ICtzdGF0aWMgaW50IGV0aHFvc19zY21pX3NldHVwKHN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9z
LAo+ICsJCQkgICAgIHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4gK3sK
WyAuLi4gXQo+ICsJc3dpdGNoIChldGhxb3MtPnBoeV9tb2RlKSB7Cj4gKwljYXNlIFBIWV9JTlRF
UkZBQ0VfTU9ERV8yNTAwQkFTRVg6Cj4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSToK
PiArCQlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IGV0aHFvc19maXhfbWFjX3NwZWVkX3NnbWlp
Owo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQlicmVhazsKCltTZXZlcml0eTogTWVkaXVt
XQpXaWxsIHRoaXMgc2lsZW50bHkgaWdub3JlIFJHTUlJIGFuZCBvdGhlciB1bnN1cHBvcnRlZCBQ
SFkgbW9kZXMgd2l0aG91dApyZXR1cm5pbmcgYW4gZXJyb3I/CgpJZiBhIG1pc2NvbmZpZ3VyZWQg
ZGV2aWNlIHRyZWUgc3BlY2lmaWVzIGFuIHVuc3VwcG9ydGVkIG1vZGUgbGlrZSBSR01JSSBmb3Ig
YW4KU0NNSS1iYXNlZCB2YXJpYW50LCBxY29tX2V0aHFvc19wcm9iZSgpIGFsbG93cyBpdCBnbG9i
YWxseSwgYnV0IHRoaXMgc2V0dXAKZnVuY3Rpb24gaW4gZHdtYWMtcWNvbS1ldGhxb3MuYyB3aWxs
IHNpbGVudGx5IGZhbGwgdGhyb3VnaCB0aGUgZGVmYXVsdCBjYXNlCndpdGhvdXQgY29uZmlndXJp
bmcgcGxhdF9kYXQtPmZpeF9tYWNfc3BlZWQgb3IgcmV0dXJuaW5nIC1FSU5WQUwuCgpDb3VsZCB0
aGlzIGxlYXZlIHRoZSBpbnRlcmZhY2UgaW4gYSBicm9rZW4gc3RhdGUgdGhhdCBpcyBkaWZmaWN1
bHQgdG8gZGVidWcsCnJhdGhlciB0aGFuIGZhaWxpbmcgcHJvYmUgZXhwbGljaXRseT8KCj4gKwl9
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MDYtcWNvbS1zYTgyNTVwLWVtYWMtdjEyLTAt
ZTNhYjFlY2YyOTAxQG9zcy5xdWFsY29tbS5jb20/cGFydD03CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
