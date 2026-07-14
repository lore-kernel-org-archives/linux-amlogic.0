Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EADC44508
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWDoLPxAIhV3TekbAgM5+oqniIgFj9VKOWOx2fgSDJk=; b=t69gvnY3FB4z7G
	kpph5u33OWy3PJ95miREos+CIKtW30zoN2230nPvDwsI7V+wMUJEm/m57Egm45Bwznf5yCVriMh9c
	JyNWMhyOYBWaoOkovP26ATCWhWnaN5Ubc2RwSFYodthr9AYO7LR+KvCdkGUnXRcPZtCyiylpDaJbc
	Ef9xeYJRODT0JZY/qm7AaLPeHWcHRFwssLsO1m6XqCBNtAdF51nZrqfbbHT4LYivT5P0mqBZhx9oY
	ySm311sxeANYJXhrd1VCtq+iPuuIvUw9mSwHgkGkQpd68bicIeURBmGgKAo7M53eHU7LLVCmnkorq
	7BnAEkjar8wTwNC4voZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfH8-0000000CZK1-49CH;
	Tue, 14 Jul 2026 15:42:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfH7-0000000CZJL-3TsX
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 15:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9588341A34;
	Tue, 14 Jul 2026 15:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BCA1F00A3A;
	Tue, 14 Jul 2026 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043745;
	bh=oo7FF33HGvM0uQdGUTkwrzcFjJf9/6hKdsBWusFY6yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8RTxB2SRElnUcvuV6QpzErYLyxNviVq7+zBy+f8OSOIYZ19aWJM5LybY+wcIxk1/
	 bJPjL4zMWEF3HXJ91t+7NNrbq11PncbqOr6MROzuJBXiaX8RE93SoywDTofrNCHmKw
	 XAK1ShZxR8CHlpFzCIOAHThvOrUEFFgMu++eJBUNuNugoDutDztYuWicl2Uw8mxvrM
	 7YyukQXr8W1MbqDRa7jRQwa+y2344paxJ3lrPy/t2/+/VesQ+yWJHTv+kRnSOaPT5i
	 KRo8DfxJrtdqoTra9KXsNnag+zbWU2DF89MBw5tvlKpT82ctouOTh37NBJwme9bbbI
	 QEelLzIkXmaIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:42:24 +0000
