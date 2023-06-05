Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF64C7EE24
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jun 2023 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvTTywphNDQMqXShSd1d+SVA/z4JWZx8Q5ZNi6vxops=; b=XcFwlSVuC2BZll
	0H8Zs5Hf4WLOL37kmTo7nwyAjko05jm0MHur9p7oiaxP9vdxoBlY+DBL0rmE23Wb3eJ9RJMH3a454
	TcQpFEt7Tf33PnrcUpThPHzST/MJ7DQm6xiO1FnO2+quQatOeze1vYlzYDryNHcdTFJHUlxIjyINw
	inJh/gGK3MJGUT2pDYBzQhudMmM/hy9acFwjXgJN+2xyMofWQTsKcRVhsH42bqQKZ1+BVYTHcRWk5
	FarDBvafAFYrcZYdZYZk77rQkIojopR8wLyWPqL7azqYMADAUze35SxbeTiiveWIhK7SX/atXRiHP
	3r+g8AYpREaDhXLMh/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HKo-00Gmsh-2v;
	Mon, 05 Jun 2023 21:01:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HKi-00GmpA-2y;
	Mon, 05 Jun 2023 21:01:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so5357767f8f.1;
        Mon, 05 Jun 2023 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685998902; x=1688590902;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UuDqA9QdnJOky0P/4GZ0/HcprcAx5ORnIFMZhmVSsY=;
        b=rscLBPynR6TMxI19jepJvNbfgpFoEHAykXLqe5/ReQZhBnrYAM433Wdoogv9R/Cjpw
         3iCxKmox8WcVqKOJl2qYX30ykq1IsvFhawEeXY4RWis0gECfM/qEUL5a9gWlezCB5lIe
         ckHtKbb3qaqlYiXz11eLiR9YwWXTDxGuGTx5KvA1pUTL6ziTHzTtGQ0fJTPPZHTs/zcF
         3455YUmIVKgcrg1ABVjYpVODeCtJxC9XNCsPlegbQRVbAjq/e2gRvhV/5njs8NjNwOUK
         5MW+XXMT8NoQn7pBEvm2vKjsDKiXcJNwG3KaHcppDnfIhza3ZNjcgyflDEyCB1uXlezC
         SWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685998902; x=1688590902;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UuDqA9QdnJOky0P/4GZ0/HcprcAx5ORnIFMZhmVSsY=;
        b=GEr+UNAaegTOTGiwYViRlQNlzo0q7YSaRNe7x4n3zp/4By6SQxR5w6gl/7o/D9y7PQ
         tvLRRN60IwkkmfeO8CiAl2G1/nTs0bZC2fUffiVORirnrheSmVPkROHv3wIiksUR2aml
         trGZMJt3AeoDwsGJ8zHKfqquqwFU+cElJtmGs58MinReGpXVqRWZyAQuiFEPAQs1ZCy3
         5Y2rF0+qjSKB8ICABSKXBQluIJEcaxVFf/ePnKZJR2U7sqPC2kubufIua2LpkVdwXrtq
         Q3oBAPlqXtHmpHmfL7i0v6agxxvojueQcvMd9MBTdeN5StoskKtPDam6dez+nhwGnpm4
         2K1w==
X-Gm-Message-State: AC+VfDyNSPplVe2M6JEJus++ElaZomYI9U89mIqe/mg159P5MZG5RX9v
	xSxLzVNGLXqudXku/qVl5YA=
X-Google-Smtp-Source: ACHHUZ7mNV6YQu9OB99bLB58sGz6QL4pOrfMccnMO+NFakN92T72Pr6TOxLePg7g9xlKisTHCE0niA==
X-Received: by 2002:adf:f8c9:0:b0:30a:ec3b:58d5 with SMTP id f9-20020adff8c9000000b0030aec3b58d5mr71328wrq.69.1685998902007;
        Mon, 05 Jun 2023 14:01:42 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1fe:b00:f181:5e69:a6b8:882f? (dynamic-2a01-0c23-c1fe-0b00-f181-5e69-a6b8-882f.c23.pool.telefonica.de. [2a01:c23:c1fe:b00:f181:5e69:a6b8:882f])
        by smtp.googlemail.com with ESMTPSA id b12-20020a05600010cc00b003077a19cf75sm10601714wrx.60.2023.06.05.14.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:01:41 -0700 (PDT)
