Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A920FCCD1BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Oct 2025 22:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8ysQ1ItuDtE66Va8UvNVJZj2TKaRSTnS8toPtnEpSyc=; b=T7a0lrBsCi9zIP
	3X24xXpuNbVG8smP22zBhADi1YrSicbtnEW659Jy5WFTK4PdSWAq5ZnSLMfSFroWo0P0JWhAAlEkv
	OYFrSc7jvcRXTeFkCDcgDNPSnVFhNtaix+a78LKjmS1NuJpMIX1Mq3DHnkKnLP0k9WSI/GEBO+0yZ
	yFHbSvJNHAFC40OOtorrZh/SeYZakshuanLddcBCNbZDik5RGJ+NabG231Amn9JZv63GAYUoJ+U36
	cWqauaLghgdFa7+LpSAPFn3jVVDvMpZL3DaS51SDfw7P7r1m7KfaDYkEX9Y7+hTvAj4KQhwl2Zqob
	7yAfpy9Va8Z1uV7sduNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrzD-0000000Gjb0-2ASB;
	Tue, 28 Oct 2025 22:16:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrz7-0000000GjaB-1I7w
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Oct 2025 22:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A582C4061C;
	Tue, 28 Oct 2025 22:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670D1C4CEE7;
	Tue, 28 Oct 2025 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761689768;
	bh=NxQA4oKj6S/J9ShJx5/SQ4Cwfe8hUWFvyW9NNm3a+Nk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qW8rRUrB+EZgZTiEdhF/sYqZRKC4Rv6g/hbbiIeQmSnCDV2ksc36AMCqHtvCz6qVH
	 hWFkgBCxxRd5/E8Cc8TI7aBr/HjBCsmmESgcnfSwJxQyzAUNjjccO+Z5vmUIQfEBTn
	 PLe1DmLzDq1kgWsUCvl5xyNB0Us7HrG9g5S1JVa+03Rirj3DQ1L8OF0qKVzxSLIwOh
	 l0XQDvUize8wTPl17SvS9uRsGmXWEdUksBQ8HSr8+65I2K3p9RAmH/qMuOSKhoI4dA
	 210hY1/TcUCkQz+pwcvwMRRDxg8RfJX55Skd3QRhf7Z7fytnfZzngOny5eqI6N7WiY
	 JVkmpKr/75rDg==
