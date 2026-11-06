Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4E606A326
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bF5EXnpU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1/9PKM9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0CyF+PSk1zhNwSajLRGwpgKZ1hEICEdwAV3MtqUIID0=; b=bF5EXnpU1THEOTarWjR6JPoWMk
	SmbihnAI7hfHxuxX+OA+qH1JxFFlJK9gk7pC5QYHHkJHu47LRWZIO3NCv6gVAgQ8LP/bq13gkZvM6
	uvvphzqSeoptpcT8S2Y7gI33OSN/cJhAdwZw4jiRcUxn3pWTc7Nipyp4wOZZtUyPVrNviZXSypMdl
	/0S8CNWD4vcKqtkQMf5SgJLP00oafT3qZoJjAVwEhgHBDNooJ5CO6RrMYXiqztzhEsEHTRoX3pHGp
	mZZngup3+NJNYrQIwwSyWtpVsaserCZ50wPWS/g873bHMea5kMyIaJaDMnnHAgekKpLhvEfnzl6vh
	uBfWjlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHaG-0000000C33h-0Wg4;
	Fri, 06 Nov 2026 10:54:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHaF-0000000C32R-0aVj
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:54:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95287601E3;
	Fri,  6 Nov 2026 10:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DA81F008A1;
	Fri,  6 Nov 2026 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962450;
	bh=E5K0K7vFwuaiVldhUkB3W66piNAnwDOGWt+Bwbq9N14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1/9PKM9y4Zjg7F7LmUB91b89kaW9modZxnE/+L1LhwqQVFmEU7xkKI4G1EOTx4uz
	 9bet7Oe+L72lawzxkgVQc8ZKH0TAbX9sWkMyFY6EmYdYXADLyFOM6HWe9xV6fo+EHd
	 w3G/qq4pQoRy9Ixza3xkT5spAKYkRYOSJSd2p/2BCwYNFYlY+S0Eul0xYd5yJNuvP+
	 ktmilag1W+Oxj7juNqISsfjYHe9CeMUoe2k8dU0/xL8aMHwVM9wom4BoxZ51lafiqE
	 BEVgYf6sdEg3IAvcmX3bBI9cuYIN0Ce14SDCVNwRnQ2wjLlvllGVCeEo5AyrN+AETb
	 gjIXXFPUiaGgQ==
Message-ID: <sashiko-outbox-201242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] arm64: dts: amlogic: meson-s4: use the S4 secure
 monitor compatible
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
Date: Fri, 06 Nov 2026 10:54:09 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gYXJtNjQ6IGR0czogYW1s
b2dpYzogbWVzb24tczQ6IHVuZG9jdW1lbnRlZCBhbmQgdW5oYW5kbGVkCiAgYW1sb2dpYyxtZXNv
bi1zNC1zbSBjb21wYXRpYmxlCi0tCgpjb21taXQgNzYxNDMwOGEzY2VmNmI5NDA2NDY1ODNhOWYy
NWE3YjQ0MzcyNDIyMgpBdXRob3I6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tv
ZXZlckBvdXRsb29rLmRlPgoKYXJtNjQ6IGR0czogYW1sb2dpYzogbWVzb24tczQ6IHVzZSB0aGUg
UzQgc2VjdXJlIG1vbml0b3IgY29tcGF0aWJsZQoKVGhpcyBjb21taXQgYWRkcyB0aGUgImFtbG9n
aWMsbWVzb24tczQtc20iIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRoZQpzZWN1cmUtbW9uaXRvciBu
b2RlIGluIHRoZSBNZXNvbiBTNCBkZXZpY2UgdHJlZSBpbmNsdWRlLgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+IGluZGV4IDU3MjcwZmJmYjRhNzMuLjc5M2M3
YmI5NTEyZWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LXM0LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRz
aQo+IEBAIC0xMzUsNyArMTM1LDcgQEAgeHRhbDogeHRhbC1jbGsgewo+ICAKPiAgCWZpcm13YXJl
IHsKPiAgCQlzbTogc2VjdXJlLW1vbml0b3Igewo+IC0JCQljb21wYXRpYmxlID0gImFtbG9naWMs
bWVzb24tZ3hiYi1zbSI7Cj4gKwkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1zbSIs
ICJhbWxvZ2ljLG1lc29uLWd4YmItc20iOwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgYWRkaW5n
ICJhbWxvZ2ljLG1lc29uLXM0LXNtIiBicmVhayBkdGJzX2NoZWNrIG9uIE1lc29uIFM0IGJvYXJk
cz8KCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9hbWxvZ2ljLG1l
c29uLWd4YmItc20ueWFtbCBvbmx5CnBlcm1pdHMgImFtbG9naWMsbWVzb24tZ3hiYi1zbSIgb3Ig
ImFtbG9naWMsbWVzb24tZ3gtc20iIGZvbGxvd2VkIGJ5CiJhbWxvZ2ljLG1lc29uLWd4YmItc20i
LiAgSW4gYWRkaXRpb24sIG1lc29uX3NtX2lkc1tdIGluCmRyaXZlcnMvZmlybXdhcmUvbWVzb24v
bWVzb25fc20uYyBvbmx5IG1hdGNoZXMgImFtbG9naWMsbWVzb24tZ3hiYi1zbSIgYW5kIG5vCmRy
aXZlciBpbiB0aGUgdHJlZSBoYW5kbGVzICJhbWxvZ2ljLG1lc29uLXM0LXNtIiBvciBpbXBsZW1l
bnRzIGFuIFM0CnBvd2VyLW9mZiBzZXF1ZW5jZS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDYxMDQ2NTkuNTQ2NTYtMS1jaHJp
c3RpYW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdD9wYXJ0PTQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
