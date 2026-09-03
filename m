Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F15AC624A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WN/uHEjBfM+zLmS0nEQDO133AHYPMxYygednL3SI7m8=; b=hzzuvaC5cP6Kmj
	Jmp39G072xKiFHcR1aY9soFeNmenapUMruTm7X8zIehxXUvLMX+kPWKJO/RQzLpBEOYkneuJEt5ej
	JBHH2x9VCxYFYsomTAW2Gf4dfswj8pUjjojvkr6hGwa5xvtKl5WQSMmcW8E0RTSXt+OirLwLYQm++
	R8G9xXN0mPbC8NGwUkio8gx8DMcIxZqrKvk1nnhTOTcUha7Y7UIo6hL/sfW9h17OlPNDffiUM4AfG
	jVkvT8q/gZ+EwJpAtQ9tW9RcZhOUz/bmcsBNH2Eh6XLma7OzSFpyEdeqvfhtqKsHwYeNSVNxU9MaU
	A4ndRdiznyMmya9k3Wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Hj-0000000Grna-2Ew2;
	Thu, 03 Sep 2026 08:59:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Hi-0000000GrnO-2E6j
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 08:59:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15E5140128;
	Thu,  3 Sep 2026 08:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD541F00A3A;
	Thu,  3 Sep 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425942;
	bh=FvHbdynlOcQ1qPX1bWqrLNnrHMx+Xq9NvBsf4ep63P8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNXGd0Ze54H+hl8RDqjw37hzz5/Ei1sHY/BpY0gPTbm0+U0wUPZ50TAFBxnaxnCa5
	 HaVjo6f8W/gOBuRjt5OSr3vjmfnAiCXotT1gH/CCn44n3Lw5eRfV8unnp9kwUn/Vsc
	 0j3NqS257vQRlJ6jGibYq9PIM5J4hut6A3rgdNwtaUrs4IeEytGzqHre8+jrUNXzPN
	 EpXyFQ4gJTHjw2xfX8UITeADvT0tEJe95NXqqJUgpayfSSfyQvehpdd8JOPKwZP/dn
	 G+c7gGSCtzhRMz9PsLH/+h/o98cZYkw2VqpOvc/B7hIIOfiutbGi/lq9XnknjrFuP9
	 cBvTIv5GnEwCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 08:59:01 +0000
Message-Id: <20260903085901.9CD541F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gTWFrZWZpbGUgZW50cmll
cyBhcmUgbm90IGFscGhhYmV0aWNhbGx5IHNvcnRlZC4KLS0KCmNvbW1pdCA3MGNjMzMwYTZiYzQz
YmQ1Y2ZkMzA1ZmU0NjMzNTY1ODdhMmU0YTdkCkF1dGhvcjogWXVDaGlhLUthbiA8cmFzcGJlcnJ5
a2FuQHN0dS5ocXUuZWR1LmNuPgoKYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIFhpYW9taSBNaSBC
b3ggNCBzdXBwb3J0CgpUaGlzIHBhdGNoIGFkZHMgaW5pdGlhbCBkZXZpY2UgdHJlZSBzdXBwb3J0
IGZvciB0aGUgWGlhb21pIE1pIEJveCA0LCB3aGljaCBpcwpiYXNlZCBvbiB0aGUgQW1sb2dpYyBT
OTA1TCBTb0MuIEl0IGVuYWJsZXMgdGhlIG1haW4gb24tYm9hcmQgcGVyaXBoZXJhbHMKaW5jbHVk
aW5nIGVNTUMsIFdpLUZpLCBIRE1JLCBVU0IsIGFuZCBhdWRpby4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9NYWtlZmlsZQo+IGluZGV4IDU3YmM0NDBmYTU1Y2MuLjlmMzU3ZGY1ZmM1NGUgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4gQEAgLTcyLDYgKzcyLDcgQEAg
ZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bC1zOTA1eC1uZXhib3gtYTk1eC5k
dGIKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bC1zOTA1eC1wMjEyLmR0
Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3hsLXM5MDV4LXZlcm80ay5k
dGIKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bHgtczkwNWwtcDI3MS5k
dGIKPiArZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bHgtbWlib3g0LmR0YgoK
W1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBicmVhayB0aGUgYWxwaGFiZXRpY2FsIHNvcnRpbmcg
b2YgdGhlIGR0YiBsaXN0PyBJdCBsb29rcyBsaWtlCm1lc29uLWd4bHgtbWlib3g0LmR0YiBzaG91
bGQgYmUgaW5zZXJ0ZWQgYmVmb3JlIG1lc29uLWd4bHgtczkwNWwtcDI3MS5kdGIgdG8KbWFpbnRh
aW4gdGhlIGNvcnJlY3Qgb3JkZXIgaW4gdGhlIE1ha2VmaWxlLgoKWyAuLi4gXQoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMy1t
aWJveDQtZHQtdjItMC1mYmU3YzA0NDcyYTdAc3R1LmhxdS5lZHUuY24/cGFydD0yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
