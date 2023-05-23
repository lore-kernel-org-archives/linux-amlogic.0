Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536CFC7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 May 2023 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4cyTuwiskyV+vnHvotY50iyG44/N6Xk04WyrilFjyY=; b=RDg+e4K3+afXT8
	jwbnlHj8dS7EVrpjYrY+rYVcR8dxRtfyn9TU26fZBbEEokLgby0GPQD448y0EbG7eQ2zYqKyYvPai
	hV4cqYJVJJHfzLD2EcoAgB31a9Q/lnCo+pI3s4cIzAW911UYTUAlhKfzdnru9Q1bA0GJirNaUaecm
	jvIX2zPjCI++rnC7piMsug4GvIRbRm7f1EPHbUIIenTHJdDozsjCR1o3g5fI64kruTBi2bfXGHK+C
	e7oCdvkXCVr0K+JzHcSlcnJS7GSPITgSxgupWD+fpkpUrM3aCuvVupwRujtk5AdtewGX4hSLo553x
	JtpT2brpT3O5/zGv8r9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1XSI-00BDhB-1X;
	Tue, 23 May 2023 19:13:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1XSE-00BDg5-1o;
	Tue, 23 May 2023 19:13:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96ff9c0a103so384839466b.0;
        Tue, 23 May 2023 12:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684869229; x=1687461229;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldi8AGUTx7zIvnhIDgirP/2HuKJcRJ5qFJRH7LbrUDM=;
        b=iI2ve+6oZIk3VsfOpkmAoJu5FNErEQVjGna9+lnAm0sliZzREs3znkF15O/1Liymsz
         ulIo1Gtwhae7EAXquL8xd+Nhn2ei91XXzOj2y7cBj+Ubr7Zb/kkCeGxTfFzimozBo4oK
         fJpiYSCtkAAEzfVphPQb29fY5DxBpAT97EJ9Cw6Un5YrqwB7T7r4REwVWpvrX3xlT0te
         yLOcAUTpEH1dXalkJLyIRIRWTXbCATIee4jWVnlBsylt9yFk7EihZxS1x63AiatAZpUs
         0s5HpyjqKQPYmqRo4rgHMy/6bOOQNj8weRjZaz0yyR7lSMQBVe9M7nXkITE4s3WFE9jl
         ZHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684869229; x=1687461229;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldi8AGUTx7zIvnhIDgirP/2HuKJcRJ5qFJRH7LbrUDM=;
        b=BXc5gEy1V5/7AM5y9W5Chohvn280pTP3WjoVTtbm00cQcx9CL687bLcwj08+0Xq+sC
         uU460WpbllDRFgd1ls8WM4gELRfGwUT9cjEnpnje5kNq8wooVCA5BsU9dQHSgawdb4E8
         bnHtoAF3iRvz0WnPqtx/8gk4hgxVVGkcoLx/3dKGK248diAk2kmj3obqViQnup97bOEk
         mNzjrmXVKZEFOusiZno0a/LHfbTTSInawZPeYJSQKnrK98h/yY7qFTTzD/1cpp0N+2x6
         bdRr5ur2FtC3R+i0Bq1CWj/CjV4TglyYyfKRXk9kiG0YaXukZKSfAYXymkjqoMCglAYU
         XAJA==
X-Gm-Message-State: AC+VfDzm63dSmiJlX6p1eJL91lPVYsvSd+6Co1QVGrBG1IHuaAXLqsoe
	I1k9cGsJI8++CA5dHoYRYE4=
X-Google-Smtp-Source: ACHHUZ7TRjjs+1trzDlMQKVpk+fzDYeiTzotYNAq2c88Gt5jXN6QXjRorz8EfbuFP+EZvBH212L50w==
X-Received: by 2002:a17:907:3ea9:b0:969:f433:9b54 with SMTP id hs41-20020a1709073ea900b00969f4339b54mr15907605ejc.39.1684869228400;
        Tue, 23 May 2023 12:13:48 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4b9:3000:6c58:d026:2a46:c9d0? (dynamic-2a01-0c23-c4b9-3000-6c58-d026-2a46-c9d0.c23.pool.telefonica.de. [2a01:c23:c4b9:3000:6c58:d026:2a46:c9d0])
        by smtp.googlemail.com with ESMTPSA id rv25-20020a17090710d900b00965f6ad266bsm4746836ejb.119.2023.05.23.12.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 12:13:47 -0700 (PDT)
