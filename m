Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82A9C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEQ7r9YT+6ks9lmTzPDu52po+gOLLtEDya2F6PGa9kM=; b=W8heACvC1M5UIAgge/XajN0yKX
	kN3iy9U/thnZv7ulhDwdfxZFRBsQygzx8g4TZzJI1W2S9dJHZilSILtNqLNqLwtuAAFcHoE1dQZ/f
	YhPUUprG1P6ePqtmeTGqVV8w0fZP/a4lZWnQ20gGTSv9Npv93E7fEe+iW7NkP/XYEckAQgSkFQxXe
	SYQz9hABBZHFc4WvsPBFugkkbKcqMa25W+kaxtAdA4PIt8cz0r51+lKmqHD1samfjvZmJz5WPENGv
	AmpwXRmou0xQTJau42xtgsBHdUt5Yfl0LBP31KJeifOH/hs7PKyzGD4qihRG/6VY3/Lhk5JxHhsIi
	cZycek6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvvzY-009fGj-VV; Tue, 31 May 2022 07:08:36 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvvzV-009fFi-Fc
	for linux-amlogic@lists.infradead.org; Tue, 31 May 2022 07:08:35 +0000
Received: by mail-qt1-x841.google.com with SMTP id hh4so12691358qtb.10
        for <linux-amlogic@lists.infradead.org>; Tue, 31 May 2022 00:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:references
         :content-language:reply-to:in-reply-to:content-transfer-encoding;
        bh=gAK7/94O7agAtZNEVZfPqId6jughcsczu/XIQP5UVjg=;
        b=lcMGUvDIyt+ZQmejk7dwCEkt8Awpq9hPjwBeJWbE+tPmZw8YGDqdPoKgDtIcrNfDM+
         clm/MvPy0tVaiTRHGUnJ38J8a88+EJY610sSRF+rM8K3TLEjtnm00Zo91GYbK51IG1/J
         v6G/6nBCZ8We2KlL/QarnkznOkTmW6gX95Baw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:references:content-language:reply-to:in-reply-to
         :content-transfer-encoding;
        bh=gAK7/94O7agAtZNEVZfPqId6jughcsczu/XIQP5UVjg=;
        b=G38D9nZ/kUFjqrjK0qi54OV96g5uckz6tWnc3h3b0liYHwVuqpb2ciHaTM0Uy0zKOa
         upiVVBkNIliSuetsiFZsfnpIkRW3tlktoEiZk8uaintbU/MNPg83yq92JIRKk7eOVYkc
         X/ulYoPeGEbTUEHYYPGwYQCTg4EM3G032rSoMYnojRk4jkXaFMlWz5PRKW2aA6uae0qL
         8veIL6+9Ys0K2s4v0Bj7o/cxncGiPCHHYrBo/zEnerZaVcjPB/9UpsXeJdUmeXYow406
         9goL0JL84WYDO7FSNMfS26WtzE9Q7YNuro9J+x+3Y56mvUrw93zzmyzAe9vJUu0BkNpO
         Dxcg==
X-Gm-Message-State: AOAM532zZh33jRKFAvjs1J1HewBBOEey9feeeensgn34S5nNh7sRHaCN
	aajmoYaXHzwtbe/3T/HjZIF62YIlBZ45QOp0
X-Google-Smtp-Source: ABdhPJw+HO6LTQnwpuQXgFF6zZJCHuLPH3GuGObGhbAQEw2JBE+yn0AXu0AOabRXhBhWPcPdqcJhLg==
X-Received: by 2002:a05:622a:1211:b0:2f3:d6c8:4845 with SMTP id y17-20020a05622a121100b002f3d6c84845mr46794782qtx.118.1653980910296;
        Tue, 31 May 2022 00:08:30 -0700 (PDT)
