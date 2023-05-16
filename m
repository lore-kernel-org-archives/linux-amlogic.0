Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ED7C77B7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 21:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izk4cji4JBu5arKlxbLavKLCxUlijD4Mg0LoXC1rSqM=; b=Uha0KlNasyjWMu
	b/zCwB7FmBrMjmSSeTJZWmSXQvFbYRHz6gcLksRqrtYnP3TudK4ULn4O0xrZ+B325hI3uPSIyDfFS
	/obtIoLLc15N1JCWuZiQWQ3mwiPK/jpcxM99CWJU40nvyX4AX4XIavibMXW5s3CyV6bJr6fgJPNZ0
	dcWU2WC2R5Nw0OMXyfPN8IHVPmqeGqT/blc6DEOvZk/iA1kG+ZF+K1/rllcQFHfu2CgzMpQb55RZF
	bSqw3RgoaDuaP1IpNPFxX1wbhQbC1lr86rCk5bk9gaYRozOUz5aPfkAI8tjk96S9fsCyj+weJHc8h
	Bc6RwzcgCl5kh/7Yp7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1wJ-0078fu-1h;
	Tue, 16 May 2023 21:10:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1wG-0078f7-2a;
	Tue, 16 May 2023 21:10:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-965a68abfd4so2778448766b.2;
        Tue, 16 May 2023 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684271430; x=1686863430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n73A5ikyqINLnlDhqbTvCi+0kCGqHkJ94IeKapmahoE=;
        b=LhJ8iLFLtcCAuCR6l9IHP15t2tujl1me7wzUyl/h2h7LaxKrnYgA/fP7z/ZChEWxKV
         muDNAeYJLCcJUTWrEAdbD2N1cckJQYPGjbomLonDRrjLb6NM96Jete/RDYf9GTTuCHiS
         dsl/R57+DKVsFpO9vEyYvLuqOqg5yWG+dWO6zo6szGMQHCMtAKSadHIolidfi0tsnqym
         S1c0kRMJDMbTdc4FS0MnIM2kHgksv1XdXMQxFJKLo0h3zFGzbCChpkxYgMCNGtPwR4Sp
         ZF+NrCw7aD1zrsB7KJfpe+l4QcB1yZ1BfCIAQ/NSSU6T+1HG7dyzSVdf8jQvKGVWkN56
         dL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684271430; x=1686863430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n73A5ikyqINLnlDhqbTvCi+0kCGqHkJ94IeKapmahoE=;
        b=dzcr0T3Kxn4nWzjYtyYtJf2D5P5XUWsFyuYJI5AjHZpJpyBUOV1NYzohhEGT1BgvKG
         fVN6/Gum6Kw+czRv60BrXv8mTSmBEHkN5dOL3dlcJVsKoKpfWO1CsBSbcrn5rCnRRK+C
         0BFHKK47CSvxnwP+B5Jx4NPBc7ZsX2WJjQTugQLUqQLMq/8El6vUaccKYK08jes2R0Q3
         AZzJjrHOQzHCTblyaDT+QPdzV8jaECliSTZIDNRklLJtqp3WFZ7xiyX+ZVdBcQlCk6e/
         qCWtKyga5i3b9NH4p9M8H2flR0TudatWktS+AiPlQFgAjEMOSbUHw1red0MWaArjhcL+
         fcWA==
X-Gm-Message-State: AC+VfDzdw2rLYJL7IXW2l+ytrMnTPusaT8J8dFd8/FArWskh90Yx5Wi/
	RWhKVa9qZE5l69bIaHoGglfJM4WaWydEwXTDXm4=
X-Google-Smtp-Source: ACHHUZ7VwJQ7m6uMhLM8YPBx9yE/to5sr9FgMcI7tXUUErTzps4roK4BFliZIW0ptbv7CVPU+2WGGuadwAU5jqQGePs=
X-Received: by 2002:a17:907:9694:b0:96a:1ec1:2c9f with SMTP id
 hd20-20020a170907969400b0096a1ec12c9fmr23981423ejc.12.1684271430372; Tue, 16
 May 2023 14:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-7-ddrokosov@sberdevices.ru> <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
 <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021>