Message-Id: <20260714154224.E7BCA1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVwZGF0aW5nIGBldGhx
b3MtPnBoeV9tb2RlYCBiZWZvcmUgY2xlYXJpbmcgdGhlIFNHTUlJIGxvb3BiYWNrIGNhdXNlcyB0
aGUgbG9vcGJhY2sgdG8gcmVtYWluIGVycm9uZW91c2x5IGVuYWJsZWQgd2hlbiBzd2l0Y2hpbmcg
YXdheSBmcm9tIDI1MDBCQVNFLVguCi0tCgotLS0gUGF0Y2ggWzZdOiBbUEFUQ0ggbmV0LW5leHQg
djEzIDA2LzEwXSBuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6IHVwZGF0ZSBwaHlfbW9kZSB0byB0
aGUgcmVzb2x2ZWQgaW50ZXJmYWNlIGluIG1hY19maW5pc2goKSAtLS0KY29tbWl0IDNkZmQ2NjYz
Zjc1OWMxMGMyNDY1OWI1Mjc1Yjg4ZmY1Zjk3NmI0MjAKQXV0aG9yOiBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+CgpuZXQ6IHN0bW1hYzog
cWNvbS1ldGhxb3M6IHVwZGF0ZSBwaHlfbW9kZSB0byB0aGUgcmVzb2x2ZWQgaW50ZXJmYWNlIGlu
IG1hY19maW5pc2goKQoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgZHJpdmVyIHRvIG92ZXJ3cml0
ZSBldGhxb3MtPnBoeV9tb2RlIHdpdGggdGhlCnJlc29sdmVkIHBoeWxpbmsgaW50ZXJmYWNlIGR1
cmluZyB0aGUgbWFjX2ZpbmlzaCgpIGNhbGxiYWNrLiBUaGlzIGVuc3VyZXMKdGhlIHN0b3JlZCBt
b2RlIG1hdGNoZXMgcnVudGltZSBjaGFuZ2VzIGluc3RlYWQgb2YgYmVpbmcgcGVybWFuZW50bHkg
c3R1Y2sKYXQgdGhlIGRldmljZSB0cmVlIGRlZmF1bHQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+IGluZGV4
IDQ3YjcwYjVlNzA2ZjIuLjlkMTkyMDNhZTRiZDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKPiBAQCAt
NjMyLDYgKzYzMiwxMiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdiwKPiAgCXN0cnVjdCBxY29tX2V0aHFvcyAq
ZXRocW9zID0gcHJpdjsKPiAgCWludCByZXQgPSAwOwo+ICAKPiArCS8qIFRoZSBpbnRlcmZhY2Ug
bW9kZSBpcyBvbmx5IGtub3duIG9uY2UgcGh5bGluayBoYXMgcmVzb2x2ZWQgaXQgYW5kCj4gKwkg
KiBtYXkgY2hhbmdlIGF0IHJ1bnRpbWUsIHNvIGtlZXAgaXQgaW4gc3luYyBmb3IgbGF0ZXIKPiAr
CSAqIHNlcmRlc19wb3dlcnVwKCkvc2VyZGVzX3Bvd2VyZG93bigpIGNhbGxzLgo+ICsJICovCj4g
KwlldGhxb3MtPnBoeV9tb2RlID0gaW50ZXJmYWNlOwo+ICsKPiAgCXFjb21fZXRocW9zX3NldF9z
Z21paV9sb29wYmFjayhldGhxb3MsIGZhbHNlKTsKCltTZXZlcml0eTogSGlnaF0KRG9lcyB1cGRh
dGluZyBldGhxb3MtPnBoeV9tb2RlIGhlcmUgcHJldmVudCB0aGUgbG9vcGJhY2sgZnJvbSBiZWlu
ZyBkaXNhYmxlZD8KCklmIHRoZSBsaW5rIG5lZ290aWF0ZXMgZnJvbSAyNTAwQkFTRS1YIGRvd24g
dG8gU0dNSUksIHRoaXMgdXBkYXRlIGNoYW5nZXMKZXRocW9zLT5waHlfbW9kZSB0byBTR01JSSBi
ZWZvcmUgdGhlIGxvb3BiYWNrIGlzIGRpc2FibGVkLgoKTG9va2luZyBhdCBxY29tX2V0aHFvc19z
ZXRfc2dtaWlfbG9vcGJhY2soKSwgaXQgY2hlY2tzIHRoZSBjdXJyZW50IG1vZGUgdG8KZGV0ZXJt
aW5lIGlmIGl0IG5lZWRzIHRvIGFjdDoKCnFjb21fZXRocW9zX3NldF9zZ21paV9sb29wYmFjaygp
IHsKICAgIGlmICghZXRocW9zLT5uZWVkc19zZ21paV9sb29wYmFjayB8fAogICAgICAgIGV0aHFv
cy0+cGh5X21vZGUgIT0gUEhZX0lOVEVSRkFDRV9NT0RFXzI1MDBCQVNFWCkKICAgICAgICAgICAg
cmV0dXJuOwogICAgLi4uCn0KCldpbGwgdGhpcyBjYXVzZSB0aGUgZnVuY3Rpb24gdG8gcmV0dXJu
IGVhcmx5IHdpdGhvdXQgY2xlYXJpbmcgdGhlIGxvb3BiYWNrCndoZW4gc3dpdGNoaW5nIGF3YXkg
ZnJvbSAyNTAwQkFTRS1YLCBsZWF2aW5nIG91dGdvaW5nIHBhY2tldHMgcmVmbGVjdGVkCmludGVy
bmFsbHkgaW5zdGVhZCBvZiB0cmFuc21pdHRpbmcgdG8gdGhlIHdpcmU/CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzEzLXFjb20t
c2E4MjU1cC1lbWFjLXYxMy0wLTExOWY4Njk5ZWY4ZUBvc3MucXVhbGNvbW0uY29tP3BhcnQ9NgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