Received: from [10.1.14.153] (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id ew10-20020a05622a514a00b00304b41fa057sm2554924qtb.57.2022.05.31.00.08.29
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 00:08:30 -0700 (PDT)
Message-ID: <7724a931-00e7-fd87-9340-9354263b0f4b@streamunlimited.com>
Date: Tue, 31 May 2022 09:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Peter Suti <peter.suti@streamunlimited.com>
Subject: Re: [PATCH v5 0/4] fix the meson NFC clock
To: linux-amlogic@lists.infradead.org
References: <20220513123404.48513-1-liang.yang@amlogic.com>
Content-Language: en-US
In-Reply-To: <20220513123404.48513-1-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_000833_863243_D996D4F3 
X-CRM114-Status: GOOD (  12.61  )
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
Reply-To: 20220513123404.48513-1-liang.yang@amlogic.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB0aGUgZWZmb3J0IGZvciBzdXBwb3J0aW5nIE5BTkQgY2hpcHMgb24gdGhl
IG1lc29uIHBsYXRmb3JtIQpJJ20gdHJ5aW5nIHRvIGdldCBvdXIgbW9kdWxlIHdvcmtpbmcgd2l0
aCB0aGVzZSBwYXRjaCBzZXJpZXMgYnV0IAp1bmZvcnR1bmF0ZWx5IGl0IGlzIG5vdCB3b3JraW5n
IGZvciBtZS4gV2UgYXJlIHVzaW5nIHRoZSBBMTEzIGFuZCBhIApUQzU4TlZHMlMwSEJBSTYgTkFO
RCBjaGlwLgoKVGhpcyBOQU5EIGNoaXAgdXNlcyBzb21lIG5vbmUgT05GSSBjb21wbGlhbnQgdGlt
aW5ncyB3aGljaCBJJ3ZlIHNldCB1cCAKZXhhY3RseSBsaWtlIGluIHRoZSBmdW5jdGlvbiAidGg1
OG52ZzJzM2hiYWk0X2Nob29zZV9pbnRlcmZhY2VfY29uZmlnIi4gCkV2ZW4gd2l0aCB0aGVzZSB0
aW1pbmdzIHRoZSBjaGlwIGlzIG5vdCB3b3JraW5nLgoKSGVyZSBhcmUgdGhlIGtlcm5lbCBsb2dz
LCB3aXRoIHNvbWUgZXh0cmEgbG9nZ2luZyBmb3IgdGhlIHRpbWluZyBwYXJhbWV0ZXJzOgpbwqDC
oMKgIDAuOTgxMDg3XSBsb29wOiBtb2R1bGUgbG9hZGVkClvCoMKgwqAgMC45ODE2MjZdIG1lZ2Fz
YXM6IDA3LjcxNC4wNC4wMC1yYzEKW8KgwqDCoCAwLjk4NDIzOV0gbmFuZDogZGV2aWNlIGZvdW5k
LCBNYW51ZmFjdHVyZXIgSUQ6IDB4OTgsIENoaXAgSUQ6IDB4ZGMKW8KgwqDCoCAwLjk4ODU2OF0g
bmFuZDogVG9zaGliYSBUQzU4TlZHMlMwSCA0RyAzLjNWIDgtYml0ClvCoMKgwqAgMC45OTMzNjZd
IG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMjU2IEtpQiwgcGFnZSBzaXplOiA0MDk2
LCAKT09CIHNpemU6IDI1NgpbwqDCoMKgIDEuMDAwOTcxXSB0Q0xTX21pbiAxMjAwMApbwqDCoMKg
IDEuMDAzNjIxXSB0Q0xIX21pbiA1MDAwClvCoMKgwqAgMS4wMDYyMjNdIHRDU19taW4gMjAwMDAK
W8KgwqDCoCAxLjAwODgwMl0gdENIX21pbiA1MDAwClvCoMKgwqAgMS4wMTEyOThdIHRXUF9taW4g
MTIwMDAKW8KgwqDCoCAxLjAxMzg5MV0gdEFMU19taW4gMTIwMDAKW8KgwqDCoCAxLjAxNjU2OV0g
dEFMSF9taW4gNTAwMApbwqDCoMKgIDEuMDE5MTQ2XSB0RFNfbWluIDEyMDAwClvCoMKgwqAgMS4w
MjE3MzldIHRESF9taW4gNTAwMApbwqDCoMKgIDEuMDI0MjM1XSB0V0NfbWluIDI1MDAwClvCoMKg
wqAgMS4wMjY4MjhdIHRXSF9taW4gMTAwMDAKW8KgwqDCoCAxLjAyOTQxNV0gdFdXX21pbiAxMDAw
MDAKW8KgwqDCoCAxLjAzMjA4NF0gdFJSX21pbiAyMDAwMApbwqDCoMKgIDEuMDM0Njc3XSB0UlBf
bWluIDEyMDAwClvCoMKgwqAgMS4wMzcyNjRdIHRSQ19taW4gMjUwMDAKW8KgwqDCoCAxLjAzOTg0
Nl0gdFJFQV9tYXggMjAwMDAKW8KgwqDCoCAxLjA0MjUzOF0gdENFQV9tYXggMjUwMDAKW8KgwqDC
oCAxLjA0NTE5OV0gdENMUl9taW4gMTAwMDAKW8KgwqDCoCAxLjA0Nzg2OF0gdEFSX21pbiAxMDAw
MApbwqDCoMKgIDEuMDUwNDYwXSB0UkhPSF9taW4gMjUwMDAKW8KgwqDCoCAxLjA1MzIyMV0gdFJM
T0hfbWluIDUwMDAKW8KgwqDCoCAxLjA1NTg4OV0gdFJIWl9tYXggNjAwMDAKW8KgwqDCoCAxLjA1
ODU2OF0gdENIWl9tYXggMjAwMDAKW8KgwqDCoCAxLjA2MTI0Ml0gdFJFSF9taW4gMTAwMDAKW8Kg
wqDCoCAxLjA2MzkxMF0gdElSX21pbiAwClvCoMKgwqAgMS4wNjYxNThdIHRSSFdfbWluIDMwMDAw
ClvCoMKgwqAgMS4wNjg4MzJdIHRXSFJfbWluIDYwMDAwClvCoMKgwqAgMS4wNzE1MDBdIHRXQl9t
YXggMTAwMDAwClvCoMKgwqAgMS4wNzQxNzldIHRSU1RfbWF4IDUwMDAwMDAwMApbwqDCoMKgIDEu
MDc3MTk4XSB0UFJPR19tYXggNzAwMDAwMDAwClvCoMKgwqAgMS4wODAzMDNdIHRCRVJTX21heCA1
MDAwMDAwMDAwClvCoMKgwqAgMS4wODM0ODldIHRSX21heCAyMDAwMDAwMDAKW8KgwqDCoCAxLjA4
NjM0MF0gdENDU19taW4gNTAwMDAwClvCoMKgwqAgMS4wODkxMDBdIHRBRExfbWluIDQwMDAwMApb
wqDCoMKgIDEuMDkxODU1XSB0Q0VIX21pbiAyMDAwMApbwqDCoMKgIDEuMDk0NTM0XSB0Q09IX21p
biAwClvCoMKgwqAgMS4wOTY4NjNdIHRGRUFUX21heCAxMDAwMDAwClvCoMKgwqAgMS4wOTk3OTFd
IHRJVENfbWF4IDEwMDAwMDAKW8KgwqDCoCAxLjEwMjY0OF0gU2Nhbm5pbmcgZGV2aWNlIGZvciBi
YWQgYmxvY2tzClvCoMKgwqAgMS4xMDY4OThdIEJhZCBlcmFzZWJsb2NrIDAgYXQgMHgwMDAwMDAw
MDAwMDAKW8KgwqDCoCAxLjExMTY1M10gQmFkIGVyYXNlYmxvY2sgMiBhdCAweDAwMDAwMDA4MDAw
MApbwqDCoMKgIDEuMTE2MDQ1XSBCYWQgZXJhc2VibG9jayA0IGF0IDB4MDAwMDAwMTAwMDAwClvC
oMKgwqAgMS4xMjA0NDVdIEJhZCBlcmFzZWJsb2NrIDYgYXQgMHgwMDAwMDAxODAwMDAKW8KgwqDC
oCAxLjEyNDg0NF0gQmFkIGVyYXNlYmxvY2sgOCBhdCAweDAwMDAwMDIwMDAwMApbwqDCoMKgIDEu
MTI5MjQyXSBCYWQgZXJhc2VibG9jayAxMCBhdCAweDAwMDAwMDI4MDAwMApbwqDCoMKgIDEuMTMz
NzI4XSBCYWQgZXJhc2VibG9jayAxMiBhdCAweDAwMDAwMDMwMDAwMApbwqDCoMKgIDEuMTM4MjEy
XSBCYWQgZXJhc2VibG9jayAxNCBhdCAweDAwMDAwMDM4MDAwMApbwqDCoMKgIDEuMTQ0MTUzXSBC
YWQgZXJhc2VibG9jayAyMCBhdCAweDAwMDAwMDUwMDAwMApbwqDCoMKgIDEuMTUwODI0XSBCYWQg
ZXJhc2VibG9jayAzMiBhdCAweDAwMDAwMDgwMDAwMApbwqDCoMKgIDEuMTYyNTc5XSBCYWQgZXJh
c2VibG9jayA2NCBhdCAweDAwMDAwMTAwMDAwMApbwqDCoMKgIDEuMTYyNzgwXSBCYWQgZXJhc2Vi
bG9jayA2NSBhdCAweDAwMDAwMTA0MDAwMApbwqDCoMKgIDEuMTY2MTQ0XSBCYWQgZXJhc2VibG9j
ayA2NiBhdCAweDAwMDAwMTA4MDAwMApbwqDCoMKgIDEuMTcwNjMwXSBCYWQgZXJhc2VibG9jayA2
NyBhdCAweDAwMDAwMTBjMDAwMApbwqDCoMKgIDEuMTc1MTE2XSBCYWQgZXJhc2VibG9jayA2OCBh
dCAweDAwMDAwMTEwMDAwMApbwqDCoMKgIDEuMTgwNjkzXSBCYWQgZXJhc2VibG9jayA3MiBhdCAw
eDAwMDAwMTIwMDAwMApbwqDCoMKgIDEuMTg0MDc2XSBCYWQgZXJhc2VibG9jayA3MyBhdCAweDAw
MDAwMTI0MDAwMApbwqDCoMKgIDEuMTg4NTcwXSBCYWQgZXJhc2VibG9jayA3NCBhdCAweDAwMDAw
MTI4MDAwMApbwqDCoMKgIDEuMTkzMDU1XSBCYWQgZXJhc2VibG9jayA3NSBhdCAweDAwMDAwMTJj
MDAwMApbwqDCoMKgIDEuMTk3NTQyXSBCYWQgZXJhc2VibG9jayA3NiBhdCAweDAwMDAwMTMwMDAw
MApbwqDCoMKgIDEuMjAzMTE4XSBCYWQgZXJhc2VibG9jayA4MCBhdCAweDAwMDAwMTQwMDAwMApb
wqDCoMKgIDEuMjA2NTA5XSBCYWQgZXJhc2VibG9jayA4MSBhdCAweDAwMDAwMTQ0MDAwMApbwqDC
oMKgIDEuMjEwOTk1XSBCYWQgZXJhc2VibG9jayA4MiBhdCAweDAwMDAwMTQ4MDAwMApbwqDCoMKg
IDEuMjE1NDgyXSBCYWQgZXJhc2VibG9jayA4MyBhdCAweDAwMDAwMTRjMDAwMApbwqDCoMKgIDEu
MjIxNDIyXSBCYWQgZXJhc2VibG9jayA4OCBhdCAweDAwMDAwMTYwMDAwMApbwqDCoMKgIDEuMjI0
NDQzXSBCYWQgZXJhc2VibG9jayA4OSBhdCAweDAwMDAwMTY0MDAwMApbwqDCoMKgIDEuMjI4OTM1
XSBCYWQgZXJhc2VibG9jayA5MCBhdCAweDAwMDAwMTY4MDAwMApbwqDCoMKgIDEuMjMzNDIxXSBC
YWQgZXJhc2VibG9jayA5MSBhdCAweDAwMDAwMTZjMDAwMAouLi4KCgpUaGUgYmFkIGJsb2NrcyBh
cmUgcmVwb3J0ZWQgdW50aWwgdGhlIGxhc3QgYmxvY2sgaXMgcmVhY2hlZC4KCkkgYWRkZWQgdGhl
IERUUyBlbnRyaWVzIGFjY29yZGluZyB0byB0aGUgZG9jdW1lbnRhdGlvbiwgYnV0IGhhZCB0byBh
ZGQgCnRoZSBhbGxfbmFuZF9waW5zIGJ5IGhhbmQ6Cm10ZF9uYW5kOiBuYW5kLWNvbnRyb2xsZXJA
ZmZlMDc4MDAgewogwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1heGctbmZjIjsK
IMKgwqDCoCBzdGF0dXMgPSAib2theSI7CiDCoMKgwqAgcmVnID0gPDB4MCAweGZmZTA3ODAwIDB4
MCAweDEwMD4sIDwweDAgMHhmZmUwNzAwMCAweDAgMHg4MDA+OwogwqDCoMKgIHJlZy1uYW1lcyA9
ICJuZmMiLCAiZW1tYyI7CiDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBF
X0VER0VfUklTSU5HPjsKIMKgwqDCoCBjbG9ja3MgPSA8JmNsa2MgQ0xLSURfU0RfRU1NQ19DPizC
oCA8JmNsa2MgQ0xLSURfRkNMS19ESVYyPjsKIMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjb3JlIiwg
ImRldmljZSI7CgogwqDCoMKgIHBpbmN0cmwtMCA9IDwmYWxsX25hbmRfcGlucz47CiDCoMKgwqAg
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKCiDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
CiDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47CgogwqDCoMKgIG5hbmRAMCB7CiDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MD47CiDCoMKgwqDCoMKgwqDCoCBuYW5kLWVjYy1tb2RlID0gImh3IjsKIMKg
wqDCoCB9Owp9OwoKCiZwaW5jdHJsX3BlcmlwaHMgewogwqDCoCDCoGFsbF9uYW5kX3BpbnM6IGFs
bF9uYW5kX3BpbnMgewogwqDCoCDCoMKgwqDCoCBtdXgtMCB7CiDCoMKgIMKgwqDCoMKgIMKgwqDC
oCBncm91cHMgPcKgICJlbW1jX25hbmRfZDAiLAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKg
ICJlbW1jX25hbmRfZDEiLAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJlbW1jX25hbmRf
ZDIiLAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJlbW1jX25hbmRfZDMiLAogwqDCoCDC
oMKgwqDCoCDCoMKgwqAgwqDCoMKgICJlbW1jX25hbmRfZDQiLAogwqDCoCDCoMKgwqDCoCDCoMKg
wqAgwqDCoMKgICJlbW1jX25hbmRfZDUiLAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJl
bW1jX25hbmRfZDYiLAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJlbW1jX25hbmRfZDci
LAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJuYW5kX2NlMCIsCiDCoMKgIMKgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgIm5hbmRfYWxlIiwKIMKgwqAgwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCAi
bmFuZF9jbGUiLAogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJuYW5kX3dlbl9jbGsiLAog
wqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgICJuYW5kX3Jlbl93ciIsCiDCoMKgIMKgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgIm5hbmRfcmIwIjsKIMKgwqAgwqDCoMKgwqAgwqDCoMKgIGZ1bmN0aW9u
ID0gIm5hbmQiOwogwqDCoCDCoMKgwqDCoCDCoMKgwqAgaW5wdXQtZW5hYmxlOwogwqDCoCDCoMKg
wqDCoCB9OwogwqDCoCDCoH07Cn07CgpBbnkgaW5wdXQgb24gd2hhdCBJJ20gZG9pbmcgd3Jvbmcg
d291bGQgYmUgYXBwcmVjaWF0ZWQhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
