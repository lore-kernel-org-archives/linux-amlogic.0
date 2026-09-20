Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52310C982E6
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbU9UFYTaN1TEXAygAZcqU/4L8chx2jQZYcjEpp5gbE=; b=SBeyW5dUItVA5x
	W8pXoNXtqOXLNRjLVE9q6T80mINApPX2ArkDVvisuiXFxCe9I3JuYO9+bzRykTWWQuWKXn6cc9Npu
	65z/Wts2R8Y8CIyzGF68Cdsr5P6eoi+KxAqcBQ5uHxNPtlCxJ9+4e5Evk17LzFzJgDJsHNtwcQmSK
	/OOvUwTjJhsGx6WknL7q27ErsEFk3/XzZH8ycOKJnaq8fv9mrPYJsvnz7UDo0AhOuhy1JhV26CYsj
	popfTnWCbRXaomYU/NRAB7MWe1GWHJg5y6u9BC6lS245ISCmFodZoR6uIIxYCuehNWveTWBwajCBR
	0XvGdiKju2alQzS1SQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FeE-0000000HM3G-2pEl;
	Sun, 20 Sep 2026 11:23:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FeD-0000000HM3A-2Irk
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 11:23:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A45F8601FD;
	Sun, 20 Sep 2026 11:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67771F000FF;
	Sun, 20 Sep 2026 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789903432;
	bh=yTChrhpeZ39+OM+x/SzyBKVkct9L7PNwz1loHtHe8i0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQzW4zNO8v/DJLquoxSJR+8PqnY3Gt7rEOIJB1eB3Q3kSzSh2hmLTwk+US2yEaYMU
	 E3isJUQpTnZCazk9F5cs11g2uQGoxMo0Tb0RkPdPpBipTurWk8q/p8+qGIjopNe/4c
	 W/PFRO3nybNVhQ5J/ot5P6+9H+HdiJayldAYkDrNhVUfaBxzvMDlR5X7+0fB8jQqmV
	 h9mHTa6UCLqHvKHpns/28hTgJsR4bXSY6ng231vJx5RnYaA41Rveduk4b1SahCfqJ6
	 bMFxL+hGeLZMfNwLpaCb1+1LIjVFDuhgmIdyM5xBwAwxYl62M2tmSdKMoU/JGtsmWH
	 7+fG1aCfYjJuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] nvmem: enable COMPILE_TEST for more drivers
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: linux-amlogic@lists.infradead.org, ojeda@kernel.org, gary@garyguo.net, Frank.Li@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260920111000.2404131-5-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
 <20260920111000.2404131-5-linkmauve@linkmauve.fr>
