Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE1606A323
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2026 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFsqdXUo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvB/lWrP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nbA3vZdA3KnqvqZw1dlhDrIVo3Po9h5UgjuFKORHWQ4=; b=YFsqdXUo545TgfQd/t5N7cZxwt
	0AQ/7b0x1TbTrzFBd6OtQ4lYmejqN6Cpi5P8Rs3yImp8uQZpSFFmFZjclp7ylj0r4oDBunICTQlu6
	qw7qhz2zN53Gbw1mBWUOBrJV0OlCGUia2jQCSewLOHNUDT6oTNkjKCvrvDmzaNBw/jIcWAV6OK9vc
	Y6va37RVfwoiW9KgX2yWisdhYMNl6ibhmY8rOunK69RlzgFr3IpGOZGz3n4Sv7FcYtpVsyqy6xs8f
	p9s7EZsZeQLKFpNzRQCkWXRhgQEHtKFcRlSgFSaRu/e8QOH92ny3Xktr0wDFDv2dr/HWKXJ5xlyZE
	9LNPBHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMC8-0000000GqJh-1zqU;
	Sat, 14 Nov 2026 22:26:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMC8-0000000GqJZ-0G6q
	for linux-amlogic@lists.infradead.org;
	Sat, 14 Nov 2026 22:26:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A1A8609EF;
	Sat, 14 Nov 2026 22:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A783C1F000C4;
	Sat, 14 Nov 2026 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794695158;
	bh=l9Lktmad6aldki3CP7RDALK/ehOQCSYds+PrMiE3D5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvB/lWrP8v9GcrrvW2Pmr7ajGncTAtJRvRNVqAIdoTC5ufisV0JhTH16UXpW24N8+
	 sJJlpNUzSLtD4npePslI5AuNA7hlRj8RjpAyigEieVZIjwBfQlR3Lnc7Ih9maYLEz7
	 0badfCwHVupXpbyGvpP5l8eZGtZMw9XuCdu9i1snV5AZlYJR2C7de+qDFC/8vkYR9X
	 qfZiBQlqj/hIv4q4LGve5BASwhvCpMIX94RSdCTogCCYBYfLuicaaN9ChPTlW07b8N
	 tFbNvkDjjutSvk/INxNaAIkAGaVPnDJ33V4BdQ2c4iL+CvV7vZXO6rnPBEEyecstW/
	 qE5JsAO1pGLpg==
Message-ID: <sashiko-outbox-215064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] PCI: meson: Add system suspend/resume support
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261114-b4-pci-meson-suspend-v1-2-be3d04a13304@iav.lv>
References: <20261114-b4-pci-meson-suspend-v1-0-be3d04a13304@iav.lv>
 <20261114-b4-pci-meson-suspend-v1-2-be3d04a13304@iav.lv>
