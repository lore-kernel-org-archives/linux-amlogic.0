Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75802C7EE2A
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 May 2023 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byf5c0noGdqK56FtrWzQ6wM8jbUw7kEqJe3XBNMrcp8=; b=JSZwrUVCRIopU4
	LCCDw/AWJ4ADQXB4nqu2ExztucULYwj61DwU94N3z2LZ7/6pfVr+vNemgUCm/s3xWy4Chureo795n
	Dw+6GRIoA7gD2yQTANWd7B8BD30zOXkqhV9TwEl8NKUsEY3r7z/ElqTJIb2uiLIYg9ctBwiUFQ5zR
	iWbW/BR+x2gLbO2GrttUSxK3JYxNN3b/xOImiNV+kx6eSu9V/Zj2Em+t+3x25uu104igiq4RPjd2w
	M6yY1Z3vbRZge9t92qP3mMfkfP0dX2Ys+N3/CtX/6x7NhGvA2EW7KdRMOOELooHymHgvdPsXPibmb
	RYPzp/ZwwCFG4ypOuwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1CGH-007w7I-0P;
	Mon, 22 May 2023 20:36:09 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1CGE-007w4u-2p;
	Mon, 22 May 2023 20:36:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96aae59bbd6so1226497166b.3;
        Mon, 22 May 2023 13:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684787762; x=1687379762;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em5xbQ0D6ebbV1FmoffaL+UEbuwTqf3dFkcFxuCUFqk=;
        b=PLEVt5noRBecT/d0+FkHXk5fJI1Dt947zFvNSYyURc0czoUFNFQyzW/jTNbcOGotZD
         brwoyjTwpCgDuZ+Q8Lww93nuYtz8Grg3tQz/KjEipbl5bGwjXdkAp4zd3Ej2R/sF4X4f
         QWaewcLMYoOcFSd+asGvcgJHV+hh0UibQaCu3NT7ten/jaHT6cMDowWaV6jLwwra1/1k
         v3SMFNU9W16FLMbnf4FmxiCiYT9wOBDqn4ApNtm1OsWxpalCRY1koW4chzdHRbDXGyh7
         HJKrXaSXXEzthRhsLdoZT+321WgJv07nKNbBv/UPBr5possRJjupHot8tnhPdWvYCNX2
         lysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684787762; x=1687379762;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Em5xbQ0D6ebbV1FmoffaL+UEbuwTqf3dFkcFxuCUFqk=;
        b=Y9IFLqeWmi7hVYqUW3e9BoO41JBLky4ZTJH4Iru+5X0un/ljqilcIUOmqzdZbLZzGs
         U8dFQS65DPHOo0TDx3ZnBk7onD/mXK3fcQ8H3wMof9fhA1cypvlI0mYKz6r+IxafJja/
         8208mkk/5Tj1rj14ZuPaOmu6bE3KXP9uiIW0Wa7xqs91QAPfpTUPZ2nlP2Q7BCGBuZDZ
         Ej0LhDi+82FNuNrI2LhKq9iFMBr6TgJNIak2Au6kBZ01KEp72YCHC2zciZ4YLJ1oTH49
         Q5wmFeG/9yEnui47msmCzyQEFxpuNLpQWM6GefThpip7q2vZax0yn1ETDhGoRBKEP2rV
         ssLw==
X-Gm-Message-State: AC+VfDyRXGnBv2sie5x/02TWslb+pVHCkQjvtri4qO6/L4SG8XnvU4rC
	70YzVCUp9Z2Q2M8B0afKzWA=
X-Google-Smtp-Source: ACHHUZ5XyYgU1i3B3mHjaGM2BnWB48rIAuG2m9x2R44TQdOSaTOc5VoDa2KV6AYGt4r7SVR59DTbYw==
X-Received: by 2002:a17:906:6a0d:b0:967:3963:dab8 with SMTP id qw13-20020a1709066a0d00b009673963dab8mr12863409ejc.7.1684787761823;
        Mon, 22 May 2023 13:36:01 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c506:b200:dd98:9b90:4551:7dd3? (dynamic-2a01-0c23-c506-b200-dd98-9b90-4551-7dd3.c23.pool.telefonica.de. [2a01:c23:c506:b200:dd98:9b90:4551:7dd3])
        by smtp.googlemail.com with ESMTPSA id de16-20020a1709069bd000b00970f0e2dab2sm50869ejc.112.2023.05.22.13.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 13:36:01 -0700 (PDT)
