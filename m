Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B3BC54FDF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2026 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmBTVWuhS7+N5bRII/kHnzABs0RbJh9PJXmQivUfEsY=; b=qnbSEHtXSL/h2Y
	OwMOA7CGkQndMiLH7kY4Diu8qrI6Nls9pDZyTIe1P0WaeEs66FSHEm4HRMjtB5JHHlpCexqv35bKP
	rariAAGpy4TJHL5KSG4rKQ84O7pY9sn7qAa61LYZWNMWKiF0hbJjNd7vpce7TpKzfKxXn0Ig4qfK7
	dSaHhud0EYW2twmxW1fYGzoUgTUZNEooaaM8fT4FWqqxoQ01sRaMBjRStHtuem03ABbWzMmuNQvpJ
	H02+NS37+Si0HvO+rHdMnGYVQkRyq/N7GrmciglqQyuMuJ3yU6vP+mouzg5hFF1udlAx09oRvL2Xw
	uWJyHq8uD3U1SQlG3NJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMIx-00000009tpB-15UH;
	Thu, 30 Jul 2026 08:39:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMIw-00000009tp4-1xJi
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Jul 2026 08:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 301EE408F0;
	Thu, 30 Jul 2026 08:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0351F000E9;
	Thu, 30 Jul 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785400790;
	bh=I5neRnxEJg/Y2z91Wkid8tiwafceSy3HKtSxVnoN0ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGs1FrGdUvznQV+Xag8MOGxayJdIoK4dTnwRXRkiBLN9KhBoa28127TFx+krwkfKl
	 47/R+Bu3eipwNAaxg7oegtLekbGGHdjlwqv+3emkeUu8YIHYjVL8knFHhGJdiVqak8
	 mIWnC/0/3lIHLbsEtu0edqlUWGumddILgIYx4JYGGm+te9pYA9fVQ/tXMBmlr4jTiv
	 KyegLQkc4i+I0NYYa+xCSZwVoQZSzXOfI88K9TCX6c2Pv5QBkSefbUJoSETNYJdkT2
	 pcMd5XkeG3BM20wxfPL2jnnv8LZwqIImcPZihaTEOPhNTb1/ei6QERXq9MX/tsoASf
	 +NX1HiJ5ES5qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260730-a9-thermal-v1-1-d786d37cba58@amlogic.com>
References: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
 <20260730-a9-thermal-v1-1-d786d37cba58@amlogic.com>
Date: Thu, 30 Jul 2026 08:39:49 +0000
Message-Id: <20260730083949.AE0351F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVHlwbyBpbiB0aGUgWUFN
TCBzY2hlbWEgYGVsc2VgIGJsb2NrOiBgY2xvY2tzLW5hbWVzOiBmYWxzZWAgaW5zdGVhZCBvZiBg
Y2xvY2stbmFtZXM6IGZhbHNlYCBmYWlscyB0byBmb3JiaWQgdGhlIHByb3BlcnR5IGZvciBub24t
QTkgZGV2aWNlcy4KLS0KCi0tLSBQYXRjaCBbMV06IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiB0
aGVybWFsOiBhbWxvZ2ljOiBBZGQgQTkgdGhlcm1hbCBiaW5kaW5ncyAtLS0KY29tbWl0IDNhM2M1
YjFmN2I2NWY0ZDg2MDY4ZGVkYTc2YmUxYjcxNDExNzBiOGMKQXV0aG9yOiBYaWFud2VpIFpoYW8g
PHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KCmR0LWJpbmRpbmdzOiB0aGVybWFsOiBhbWxvZ2lj
OiBBZGQgQTkgdGhlcm1hbCBiaW5kaW5ncwoKVGhpcyBjb21taXQgZG9jdW1lbnRzIHRoZSB0aGVy
bWFsIGNvbnRyb2xsZXIgY29tcGF0aWJsZXMgZm9yIHRoZSBBbWxvZ2ljCkE5IFNvQy4gSXQgZGVz
Y3JpYmVzIHRoZSBjb3JlIGFuZCBwY2xrIGNsb2NrcywgYWRkcyBhIGhhcmR3YXJlIHJlc2V0CnRl
bXBlcmF0dXJlIHByb3BlcnR5LCBhbmQgdXBkYXRlcyBzY2hlbWEgY29uc3RyYWludHMuCgo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxv
Z2ljLHRoZXJtYWwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVy
bWFsL2FtbG9naWMsdGhlcm1hbC55YW1sCj4gaW5kZXggOGNmYTQ0ZGNkYTU4Yy4uNWY1ZGM2ZjEy
ODUxZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhl
cm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhlcm1hbC55YW1sCgpbIC4uLiBdCgo+IEBAIC03
Myw2ICs4NCwyMiBAQCBhbGxPZjoKPiAgICAgICAgcmVxdWlyZWQ6Cj4gICAgICAgICAgLSBhbWxv
Z2ljLHNlY3VyZS1tb25pdG9yCj4gIAo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4g
KyAgICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAg
ICBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxhOS10aGVybWFsCj4gKyAgICB0aGVu
Ogo+ICsgICAgICByZXF1aXJlZDoKPiArICAgICAgICAtIGNsb2NrLW5hbWVzCj4gKyAgICBlbHNl
Ogo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNsb2NrczoKPiArICAgICAgICAgIG1h
eEl0ZW1zOiAxCj4gKyAgICAgICAgY2xvY2tzLW5hbWVzOiBmYWxzZQoKW1NldmVyaXR5OiBMb3dd
CkRvZXMgdGhpcyBjb2RlIGludGVuZCB0byByZXN0cmljdCB0aGUgY2xvY2stbmFtZXMgcHJvcGVy
dHkgaGVyZT8gSXQgYXBwZWFycwp0aGVyZSBpcyBhIHR5cG8gaW4gdGhlIHByb3BlcnR5IG5hbWUg
KGNsb2Nrcy1uYW1lcyBpbnN0ZWFkIG9mIGNsb2NrLW5hbWVzKS4KQ291bGQgdGhpcyB0eXBvIGFs
bG93IG5vbi1BOSB2YXJpYW50cyB0byBkZWZpbmUgdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5Cndp
dGhvdXQgZmFpbGluZyBzY2hlbWEgdmFsaWRhdGlvbj8KCj4gKyAgICAgICAgYW1sb2dpYyxody1y
ZXNldC10ZW1wOiBmYWxzZQo+ICsKPiAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICAK
PiAgZXhhbXBsZXM6CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwNzMwLWE5LXRoZXJtYWwtdjEtMC1kNzg2ZDM3Y2JhNThAYW1sb2dp
Yy5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