Date: Sat, 14 Nov 2026 22:25:58 +0000
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
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBQQ0k6IG1lc29u
OiBhY2NpZGVudGFsIGNsZWFyaW5nIG9mIFcxQyBiaXRzIGluIERldmljZSBTdGF0dXMKICByZWdp
c3RlciBbMV0KLS0KCmNvbW1pdCBmN2E1Y2ZmODNjZTIwZGQ5MzZmNzAxODE3ZmFhODIzMDM3OWFi
M2FkCkF1dGhvcjogSWdvciBWZWxrb3YgPGlhdkBpYXYubHY+CgpQQ0k6IG1lc29uOiBBZGQgc3lz
dGVtIHN1c3BlbmQvcmVzdW1lIHN1cHBvcnQKClRoaXMgY29tbWl0IGFkZHMgbm9pcnEgc3VzcGVu
ZCBhbmQgcmVzdW1lIGNhbGxiYWNrcyBmb3IgdGhlIEFtbG9naWMgTWVzb24KUENJZSBjb250cm9s
bGVyIHdoZW4gYXR0YWNoZWQgdG8gYSBwb3dlciBkb21haW4sIGFsb25nIHdpdGggYQoucG1lX3R1
cm5fb2ZmIGNhbGxiYWNrIGFuZCBwb3dlciBzdGF0ZSB0cmFja2luZyBhY3Jvc3MgaG9zdCBpbml0
IGFuZApkZWluaXQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbWVzb24uYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gaW5k
ZXggNjI3NDcwYzgzYmI1ZC4uNWVmNzM2OWJiMjFiZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaS1tZXNvbi5jCgpbIC4uLiBdCgo+IEBAIC0zODUsNiArMzg5LDggQEAgc3RhdGlj
IGludCBtZXNvbl9wY2llX2hvc3RfaW5pdChzdHJ1Y3QgZHdfcGNpZV9ycCAqcHApCj4gIAkJcmV0
dXJuIHJldDsKPiAgCX0KPiAgCj4gKwltcC0+cG93ZXJlZCA9IHRydWU7Cj4gKwo+ICAJcHAtPmJy
aWRnZS0+b3BzID0gJm1lc29uX3BjaV9vcHM7Cj4gIAo+ICAJbWVzb25fc2V0X21heF9wYXlsb2Fk
KG1wLCBNQVhfUEFZTE9BRF9TSVpFKTsKCltTZXZlcml0eTogTWVkaXVtXQpUaGlzIHByb2JsZW0g
d2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNhbgptZXNvbl9zZXRfbWF4X3Bh
eWxvYWQoKSBhbmQgbWVzb25fc2V0X21heF9yZF9yZXFfc2l6ZSgpIGluYWR2ZXJ0ZW50bHkKY2xl
YXIgd3JpdGUtMS10by1jbGVhciBzdGF0dXMgYml0cyBpbiBQQ0lfRVhQX0RFVlNUQSBbMV0gd2hl
bgptZXNvbl9wY2llX2hvc3RfaW5pdCgpIHJ1bnMgb24gcHJvYmUgYW5kIHJlc3VtZT8KCmRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jOm1lc29uX3NldF9tYXhfcGF5bG9hZCgp
IHsKICAgIC4uLgoJdmFsID0gZHdfcGNpZV9yZWFkbF9kYmkocGNpLCBvZmZzZXQgKyBQQ0lfRVhQ
X0RFVkNUTCk7Cgl2YWwgJj0gflBDSV9FWFBfREVWQ1RMX1BBWUxPQUQ7Cglkd19wY2llX3dyaXRl
bF9kYmkocGNpLCBvZmZzZXQgKyBQQ0lfRVhQX0RFVkNUTCwgdmFsKTsKCgl2YWwgPSBkd19wY2ll
X3JlYWRsX2RiaShwY2ksIG9mZnNldCArIFBDSV9FWFBfREVWQ1RMKTsKCXZhbCB8PSBQQ0lFX0NB
UF9NQVhfUEFZTE9BRF9TSVpFKG1heF9wYXlsb2FkX3NpemUpOwoJZHdfcGNpZV93cml0ZWxfZGJp
KHBjaSwgb2Zmc2V0ICsgUENJX0VYUF9ERVZDVEwsIHZhbCk7Cn0KCkJvdGggaGVscGVycyBwZXJm
b3JtIDMyLWJpdCByZWFkLW1vZGlmeS13cml0ZSBhY2Nlc3NlcyBhdCBvZmZzZXQgKwpQQ0lfRVhQ
X0RFVkNUTCwgd2hpY2ggaW5jbHVkZXMgdGhlIDE2LWJpdCBQQ0lfRVhQX0RFVlNUQSByZWdpc3Rl
ciBpbiB0aGUKdXBwZXIgaGFsZiBvZiB0aGUgd29yZC4gIFdyaXRpbmcgYmFjayAxcyByZWFkIGZy
b20gUENJX0VYUF9ERVZTVEEgY2xlYXJzCnBlbmRpbmcgY29ycmVjdGFibGUgb3Igbm9uLWZhdGFs
IGVycm9yIHN0YXR1cyBiaXRzLCBhbmQgdXNpbmcKZHdfcGNpZV9yZWFkd19kYmkoKSBhbmQgZHdf
cGNpZV93cml0ZXdfZGJpKCkgd291bGQgYXZvaWQgdG91Y2hpbmcKUENJX0VYUF9ERVZTVEEuCgpb
MV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC02MDdkNGUyOS03MzE4LTQ5YjEtYTdj
My1jOTFhNGM0ZjI2YTAKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTQtYjQtcGNpLW1lc29uLXN1c3BlbmQtdjEtMC1iZTNkMDRh
MTMzMDRAaWF2Lmx2P3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
