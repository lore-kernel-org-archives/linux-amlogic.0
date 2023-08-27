Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEFAC83F11
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRgBBr2q8AiRGjes2AyFBNX2x975iD5uJHLqYJhlOE8=; b=vxB2dDcE+3MPq+
	ZJKxFaI2yAoXsICM+1mojLEG50nVXZGzezXP/gQJ5e02MV2PUxGiC22jgd6mIp3zhhWB15ucFBILf
	/lPdNx43E1HV8+ImSiBZC1ZBOt+WGpc1eDDPJaNn49QZSvE8xruLm+cViFs5Rgc3wqzvqUvJRDPua
	G2Zm8d5IolmqBktbIWicV25oF7sugPgJOF6XW7WsV+awYSXrQ3QMfMkwxGmpMVuqHohP57tbNocS/
	Q1lmv4iq2baaDD0VNOn8rxq+NyvHNGQn05yyIq4VZ0F2NB45Dtsp2YIlpeimR1DnVGHKhtsqf0xvH
	24yU2jijjJWbsa28C6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCdV-007mP4-1O;
	Sun, 27 Aug 2023 10:04:49 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCdP-007mOO-2h;
	Sun, 27 Aug 2023 10:04:48 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99c353a395cso288675066b.2;
        Sun, 27 Aug 2023 03:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693130678; x=1693735478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3yLEQRh2p6qcn+rlG3lKXhYcStLscrFlLBAG5p3HJg=;
        b=e9b31Rc3UD4fEig0VLRbYarlbLsuHQjRMpROYil1k+02isIF5Xw9/JWb9bISOddYx3
         OMQZhdL5REPjj4NpJpU2TYeC1GTLkD/BWIPWh+j7epjnhK71ii/G/39FpfCGhbSEU3i6
         0mBZoq+DtU3HfDZpL+xi8UeG6qc/BcNzDwk1Yt1so53oTKJM4ef9KiIZDpIi+shnbYmX
         99x3ugj+vWk3u/rKqwEwk4DegEuc8hE0GTLwdf8KSIOBQLiBptvHbr60vL6Moogr2aV7
         E7itg8rQkwLiq+DC9/aThujTnBN+rb0BOtMWtJBpkYoIIaO8MSQ1IyJnt+Z1ixZAELRB
         EaYg==
X-Gm-Message-State: AOJu0Yy5Lkt5q3sSqiavD8GV8w5UNnfhOCL3h94xZ7BOsDy95i1Ulv2I
	evjsQkeaw7E5/CSnPriyVBo=
X-Google-Smtp-Source: AGHT+IGH1Bhx1BbidsnYdjWIJhV9dyqreMXlr2EtXDJOyKYP8FbqwIp6lVVa1c9wNDavJV05rKhi6g==
X-Received: by 2002:a17:907:7635:b0:9a1:d915:d8dd with SMTP id jy21-20020a170907763500b009a1d915d8ddmr9873398ejc.10.1693130677691;
        Sun, 27 Aug 2023 03:04:37 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id ck8-20020a170906c44800b0099bd5d28dc4sm3252637ejb.195.2023.08.27.03.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 03:04:37 -0700 (PDT)
