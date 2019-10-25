Return-Path: <SRS0=91Jp=YS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20179CA9EA0
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 20:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E414D21D82
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 20:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DPzqph19";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqeviibT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E414D21D82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGVgoygt/N6zzrFYIVgQGEXyxOiLB5r576DM/WPyQLQ=; b=DPzqph19KKC0Bd
	OUQiUvgNv5znfoF2oWOsd49kmOglgHs9li2ZVGc3vT7v8h1ulLTBslP7wbEFNXOF9J7hcyMwJsKYl
	egyCsuvN7UY8Gx5UjoUD0DnCrtraZoysilWQf4A8TunrSlXBBFyA04SSyB+OiIV73xACkEoKR28Qr
	uFd8o+8UktyJq40BYn7Gh4PXt1arNrow9F37Iy1l0MN3hyBRgwsKzrYOUqmYg+Gud6iyZSvENlv4A
	B5GGBzdQVyazqalgAXvMwJHPrR8yJ82jDB2QQNmjAt+0VNAKv83f2Kb2DmXK3aJm+ZbEi2P7FuFc7
	AjQuy/tUvjW6TxysHyPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO63u-0004Lr-1u; Fri, 25 Oct 2019 20:19:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO63q-0004Ku-KD; Fri, 25 Oct 2019 20:19:51 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 817BA222BD;
 Fri, 25 Oct 2019 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572034787;
 bh=0zDH0Fbrijq1CDlKb/eS9UolHwf/vrJ4mzyY2QBJsBI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UqeviibTuNZv2SaUyRGiB0nQifeY/W01PGm9s6G/Tvxny0L1/LfoH23izCCNYZcPU
 N82wKD6IFXMHPN6icjNVj+/HPv5IvXnZjRkL3mPFMBg5rHzQXVlCi3b+e7zr8iW165
 vpp9AXWeviqIGQAfeFQvRZ278d69OpkhbTEl6dWg=
Received: by mail-qt1-f169.google.com with SMTP id u22so5102645qtq.13;
 Fri, 25 Oct 2019 13:19:47 -0700 (PDT)
X-Gm-Message-State: APjAAAX4nfSy9OYsl+ENC4aoUujB81V8NtvcpVEw6iDEGPAOOOGCEYIx
 CotdmM98/9il1Mb/8g10hUPT3K46+M5/A+MyJA==
X-Google-Smtp-Source: APXvYqzLV0DNiSIgrqSeSFTkfH8awvr/ASCKRP7JD+/ltAUIM+wC1d0zfF+U7OiEUa1J3NlXBL4cFdbcYR0OTsXOWoQ=
X-Received: by 2002:ad4:518d:: with SMTP id b13mr356862qvp.79.1572034786614;
 Fri, 25 Oct 2019 13:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <1570695678-42623-1-git-send-email-jianxin.pan@amlogic.com>
 <1570695678-42623-2-git-send-email-jianxin.pan@amlogic.com>
 <20191014173900.GA6886@bogus>
 <622c7785-8254-5473-6b35-7287830f3c60@amlogic.com>
In-Reply-To: <622c7785-8254-5473-6b35-7287830f3c60@amlogic.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2019 15:19:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+F9EGv2jEWw2BrmH0NDKMRt6=pG6LSHL8UYH9G+-OeMw@mail.gmail.com>
Message-ID: <CAL_Jsq+F9EGv2jEWw2BrmH0NDKMRt6=pG6LSHL8UYH9G+-OeMw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/4] dt-bindings: power: add Amlogic secure
 power domains bindings
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_131950_707021_9A9C24A2 
X-CRM114-Status: GOOD (  14.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNjoyNiBBTSBKaWFueGluIFBhbiA8amlhbnhpbi5wYW5A
YW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gMjAxOS8xMC8xNSAxOjM5LCBS
b2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDA0OjIxOjE1QU0g
LTA0MDAsIEppYW54aW4gUGFuIHdyb3RlOgo+ID4+IEFkZCB0aGUgYmluZGluZ3MgZm9yIHRoZSBB
bWxvZ2ljIFNlY3VyZSBwb3dlciBkb21haW5zLCBjb250cm9sbGluZyB0aGUKPiA+PiBzZWN1cmUg
cG93ZXIgZG9tYWlucy4KPiA+Pgo+ID4+IFRoZSBiaW5kaW5ncyB0YXJnZXRzIHRoZSBBbWxvZ2lj
IEExIGFuZCBDMSBjb21wYXRpYmxlIFNvQ3MsIGluIHdoaWNoIHRoZQo+ID4+IHBvd2VyIGRvbWFp
biByZWdpc3RlcnMgYXJlIGluIHNlY3VyZSB3b3JsZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6
IEppYW54aW4gUGFuIDxqaWFueGluLnBhbkBhbWxvZ2ljLmNvbT4KPiA+PiAtLS0KPiA+PiAgLi4u
L2JpbmRpbmdzL3Bvd2VyL2FtbG9naWMsbWVzb24tc2VjLXB3cmMueWFtbCAgICAgfCA0MiArKysr
KysrKysrKysrKysrKysrKysrCj4gPj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvbWVzb24t
YTEtcG93ZXIuaCAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysKPiA+PiAgMiBmaWxlcyBj
aGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvYW1sb2dpYyxtZXNvbi1zZWMtcHdyYy55
YW1sCj4gPj4gKwo+ID4+ICsgIHNlY3VyZS1tb25pdG9yOgo+ID4+ICsgICAgZGVzY3JpcHRpb246
IHBoYW5kbGUgdG8gdGhlIHNlY3VyZS1tb25pdG9yIG5vZGUKPiA+PiArICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiA+Cj4gPiBXaHkgbm90IGp1c3Qg
YSBjaGlsZCBub2RlIG9mIHRoaXMgbm9kZT8KPiA+Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+
Cj4gSSBmb2xsb3dlZCB0aGUgc3R5bGUgb2YgdGhlIHByZXZpb3VzIHNlcmllcyBvZiBtZXNvbu+8
mgo+Cj4gICA0NiAgICAgICAgIGVmdXNlOiBlZnVzZSB7Cj4gICA0NyAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4YmItZWZ1c2UiOwo+ICAgNDggICAgICAgICAg
ICAgICAgIGNsb2NrcyA9IDwmY2xrYyBDTEtJRF9FRlVTRT47Cj4gICA0OSAgICAgICAgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gICA1MCAgICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MT47Cj4gICA1MSAgICAgICAgICAgICAgICAgcmVhZC1vbmx5Owo+ICAgNTIgICAgICAg
ICAgICAgICAgIHNlY3VyZS1tb25pdG9yID0gPCZzbT47Cj4gICA1MyAgICAgICAgIH07CgpMb29r
cyBsaWtlIHRoYXQgd2FzIG5vdCByZXZpZXdlZCBieSBtZSBhbmQgaXMgb25seSBpbiBsaW51eC1u
ZXh0LgpQbGVhc2UgbWFrZSBmdW5jdGlvbnMgZXhwb3NlZCBieSBzZWN1cmUgd29ybGQgYSBjaGls
ZCBvZiB0aGUgc2VjdXJlCmZpcm13YXJlIG5vZGUuCgpSZWFsbHkgZm9yIHBvd2VyIGRvbWFpbnMs
IHlvdSBvbmx5IG5lZWQgdG8gYWRkIGEgJyNwb3dlci1kb21haW4tY2VsbHMnCnByb3BlcnR5IHRv
IHRoZSBzZWN1cmUgbW9uaXRvciBub2RlLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
