Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FAE606A31B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rEnfvWxB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hld8DjiF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Q1OlPkJ+D2oVJAg8myIldLMaKd0T140ks90dAxT7As=; b=rEnfvWxBooSGeRCrf8flLD3HbU
	wsm4bMZhUd7oOmryG75FRenDgRVSa1GVYbECvnIaReAJTSSzTp+uwiRkb5tjcR9GW+cOdH+AQDr8A
	BlFQV0hKqMH6uxi/oKjzGvT6IEkQ89hZNxkbjEy1InK5UW3TuKhbVeIGTl5cqspte8N/bBnBgn5jX
	AB1q3gUxGm0FaUckr4f7yVknPzo8DEb2/+Hf7WRCg60tQ7aZHCM3Nw42iJmnDWDpgUQqpbQc5t637
	3gR+2XQuIBEv89u/WdnrGegYYGYfpnxnwkmJQfuD/UiaPVoJ/MOSEKJrvm20s6+pvA63QRzn5uLQI
	asOk6cJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgv5-00000004kQ1-14eC;
	Tue, 27 Oct 2026 13:08:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgv3-00000004kPi-33eW
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 13:08:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2973F40120;
	Tue, 27 Oct 2026 13:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF45C1F01825;
	Tue, 27 Oct 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106529;
	bh=V/VeFTBNZ+GruP1q870te1XoJIbeCvXwjgX+9ZL8Y10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hld8DjiF2KC8MW42II66+0eFGFNSwJBTLMzF+ZZ6WHvP1G+Uhn/YFqNkBYKQ7PByy
	 STmSTrXHVUM1V1GWxwBoNy8Nr+tBo4ANzcEF/xJCgJ7xCynkHvOCBQiJ/8gVKlkqGM
	 qlPmqeRTDZHZGIdrXAuZszj2uKYP7MPmqjmFa35lgMQUMg2riM6o2KjH5bIqRrp8kb
	 Ip6/+UyuIDifUVc65lMZnsc4SJGukKFOUSP6s5N2xAoG/0N/aeoilMz3ChsYJUC0FH
	 9h/MFbovHCnHPZEcTl+03JuXI2uWKROg2ocYHvQvk0VuTRWMLXDa6p1NzD5G4WfLYh
	 s6Ict9Zla7kxQ==
Message-ID: <sashiko-outbox-186603@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/9] iio: adc: meson_saradc: annotate the lock
 helpers
