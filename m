Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A29606A31B
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1peVxQV+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoylnmEN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zvlR7iEa2ErQOrhaNvi9eKD3calXCSPA8eWWaYwVj7Y=; b=1peVxQV+SvIW0PhrePZv9LlTVm
	gimfgYNPBFBJJy1fMtKc3q3Xy4z04yrDlsKAZTxkTDTAIz6bL0ZDPRmLNv+e1fWiN9v1+dvfLodtK
	J9P+spP6whPDuIT2e8yNhiwHKQoY/I06Jlmt41bljzCq9oqabNdTO3c7d1bOm0F7IHJh1U0xMQ/lK
	bcDQHHk2OU68jZzUuujxktJaTo2i0hxp6nUQjTqZh3PMqFEgS1+4EVSzQSnPyHuVN61nv1ClhGtFp
	HC4Orq6usA9lwfS2eJi9S7CfKMtG5hH6Ljn1o4cl1NX2NiPRsmoBtw5xwdcFpdvHQgoJFkqQ3Xsms
	0vk6VjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsx2-0000000EDFM-3E1q;
	Thu, 22 Oct 2026 13:35:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsx1-0000000EDFC-25JA
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD13843F44;
	Thu, 22 Oct 2026 13:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532D61F000C7;
	Thu, 22 Oct 2026 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676122;
	bh=PlLBVTPI7eZpeRaDmVkEiCpkiEZhzAXhcueo3GF4oYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VoylnmEN3jSLZ2B+1hKBAGmav+2Aoy4D7B1edUtItSmEaNhplhLoiX/maHXguwL13
	 wJFbnanOSM2eoKenoXausGL9ftaW1z8WuARShfCOPIfYjaZ/K4f6mP688LL8saW279
	 DPA2nHhStBHFmNDO/hfjSh/h1j/bkn/+BsgoxC5QGEF4WMdTA0JcLFC/b1K/tuEkWW
	 VZ9M0S1MyAUFI947CY2Cy1ntjH0+3zcrbBMmsWICmTAEIYWZ/DMOEf5fs30W/k6Grd
	 VjQ1dMyjKglEdy4yWhVgoNzEED1AhLmI+uLc4egKxWMQBbMQYPnpET4SINQz5++dhQ
	 07tvdvpsdBwUA==