Date: Tue, 28 Oct 2025 17:16:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linnaea Lavia <linnaea-von-lavia@live.com>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
Message-ID: <20251028221607.GA1533456@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR05MB102705BB2124288C68EEFDA04C7FCA@DM4PR05MB10270.namprd05.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_151609_387133_C391C979 
X-CRM114-Status: GOOD (  13.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgMDI6MTk6MTNBTSArMDgwMCwgTGlubmFlYSBMYXZpYSB3
cm90ZToKCj4gT24gNi4xOC1yYzMgd2l0aCB0aGUgY2hhbmdlIHRoZSBsaW5rIGRvZXMgbm90IGNv
bWUgdXAgd2l0aG91dCBwY2llX2FzcG09b2ZmLgoKVGhhbmtzIGZvciB0ZXN0aW5nIHRoaXMhCgpJ
IHRoaW5rIHRoZXJlIGFyZSB0d28gcHJvYmxlbXM6CgogIDEpIE9uIHY2LjE4LXJjMiwgdGhlIG1l
c29uLXBjaWUgcHJvYmUgZmFpbGVkIHdpdGg6CgogICAgICAgbWVzb24tcGNpZSBmYzAwMDAwMC5w
Y2llOiBlcnJvciAtRUJVU1k6IGNhbid0IHJlcXVlc3QgcmVnaW9uIGZvciByZXNvdXJjZSBbbWVt
IDB4ZmMwMDAwMDAtMHhmYzNmZmZmZl0KCiAgICAgc28gd2UgZGlkbid0IGV2ZW4gdHJ5IHRvIGJy
aW5nIHVwIHRoZSBsaW5rLiAgSSB0aGluayB0aGlzIHdhcwogICAgIGZpeGVkIGluIHY2LjE4LXJj
MyBieSBhMTk3OGI2OTJhMzkgKCJQQ0k6IGR3YzogVXNlIGN1c3RvbSBwY2lfb3BzCiAgICAgZm9y
IHJvb3QgYnVzIERCSSB2cyBFQ0FNIGNvbmZpZyBhY2Nlc3MiKS4KCiAgMikgT24gdjYuMTgtcmMz
LCB3ZSBicm91Z2h0IHVwIHRoZSBsaW5rIGFuZCBlbnVtZXJhdGVkIDAxOjAwLjAsIGJ1dAogICAg
IGFzIHNvb24gYXMgd2UgdHJpZWQgdG8gZW5hYmxlIEFTUE0gTDEsIHRoZSBsaW5rIHN0b3BwZWQg
d29ya2luZzoKCj4gWyAgICA1LjM5NjM0MV0gWyAgICAgVDUwXSBtZXNvbi1wY2llIGZjMDAwMDAw
LnBjaWU6IGhvc3QgYnJpZGdlIC9zb2MvcGNpZUBmYzAwMDAwMCByYW5nZXM6Cj4gWyAgICA1LjQ3
NDcyMl0gWyAgICAgVDUwXSBtZXNvbi1wY2llIGZjMDAwMDAwLnBjaWU6IGVycm9yOiB3YWl0IGxp
bmt1cCB0aW1lb3V0Cj4gWyAgICA1LjQ4MDU5MF0gWyAgICAgVDUwXSBtZXNvbi1wY2llIGZjMDAw
MDAwLnBjaWU6IFBDSWUgR2VuLjIgeDEgbGluayB1cAo+IFsgICAgNS40ODQzOTRdIFsgICAgIFQ1
MF0gbWVzb24tcGNpZSBmYzAwMDAwMC5wY2llOiBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAwMDA6
MDAKPiBbICAgIDUuNTExNjI1XSBbICAgICBUNTBdIHBjaSAwMDAwOjAwOjAwLjA6IFsxNmMzOmFi
Y2RdIHR5cGUgMDEgY2xhc3MgMHgwNjA0MDAgUENJZSBSb290IFBvcnQKPiBbICAgIDUuNTc4NTA3
XSBbICAgICBUNTBdIHBjaSAwMDAwOjAxOjAwLjA6IFs4MDg2OjI3MjVdIHR5cGUgMDAgY2xhc3Mg
MHgwMjgwMDAgUENJZSBFbmRwb2ludAo+IFsgICAgNS41ODc0NjBdIFsgICAgIFQ1MF0gcGNpIDAw
MDA6MDE6MDAuMDogQkFSIDAgW21lbSAweDAwMDAwMDAwLTB4MDAwMDNmZmYgNjRiaXRdCj4gWyAg
ICA1LjY1NjAwOV0gWyAgICAgVDUwXSBwY2kgMDAwMDowMTowMC4wOiBBU1BNOiBkZWZhdWx0IHN0
YXRlcyBMMQo+IFsgICAgNS43MDEwNjNdIFsgICAgIFQ1MF0gbWVzb24tcGNpZSBmYzAwMDAwMC5w
Y2llOiBlcnJvcjogd2FpdCBsaW5rdXAgdGltZW91dAo+IFsgICAgNS43MjQxNDddIFsgICAgIFQ1
MF0gcGNpIDAwMDA6MDE6MDAuMDogQkFSIDAgW21lbSAweGZjNzAwMDAwLTB4ZmM3MDNmZmYgNjRi
aXRdOiBhc3NpZ25lZAo+IFsgICAgNS43Nzk1MjhdIFsgICAgIFQ1MF0gbWVzb24tcGNpZSBmYzAw
MDAwMC5wY2llOiBlcnJvcjogd2FpdCBsaW5rdXAgdGltZW91dAo+IFsgICAgNS44MjIwNzRdIFsg
ICAgIFQ1MF0gbWVzb24tcGNpZSBmYzAwMDAwMC5wY2llOiBlcnJvcjogd2FpdCBsaW5rdXAgdGlt
ZW91dAo+IFsgICAgNS44NjQ5MDJdIFsgICAgIFQ1MF0gbWVzb24tcGNpZSBmYzAwMDAwMC5wY2ll
OiBlcnJvcjogd2FpdCBsaW5rdXAgdGltZW91dAo+IFsgICAgNS45MDc0NDhdIFsgICAgIFQ1MF0g
bWVzb24tcGNpZSBmYzAwMDAwMC5wY2llOiBlcnJvcjogd2FpdCBsaW5rdXAgdGltZW91dAo+IFvC
oMKgwqAgNS45ODc1MTddIFvCoMKgwqDCoCBUNTBdIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBl
cnJvciB1cGRhdGluZyAoMHhmYzcwMDAwNCAhPSAweGZmZmZmZmZmKQo+IFvCoMKgwqAgNi4wODE0
MjFdIFvCoMKgwqDCoCBUNTBdIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBlcnJvciB1cGRhdGlu
ZyAoaGlnaCAweDAwMDAwMDAwICE9IDB4ZmZmZmZmZmYpCgpDYW4geW91IHRyeSB0aGUgcGF0Y2gg
YmVsb3cgb24gdG9wIG9mIHY2LjE4LXJjMz8gIEl0IHNob3VsZCBwcmV2ZW50CmVuYWJsaW5nIEFT
UE0gTDEuICBDYW4geW91IGFsc28gY29sbGVjdCB0aGUgb3V0cHV0IG9mICJzdWRvIGxzcGNpIC12
diIKb24gc29tZSB3b3JraW5nIGtlcm5lbD8KCkknbSBhIGxpdHRsZSBjb25jZXJuZWQgdGhhdCBb
MTZjMzphYmNkXSBpcyB0b28gZ2VuZXJhbCBiZWNhdXNlIGl0Cmxvb2tzIGxpa2UgdGhhdCBJRCBo
YXMgcmVhbGx5IGJlZW4gYWJ1c2VkIGJ5IHZlbmRvcnM6Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcGF0Y2gvMTA3OTg0OTcvCgpJIHdvbmRlciBpZiB0aGVyZSdzIGEgd2F5IGZvciBtZXNv
bi1wY2llIHRvIHdyaXRlIGEgY29ycmVjdGVkClZlbmRvci9EZXZpY2UgSUQgaW4gdGhlIFJvb3Qg
UG9ydCBzbyB3ZSBjb3VsZCBtYWtlIGEgcXVpcmsgdGhhdCdzCnNwZWNpZmljIHRvIHRoZSBNZXNv
biBjb250cm9sbGVyLgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVy
cy9wY2kvcXVpcmtzLmMKaW5kZXggMjE0ZWQwNjBjYTFiLi45Y2QxMjkyNGI1Y2IgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jCisrKyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCkBAIC0y
NTI0LDYgKzI1MjQsNyBAQCBzdGF0aWMgdm9pZCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKHN0
cnVjdCBwY2lfZGV2ICpkZXYpCiAgKiBkaXNhYmxlIGJvdGggTDBzIGFuZCBMMSBmb3Igbm93IHRv
IGJlIHNhZmUuCiAgKi8KIERFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURfQVNN
RURJQSwgMHgxMDgwLCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKTsKK0RFQ0xBUkVfUENJX0ZJ
WFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURfU1lOT1BTWVMsIDB4YWJjZCwgcXVpcmtfZGlzYWJsZV9h
c3BtX2wwc19sMSk7CiAKIC8qCiAgKiBTb21lIFBlcmljb20gUENJZS10by1QQ0kgYnJpZGdlcyBp
biByZXZlcnNlIG1vZGUgbmVlZCB0aGUgUENJZSBSZXRyYWluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