In-Reply-To: <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 16 May 2023 23:10:19 +0200
Message-ID: <CAFBinCA8e9evk+9hTEgoNOD_+3DBst6vYDcradmr2c996jdUmw@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_141032_842237_44625738 
X-CRM114-Status: GOOD (  39.14  )
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

SGVsbG8gRG1pdHJ5LAoKT24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgNDowNuKAr1BNIERtaXRyeSBS
b2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ID4gPiArc3Rh
dGljIHN0cnVjdCBjbGtfcmVnbWFwIHB3bV9hX3NlbCA9IHsKPiA+ID4gKyAgICAgICAuZGF0YSA9
ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2RhdGEpewo+ID4gPiArICAgICAgICAgICAgICAgLm9m
ZnNldCA9IFBXTV9DTEtfQUJfQ1RSTCwKPiA+ID4gKyAgICAgICAgICAgICAgIC5tYXNrID0gMHgx
LAo+ID4gPiArICAgICAgICAgICAgICAgLnNoaWZ0ID0gOSwKPiA+ID4gKyAgICAgICB9LAo+ID4g
PiArICAgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAubmFtZSA9ICJwd21fYV9zZWwiLAo+ID4gPiArICAgICAgICAgICAgICAgLm9w
cyA9ICZjbGtfcmVnbWFwX211eF9vcHMsCj4gPiA+ICsgICAgICAgICAgICAgICAucGFyZW50X2Rh
dGEgPSBwd21fYWJjZF9wYXJlbnRzLAo+ID4gPiArICAgICAgICAgICAgICAgLm51bV9wYXJlbnRz
ID0gQVJSQVlfU0laRShwd21fYWJjZF9wYXJlbnRzKSwKPiA+ID4gKyAgICAgICAgICAgICAgIC8q
IEZvciBtb3JlIGluZm9ybWF0aW9uLCBwbGVhc2UgcmVmZXIgdG8gcnRjIGNsb2NrICovCj4gPiA+
ICsgICAgICAgICAgICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsCj4gPiBI
ZWluZXIgaXMgd29ya2luZyBvbiBhIHNlcmllcyB0aGF0IGFkZHMgY29tbW9uIGNsb2NrIHN1cHBv
cnQgdG8gdGhlCj4gPiBQV00gZHJpdmVyIFswXS4KPiA+IEkgdGhpbmsgaGlzIHBsYW5zIGZvciBh
IG5leHQgc3RlcCBhcmUgYWRkaW5nIHN1cHBvcnQgZm9yIFNvQ3Mgd2hlcmUKPiA+IHRoZSBQV00g
Y2xvY2tzIGFyZSBwYXJ0IG9mIHRoZSBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIgKGluc3Rl
YWQgb2YKPiA+IGJlaW5nIHBhcnQgb2YgdGhlIFBXTSBjb250cm9sbGVyIHJlZ2lzdGVycykuCj4g
Pgo+Cj4gWWVzLCBJJ20ga2VlcGluZyB1cCB3aXRoIHRoaXMgcmV2aWV3IGFuZCBzdGF5aW5nIGlu
Zm9ybWVkLiBJdCdzIHdvcnRoCj4gbm90aW5nIHRoYXQgdGhlIHBlcmlwaGVyYWwgY2xvY2sgZHJp
dmVyIGFscmVhZHkgaW5jbHVkZXMgUFdNIGNsb2NrcywKPiB3aXRoIGFuIGltcG9ydGFudCByZW1h
cmsgYWJvdXQgcmVwYXJlbnRpbmcgYmVpbmcgc3dpdGNoZWQgb2ZmLiBJdCdzCj4gZGVzY3JpYmVk
IGJlbG93LgpJbmRlZWQsIHRoaXMgaXMgd2h5IHRoaXMgcXVlc3Rpb24gY2FtZSB0byBteSBtaW5k
Cgo+ID4gSGF2ZSB5b3UgY29uc2lkZXJlZCByZW1vdmluZyBDTEtfU0VUX1JBVEVfUEFSRU5UIGZy
b20gdGhlICZydGMgY2xvY2sKPiA+IHNvIGRvd25zdHJlYW0gY2xvY2tzIHdvbid0IGNoYW5nZSB0
aGUgcnRjIGNsb2NrIHJhdGUgYnkgYWNjaWRlbnQ/Cj4gPiBUaGVuIHdlIGNvdWxkIGRyb3AgdGhl
IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCBmbGFnIGZyb20gdGhlIFBXTQo+ID4gY2xvY2tzIHRv
IGFsbG93IHRoZW0gdG8gcGljayB0aGUgYmVzdCBhdmFpbGFibGUgcGFyZW50ICh3aGV0aGVyIHRo
YXQncwo+ID4gdGhlIHJ0YyBjbG9jaywgeHRhbCBvciBzeXNfcGxsKS4KPiA+IFRoYXQgc2FpZCwg
aXQgd291bGQgcmVxdWlyZSBtYW5hZ2luZyB0aGUgQ0xLSURfUlRDXzMyS19TRUwgY2xvY2sgKG9y
Cj4gPiBpdCdzIHBhcmVudHMpIHVzaW5nIGFzc2lnbmVkLWNsb2NrcyBpbnN0ZWFkIG9mIGRvaW5n
IHNvIHdpdGggdGhlIFBXTQo+ID4gKGFuZCBvdGhlcikgY2xvY2tzLiBXaGV0aGVyIHRoaXMgd291
bGQgY2F1c2UgcHJvYmxlbXM6IEknbSBub3Qgc3VyZSwKPiA+IHNvIEknbSBob3BpbmcgdGhhdCB5
b3UgY2FuIHNoYXJlIHNvbWUgaW5zaWdodHMuCj4gPgo+ID4KPgo+IEFsbG93IG1lIHRvIHNoYXJl
IG15IHRob3VnaHRzIG9uIHRoaXMgbWF0dGVyLiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsCj4gQW1s
b2dpYyBwcm92aWRlcyBhbiBSVEMgY2xvY2sgdGhhdCBpcyBib3RoIGFjY3VyYXRlIGFuZCBwb3dl
ci1lZmZlY3RpdmUKPiBpbiBhY2hpZXZpbmcgYSAzMktIeiBzaWduYWwgZnJvbSBhbiBpbnRlcm5h
bCB4dGFsIG9mIDI0TUh6LiBIb3dldmVyLAo+IHRoaXMgcmVxdWlyZXMgYSBjb21wbGV4IFJUQyBk
aXZpZGVyIHdpdGggZm91ciBwYXJhbWV0ZXJzIChtMSwgbTIsIG4xLAo+IG4yKSwgYXMgaXQgY2Fu
bm90IGJlIGFjY29tcGxpc2hlZCB3aXRoIGEgc2luZ2xlIGRpdmlkZXIuIE91ciB0ZWFtIGhhcwo+
IG1lYXN1cmVkIHRoZSBSVEMgY2xvY2sgdXNpbmcgYW4gb3NjaWxsb3Njb3BlIG9uIHRoZSBHRU4g
Q0xLIHBpbiBhbmQKPiBmb3VuZCB0aGF0IGl0IHByb3ZpZGVzIGEgc3RhYmxlIDMyS0h6IHNpZ25h
bCB3aXRoIGFjY2VwdGFibGUgaml0dGVyLiBPbgo+IHRoZSBvdGhlciBoYW5kLCBvdGhlciBhcHBy
b2FjaGVzLCBzdWNoIGFzIHRoZSBQV00gd2F5LCB5aWVsZCBsZXNzIHN0YWJsZQo+IGFuZCBsZXNz
IGFjY3VyYXRlIDMyS0h6IHNpZ25hbHMgd2l0aCBncmVhdGVyIGppdHRlci4KVGhpcyBwYXJ0IGlz
IGNsZWFyIHRvIG1lICh3ZSBtYXkgaGF2ZSBldmVuIGNoYXR0ZWQgb24gSVJDIGhvdyB0byB1c2UK
dGhlIEdFTiBDTEsgb3V0cHV0IHByZXZpb3VzbHkpCgo+IEFkZGl0aW9uYWxseSwgdGhlIENDRiBk
ZXRlcm1pbmVzIHRoZSBiZXN0IGFuY2VzdG9yIGJhc2VkIG9uIGhvdyBjbG9zZQo+IGl0cyByYXRl
IGlzIHRvIHRoZSBnaXZlbiBvbmUsIGJhc2VkIG9uIGFyaXRobWV0aWMgY2FsY3VsYXRpb25zLiBI
b3dldmVyLAo+IHdlIGhhdmUgaW5kZXBlbmRlbnQga25vd2xlZGdlIHRoYXQgYSBjZXJ0YWluIGNs
b2NrIHdvdWxkIGJlIGJldHRlciwgd2l0aAo+IGxlc3Mgaml0dGVyIGFuZCBmZXdlciBpbnRlcm1l
ZGlhcmllcywgd2hpY2ggd2lsbCBsaWtlbHkgaW1wcm92ZSBlbmVyZ3kKPiBlZmZpY2llbmN5LiBT
YWRseSwgdGhlIENDRiBjYW5ub3QgdGFrZSB0aGlzIGludG8gYWNjb3VudC4KSSBhZ3JlZSB0aGF0
IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBDQ0YgaXMgZmFpcmx5IHNpbXBsZS4gVGhlcmUncyB3YXlz
CnRvIHRyaWNrIGl0IHRob3VnaDogSUlSQyBpZiB0aGVyZSBhcmUgbXVsdGlwbGUgZXF1YWxseSBz
dWl0YWJsZSBjbG9ja3MKaXQgcGlja3MgdGhlIGZpcnN0IG9uZS4gRm9yIG1lIGFsbCBvZiB0aGlz
IGhhcyB3b3JrZWQgc28gZmFyIHdoaWNoIGlzCndoYXQgbWFrZXMgbWUgY3VyaW91cyBpbiB0aGlz
IGNhc2UgKG5vdCBzYXlpbmcgdGhhdCBhbnl0aGluZyBpcyB3cm9uZwp3aXRoIHlvdXIgYXBwcm9h
Y2gpLgoKRG8geW91IGhhdmUgYSAocmVhbCB3b3JsZCkgZXhhbXBsZSB3aGVyZSB0aGUgUlRDIGNs
b2NrIHNob3VsZCBiZQpwcmVmZXJyZWQgb3ZlciBhbm90aGVyIGNsb2NrPwoKSSdtIHRoaW5raW5n
IGFib3V0IHRoZSBmb2xsb3dpbmcgc2NlbmFyaW8uClBXTSBwYXJlbnRzOgotIFhUQUw6IDI0TUh6
Ci0gc3lzOiBub3Qgc3VyZSAtIGxldCdzIHNheSAxNjYuNjdNSHoKLSBSVEM6IDMya0h6CgpUaGVu
IGFmdGVyIHRoYXQgdGhlcmUncyBhIGRpdmlkZXIgYW5kIGEgZ2F0ZS4KCkxldCdzIHNheSB0aGUg
UFdNIGNvbnRyb2xsZXIgbmVlZHMgYSAxTUh6IGNsb2NrOiBpdCBjYW4gdGFrZSB0aGF0IGZyb20K
WFRBTCBvciBzeXMuIFNpbmNlIFhUQUwgaXMgZXZlbmx5IGRpdmlzaWJsZSB0byAxTUh6IENDRiB3
aWxsIHBpY2sgdGhhdAphbmQgdXNlIHRoZSBkaXZpZGVyLgpCdXQgbGV0J3Mgc2F5IHRoZSBQV00g
Y29udHJvbGxlciBuZWVkcyBhIDMya0h6IGNsb2NrOiBDQ0Ygd291bGQKYXV0b21hdGljYWxseSBw
aWNrIHRoZSBSVEMgY2xvY2suClNvIGlzIHlvdXIgaW1wbGVtZW50YXRpb24gdGhlcmUgdG8gY292
ZXIgbGV0J3Mgc2F5IDFrSHogd2hlcmUKbWF0aGVtYXRpY2FsbHkgMjRNSHogY2FuIGJlIGRpdmlk
ZWQgZXZlbmx5IHRvIDFrSHogKGFuZCB0aHVzIHNob3VsZApub3QgcmVzdWx0IGluIGFueSBqaXR0
ZXIpIGJ1dCBSVEMgZ2l2ZXMgYmV0dGVyIHByZWNpc2lvbiBpbiB0aGUgcmVhbAp3b3JsZCAoZXZl
biB0aG91Z2ggaXQncyBvZmYgYnkgMjRIeik/Cgo+IEdpdmVuIHRoZSBhZHZhbnRhZ2VzIG9mIHRo
ZSBSVEMgY2xvY2ssIHdlIHdpc2ggdG8gYmUgYWJsZSB0byBjb250cm9sIHRoZQo+IFJUQyBhcyBh
IHBhcmVudCBmb3Igc3BlY2lmaWMgbGVhZiBjbG9ja3MuIFRoaXMgaXMgYWNoaWV2YWJsZSB3aXRo
IHRoZQo+ICdhc3NpZ25lZC1jbG9ja3MnIGZlYXR1cmUgb2YgQ0NGIE9GLCBidXQgaXQgcG9zZXMg
YSBzaWduaWZpY2FudAo+IGFyY2hpdGVjdHVyYWwgcHJvYmxlbS4gVGhlICdhc3NpZ25lZC1jbG9j
a3MnIG5vZGUgZG9lcyBub3QgbG9jay9waW4gdGhlCj4gcGFyZW50LCBhbmQgYSBzaW1wbGUgY2xr
X3NldF9yYXRlKCkgY2FsbCBjYW4gY2hhbmdlIHRoZSBwYXJlbnQgZHVyaW5nCj4gcmF0ZSBwcm9w
YWdhdGlvbi4KQXJlIHlvdSBhd2FyZSBvZiBjbGtfc2V0X3JhdGVfZXhjbHVzaXZlKCkgYW5kIGNs
a19yYXRlX2V4Y2x1c2l2ZV97Z2V0LHB1dH0oKT8KSXQgbG9ja3MgYSBjbG9jayBhbmQgYWxsIG9m
IGl0cyBwYXJlbnRzIHRvIGEgY2VydGFpbiByYXRlLiBPdGhlcgpjb25zdW1lcnMgYXJlIHVuYWJs
ZSB0byBjaGFuZ2UgdGhlIHJhdGUgdW5sZXNzIHRoZSBsb2NrIGlzIHJlbGVhc2VkCmFnYWluLgoK
PiBJbiBteSBvcGluaW9uLCBhbiBpZGVhbCBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0gd291bGQK
PiBiZSBhbiBhZGRpdGlvbmFsIHBhdGNoIHRvIHRoZSBDQ0YgY29yZSB0aGF0IHByb3ZpZGVzIHRo
aXMgbG9ja2luZwo+IGNhcGFiaWxpdHkuQXMgYSBib2FyZCBEVFMgZGV2ZWxvcGVyLCBJIGtub3cg
d2hpY2ggY2xvY2sgSSB3YW50IHRvIHVzZQo+IGFzIHRoZSBwYXJlbnQgYW5kIGhhdmUgYSBzdHJv
bmcgcmVhc29uIGZvciBkb2luZyBzbywgYW5kIEkgZG8gbm90IHdpc2gKPiB0byBvcGVuIHVwIG15
IHBhcmVudCBtdXhpbmcgdG8gb3RoZXIgZHJpdmVycy4gQnV0IHVudGlsIHRoZSBiZWhhdmlvciBv
Zgo+ICdhc3NpZ25lZC1jbG9ja3MnIGlzIG5vdCBhdmFpbGFibGUsIHdlIHdpbGwgc2ltcGx5IGxh
YmVsIGFsbCBSVEMKPiBjaGlsZHJlbiB3aXRoIHRoZSBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQg
ZmxhZy4KClBTOiB3aGlsZSB3cml0aW5nIHRoaXMgcmVwbHkgSSBmb3VuZApkcml2ZXJzL2Nsay9z
dW54aS1uZy9jY3Utc3VuNmktcnRjLmMgd2hpY2ggaW1wbGVtZW50cwpjbGtfb3BzLnJlY2FsY19h
Y2N1cmFjeQpJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5IGJ1dCBpdCBz
ZWVtcyB0aGF0IENDRiBpcyBub3QKdXNpbmcgdGhhdCBpbmZvcm1hdGlvbiB3aGVuIG1ha2luZyB0
aGUgZGVjaXNpb24gd2hpY2ggcGFyZW50IHRvIHVzZS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