Message-ID: <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
Date: Sun, 27 Aug 2023 11:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_030443_899387_06576829 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjctMDgtMjAyMyAxMDo0OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgTHVjYXMsCj4g
Cj4gTGUgMjcvMDgvMjAyMyDDoCAxMDoyOSwgTHVjYXMgVGFudXJlIGEgw6ljcml0wqA6Cj4+IFRo
aXMgcmV2ZXJ0cyBjb21taXQgNmE0MTk3Zjk3NjMzMjUwNDNhYmY3NjkwYTIxMTI0YTlmYWNiZjUy
ZS4KPj4gTmV3IFNvQyB3aWxsIHVzZSB0dHlTMCBpbnN0ZWFkIG9mIHR0eUFNTCwgc28gVDcgU29D
IGRvZXNuJ3QgbmVlZCBhIAo+PiBPRl9FQVJMWUNPTl9ERUNMQVJFLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4+IC0tLQo+PiBTaW5jZSBWMToK
Pj4gLSBhZGQgU2lnbmVkLW9mZi1ieToKPj4KPj4gwqAgZHJpdmVycy90dHkvc2VyaWFsL21lc29u
X3VhcnQuYyB8IDIgLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIAo+PiBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4gaW5kZXggYzRmNjFkODJmYjcyNy4uNzkwZDkx
MGRhZmE1ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+
PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+IEBAIC02NDgsOCArNjQ4
LDYgQEAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3RydWN0IAo+PiBlYXJseWNv
bl9kZXZpY2UgKmRldmljZSwgY29uc3QgY2hhciAqb3B0Cj4+IMKgIE9GX0VBUkxZQ09OX0RFQ0xB
UkUobWVzb24sICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4+IC1PRl9FQVJMWUNP
Tl9ERUNMQVJFKG1lc29uLCAiYW1sb2dpYyx0Ny11YXJ0IiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+PiDCoCAjZGVmaW5lIE1F
U09OX1NFUklBTF9DT05TT0xFX1BUUihfZGV2bmFtZSkgCj4+ICgmbWVzb25fc2VyaWFsX2NvbnNv
bGVfIyNfZGV2bmFtZSkKPj4gwqAgI2Vsc2UKPiAKPiBIb3cgZG8geW91IHVzZSBlYXJseWNvbiB3
aXRoIHRoaXMgcmVtb3ZlZCA/Cj4gCj4gTmVpbApUaGlzIGlzIG15IGtlcm5lbCBjbWRsaW5lOgpj
b25zb2xlPXR0eVMwLDkyMTYwMCBub19jb25zb2xlX3N1c3BlbmQgZWFybHljb249dHR5UzAsMHhm
ZTA3ODAwMAoKQW5kIEkgY2FuIHNlZSBteSBsb2c6CmJvb3QgNjRiaXQga2VybmVsClsgICAgMC4w
MDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBm
ZDA5Ml0KWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjUuMC1yYzctbmV4dC0yMDIzMDgy
NSsgKHRhbnVyZWFsQHJ5emVuKSAKKGFhcmNoNjQtbm9uZS1saW51eC1nbnUtZ2NjIChHTlUgVG9v
bGNoYWluIGZvciB0aGUgQS1wcm9maWxlIApBcmNoaXRlY3R1cmUgMTAuMy0yMDIxLjA3IChhcm0t
MTAuMjkpKSAxMC4zLjEgMjAyMTA2MjEsIEdOVSBsZCAoR05VIApUb29sY2hhaW4gZm8zClsgICAg
MC4wMDAwMDBdIEtBU0xSIGRpc2FibGVkIGR1ZSB0byBsYWNrIG9mIHNlZWQKWyAgICAwLjAwMDAw
MF0gTWFjaGluZSBtb2RlbDogS2hhZGFzIHZpbTQKWyAgICAwLjAwMDAwMF0gT0Y6IHJlc2VydmVk
IG1lbTogMHgwMDAwMDAwMDA1MDAwMDAwLi4weDAwMDAwMDAwMDUyZmZmZmYgCigzMDcyIEtpQikg
bm9tYXAgbm9uLXJldXNhYmxlIHNlY21vbkA1MDAwMDAwClsgICAgMC4wMDAwMDBdIE9GOiByZXNl
cnZlZCBtZW06IDB4MDAwMDAwMDAwNTMwMDAwMC4uMHgwMDAwMDAwMDA3MmZmZmZmIAooMzI3Njgg
S2lCKSBub21hcCBub24tcmV1c2FibGUgc2VjbW9uQDUzMDAwMDAKLi4uClsgICAgMC4wNzkzNjhd
IGlvIHNjaGVkdWxlciBtcS1kZWFkbGluZSByZWdpc3RlcmVkClsgICAgMC4wNzkzNzRdIGlvIHNj
aGVkdWxlciBreWJlciByZWdpc3RlcmVkClsgICAgMC4wNzk1NDldIGlvIHNjaGVkdWxlciBiZnEg
cmVnaXN0ZXJlZApbICAgIDAuMDgzMzczXSBmZTA3ODAwMC5zZXJpYWw6IHR0eVMwIGF0IE1NSU8g
MHhmZTA3ODAwMCAoaXJxID0gMTQsIApiYXNlX2JhdWQgPSAxNTAwMDAwKSBpcyBhIG1lc29uX3Vh
cnQKWyAgICAwLjA4MzQwM10gcHJpbnRrOiBjb25zb2xlIFt0dHlTMF0gZW5hYmxlZAoKQXMgdGhl
IGxvZyBpcyBPSywgYW5kIFQ3IGZvciBub3cgaXMgYmluZGluZyBhZ2FpbnN0IFM0IGNvZGUgd2Ug
c2hvdWxkIApkcm9wIHRoaXMgcGF0Y2ggYW5kIGFkZCBhIFM0IG9uZSBpZiBuZWVkZWQuCgpCdXQg
anVzdCBoYXZpbmcgdGhpcyBsb2cgaXMgbm90IGVub3VnaCBmb3IgdGVzdGluZyBlYXJseWNvbj8K
SSBhbSBhc3N1bWluZyB0aGF0IGJ5IGp1c3QgaGF2aW5nIHRoZSBsb2cgc2luY2UgMC4wMDAwIGlz
IGEgZ29vZCBzaWduIAp0aGF0IGVhcmx5Y29uIGlzIHdvcmtpbmcuCkNvdWxkIHlvdSBnaXZlIGZ1
cnRoZXIgZ3VpZGFuY2U/CgpMdWNhcyBUYW51cmUKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