To: "Rupesh Majhi" <zoone.rupert@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261027124954.110697-6-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-6-zoone.rupert@gmail.com>
Date: Tue, 27 Oct 2026 13:08:48 +0000
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaWlvOiBhZGM6IG1l
c29uX3NhcmFkYzogY29udGV4dCBhbmFseXNpcyB3YXJuaW5nIGluIG1lc29uX3Nhcl9hZGNfaHdf
ZGlzYWJsZSgpCi0tCgpjb21taXQgYWIzN2MzOTQ4NDQ3ZjQ0MGFmZWViZWYyZmIwYTdhMGZkZjVl
OWU2MwpBdXRob3I6IFJ1cGVzaCBNYWpoaSA8em9vbmUucnVwZXJ0QGdtYWlsLmNvbT4KCmlpbzog
YWRjOiBtZXNvbl9zYXJhZGM6IGFubm90YXRlIHRoZSBsb2NrIGhlbHBlcnMKClRoaXMgcGF0Y2gg
YWRkcyBfX2NvbmRfYWNxdWlyZXMoKSBhbmQgX19yZWxlYXNlcygpIGNvbnRleHQgYW5hbHlzaXMK
YW5ub3RhdGlvbnMgdG8gbWVzb25fc2FyX2FkY19sb2NrKCkgYW5kIG1lc29uX3Nhcl9hZGNfdW5s
b2NrKCkgc28gdGhhdApjb21waWxlciBjb250ZXh0IGFuYWx5c2lzIHRyYWNrcyBwcml2LT5sb2Nr
IGFjcm9zcyB0aGVpciBjYWxsZXJzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL21l
c29uX3NhcmFkYy5jIGIvZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jCj4gaW5kZXggMmIw
MDNmZDVhZmViYS4uM2MxYmMyMjc0MTI5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMv
bWVzb25fc2FyYWRjLmMKPiArKysgYi9kcml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmMKPiBA
QCAtNTc4LDYgKzU3OCw3IEBAIHN0YXRpYyB2b2lkIG1lc29uX3Nhcl9hZGNfc3RvcF9zYW1wbGVf
ZW5naW5lKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQg
bWVzb25fc2FyX2FkY19sb2NrKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4gKwlfX2NvbmRf
YWNxdWlyZXMoMCwgJigoc3RydWN0IG1lc29uX3Nhcl9hZGNfcHJpdiAqKWlpb19wcml2KGluZGlv
X2RldikpLT5sb2NrKQo+ICB7Cj4gIAlzdHJ1Y3QgbWVzb25fc2FyX2FkY19wcml2ICpwcml2ID0g
aWlvX3ByaXYoaW5kaW9fZGV2KTsKPiAgCWludCB2YWwsIHJldDsKPiBAQCAtNjA4LDYgKzYwOSw3
IEBAIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY19sb2NrKHN0cnVjdCBpaW9fZGV2ICppbmRpb19k
ZXYpCj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIG1lc29uX3Nhcl9hZGNfdW5sb2NrKHN0cnVjdCBp
aW9fZGV2ICppbmRpb19kZXYpCj4gKwlfX3JlbGVhc2VzKCYoKHN0cnVjdCBtZXNvbl9zYXJfYWRj
X3ByaXYgKilpaW9fcHJpdihpbmRpb19kZXYpKS0+bG9jaykKCltTZXZlcml0eTogTWVkaXVtXQpE
b2VzIGFkZGluZyB0aGVzZSBhbm5vdGF0aW9ucyB0cmlnZ2VyIGEgLVd0aHJlYWQtc2FmZXR5LWFu
YWx5c2lzIHdhcm5pbmcgaW4KbWVzb25fc2FyX2FkY19od19kaXNhYmxlKCkgd2hlbiBjb250ZXh0
IGFuYWx5c2lzIGlzIGVuYWJsZWQ/CgpJbiBkcml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmM6
bWVzb25fc2FyX2FkY19od19kaXNhYmxlKCksIHRoZSBjYWxsZXIgbG9ncwphbiBlcnJvciBpZiBt
ZXNvbl9zYXJfYWRjX2xvY2soKSBmYWlscywgYnV0IGNvbnRpbnVlcyBleGVjdXRpb24gcmF0aGVy
IHRoYW4KcmV0dXJuaW5nIGVhcmx5OgoKCXJldCA9IG1lc29uX3Nhcl9hZGNfbG9jayhpbmRpb19k
ZXYpOwoJaWYgKHJldCkKCQlkZXZfZXJyKGluZGlvX2Rldi0+ZGV2LnBhcmVudCwgIkZhaWxlZCB0
byBsb2NrIEFEQyAoJXBFKVxuIiwgRVJSX1BUUihyZXQpKTsKCgljbGtfZGlzYWJsZV91bnByZXBh
cmUocHJpdi0+YWRjX2Nsayk7CgoJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBNRVNP
Tl9TQVJfQURDX1JFRzMsCgkJCSAgTUVTT05fU0FSX0FEQ19SRUczX0FEQ19FTik7CgoJbWVzb25f
c2FyX2FkY19zZXRfYmFuZGdhcChpbmRpb19kZXYsIGZhbHNlKTsKCglyZWd1bGF0b3JfZGlzYWJs
ZShwcml2LT52cmVmKTsKCglpZiAoIXJldCkKCQltZXNvbl9zYXJfYWRjX3VubG9jayhpbmRpb19k
ZXYpOwoKQmVjYXVzZSB0aGUgZXJyb3IgYnJhbmNoIGZhbGxzIHRocm91Z2gsIHRoZSBsb2NrZWQg
KHJldCA9PSAwKSBhbmQgdW5sb2NrZWQKKHJldCAhPSAwKSBjb250cm9sLWZsb3cgcGF0aHMgbWVy
Z2UgYXQgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmFkY19jbGspCndpdGggbWlzbWF0Y2hl
ZCBsb2NrIHNldHMsIGZvbGxvd2VkIGJ5IGEgY29uZGl0aW9uYWwgdW5sb2NrIGF0IGlmICghcmV0
KS4KCldoZW4gYnVpbGRpbmcgd2l0aCBDT05GSUdfTUVTT05fU0FSQURDPXkgYW5kIENPTkZJR19X
QVJOX0NPTlRFWFRfQU5BTFlTSVM9eQooYW5kIENPTlRFWFRfQU5BTFlTSVMgOj0geSBlbmFibGVk
IGZvciBJSU8gZHJpdmVycyksIHdvdWxkbid0IENsYW5nIHdhcm4gdGhhdApwcml2LT5sb2NrIGlz
IG5vdCBoZWxkIG9uIGV2ZXJ5IHBhdGggdGhyb3VnaCBoZXJlIGFuZCBvbiB0aGUgY29uZGl0aW9u
YWwKcmVsZWFzZSBpbiBtZXNvbl9zYXJfYWRjX3VubG9jaygpLCB1bmxlc3MgbWVzb25fc2FyX2Fk
Y19od19kaXNhYmxlKCkgaXMgYWxzbwphbm5vdGF0ZWQgd2l0aCBfX2NvbnRleHRfdW5zYWZlKCkg
b3IgaXRzIGNvbnRyb2wgZmxvdyBpcyByZXN0cnVjdHVyZWQ/CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDI3MTI0OTU0LjExMDY5
Ny0xLXpvb25lLnJ1cGVydEBnbWFpbC5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