Message-ID: <a121266a-110a-8c4e-cd71-4e35165fc789@gmail.com>
Date: Mon, 22 May 2023 22:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
In-Reply-To: <20230522134425.pc5fhojf53v6q2jz@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_133606_916624_219F649F 
X-CRM114-Status: GOOD (  27.78  )
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

T24gMjIuMDUuMjAyMyAxNTo0NCwgRG1pdHJ5IFJva29zb3Ygd3JvdGU6Cj4gSGVpbmVyLAo+IAo+
IE9uIEZyaSwgTWF5IDE5LCAyMDIzIGF0IDA2OjEwOjUwUE0gKzAyMDAsIEhlaW5lciBLYWxsd2Vp
dCB3cm90ZToKPj4gT24gMTguMDUuMjAyMyAyMjowNCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPj4+IEhpIERtaXRyeSwKPj4+Cj4+PiBPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAxMjozNOKA
r1BNIERtaXRyeSBSb2tvc292Cj4+PiA8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToK
Pj4+IFsuLi5dCj4+Pj4+PiBBZGRpdGlvbmFsbHksIHRoZSBDQ0YgZGV0ZXJtaW5lcyB0aGUgYmVz
dCBhbmNlc3RvciBiYXNlZCBvbiBob3cgY2xvc2UKPj4+Pj4+IGl0cyByYXRlIGlzIHRvIHRoZSBn
aXZlbiBvbmUsIGJhc2VkIG9uIGFyaXRobWV0aWMgY2FsY3VsYXRpb25zLiBIb3dldmVyLAo+Pj4+
Pj4gd2UgaGF2ZSBpbmRlcGVuZGVudCBrbm93bGVkZ2UgdGhhdCBhIGNlcnRhaW4gY2xvY2sgd291
bGQgYmUgYmV0dGVyLCB3aXRoCj4+Pj4+PiBsZXNzIGppdHRlciBhbmQgZmV3ZXIgaW50ZXJtZWRp
YXJpZXMsIHdoaWNoIHdpbGwgbGlrZWx5IGltcHJvdmUgZW5lcmd5Cj4+Pj4+PiBlZmZpY2llbmN5
LiBTYWRseSwgdGhlIENDRiBjYW5ub3QgdGFrZSB0aGlzIGludG8gYWNjb3VudC4KPj4+Pj4gSSBh
Z3JlZSB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBDQ0YgaXMgZmFpcmx5IHNpbXBsZS4gVGhl
cmUncyB3YXlzCj4+Pj4+IHRvIHRyaWNrIGl0IHRob3VnaDogSUlSQyBpZiB0aGVyZSBhcmUgbXVs
dGlwbGUgZXF1YWxseSBzdWl0YWJsZSBjbG9ja3MKPj4+Pj4gaXQgcGlja3MgdGhlIGZpcnN0IG9u
ZS4gRm9yIG1lIGFsbCBvZiB0aGlzIGhhcyB3b3JrZWQgc28gZmFyIHdoaWNoIGlzCj4+Pj4+IHdo
YXQgbWFrZXMgbWUgY3VyaW91cyBpbiB0aGlzIGNhc2UgKG5vdCBzYXlpbmcgdGhhdCBhbnl0aGlu
ZyBpcyB3cm9uZwo+Pj4+PiB3aXRoIHlvdXIgYXBwcm9hY2gpLgo+Pj4+Pgo+Pj4+PiBEbyB5b3Ug
aGF2ZSBhIChyZWFsIHdvcmxkKSBleGFtcGxlIHdoZXJlIHRoZSBSVEMgY2xvY2sgc2hvdWxkIGJl
Cj4+Pj4+IHByZWZlcnJlZCBvdmVyIGFub3RoZXIgY2xvY2s/Cj4+Pj4+Cj4+Pj4KPj4+PiBZZXMs
IGEgcmVhbC1saWZlIGV4YW1wbGUgaXMgdGhlIG5lZWQgZm9yIGEgMzJLaHogY2xvY2sgZm9yIGFu
IGV4dGVybmFsCj4+Pj4gd2lmaSBjaGlwLiBUaGVyZSBpcyBvbmUgb3B0aW9uIHRvIHByb3ZpZGUg
dGhpcyBjbG9jayB3aXRoIGhpZ2gKPj4+PiBwcmVjaXNpb24sIHdoaWNoIGlzIFJUQyArIEdFTkNM
Sy4KPj4+Pgo+Pj4+PiBJJ20gdGhpbmtpbmcgYWJvdXQgdGhlIGZvbGxvd2luZyBzY2VuYXJpby4K
Pj4+Pj4gUFdNIHBhcmVudHM6Cj4+Pj4+IC0gWFRBTDogMjRNSHoKPj4+Pj4gLSBzeXM6IG5vdCBz
dXJlIC0gbGV0J3Mgc2F5IDE2Ni42N01Iego+Pj4+PiAtIFJUQzogMzJrSHoKPj4+Pj4KPj4+Pj4g
VGhlbiBhZnRlciB0aGF0IHRoZXJlJ3MgYSBkaXZpZGVyIGFuZCBhIGdhdGUuCj4+Pj4+Cj4+Pj4+
IExldCdzIHNheSB0aGUgUFdNIGNvbnRyb2xsZXIgbmVlZHMgYSAxTUh6IGNsb2NrOiBpdCBjYW4g
dGFrZSB0aGF0IGZyb20KPj4+Pj4gWFRBTCBvciBzeXMuIFNpbmNlIFhUQUwgaXMgZXZlbmx5IGRp
dmlzaWJsZSB0byAxTUh6IENDRiB3aWxsIHBpY2sgdGhhdAo+Pj4+PiBhbmQgdXNlIHRoZSBkaXZp
ZGVyLgo+Pj4+PiBCdXQgbGV0J3Mgc2F5IHRoZSBQV00gY29udHJvbGxlciBuZWVkcyBhIDMya0h6
IGNsb2NrOiBDQ0Ygd291bGQKPj4+Pj4gYXV0b21hdGljYWxseSBwaWNrIHRoZSBSVEMgY2xvY2su
Cj4+Pj4+IFNvIGlzIHlvdXIgaW1wbGVtZW50YXRpb24gdGhlcmUgdG8gY292ZXIgbGV0J3Mgc2F5
IDFrSHogd2hlcmUKPj4+Pj4gbWF0aGVtYXRpY2FsbHkgMjRNSHogY2FuIGJlIGRpdmlkZWQgZXZl
bmx5IHRvIDFrSHogKGFuZCB0aHVzIHNob3VsZAo+Pj4+PiBub3QgcmVzdWx0IGluIGFueSBqaXR0
ZXIpIGJ1dCBSVEMgZ2l2ZXMgYmV0dGVyIHByZWNpc2lvbiBpbiB0aGUgcmVhbAo+Pj4+PiB3b3Js
ZCAoZXZlbiB0aG91Z2ggaXQncyBvZmYgYnkgMjRIeik/Cj4+Pj4+Cj4+Pj4KPj4+PiBJIGRvbid0
IHRoaW5rIHNvLiBUaGUgaGlnaGVzdCBwcmVjaXNpb24gdGhhdCBSVEMgY2FuIHByb3ZpZGUgaXMg
ZnJvbSBhCj4+Pj4gMzJLSHogcmF0ZSBvbmx5LiBIb3dldmVyLCBJIGJlbGlldmUgdGhhdCBhIDFr
SHogZnJlcXVlbmN5IGNhbiBhbHNvIGJlCj4+Pj4gYWNoaWV2ZWQgYnkgdXNpbmcgeHRhbCAyNE1I
eiB3aXRoIGEgZGl2aWRlciwgd2hpY2ggY2FuIHByb3ZpZGUgaGlnaAo+Pj4+IHByZWNpc2lvbiBh
cyB3ZWxsLgo+Pj4gVGhhbmsgeW91IGFnYWluIGZvciB0aGUgZ3JlYXQgZGlzY3Vzc2lvbiBvbiBJ
UkMgdG9kYXkuCj4+PiBIZXJlJ3MgbXkgc2hvcnQgc3VtbWFyeSBzbyBJIGRvbid0IGZvcmdldCBi
ZWZvcmUgeW91J2xsIGZvbGxvdyB1cCBvbiB0aGlzLgo+Pj4KPj4+IEluIGdlbmVyYWwgdGhlcmUn
cyB0d28ga25vd24gY2FzZXMgd2hlcmUgdGhlIFJUQyBjbG9jayBuZWVkcyB0byBiZSB1c2VkOgo+
Pj4gYSkgV2hlbiB1c2luZyB0aGUgR0VOQ0xLIG91dHB1dCBvZiB0aGUgU29DIHRvIG91dHB1dCB0
aGUgMzJrSHogUlRDCj4+PiBjbG9jayBhbmQgY29ubmVjdCB0aGF0IHRvIGFuIFNESU8gV2lGaSBj
aGlwIGNsb2NrIGlucHV0ICh0aGlzIHNlZW1zCj4+PiB1c2VmdWwgaW4gbXkgdW5kZXJzdGFuZGlu
ZyBiZWNhdXNlIHRoZSBSVEMgY2xvY2sgcHJvdmlkZXMgaGlnaAo+Pj4gcHJlY2lzaW9uKQo+Pj4g
YikgV2hlbiB1c2luZyB0aGUgUFdNIGNvbnRyb2xsZXIgdG8gb3V0cHV0IGEgMzJrSHogY2xvY2sg
c2lnbmFsLiBJbgo+Pj4gdGhpcyBjYXNlIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB1c2luZyB0
aGUgUlRDIGNsb2NrIGFzIGlucHV0IHRvIHRoZQo+Pj4gUFdNIGNvbnRyb2xsZXIgcmVzdWx0cyBp
biB0aGUgYmVzdCBwb3NzaWJsZSBzaWduYWwKPj4+Cj4+PiBUaGUgc2Vjb25kIGNhc2Ugd29uJ3Qg
YmUgc3VwcG9ydGVkIHdpdGggSGVpbmVyJ3MgcGF0Y2hlcyBbMF0gdGhhdCB1c2UKPj4+IENDRiAo
Y29tbW9uIGNsb2NrIGZyYW1ld29yaykgaW4gdGhlIFBXTSBjb250cm9sbGVyIGRyaXZlci4KPj4+
IEluIHRoaXMgc2VyaWVzIHRoZSBwYXJlbnQgY2xvY2sgaXMgY2FsY3VsYXRlZCB1c2luZzoKPj4+
ICAgZnJlcSA9IGRpdjY0X3U2NChOU0VDX1BFUl9TRUMgKiAodTY0KTB4ZmZmZiwgcGVyaW9kKTsK
Pj4+Cj4+PiBBIDMya0h6IGNsb2NrIG1lYW5zIGEgUFdNIHBlcmlvZCBvZiAzMDUxOG5zLiBTbyB3
aXRoIHRoZSBhYm92ZQo+Pgo+PiBUbyBiZSBwcmVjaXNlOiAzMDUxNyw1NzgxMjVucwo+PiBXaGF0
IG1lYW5zIHRoYXQgdGhlIFBXTSBmcmFtZXdvcmsgY2FuJ3Qgc2F5ICJJIHdhbnQgMzI3NjhIeiIs
Cj4+IGJ1dCBqdXN0ICJJIHdhbnQgc29tZXRoaW5nIGJlaW5nIHZlcnkgY2xvc2UgdG8gMzI3NjhI
eiIuCj4+IFNvIHdoYXQgeW91IG5lZWQgaXMgc29tZSBzaW1wbGUgaGV1cmlzdGljIHRvIGludGVy
cHJldCB0aGUKPj4gUFdNIHJlcXVlc3QgLT4gIlBXTSByZXF1ZXN0cyAzMDUxOG5zLCBidXQgc3Vw
cG9zZWRseSBpdCB3YW50cwo+PiAzMjc2OEh6Igo+Pgo+PiBOU0VDX1BFUl9TRUMgLyAzMDUxOCA9
IDMyNzY3IChyb3VuZGVkIGRvd24gZnJvbSAzMjc2Nyw1NDcpCj4+IGNsa19yb3VuZF9yYXRlKGNo
YW5uZWwtPmNsaywgMzI3NjcpIHdvdWxkIHJldHVybiAwIChJICp0aGluayopLAo+PiBiZWNhdXNl
IGl0IHRyaWVzIHRvIGZpbmQgdGhlIG5leHQgbG93ZXIgY2xvY2suCj4+Cj4+IFRoZSBTb0MgZmFt
aWxpZXMgSSdtIGZhbWlsaWFyIHdpdGggaGF2ZSBmY2xraW4yIGFzIFBXTSBwYXJlbnQuCj4+IFRo
YXQncyAxIEdIeiBpbiBteSBjYXNlLCB3aGF0IHJlc3VsdHMgaW4gYSBmcmVxdWVuY3kgb2YgMzIu
NzY3LDU0N0h6Cj4+IGZvciBwZXJpb2QgPSAzMDUxOG4uCj4+IFdoYXQgeW91J3JlIHNheWluZyBp
cyB0aGF0IG5ld2VyIGdlbmVyYXRpb25zIGRvbid0IGhhdmUgUFdNIHBhcmVudHMKPj4+IDI0TUh6
IGFueSBsb25nZXI/Cj4gCj4gTm8sIG9mIGNvdXJzZSBub3QuIEZvciBleGFtcGxlLCBhIGZpeGVk
IFBMTCAod2l0aCBhbGwgZmNsa19kaXZYCj4gc2V0dGluZ3MpIGhhcyByYXRlcyBoaWdoZXIgdGhh
biAyNE1Iei4gSG93ZXZlciwgd2UgbmVlZCB0byBjb25zaWRlciB0aGUKPiAnaGVhdnknIGJhY2tn
cm91bmQgb2Ygc3VjaCBQV00uCj4gCj4gSG93ZXZlciwgd2UgaGF2ZSBhICJsaWdodHdlaWdodCIg
Y2xraW4gKHNwZWNpYWwgcnRjMzJrKSB3aXRoIGEgcmF0ZSBvZgo+IDMya0h6IHRoYXQgd2UgY291
bGQgcG90ZW50aWFsbHkgdXNlIGFzIGFuIGlucHV0IHRvIHByb2R1Y2UgYSAzMmtIego+IG91dHB1
dCBvbiB0aGUgUFdNIGxpbmVzLiBJIGRvbid0IHNlZSBhbnkgcmVhc29uIHdoeSB3ZSBzaG91bGQg
bm90Cj4gc3VwcG9ydCBzdWNoIHNwZWNpYWwgY2FzZXMuCj4gCgpUd28gbW9yZSB0aGluZ3MgdG8g
Y29uc2lkZXI6CjEuIFdoZW4gd2FudGluZyBhIDMya0h6ICh3ZWxsLCAzMjc2OEh6KSBvdXRwdXQg
d2l0aCBhIDUwJSBkdXR5IGN5Y2xlLAogICB0aGVuIHdlIG5lZWQgaGk9MCBhbmQgbG89MCB3aXRo
IGEgNjRrSHogaW5wdXQgY2xvY2suCiAgIFNlZSBwb2ludCAyIGZvciBhbiBleHBsYW5hdGlvbiBv
ZiB3aHkgMCBhbmQgbm90IDEuCiAgIE1lYW5zIHdlIGNvdWxkbid0IHVzZSB0aGUgUlRDIGlucHV0
IGNsb2NrLiBEaWQgeW91IGNvbnNpZGVyIHRoaXM/CiAgIE9yIGRvIEkgbWlzcyBzb21ldGhpbmc/
CjIuIFNlZW1zIHRoZSBQV00gYmxvY2sgaW50ZXJuYWxseSBpbmNyZW1lbnRzIGhpIGFuZCBsbywg
ZXhjZXB0IHRoZQogICBjb25zdGFudF9lbiBiaXQgaXMgc2V0IG9uIG5ld2VyIFBXTSBibG9jayB2
ZXJzaW9ucy4KICAgRm9yIGJpZ2dlciBjbnQgdmFsdWVzIHRoZSBpbXBhY3QgaXMgbmVnbGlnaWJs
ZSwgYnV0IGZvciB2ZXJ5IHNtYWxsCiAgIHZhbHVlcyBpdCdzIHNvbWV0aGluZyB3ZSBoYXZlIHRv
IGNvbnNpZGVyLgogICBUaGlzIHdhcyBvbmUgYWRkaXRpb25hbCBtb3RpdmF0aW9uIGZvciBtZSB0
byBjaG9vc2UgYW4gaW5wdXQKICAgZnJlcXVlbmN5IHRoYXQgY3JlYXRlcyBiaWcgY250IHZhbHVl
cy4KCj4+Cj4+Cj4+PiBjYWxjdWxhdGlvbiB0aGUgUFdNIGRyaXZlciBpcyBhc2tpbmcgZm9yIGEg
Y2xvY2sgcmF0ZSBvZiA+PTJHSHouCj4+PiBXZSBjb25jbHVkZWQgdGhhdCBsZXR0aW5nIHRoZSBj
b21tb24gY2xvY2sgZnJhbWV3b3JrIGNob29zZSB0aGUgYmVzdAo+Pj4gcG9zc2libGUgcGFyZW50
IChtZWFuaW5nOiByZW1vdmluZyBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgaGVyZSkgY2FuCj4+
PiBiZSBhIHdheSBmb3J3YXJkLgo+Pj4gQnV0IHRoaXMgbWVhbnMgdGhhdCB0aGUgUFdNIGNvbnRy
b2xsZXIgZHJpdmVyIG11c3QgdHJ5IHRvIGZpbmQgdGhlCj4+PiBiZXN0IHBvc3NpYmxlIHBhcmVu
dCBzb21laG93LiBUaGUgZWFzaWVzdCB3YXkgd2UgY2FtZSB1cCB3aXRoCj4+PiAocHNldWRvLWNv
ZGUpOgo+Pj4gICBmcmVxID0gTlNFQ19QRVJfU0VDIC8gcGVyaW9kOwo+Pj4gICBmaW5fZnJlcSA9
IGNsa19yb3VuZF9yYXRlKGNoYW5uZWwtPmNsaywgZnJlcSk7Cj4+PiAgIGlmIChmaW5fZnJlcSAh
PSBmcmVxKSB7Cj4+PiAgICAgZnJlcSA9IGRpdjY0X3U2NChOU0VDX1BFUl9TRUMgKiAodTY0KTB4
ZmZmZiwgcGVyaW9kKTsKPj4+ICAgICBmaW5fZnJlcSA9IGNsa19yb3VuZF9yYXRlKGNoYW5uZWwt
PmNsaywgZnJlcSk7Cj4+PiAgIH0KPj4+Cj4+PiBUaGUgaWRlYSBpczogZm9yIGEgcmVxdWVzdGVk
IDMya0h6IHNpZ25hbCB0aGUgUFdNIHBlcmlvZCBpcyAzMDUxOG5zLgo+Pj4gVGhlIHVwZGF0ZWQg
bG9naWMgd291bGQgZmluZCB0aGF0IHRoZXJlJ3MgYSBtYXRjaGluZyBjbG9jayBpbnB1dCBhbmQK
Pj4+IHVzZSB0aGF0IGRpcmVjdGx5LiBJZiBub3Q6IHVzZSB0aGUgb3JpZ2luYWwgbG9naWMgYXMg
c3VnZ2VzdGVkIGJ5Cj4+PiBIZWluZXIuCj4+Pgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IE1h
cnRpbgo+Pj4KPj4+Cj4+PiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dp
Yy85ZmFjYTJlNi1iN2ExLTQ3NDgtN2ViMC00OGY4MDY0ZTMyM2VAZ21haWwuY29tLwo+Pgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