Message-ID: <sashiko-outbox-181548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:35:21 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tc20vZHA6IG1p
c3NpbmcgY2xvc2luZyBicmFjZSBpbiBtc21fZHBfYnJpZGdlX2hwZF9ub3RpZnkoKQotLQoKY29t
bWl0IDQyMDM0ZjU3MGQxMjA2NTRkNmFhNGUwNmI5YzU4MmViMDZjYjJmNWYKQXV0aG9yOiBEbWl0
cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+Cgpkcm0vbXNt
OiBkcDogaGFuZGxlIHRoZSBJUlFfSFBEIGV2ZW50cyByZXBvcnRlZCBieSBVU0ItQwoKVGhpcyBj
b21taXQgdXBkYXRlcyBtc21fZHBfYnJpZGdlX2hwZF9ub3RpZnkoKSB0byBoYW5kbGUgb3V0LW9m
LWJhbmQKRFJNX0NPTk5FQ1RPUl9EUF9JUlFfSFBEIGV2ZW50cyBpbiBhZGRpdGlvbiB0byBJU1Jf
SVJRX0hQRF9QVUxTRV9DT1VOVApsaW5rIHN0YXR1cyBwdWxzZXMuCgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHAvZHBfZGlzcGxheS5jCj4gaW5kZXggY2U5MTlhMjZmYmEyOC4uNmE4YjNiOGUxZmU3ZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCj4gQEAgLTE1NjYsMTEgKzE1NjYsMTMg
QEAgdm9pZCBtc21fZHBfYnJpZGdlX2hwZF9ub3RpZnkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSwKPiAgCQlpZiAoaHBkX2xpbmtfc3RhdHVzID09IElTUl9IUERfUkVQTFVHX0NPVU5UKSB7Cj4g
IAkJCW1zbV9kcF9ocGRfdW5wbHVnX2hhbmRsZShkcCk7Cj4gIAkJCW1zbV9kcF9ocGRfcGx1Z19o
YW5kbGUoZHApOwo+IC0JCX0gZWxzZSBpZiAoaHBkX2xpbmtfc3RhdHVzID09IElTUl9JUlFfSFBE
X1BVTFNFX0NPVU5UKSB7Cj4gLQkJCW1zbV9kcF9pcnFfaHBkX2hhbmRsZShkcCk7Cj4gIAkJfSBl
bHNlIHsKPiAgCQkJbXNtX2RwX2hwZF9wbHVnX2hhbmRsZShkcCk7Cj4gIAkJfQo+ICsKPiArCQlp
ZiAoaHBkX2xpbmtfc3RhdHVzID09IElTUl9JUlFfSFBEX1BVTFNFX0NPVU5UIHx8Cj4gKwkJICAg
IGV2ZW50ID09IERSTV9DT05ORUNUT1JfRFBfSVJRX0hQRCkgewo+ICsJCQltc21fZHBfaXJxX2hw
ZF9oYW5kbGUoZHApOwo+ICAJfSBlbHNlIHsKPiAgCQltc21fZHBfaHBkX3VucGx1Z19oYW5kbGUo
ZHApOwo+ICAJfQoKW1NldmVyaXR5OiBIaWdoXQpJcyBhIGNsb3NpbmcgYnJhY2UgbWlzc2luZyBm
b3IgdGhlIG5ldyBpZiBzdGF0ZW1lbnQgaW4KbXNtX2RwX2JyaWRnZV9ocGRfbm90aWZ5KCkgaW4g
ZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmM/CgpUaGUgY2hlY2sgZm9yIElTUl9J
UlFfSFBEX1BVTFNFX0NPVU5UIG9yIERSTV9DT05ORUNUT1JfRFBfSVJRX0hQRCBvcGVucyBhCmJs
b2NrIHdpdGggYSBicmFjZSBiZWZvcmUgY2FsbGluZyBtc21fZHBfaXJxX2hwZF9oYW5kbGUoZHAp
LCBidXQgZG9lcyBub3QKY2xvc2UgaXQgYmVmb3JlIHRoZSBmb2xsb3dpbmcgZWxzZSBicmFuY2g6
CgoJaWYgKHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkgewoJCS4uLgoJCWlm
IChocGRfbGlua19zdGF0dXMgPT0gSVNSX0lSUV9IUERfUFVMU0VfQ09VTlQgfHwKCQkgICAgZXZl
bnQgPT0gRFJNX0NPTk5FQ1RPUl9EUF9JUlFfSFBEKSB7CgkJCW1zbV9kcF9pcnFfaHBkX2hhbmRs
ZShkcCk7Cgl9IGVsc2UgewoJCW1zbV9kcF9ocGRfdW5wbHVnX2hhbmRsZShkcCk7Cgl9CgpCZWNh
dXNlIHRoZSBibG9jayBpcyBub3QgY2xvc2VkLCB0aGUgZWxzZSBicmFuY2ggcGFpcnMgd2l0aCB0
aGUgaW5uZXIKaWYgc3RhdGVtZW50IGluc3RlYWQgb2YgdGhlIG91dGVyIHN0YXR1cyA9PSBjb25u
ZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCBjaGVjaywKYW5kIHRoZSBmdW5jdGlvbiBib2R5IG9mIG1z
bV9kcF9icmlkZ2VfaHBkX25vdGlmeSgpIHJlbWFpbnMgdW5jbG9zZWQgYXQgdGhlCmVuZCBvZiB0
aGUgZmlsZSwgY2F1c2luZyBhIGJ1aWxkIGZhaWx1cmUuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDIyLWhwZC1pcnEtZXZlbnRz
LXY2LTAtMzM3ZWEzZGRhYTYyQG9zcy5xdWFsY29tbS5jb20/cGFydD03CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