Message-ID: <2c1f7878-e58c-258f-283d-38d08ebaa07a@gmail.com>
Date: Tue, 23 May 2023 21:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-7-ddrokosov@sberdevices.ru>
 <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
 <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021>
 <CAFBinCA8e9evk+9hTEgoNOD_+3DBst6vYDcradmr2c996jdUmw@mail.gmail.com>
 <20230517103456.p3sjxzbepvg7cr2r@CAB-WSD-L081021>
 <CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com>
 <573d96df-7b08-4fa2-668b-58ff674a314e@gmail.com>
 <20230522134425.pc5fhojf53v6q2jz@CAB-WSD-L081021>
 <a121266a-110a-8c4e-cd71-4e35165fc789@gmail.com>
 <20230523102318.kf3o5rtmqdy2patg@CAB-WSD-L081021>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
In-Reply-To: <20230523102318.kf3o5rtmqdy2patg@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_121354_608516_3091C1B6 
X-CRM114-Status: GOOD (  33.50  )
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

T24gMjMuMDUuMjAyMyAxMjoyMywgRG1pdHJ5IFJva29zb3Ygd3JvdGU6Cj4gSGVpbmVyLAo+IAo+
IE9uIE1vbiwgTWF5IDIyLCAyMDIzIGF0IDEwOjM1OjU5UE0gKzAyMDAsIEhlaW5lciBLYWxsd2Vp
dCB3cm90ZToKPj4gT24gMjIuMDUuMjAyMyAxNTo0NCwgRG1pdHJ5IFJva29zb3Ygd3JvdGU6Cj4+
PiBIZWluZXIsCj4+Pgo+Pj4gT24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMDY6MTA6NTBQTSArMDIw
MCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4+IE9uIDE4LjA1LjIwMjMgMjI6MDQsIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+Pj4+IEhpIERtaXRyeSwKPj4+Pj4KPj4+Pj4gT24gV2Vk
LCBNYXkgMTcsIDIwMjMgYXQgMTI6MzTigK9QTSBEbWl0cnkgUm9rb3Nvdgo+Pj4+PiA8ZGRyb2tv
c292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPj4+Pj4gWy4uLl0KPj4+Pj4+Pj4gQWRkaXRpb25h
bGx5LCB0aGUgQ0NGIGRldGVybWluZXMgdGhlIGJlc3QgYW5jZXN0b3IgYmFzZWQgb24gaG93IGNs
b3NlCj4+Pj4+Pj4+IGl0cyByYXRlIGlzIHRvIHRoZSBnaXZlbiBvbmUsIGJhc2VkIG9uIGFyaXRo
bWV0aWMgY2FsY3VsYXRpb25zLiBIb3dldmVyLAo+Pj4+Pj4+PiB3ZSBoYXZlIGluZGVwZW5kZW50
IGtub3dsZWRnZSB0aGF0IGEgY2VydGFpbiBjbG9jayB3b3VsZCBiZSBiZXR0ZXIsIHdpdGgKPj4+
Pj4+Pj4gbGVzcyBqaXR0ZXIgYW5kIGZld2VyIGludGVybWVkaWFyaWVzLCB3aGljaCB3aWxsIGxp
a2VseSBpbXByb3ZlIGVuZXJneQo+Pj4+Pj4+PiBlZmZpY2llbmN5LiBTYWRseSwgdGhlIENDRiBj
YW5ub3QgdGFrZSB0aGlzIGludG8gYWNjb3VudC4KPj4+Pj4+PiBJIGFncmVlIHRoYXQgdGhlIGlt
cGxlbWVudGF0aW9uIGluIENDRiBpcyBmYWlybHkgc2ltcGxlLiBUaGVyZSdzIHdheXMKPj4+Pj4+
PiB0byB0cmljayBpdCB0aG91Z2g6IElJUkMgaWYgdGhlcmUgYXJlIG11bHRpcGxlIGVxdWFsbHkg
c3VpdGFibGUgY2xvY2tzCj4+Pj4+Pj4gaXQgcGlja3MgdGhlIGZpcnN0IG9uZS4gRm9yIG1lIGFs
bCBvZiB0aGlzIGhhcyB3b3JrZWQgc28gZmFyIHdoaWNoIGlzCj4+Pj4+Pj4gd2hhdCBtYWtlcyBt
ZSBjdXJpb3VzIGluIHRoaXMgY2FzZSAobm90IHNheWluZyB0aGF0IGFueXRoaW5nIGlzIHdyb25n
Cj4+Pj4+Pj4gd2l0aCB5b3VyIGFwcHJvYWNoKS4KPj4+Pj4+Pgo+Pj4+Pj4+IERvIHlvdSBoYXZl
IGEgKHJlYWwgd29ybGQpIGV4YW1wbGUgd2hlcmUgdGhlIFJUQyBjbG9jayBzaG91bGQgYmUKPj4+
Pj4+PiBwcmVmZXJyZWQgb3ZlciBhbm90aGVyIGNsb2NrPwo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4g
WWVzLCBhIHJlYWwtbGlmZSBleGFtcGxlIGlzIHRoZSBuZWVkIGZvciBhIDMyS2h6IGNsb2NrIGZv
ciBhbiBleHRlcm5hbAo+Pj4+Pj4gd2lmaSBjaGlwLiBUaGVyZSBpcyBvbmUgb3B0aW9uIHRvIHBy
b3ZpZGUgdGhpcyBjbG9jayB3aXRoIGhpZ2gKPj4+Pj4+IHByZWNpc2lvbiwgd2hpY2ggaXMgUlRD
ICsgR0VOQ0xLLgo+Pj4+Pj4KPj4+Pj4+PiBJJ20gdGhpbmtpbmcgYWJvdXQgdGhlIGZvbGxvd2lu
ZyBzY2VuYXJpby4KPj4+Pj4+PiBQV00gcGFyZW50czoKPj4+Pj4+PiAtIFhUQUw6IDI0TUh6Cj4+
Pj4+Pj4gLSBzeXM6IG5vdCBzdXJlIC0gbGV0J3Mgc2F5IDE2Ni42N01Iego+Pj4+Pj4+IC0gUlRD
OiAzMmtIego+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlbiBhZnRlciB0aGF0IHRoZXJlJ3MgYSBkaXZpZGVy
IGFuZCBhIGdhdGUuCj4+Pj4+Pj4KPj4+Pj4+PiBMZXQncyBzYXkgdGhlIFBXTSBjb250cm9sbGVy
IG5lZWRzIGEgMU1IeiBjbG9jazogaXQgY2FuIHRha2UgdGhhdCBmcm9tCj4+Pj4+Pj4gWFRBTCBv
ciBzeXMuIFNpbmNlIFhUQUwgaXMgZXZlbmx5IGRpdmlzaWJsZSB0byAxTUh6IENDRiB3aWxsIHBp
Y2sgdGhhdAo+Pj4+Pj4+IGFuZCB1c2UgdGhlIGRpdmlkZXIuCj4+Pj4+Pj4gQnV0IGxldCdzIHNh
eSB0aGUgUFdNIGNvbnRyb2xsZXIgbmVlZHMgYSAzMmtIeiBjbG9jazogQ0NGIHdvdWxkCj4+Pj4+
Pj4gYXV0b21hdGljYWxseSBwaWNrIHRoZSBSVEMgY2xvY2suCj4+Pj4+Pj4gU28gaXMgeW91ciBp
bXBsZW1lbnRhdGlvbiB0aGVyZSB0byBjb3ZlciBsZXQncyBzYXkgMWtIeiB3aGVyZQo+Pj4+Pj4+
IG1hdGhlbWF0aWNhbGx5IDI0TUh6IGNhbiBiZSBkaXZpZGVkIGV2ZW5seSB0byAxa0h6IChhbmQg
dGh1cyBzaG91bGQKPj4+Pj4+PiBub3QgcmVzdWx0IGluIGFueSBqaXR0ZXIpIGJ1dCBSVEMgZ2l2
ZXMgYmV0dGVyIHByZWNpc2lvbiBpbiB0aGUgcmVhbAo+Pj4+Pj4+IHdvcmxkIChldmVuIHRob3Vn
aCBpdCdzIG9mZiBieSAyNEh6KT8KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEkgZG9uJ3QgdGhpbmsg
c28uIFRoZSBoaWdoZXN0IHByZWNpc2lvbiB0aGF0IFJUQyBjYW4gcHJvdmlkZSBpcyBmcm9tIGEK
Pj4+Pj4+IDMyS0h6IHJhdGUgb25seS4gSG93ZXZlciwgSSBiZWxpZXZlIHRoYXQgYSAxa0h6IGZy
ZXF1ZW5jeSBjYW4gYWxzbyBiZQo+Pj4+Pj4gYWNoaWV2ZWQgYnkgdXNpbmcgeHRhbCAyNE1IeiB3
aXRoIGEgZGl2aWRlciwgd2hpY2ggY2FuIHByb3ZpZGUgaGlnaAo+Pj4+Pj4gcHJlY2lzaW9uIGFz
IHdlbGwuCj4+Pj4+IFRoYW5rIHlvdSBhZ2FpbiBmb3IgdGhlIGdyZWF0IGRpc2N1c3Npb24gb24g
SVJDIHRvZGF5Lgo+Pj4+PiBIZXJlJ3MgbXkgc2hvcnQgc3VtbWFyeSBzbyBJIGRvbid0IGZvcmdl
dCBiZWZvcmUgeW91J2xsIGZvbGxvdyB1cCBvbiB0aGlzLgo+Pj4+Pgo+Pj4+PiBJbiBnZW5lcmFs
IHRoZXJlJ3MgdHdvIGtub3duIGNhc2VzIHdoZXJlIHRoZSBSVEMgY2xvY2sgbmVlZHMgdG8gYmUg
dXNlZDoKPj4+Pj4gYSkgV2hlbiB1c2luZyB0aGUgR0VOQ0xLIG91dHB1dCBvZiB0aGUgU29DIHRv
IG91dHB1dCB0aGUgMzJrSHogUlRDCj4+Pj4+IGNsb2NrIGFuZCBjb25uZWN0IHRoYXQgdG8gYW4g
U0RJTyBXaUZpIGNoaXAgY2xvY2sgaW5wdXQgKHRoaXMgc2VlbXMKPj4+Pj4gdXNlZnVsIGluIG15
IHVuZGVyc3RhbmRpbmcgYmVjYXVzZSB0aGUgUlRDIGNsb2NrIHByb3ZpZGVzIGhpZ2gKPj4+Pj4g
cHJlY2lzaW9uKQo+Pj4+PiBiKSBXaGVuIHVzaW5nIHRoZSBQV00gY29udHJvbGxlciB0byBvdXRw
dXQgYSAzMmtIeiBjbG9jayBzaWduYWwuIEluCj4+Pj4+IHRoaXMgY2FzZSBteSB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgdXNpbmcgdGhlIFJUQyBjbG9jayBhcyBpbnB1dCB0byB0aGUKPj4+Pj4gUFdN
IGNvbnRyb2xsZXIgcmVzdWx0cyBpbiB0aGUgYmVzdCBwb3NzaWJsZSBzaWduYWwKPj4+Pj4KPj4+
Pj4gVGhlIHNlY29uZCBjYXNlIHdvbid0IGJlIHN1cHBvcnRlZCB3aXRoIEhlaW5lcidzIHBhdGNo
ZXMgWzBdIHRoYXQgdXNlCj4+Pj4+IENDRiAoY29tbW9uIGNsb2NrIGZyYW1ld29yaykgaW4gdGhl
IFBXTSBjb250cm9sbGVyIGRyaXZlci4KPj4+Pj4gSW4gdGhpcyBzZXJpZXMgdGhlIHBhcmVudCBj
bG9jayBpcyBjYWxjdWxhdGVkIHVzaW5nOgo+Pj4+PiAgIGZyZXEgPSBkaXY2NF91NjQoTlNFQ19Q
RVJfU0VDICogKHU2NCkweGZmZmYsIHBlcmlvZCk7Cj4+Pj4+Cj4+Pj4+IEEgMzJrSHogY2xvY2sg
bWVhbnMgYSBQV00gcGVyaW9kIG9mIDMwNTE4bnMuIFNvIHdpdGggdGhlIGFib3ZlCj4+Pj4KPj4+
PiBUbyBiZSBwcmVjaXNlOiAzMDUxNyw1NzgxMjVucwo+Pj4+IFdoYXQgbWVhbnMgdGhhdCB0aGUg
UFdNIGZyYW1ld29yayBjYW4ndCBzYXkgIkkgd2FudCAzMjc2OEh6IiwKPj4+PiBidXQganVzdCAi
SSB3YW50IHNvbWV0aGluZyBiZWluZyB2ZXJ5IGNsb3NlIHRvIDMyNzY4SHoiLgo+Pj4+IFNvIHdo
YXQgeW91IG5lZWQgaXMgc29tZSBzaW1wbGUgaGV1cmlzdGljIHRvIGludGVycHJldCB0aGUKPj4+
PiBQV00gcmVxdWVzdCAtPiAiUFdNIHJlcXVlc3RzIDMwNTE4bnMsIGJ1dCBzdXBwb3NlZGx5IGl0
IHdhbnRzCj4+Pj4gMzI3NjhIeiIKPj4+Pgo+Pj4+IE5TRUNfUEVSX1NFQyAvIDMwNTE4ID0gMzI3
NjcgKHJvdW5kZWQgZG93biBmcm9tIDMyNzY3LDU0NykKPj4+PiBjbGtfcm91bmRfcmF0ZShjaGFu
bmVsLT5jbGssIDMyNzY3KSB3b3VsZCByZXR1cm4gMCAoSSAqdGhpbmsqKSwKPj4+PiBiZWNhdXNl
IGl0IHRyaWVzIHRvIGZpbmQgdGhlIG5leHQgbG93ZXIgY2xvY2suCj4+Pj4KPj4+PiBUaGUgU29D
IGZhbWlsaWVzIEknbSBmYW1pbGlhciB3aXRoIGhhdmUgZmNsa2luMiBhcyBQV00gcGFyZW50Lgo+
Pj4+IFRoYXQncyAxIEdIeiBpbiBteSBjYXNlLCB3aGF0IHJlc3VsdHMgaW4gYSBmcmVxdWVuY3kg
b2YgMzIuNzY3LDU0N0h6Cj4+Pj4gZm9yIHBlcmlvZCA9IDMwNTE4bi4KPj4+PiBXaGF0IHlvdSdy
ZSBzYXlpbmcgaXMgdGhhdCBuZXdlciBnZW5lcmF0aW9ucyBkb24ndCBoYXZlIFBXTSBwYXJlbnRz
Cj4+Pj4+IDI0TUh6IGFueSBsb25nZXI/Cj4+Pgo+Pj4gTm8sIG9mIGNvdXJzZSBub3QuIEZvciBl
eGFtcGxlLCBhIGZpeGVkIFBMTCAod2l0aCBhbGwgZmNsa19kaXZYCj4+PiBzZXR0aW5ncykgaGFz
IHJhdGVzIGhpZ2hlciB0aGFuIDI0TUh6LiBIb3dldmVyLCB3ZSBuZWVkIHRvIGNvbnNpZGVyIHRo
ZQo+Pj4gJ2hlYXZ5JyBiYWNrZ3JvdW5kIG9mIHN1Y2ggUFdNLgo+Pj4KPj4+IEhvd2V2ZXIsIHdl
IGhhdmUgYSAibGlnaHR3ZWlnaHQiIGNsa2luIChzcGVjaWFsIHJ0YzMyaykgd2l0aCBhIHJhdGUg
b2YKPj4+IDMya0h6IHRoYXQgd2UgY291bGQgcG90ZW50aWFsbHkgdXNlIGFzIGFuIGlucHV0IHRv
IHByb2R1Y2UgYSAzMmtIego+Pj4gb3V0cHV0IG9uIHRoZSBQV00gbGluZXMuIEkgZG9uJ3Qgc2Vl
IGFueSByZWFzb24gd2h5IHdlIHNob3VsZCBub3QKPj4+IHN1cHBvcnQgc3VjaCBzcGVjaWFsIGNh
c2VzLgo+Pj4KPj4KPj4gVHdvIG1vcmUgdGhpbmdzIHRvIGNvbnNpZGVyOgo+PiAxLiBXaGVuIHdh
bnRpbmcgYSAzMmtIeiAod2VsbCwgMzI3NjhIeikgb3V0cHV0IHdpdGggYSA1MCUgZHV0eSBjeWNs
ZSwKPj4gICAgdGhlbiB3ZSBuZWVkIGhpPTAgYW5kIGxvPTAgd2l0aCBhIDY0a0h6IGlucHV0IGNs
b2NrLgo+PiAgICBTZWUgcG9pbnQgMiBmb3IgYW4gZXhwbGFuYXRpb24gb2Ygd2h5IDAgYW5kIG5v
dCAxLgo+PiAgICBNZWFucyB3ZSBjb3VsZG4ndCB1c2UgdGhlIFJUQyBpbnB1dCBjbG9jay4gRGlk
IHlvdSBjb25zaWRlciB0aGlzPwo+PiAgICBPciBkbyBJIG1pc3Mgc29tZXRoaW5nPwo+IAo+IE5v
cGUsIHRoYXQncyBteSBmYXVsdC4gVXNpbmcgYSAzMmtIeiBiYXNlIGNsb2NrIGZvciByYXRlcyBv
ZiAxNmtIeiBvcgo+IGxvd2VyIHRoYXQgY2FuIGJlIGRpdmlkZWQgZXZlbmx5IGlzIGEgZ29vZCBj
aG9pY2UuIEhvd2V2ZXIsIGFzIHlvdQo+IG1lbnRpb25lZCBpbiBwb2ludCAyLCB0aGUgcHJvYmxl
bSB3aXRoIGF1dG9pbmNyZW1lbnRzIHNob3VsZCBiZSBmaXhlZAo+IGZpcnN0Lgo+IAo+PiAyLiBT
ZWVtcyB0aGUgUFdNIGJsb2NrIGludGVybmFsbHkgaW5jcmVtZW50cyBoaSBhbmQgbG8sIGV4Y2Vw
dCB0aGUKPj4gICAgY29uc3RhbnRfZW4gYml0IGlzIHNldCBvbiBuZXdlciBQV00gYmxvY2sgdmVy
c2lvbnMuCj4+ICAgIEZvciBiaWdnZXIgY250IHZhbHVlcyB0aGUgaW1wYWN0IGlzIG5lZ2xpZ2li
bGUsIGJ1dCBmb3IgdmVyeSBzbWFsbAo+PiAgICB2YWx1ZXMgaXQncyBzb21ldGhpbmcgd2UgaGF2
ZSB0byBjb25zaWRlci4KPj4gICAgVGhpcyB3YXMgb25lIGFkZGl0aW9uYWwgbW90aXZhdGlvbiBm
b3IgbWUgdG8gY2hvb3NlIGFuIGlucHV0Cj4+ICAgIGZyZXF1ZW5jeSB0aGF0IGNyZWF0ZXMgYmln
IGNudCB2YWx1ZXMuCj4gCj4gR2VvcmdlIGhhcyBhIHBhdGNoc2V0IGZvciB0aGlzIGFuZCBoZSB3
aWxsIHNlbmQgaXQgdmVyeSBzb29uIGFzIGhlCj4gbWVudGlvbmVkIGluIGFub3RoZXIgZW1haWwu
IExldCdzIGFzc3VtZSB0aGUgY29kZSBpcyBhbHJlYWR5IGZpeGVkIGFuZAo+IG5vIGxvbmdlciBo
YXMgYW55IGlzc3Vlcy4gSW4gbXkgb3BpbmlvbiwgaWYgd2Ugd2FudCB0byBnZW5lcmF0ZSByYXRl
cyBvZgo+IDE2a0h6LCA4a0h6LCA0a0h6LCBldGMuLCB0aGUgYmVzdCBwYXJlbnQgY2xvY2sgdG8g
dXNlIGlzIGEgMzJrSHogUlRDLgo+IEhpZ2gtcmF0ZSBjbG9ja3MgbWF5IG5vdCBkaXZpZGUgZXZl
bmx5IGFuZCBtYXkgbm90IGdlbmVyYXRlIGFuIGFjY3VyYXRlCj4gb3V0cHV0IHJhdGUuIFdoYXQg
ZG8geW91IHRoaW5rIGFib3V0IGl0Pwo+IApXaXRoIHRoZSBsb2dpYyBpbiB0aGUgQ0NGIGNvbnZl
cnNpb24gcGF0Y2ggc2V0IGZvciB0aGVzZSByYXRlcyB0aGUgMjRNSHoKeHRhbCBtdXggaW5wdXQg
d291bGQgYmUgdXNlZCwgY3JlYXRpbmcgZXhhY3RseSB0aGUgcmVxdWVzdGVkIHJhdGVzLgpTbyBJ
IHNlZSBubyBkaWZmZXJlbmNlIGhlcmUuIFdoYXQgSSBkb24ndCBrbm93IGlzIHdoZXRoZXIgcG93
ZXIKY29uc3VtcHRpb24gbWF5IGJlIGhpZ2hlciB3aXRoIGEgaGlnaGVyIGlucHV0IHJhdGUsIG9y
IHdoZXRoZXIgcXVhbGl0eQpvZiB0aGUgbXV4IHBhcmVudCBjbG9ja3MgZGlmZmVycy4KCj4+Cj4+
Pj4KPj4+Pgo+Pj4+PiBjYWxjdWxhdGlvbiB0aGUgUFdNIGRyaXZlciBpcyBhc2tpbmcgZm9yIGEg
Y2xvY2sgcmF0ZSBvZiA+PTJHSHouCj4+Pj4+IFdlIGNvbmNsdWRlZCB0aGF0IGxldHRpbmcgdGhl
IGNvbW1vbiBjbG9jayBmcmFtZXdvcmsgY2hvb3NlIHRoZSBiZXN0Cj4+Pj4+IHBvc3NpYmxlIHBh
cmVudCAobWVhbmluZzogcmVtb3ZpbmcgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5UIGhlcmUpIGNh
bgo+Pj4+PiBiZSBhIHdheSBmb3J3YXJkLgo+Pj4+PiBCdXQgdGhpcyBtZWFucyB0aGF0IHRoZSBQ
V00gY29udHJvbGxlciBkcml2ZXIgbXVzdCB0cnkgdG8gZmluZCB0aGUKPj4+Pj4gYmVzdCBwb3Nz
aWJsZSBwYXJlbnQgc29tZWhvdy4gVGhlIGVhc2llc3Qgd2F5IHdlIGNhbWUgdXAgd2l0aAo+Pj4+
PiAocHNldWRvLWNvZGUpOgo+Pj4+PiAgIGZyZXEgPSBOU0VDX1BFUl9TRUMgLyBwZXJpb2Q7Cj4+
Pj4+ICAgZmluX2ZyZXEgPSBjbGtfcm91bmRfcmF0ZShjaGFubmVsLT5jbGssIGZyZXEpOwo+Pj4+
PiAgIGlmIChmaW5fZnJlcSAhPSBmcmVxKSB7Cj4+Pj4+ICAgICBmcmVxID0gZGl2NjRfdTY0KE5T
RUNfUEVSX1NFQyAqICh1NjQpMHhmZmZmLCBwZXJpb2QpOwo+Pj4+PiAgICAgZmluX2ZyZXEgPSBj
bGtfcm91bmRfcmF0ZShjaGFubmVsLT5jbGssIGZyZXEpOwo+Pj4+PiAgIH0KPj4+Pj4KPj4+Pj4g
VGhlIGlkZWEgaXM6IGZvciBhIHJlcXVlc3RlZCAzMmtIeiBzaWduYWwgdGhlIFBXTSBwZXJpb2Qg
aXMgMzA1MThucy4KPj4+Pj4gVGhlIHVwZGF0ZWQgbG9naWMgd291bGQgZmluZCB0aGF0IHRoZXJl
J3MgYSBtYXRjaGluZyBjbG9jayBpbnB1dCBhbmQKPj4+Pj4gdXNlIHRoYXQgZGlyZWN0bHkuIElm
IG5vdDogdXNlIHRoZSBvcmlnaW5hbCBsb2dpYyBhcyBzdWdnZXN0ZWQgYnkKPj4+Pj4gSGVpbmVy
Lgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+IE1hcnRpbgo+Pj4+Pgo+Pj4+
Pgo+Pj4+PiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy85ZmFjYTJl
Ni1iN2ExLTQ3NDgtN2ViMC00OGY4MDY0ZTMyM2VAZ21haWwuY29tLwo+Pj4+Cj4+Pgo+Pgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
