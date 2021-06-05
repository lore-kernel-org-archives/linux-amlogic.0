Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URI_HEX,URI_NOVOWEL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDC5C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 07:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14BC0613AC
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 07:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14BC0613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oyu2R20r6TUmKaEll5x8/p8kVWIKb4VxpFL94Epojvo=; b=4cwpDRJNSIi/eO
	3ltUDv0BzYnHB2nHbEbzEI2HCeoxEHXkJqLcG+GDy6E5h+oB6VD8eiRbOI13W8MQmBKdPOisk+zov
	q+YhZ4CWK0b/Cyduz1otmgZzlmmM0ij1o9DjHOXLxaoKLaQpsVv/erVowUfGUD8ZJgO7ijeg+8XyX
	g8SvB2F35ju9wU/je9KSAC8ctBNoT/3BRys/0B0MZx+HVpGZCgvZYtWSBV9zykVRp7KMTq4Zpum5z
	nlkKf4PxNqP+hGRPjZDLlKYCePWs/jnoPUigHoK2g2RsB2VMtm10pbYSM41UqzPEDiOF5irgivzIq
	FY/Ou9fqJWKNYxI/Js3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpQKn-00GBCn-Mc; Sat, 05 Jun 2021 07:03:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpQKi-00GBBh-6k; Sat, 05 Jun 2021 07:03:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B24F611C2;
 Sat,  5 Jun 2021 07:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622876574;
 bh=IWAfrMlMqi9VAZziEACqpe8WptWvLIC5/6zCndodwc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vt5BpkzEGS8Psrr/Yo+GapEzuiJrLJ8y4Ta0gJRJtsWQ/WXifgMDvLPCuw79AC6A4
 ScEAnff4YszigHWx2BVQituq6Qberbss/7sdmFssVWRgwA1GcWkZeNaCAC/neyzz4s
 BoVeB3+FSZwngqJmUWxvf1XfixjD9MCwLDLW6OBY=
Date: Sat, 5 Jun 2021 09:02:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, balbi@kernel.org,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0
 is disabled
Message-ID: <YLshmr+H4mES+kZX@kroah.com>
References: <20210601084830.260196-1-narmstrong@baylibre.com>
 <YLoHSJIOSRTyF0r1@kroah.com>
 <20210604150742.bssvnhm4gv72uw4h@nitro.local>
 <20210604164601.hrlgkrsghhqtho6m@nitro.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604164601.hrlgkrsghhqtho6m@nitro.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_000300_287970_D35E0FCF 
X-CRM114-Status: GOOD (  13.67  )
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

T24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMTI6NDY6MDFQTSAtMDQwMCwgS29uc3RhbnRpbiBSeWFi
aXRzZXYgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMTE6MDc6NDJBTSAtMDQwMCwg
S29uc3RhbnRpbiBSeWFiaXRzZXYgd3JvdGU6Cj4gPiA+IE9kZCB0aGF0IERLSU0gZGlkbid0IHdv
cmsgZm9yIGJheWxpYnJlLWNvbSwgYnV0IGhleSwgSSdsbCB0YWtlIGEgcmVhbAo+ID4gPiBzaWdu
YXR1cmUgb3ZlciBES0lNIGFueWRheSEKPiA+IAo+ID4gVGhhdCBsb29rdXAgaGFwcGVuZWQgdG8g
Z3JhYiB0aGUgdGhyZWFkIGZyb20gbGludXgtYW1sb2dpYywgd2hpY2ggaXMKPiA+IG1haWxtYW4y
LW1hbmFnZWQgYW5kIGlzIGtub3duIHRvIGJyZWFrIERLSU0uIEknbGwgdHJ5IHRvIGZpeCBvdXIg
Y29uZmlndXJhdGlvbgo+ID4gc28gdGhhdCBrbm93bi1ES0lNLWZyaWVuZGx5IHNvdXJjZXMgYXJl
IGdpdmVuIHByaW9yaXR5LiBUaGlzIHdheSwgd2hlbiBhIHRocmVhZAo+ID4gZXhpc3RzIG9uIG11
bHRpcGxlIGxpc3RzLCB5b3UnbGwgZ2V0IHRoZSBvbmUgbW9yZSBsaWtlbHkgdG8gcGFzcyBES0lN
IGNoZWNrcy4KPiAKPiBUaGlzIGlzIG5vdyBpbiBwbGFjZSAtLSBsb3JlIHdpbGwgbm93IHByZWZl
ciByZXN1bHRzIGZyb20gREtJTS1mcmllbmRseQo+IHNvdXJjZXMuIEUuZy4gZ3JhYmJpbmcgdGhl
IHNhbWUgbWVzc2FnZS1pZCB3aWxsIG5vdyByZXR1cm4gdGhlIHRocmVhZCBmcm9tCj4gbGludXgt
dXNiICh2aWEgdmdlcikgaW5zdGVhZCBvZiBsaW51eC1hbWxvZ2ljICh2aWEgaW5mcmFkZWFkKS4K
PiAKPiAgICAgJCBiNCBhbSAtby90bXAgMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20KPiAgICAgTG9va2luZyB1cCBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjEwNjAxMDg0ODMwLjI2MDE5Ni0xLW5hcm1zdHJvbmclNDBiYXlsaWJyZS5jb20KPiAgICAg
R3JhYmJpbmcgdGhyZWFkIGZyb20gbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIxMDYwMTA4
NDgzMC4yNjAxOTYtMS1uYXJtc3Ryb25nJTQwYmF5bGlicmUuY29tL3QubWJveC5nego+ICAgICBB
bmFseXppbmcgNCBtZXNzYWdlcyBpbiB0aGUgdGhyZWFkCj4gICAgIENoZWNraW5nIGF0dGVzdGF0
aW9uIG9uIGFsbCBtZXNzYWdlcywgbWF5IHRha2UgYSBtb21lbnQuLi4KPiAgICAgLS0tCj4gICAg
ICAg4pyTIFtQQVRDSF0gdXNiOiBkd2MzLW1lc29uLWcxMmE6IGZpeCB1c2IyIFBIWSBnbHVlIGlu
aXQgd2hlbiBwaHkwIGlzIGRpc2FibGVkCj4gICAgICAgICArIFJldmlld2VkLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiAo4pyTIERL
SU0vZ29vZ2xlbWFpbC5jb20pCj4gICAgICAgLS0tCj4gICAgICAg4pyTIFNpZ25lZDogb3BlbnBn
cC9uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQo+ICAgICAgIOKckyBTaWduZWQ6IERLSU0vYmF5bGli
cmUtY29tLjIwMTUwNjIzLmdhcHBzc210cC5jb20gKEZyb206IG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tKQo+ICAgICAtLS0KPiAgICAgVG90YWwgcGF0Y2hlczogMQo+ICAgICAtLS0KPiAgICAgIExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20KPiAgICAgIEJhc2U6IG5vdCBmb3VuZAo+ICAgICAgICAgICAg
Z2l0IGFtIC90bXAvMjAyMTA2MDFfbmFybXN0cm9uZ191c2JfZHdjM19tZXNvbl9nMTJhX2ZpeF91
c2IyX3BoeV9nbHVlX2luaXRfd2hlbl9waHkwX2lzX2Rpc2FibGVkLm1ieAoKVGhpcyBpcyBncmVh
dCwgdGhhbmtzIGZvciBjaGFuZ2luZyB0aGlzIG9uIHRoZSBsb3JlIGJhY2tlbmQsIGFuZCBmb3Ig
YWxsCm9mIHRoaXMgd29yayBpbiB0aGUgZmlyc3RwbGFjZS4KCmdyZWcgay1oCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
