Return-Path: <SRS0=hIX+=QM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B494C282CB
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Feb 2019 19:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363112175B
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Feb 2019 19:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAtyj/kt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363112175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sFzfOW7R6OW2ckjNcrLQenpcFqPyRAqP8L0IMBFFFM=; b=LAtyj/ktf6Erbb
	3WhI3Zf/d5u2kSv7OqcqD6ejGfCX86j/3o1VHRu+s3HzPNlkM4S21lzSWowZ6rRMhkX5lhY0dgx66
	ajC4D1CekqFPXXDs3EVuraDUKmzWkW3jecqAxIWJnitei48lmd9/B8wIOzhgq3CmoZwy5zPB4GWCP
	+oAk8tarRLMN2PZJ3qEe1pS+j8WP+gZLwv+QTq+SQTuYd6YAh51XV65m+Fr54Hid80KItQlqi1lUB
	RCq+KqN27tMVF0jrnF+P44rQiGSOq4ZZLz5QtIN/tbcKpUqr2Y1sVNEVjT2i9JnUMlvg8djx5cF8i
	D+IPFwkQnoDAxi1uMzHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr64h-0001vf-65; Tue, 05 Feb 2019 19:08:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr64P-0001fV-5Y; Tue, 05 Feb 2019 19:08:00 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 10470240003;
 Tue,  5 Feb 2019 19:07:40 +0000 (UTC)
Date: Tue, 5 Feb 2019 20:07:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: meson: Fix a limit test in
 meson_nfc_select_chip()
Message-ID: <20190205200739.5e4ff5f3@xps13>
In-Reply-To: <20190201082922.GC8459@kadam>
References: <20190201082922.GC8459@kadam>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_110746_150283_D1DEC12F 
X-CRM114-Status: GOOD (  11.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgRGFuLAoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cm90ZSBv
biBGcmksIDEgRmViIDIwMTkKMTE6Mjk6MjIgKzAzMDA6Cgo+IFRoaXMgdGVzdCBpcyBvZmYgYnkg
b25lIGJlY2F1c2UgdGhlID4gc2hvdWxkIGJlID49IGFuZCBpdCdzIGFsc28gdGVzdGluZwo+IGFn
YWluc3QgdGhlIHdyb25nIGxpbWl0LiAgVGhlIE1BWF9DRV9OVU0gaXMgdGhlIG1heGltdW0gc2l6
ZSB0aGF0Cj4gbWVzb25fY2hpcC0+c2Vsc1tdIGlzIGFsbG93ZWQgdG8gYmUgYnV0IG1lc29uX2No
aXAtPm5zZWxzIGlzIHRoZSBhY3R1YWwKPiBzaXplLgo+IAo+IEZpeGVzOiAyZDU3MGIzNGI0MWEg
KCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBOQU5EIGZsYXNo
IGNvbnRyb2xsZXIgIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCgpTZXJpZXMgbWVyZ2VkIGluIG5hbmQvbmV4dCB3aXRoIHRoZSBvcmlnaW5hbCBjb21taXQu
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