Message-ID: <bf7c71bf-4f04-0dd3-91e1-eb639b36e7d1@gmail.com>
Date: Mon, 5 Jun 2023 23:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: George Stark <gnstark@sberdevices.ru>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 kernel <kernel@sberdevices.ru>, Dmitry Rokosov <DDRokosov@sberdevices.ru>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230602103211.2199283-1-gnstark@sberdevices.ru>
 <bf2d2814-5881-0f42-8b62-89c043b66e22@gmail.com>
 <ed8f95d2-ef62-d91a-618c-402ba1c9d09f@sberdevices.ru>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] pwm: meson: compute cnt register value in proper way
In-Reply-To: <ed8f95d2-ef62-d91a-618c-402ba1c9d09f@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_140144_958363_843E2EF1 
X-CRM114-Status: GOOD (  19.57  )
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

T24gMDUuMDYuMjAyMyAwOToxMSwgR2VvcmdlIFN0YXJrIHdyb3RlOgo+IE9uIDYvMi8yMyAyMzo1
MiwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBPbiAwMi4wNi4yMDIzIDEyOjMyLCBHZW9yZ2Ug
U3Rhcmsgd3JvdGU6Cj4+PiBBY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldCwgdGhlIFBXTSBoaWdo
IGFuZCBsb3cgY2xvY2sgY291bnQgdmFsdWVzCj4+PiBzaG91bGQgYmUgc2V0IHRvIGF0IGxlYXN0
IG9uZS4gVGhlcmVmb3JlLCBzZXR0aW5nIHRoZSBjbG9jayBjb3VudAo+Pj4gcmVnaXN0ZXIgdG8g
MCBhY3R1YWxseSBtZWFucyAxIGNsb2NrIGNvdW50Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdl
b3JnZSBTdGFyayA8R05TdGFya0BzYmVyZGV2aWNlcy5ydT4KPj4+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+Cj4+PiAtLS0KPj4+IFRoaXMg
cGF0Y2ggaXMgYmFzZWQgb24gY3VycmVudGx5IHVubWVyZ2VkIHBhdGNoIGJ5IEhlaW5lciBLYWxs
d2VpdAo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yM2ZlNjI1ZS1k
YzIzLTRkYjgtM2RjZS04MzE2N2NkM2IyMDZAZ21haWwuY29tCj4+PiAtLS0KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+
PiBpbmRleCA4MzRhY2Q3Li41N2U3ZDljIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMKPj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+PiBAQCAtMjA2LDYg
KzIwNiwxMSBAQAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNoYW5uZWwtPnByZV9kaXYgPSBwcmVf
ZGl2Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNoYW5uZWwtPmhpID0gZHV0eV9jbnQ7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgY2hhbm5lbC0+bG8gPSBjbnQgLSBkdXR5X2NudDsKPj4+ICsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoY2hhbm5lbC0+aGkpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjaGFubmVsLT5oaS0tOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjaGFubmVsLT5sbykK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYW5uZWwtPmxvLS07Cj4gSGVsbG8gSGVpbmVy
Cj4gCj4gVGhhbmtzIGZvciByZXZpZXcKPj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgd2Ugc2hvdWxk
IGRvIHRoaXMuIGR1dHlfY250IGFuZCBjbnQgYXJlIHJlc3VsdHMKPj4gb2YgYW4gaW50ZWdlciBk
aXZpc2lvbiBhbmQgdGhlcmVmb3JlIHBvdGVudGlhbGx5IHJvdW5kZWQgZG93bi4KPj4gVGhlIGNo
aXAtaW50ZXJuYWwgaW5jcmVtZW50IG1heSBoZWxwIHRvIGNvbXBlbnNhdGUgc3VjaCByb3VuZGlu
Zwo+PiBlcnJvcnMsIHNvIHRvIHNheS4gV2l0aCB0aGUgcHJvcG9zZWQgY2hhbmdlIHdlIG1heSBl
bmQgdXAgd2l0aCB0aGUKPj4gZWZmZWN0aXZlIHBlcmlvZCBiZWluZyBzaG9ydGVyIHRoYW4gdGhl
IHJlcXVlc3RlZCBvbmUuCj4gQWx0aG91Z2ggY2hpcC1pbnRlcm5hbCBpbmNyZW1lbnQgc29tZXRp
bWVzIG1heSBoZWxwIGFjY2lkZW50YWxseQo+IHRoZXJlIGFyZSBjYXNlcyB3aGVuIHRoZSBpbmNy
ZW1lbnQgcnVpbnMgcHJlY2lzZSBjYWxjdWxhdGlvbiBpbiB1bmV4cGVjdGVkIHdheS4KPiAKPiBI
ZXJlJ3Mgb3VyIGV4cGVyaWVuY2Ugb24gbWVzb24gYTExM2wgKG1lc29uLWExKSB3aXRoIHB3bSBk
cml2ZXIgYmFzZWQgb24gY2NmOgo+IHdlIG5lZWQgdG8gZ2V0IHB3bSBwZXJpb2QgYXMgY2xvc2Ug
YXMgcG9zc2libGUgdG8gMzI3Njhoei4KPiBjb25maWcgcHdtIHRvIHBlcmlvZCAxLzMyNzY4ID0g
MzA1MTducywgZHV0eSAxNTI1OG4KPiBIb3cgZHJpdmVyIGNhbGN1bGF0ZXMgaGlcbG8gcmVnczoK
PiByYXRlID0gTlNFQ19QRVJfU0VDICogMHhmZmZmIC8gMzA1MTcgPSB+MjE0N01oego+IHJhdGUg
PSBjbGtfcm91bmRfcmF0ZShyYXRlKSBjbGtfcm91bmRfcmF0ZSBzZWxlY3RzIGZhc3Rlc3QgcGFy
ZW50IGNsb2NrIHdoaWNoIGlzIDY0TWh6IGluIG91ciBjYXNlIHRoZW4gY2FsY3VsYXRpbmcgaGlc
bG8gYXQgbGFzdDogcGVyaW9kPSBtdWxfdTY0X3U2NF9kaXZfdTY0KHJhdGUsIHN0YXRlLT5wZXJp
b2QsIE5TRUNfUEVSX1NFQyk7IC8vIDE5NTMKPiBkdXR5PSBtdWxfdTY0X3U2NF9kaXZfdTY0KHJh
dGUsIHN0YXRlLT5kdXR5X2N5Y2xlLCBOU0VDX1BFUl9TRUMpOyAvLyA5NzYKPiBjaGFubmVsLT5o
aT0gZHV0eTsKPiBjaGFubmVsLT5sbz0gcGVyaW9kLSBkdXR5Owo+IHdpdGggdGhlIGludGVybmFs
IGluY3JlbWVudCB3ZSdsbCBoYXZlIHJlYWwgb3V0cHV0ICgxOTUzLTk3NiArIDEgKyA5NzYgKyAx
KSAqIDEgLyA2NE1oeiA9IDMyNzM2LjU3SHogYnV0IHdlIHNob3VsZCBoYXZlICgxOTUzLTk3NiAr
IDk3NikgKiAxIC8gNjRNaHogPSAzMjc3MC4wOUh6CgpTdXBwb3NlZGx5LCBkZXBlbmRpbmcgb24g
dGhlIHByaW9yIHJvdW5kaW5nIGVycm9ycywgc29tZXRoaW5nIGluY3JlbWVudGluZywKYW5kIHNv
bWV0aW1lcyBub3QgaW5jcmVtZW50aW5nIG1heSBwcm92aWRlIHRoZSBtb3JlIHByZWNpc2UgcmVz
dWx0LgpBbm90aGVyIHNvdXJjZSBvZiBlcnJvciBpcyBzaG93biB5b3VyIGV4YW1wbGUsIHRoZSBk
dXR5IGN5Y2xlIGlzbid0IDUwJQpkdWUgdG8gdGhlIHJvdW5kaW5nLgpOb3Qgc3VyZSBob3dldmVy
IHdoZXJlIHRoZXJlJ3MgYW55IHVzZSBjYXNlIHdoZXJlIHN1Y2ggc21hbGwgZGV2aWF0aW9ucwp3
b3VsZCBjYXVzZSBwcm9ibGVtcy4gVGhlcmVmb3JlIEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGlu
aW9uLgoKPiB8IEFuZCBJSVJDIHRoaXMgc2hvdWxkIG5vdCBoYXBwZW4uCj4gQ291bGQgeW91IHBs
ZWFzZSBleHBsYWluIHdoeSBvciBwb2ludCBvdXQgZG9jL2Rlc2NyaXB0aW9uIHdoZXJlIGl0J3Mg
c3RhdGVkPwo+IElmIHNvIHdlIGNhbiBhZGQgZXhwbGljaXQgY2hlY2sgdG8gcHJldmVudCBzdWNo
IGEgY2FzZQoKSSB0aGluayBJIGdvdCB0aGlzIHdyb25nLiBXaGVuIGNoZWNraW5nIHdoZXJlIEkg
Z290IHRoaXMgaW5mb3JtYXRpb24gZnJvbQpJIGZvdW5kIHRoZSBmb2xsb3dpbmcgaW4gcHdtX2Fw
cGx5X3N0YXRlX2RlYnVnKCk6CgppZiAoc3RhdGUtPmVuYWJsZWQgJiYgc3RhdGUtPnBlcmlvZCA8
IHMyLnBlcmlvZCkKICBkZXZfd2FybihjaGlwLT5kZXYsCiAgIi5hcHBseSBpcyBzdXBwb3NlZCB0
byByb3VuZCBkb3duIHBlcmlvZCAocmVxdWVzdGVkOiAlbGx1LCBhcHBsaWVkOiAlbGx1KVxuIiwK
ICBzdGF0ZS0+cGVyaW9kLCBzMi5wZXJpb2QpOwoKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gwqAgwqDC
oMKgwqDCoCByZXR1cm4gMDsKPj4+IEBAIC0zNDAsNyArMzQ1LDggQEAKPj4+IMKgwqDCoMKgwqAg
Y2hhbm5lbC0+bG8gPSBGSUVMRF9HRVQoUFdNX0xPV19NQVNLLCB2YWx1ZSk7Cj4+PiDCoMKgwqDC
oMKgIGNoYW5uZWwtPmhpID0gRklFTERfR0VUKFBXTV9ISUdIX01BU0ssIHZhbHVlKTsKPj4+IMKg
IC3CoMKgwqAgc3RhdGUtPnBlcmlvZCA9IG1lc29uX3B3bV9jbnRfdG9fbnMoY2hpcCwgcHdtLCBj
aGFubmVsLT5sbyArIGNoYW5uZWwtPmhpKTsKPj4+ICvCoMKgwqAgc3RhdGUtPnBlcmlvZCA9IG1l
c29uX3B3bV9jbnRfdG9fbnMoY2hpcCwgcHdtLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hhbm5lbC0+bG8gKyAxICsgY2hhbm5lbC0+aGkgKyAx
KTsKPj4+IMKgwqDCoMKgwqAgc3RhdGUtPmR1dHlfY3ljbGUgPSBtZXNvbl9wd21fY250X3RvX25z
KGNoaXAsIHB3bSwgY2hhbm5lbC0+aGkpOwo+Pj4gwqAgCj4+IERvZXNuJ3QgY2hhbm5lbC0+aGkg
aGF2ZSB0byBiZSBpbmNyZW1lbnRlZCBoZXJlIHRvbz8KPiBZZXMsIGxvc3QgdGhlIGxpbmUuIEkn
bGwgZml4IGl0Cj4gCj4gQmVzdCByZWdhcmRzCj4gR2VvcmdlCj4+PiDCoMKgwqDCoMKgIHJldHVy
biAwOwo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
