Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE7EC5DF7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo+E6TUBmghfYotATof3cheETap+6tX80zLXiZjh2xc=; b=j4oJgJB5jCXf8u
	vL01fnbWisTXqup31KoB5q36JUS5GkaDp/PkEq++APra/FXH8NCFAw78rIwnGzdVrzupW6rOODlPa
	pnT6TPwitVN/+pnsS6FJkQW4THdbU007kkbHr/r8PK01/+0QO3fRqztxcUW1HbJUnO1UbJuewTWhM
	TJPAFsqU4X7zGyu7DB+mYrNLqfeHWFkB4OHRJSF91up08BEYniSwB67jH9i4E0xx4vHscEleKLvnT
	3ukU/wpU3lkiWnmgTGh+ZaLOxQcsRS5PfNQ17HxcuCJS6p0bRmB2/6GX9LLOXXwnffaihh43cSB8m
	AkgWDrOcaL9kQxctySPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK8W-0000000Ckts-1Trz;
	Fri, 21 Aug 2026 07:58:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK8V-0000000Cktg-1S9y
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:57:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B634E40420;
	Fri, 21 Aug 2026 07:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF551F000E9;
	Fri, 21 Aug 2026 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787299078;
	bh=X3MH+R5v/qXlFDCXfbXldRgr0OyBZKAdbht5rGYr3y0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XhpKF5Ge1bmRVpYxB/8RIrhHnNt69CCQzDr4+WfcK2nLwkSucyVb0k2AuPw5tQ7z7
	 jqY4Mvc3y/5La/CBpY9+qr/NAtdzd2Kaw2IKSB3Rzr6q8ijKZegGpagblrP7ruYDHR
	 HNucC3gOkTfUDKdRkYhHefFrg8xF0hbK50bXkm1Y2/POVes797Dk/TJn/ZTUmcfd4U
	 vOlbrioUaakUKmRA0FKmgQWMv1Lcb8EzMSmRLW+0dNOprIq/oLCCkKVq8vKiyoS2wI
	 R/VnA52d5L1uX8nrN0PTxAQVeMfqT0sEgoA+B5tjdRlwf27+Sf/MLtdmiv0PEMaR2/
	 e8rfuvwuGKJ9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
References: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
 <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
Date: Fri, 21 Aug 2026 07:57:57 +0000
Message-Id: <20260821075758.4BF551F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGNvbW1pdCBtZXNz
YWdlIGNvbnRhaW5zIGEgdHlwb2dyYXBoaWNhbCBlcnJvciwgcmVmZXJyaW5nIHRvIHRoZSBjbG9j
ayBhcyAncGxjaycgaW5zdGVhZCBvZiAncGNsaycuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0gg
djMgMS8yXSBkdC1iaW5kaW5nczogdGhlcm1hbDogYW1sb2dpYzogQWRkIEE5IHRoZXJtYWwgYmlu
ZGluZ3MgLS0tCmNvbW1pdCA0OWE0OTUxMzYyYjdkYWZmYTYzMTYzYmNkMDMzZjgwYzNjODM2Yjgz
CkF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpkdC1iaW5k
aW5nczogdGhlcm1hbDogYW1sb2dpYzogQWRkIEE5IHRoZXJtYWwgYmluZGluZ3MKCkRvY3VtZW50
IHRoZSB0aGVybWFsIGNvbnRyb2xsZXIgY29tcGF0aWJsZXMgZm9yIHRoZSBBbWxvZ2ljIEE5IFNv
Qy4gRGVzY3JpYmUKdGhlIHJlcXVpcmVkIGNvcmUgYW5kIHBjbGsgY2xvY2tzIGFuZCB1cGRhdGUg
dGhlIHNjaGVtYSBjb25zdHJhaW50cyBmb3IgdGhlCkE5LXNwZWNpZmljIHRoZXJtYWwgY29udHJv
bGxlcnMuCgo+IERlc2NyaWJlIHRoZSByZXF1aXJlZCAiY29yZSIgYW5kICJwbGNrIiBjbG9ja3Ms
IGFuZCB1cGRhdGUgdGhlIHNjaGVtYQo+IGNvbnN0cmFpbnRzIGZvciBBOS1zcGVjaWZpYyB0aGVy
bWFsIGNvbnRyb2xsZXJzLgoKW1NldmVyaXR5OiBMb3ddClRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0
aGVyZSBpcyBhIHR5cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGUgY29tbWl0Cm1lc3NhZ2Ug
cmVmZXJzIHRvIHRoZSBjbG9jayBhcyAicGxjayIsIHdoaWxlIHRoZSBiaW5kaW5nIHNjaGVtYSBj
b3JyZWN0bHkKZGVmaW5lcyBpdCBhcyAicGNsayIuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODIxLWE5LXRoZXJtYWwtdjMtMC0w
ZTdhYmYzOTQxZTNAYW1sb2dpYy5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
