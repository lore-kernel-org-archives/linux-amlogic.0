Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A0606B965
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rbp8InMj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JOzeonYD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iZ2PSDgglited+1TQpk4wf/jYYr23YGj+Gbm4V52E3Y=; b=rbp8InMjABnboIMc0q2WdVhkVt
	4TG1S4gUtyWO/7fTbRPh9GeI5ACjTaM97kH46SxqFD3WJXNpNA252yqfVVGAtFTJQzQZ9QTlxI4Gu
	WABtAofwaVdgDJnacUATmPZNXzHHsbo8O7uZ+YI8PbUzPz2ljZ7oOWgYhD7CSnlG1F6MEoHu9ey2f
	6Cy6Z9EaKo4vdLXN0lMYtxeil3heKHfRitqs1SynVCJQUZqUzJEdvdVuvBaoi3pb3jOerKcxg0fmY
	1krPwb2Un4GoKC4zOJCMBCZHwoiLblYO74ZMQ+wWf7NhYx8+QxDXAySeRgwT/j6l9Yh5JX2VOXZik
	RZ0kbPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkJF-0000000BTbk-1pBZ;
	Fri, 30 Oct 2026 10:58:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkJD-0000000BTba-3rFU
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 10:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17EF540F3E;
	Fri, 30 Oct 2026 10:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCE71F000C1;
	Fri, 30 Oct 2026 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357887;
	bh=ZQ89vXgB1TrUWvEfIhW+c+p7R38YEkwskGy3wdZfINs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOzeonYDU8Qzt6kJeeywRtZ5GmkGvxjGt25W1f/N/nDroDAC4opbFBaquXqR4CneM
	 se1Hu7PoIV2+vZMkiNp6DK0zVKPMIolC0IDgAT4WieFad1hfm0tDeISa8af61NpXQA
	 aARFxg59ZdGM448PxMxraPmygrDyai9XoaJx3T/r6p+75hy36l9OYxmMq++r8KXdBb
	 30RYiwrTMkns3r9IPhdnKMg/7Lfd/GFi9Be213d7An2JwyyKPmA/2pQp0uxsIPTQ0Z
	 9tq/M/SuiH7hjO4gP7ChAwT42it7SdJpaSBa5fqHd3IcdwFDMgk4jARddgO+6voSdf
	 MWwq86yYBzJuQ==
Date: Fri, 30 Oct 2026 11:58:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/3] thermal/drivers/amlogic: add S4 support
Message-ID: <20261030-funny-ibex-of-modernism-b995fe@quoll>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192244.209256-3-christian.koever-draxl@student.uibk.ac.at>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjI6NDNQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIFM0IENQVSBzZW5z
b3IgcmVhZHMgaXRzIGNhbGlicmF0aW9uIHRocm91Z2ggdGhlIHNlY3VyZSBtb25pdG9yIGFuZAo+
IG90aGVyd2lzZSBtYXRjaGVzIHRoZSBUNyBzZXR1cCwgc28gcmV1c2UgdGhlIFQ3IGRhdGEgZm9y
IGl0LgoKU28gaXMgaXQgb3IgaXMgaXQgbm90IGNvbXBhdGlibGUgd2l0aCBUNz8KPiAKPiBXaXRo
b3V0IHRoZSBjYWxpYnJhdGlvbiB0aGUgZHJpdmVyIHJlcG9ydGVkIGFib3V0IC0xNDQgZGVncmVl
cyBDZWxzaXVzCj4gb24gYW4gUzkwNVcyIGJvYXJkOyB3aXRoIGl0IHRoZSByZWFkaW5ncyBhcmUg
cGxhdXNpYmxlIGFuZCBDUFUKPiB0aHJvdHRsaW5nIGVuZ2FnZXMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4g
LS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyB8IDQgKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhl
cm1hbC9hbWxvZ2ljX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwu
Ywo+IGluZGV4IDYwNzI4ZGU2OTY4YS4uYzU4YmFjNjMzYmVkIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJtYWwuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9hbWxv
Z2ljX3RoZXJtYWwuYwo+IEBAIC0yOTIsNiArMjkyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG9mX2FtbG9naWNfdGhlcm1hbF9tYXRjaFtdID0gewo+ICAJCS5jb21wYXRp
YmxlID0gImFtbG9naWMsYTEtY3B1LXRoZXJtYWwiLAo+ICAJCS5kYXRhID0gJmFtbG9naWNfdGhl
cm1hbF9hMV9jcHVfcGFyYW0sCj4gIAl9LAo+ICsJewo+ICsJCS5jb21wYXRpYmxlID0gImFtbG9n
aWMsczQtY3B1LXRoZXJtYWwiLAo+ICsJCS5kYXRhID0gJmFtbG9naWNfdGhlcm1hbF90N19wYXJh
bSwKPiArCX0sCj4gIAl7CgpUaGlzIGNsZWFybHkgc3VnZ2VzdHMgdGhleSBhcmUgY29tcGF0aWJs
ZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