Date: Sun, 20 Sep 2026 11:23:51 +0000
Message-Id: <20260920112351.E67771F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10ga2NvbmZpZzogbWlzc2lu
ZyBIQVNfSU9NRU0gZGVwZW5kZW5jeSBmb3IgTU1JTyBudm1lbSBkcml2ZXJzIHVuZGVyIENPTVBJ
TEVfVEVTVAotLQoKY29tbWl0IDBmZjZiOWE1ZWJiYzBkMTE1ODlmMjJiMWQ2NTJmZmQxNDgzYjA3
MTgKQXV0aG9yOiBMaW5rIE1hdXZlIDxsaW5rbWF1dmVAbGlua21hdXZlLmZyPgpudm1lbTogZW5h
YmxlIENPTVBJTEVfVEVTVCBmb3IgbW9yZSBkcml2ZXJzCgpUaGlzIGNvbW1pdCBlbmFibGVzIENP
TVBJTEVfVEVTVCBmb3IgdGhyZWUgbnZtZW0gZHJpdmVycyAoTlZNRU1fUzMyR19PQ09UUCwKTlZN
RU1fU1VOWElfU0lELCBhbmQgTlZNRU1fWllOUU1QKSB0aGF0IHByZXZpb3VzbHkgZGVwZW5kZWQg
c3RyaWN0bHkgb24gdGhlaXIKdGFyZ2V0IGFyY2hpdGVjdHVyZXMuIFRoaXMgYWxsb3dzIHRoZSBk
cml2ZXJzIHRvIGJlIGJ1aWx0IGZvciBjb3ZlcmFnZSB0ZXN0aW5nCmFjcm9zcyBkaWZmZXJlbnQg
YXJjaGl0ZWN0dXJlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vS2NvbmZpZyBiL2Ry
aXZlcnMvbnZtZW0vS2NvbmZpZwo+IGluZGV4IGMzNmMyYTRjMmEwYjcuLmQzODA5N2Q2NjQ4YmQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udm1lbS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9udm1l
bS9LY29uZmlnCj4gQEAgLTM1NCw3ICszNTQsNyBAQCBjb25maWcgTlZNRU1fTklOVEVORE9fT1RQ
Cj4gIAo+ICBjb25maWcgTlZNRU1fUzMyR19PQ09UUAo+ICAJdHJpc3RhdGUgIlMzMkcgU29DIE9D
T1RQIHN1cHBvcnQiCj4gLQlkZXBlbmRzIG9uIEFSQ0hfUzMyCj4gKwlkZXBlbmRzIG9uIEFSQ0hf
UzMyIHx8IENPTVBJTEVfVEVTVAoKW1NldmVyaXR5OiBMb3ddCkRvZXMgYWRkaW5nIENPTVBJTEVf
VEVTVCBoZXJlIGV4cG9zZSB0aGlzIGRyaXZlciB0byBidWlsZCBlcnJvcnMgb24gCmFyY2hpdGVj
dHVyZXMgd2l0aG91dCBIQVNfSU9NRU0/CgpCZWNhdXNlIGNvbmZpZyBOVk1FTV9TMzJHX09DT1RQ
IGV4cG9zZXMgTU1JTyBvcGVyYXRpb25zLCBhIHVzZXIgY29uZmlndXJpbmcKdGhlIGtlcm5lbCB3
aXRoIENPTVBJTEVfVEVTVCBlbmFibGVkIG9uIGFuIGFyY2hpdGVjdHVyZSB0aGF0IGRvZXMgbm90
IHNlbGVjdApIQVNfSU9NRU0gKHN1Y2ggYXMgVXNlciBNb2RlIExpbnV4KSB3aWxsIGVuY291bnRl
ciBsaW5rZXIgZXJyb3JzLiBBZGRpbmcgYQpkZXBlbmRlbmN5IG9uIEhBU19JT01FTSB3b3VsZCBw
cmV2ZW50IHRoaXMgYnVpbGQgZmFpbHVyZS4KCj4gIAloZWxwCj4gIAkgIFRoaXMgaXMgYSBkcml2
ZXIgZm9yIHRoZSAnT0NPVFAnIHBlcmlwaGVyYWwgYXZhaWxhYmxlIG9uIFMzMkcKPiAgCSAgcGxh
dGZvcm1zLgoKWyAuLi4gXQoKPiBAQCAtNTE4LDcgKzUxOCw3IEBAIGNvbmZpZyBOVk1FTV9TVU5Q
TFVTX09DT1RQCj4gIAo+ICBjb25maWcgTlZNRU1fU1VOWElfU0lECj4gIAl0cmlzdGF0ZSAiQWxs
d2lubmVyIFNvQ3MgU0lEIHN1cHBvcnQiCj4gLQlkZXBlbmRzIG9uIEFSQ0hfU1VOWEkKPiArCWRl
cGVuZHMgb24gQVJDSF9TVU5YSSB8fCBDT01QSUxFX1RFU1QKCltTZXZlcml0eTogTG93XQpDYW4g
dGhpcyBjYXVzZSBhbiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIF9faW9yZWFkMzJfY29weSBkdXJp
bmcgdGhlIGJ1aWxkPwoKVGhlIE5WTUVNX1NVTlhJX1NJRCBkcml2ZXIgY2FsbHMgX19pb3JlYWQz
Ml9jb3B5KCkgaW4gc3VueGlfc2lkLmMuIFRoaXMKZnVuY3Rpb24gaXMgaW1wbGVtZW50ZWQgaW4g
bGliL2lvbWFwX2NvcHkuYywgd2hpY2ggaXMgb25seSBjb21waWxlZCBpZgpDT05GSUdfSEFTX0lP
TUVNIGlzIHNldC4gQ29tcGlsaW5nIHRoaXMgZHJpdmVyIHVuZGVyIENPTVBJTEVfVEVTVCBvbgph
cmNoaXRlY3R1cmVzIHdpdGhvdXQgSEFTX0lPTUVNIHJlc3VsdHMgaW4gYSBsaW5rZXIgZXJyb3Iu
IFNob3VsZCB0aGlzCmNvbmZpZyBhbHNvIGRlcGVuZCBvbiBIQVNfSU9NRU0/Cgo+ICAJaGVscAo+
ICAJICBUaGlzIGlzIGEgZHJpdmVyIGZvciB0aGUgJ3NlY3VyaXR5IElEJyBhdmFpbGFibGUgb24g
dmFyaW91cyBBbGx3aW5uZXIKPiAgCSAgZGV2aWNlcy4KClsgLi4uIF0KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjAxMTEwMDAu
MjQwNDEzMS0xLWxpbmttYXV2ZUBsaW5rbWF1dmUuZnI/cGFydD00CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
