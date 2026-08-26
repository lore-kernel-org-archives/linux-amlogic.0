Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F26C5DF97
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2026 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fm72kCZrm5jok63lB/srOUcaGZJ2Zwc7tfCeiqXH/w=; b=e3ZX/181CqF3LS
	8t9dCeCl9Pt+1xudsoEp8OWsFPMrNUthIf/a6R30SiyN3fTvcDTR27199prZk2iRxFhF93jVD+xgg
	3beMzeqWJbkZxZ2OlYMDVp76I421F0pVptlAkpj5PceMA+ApsUB0gzILVXAoby855dcnmGMwy7yFM
	Fh/c7WkQjh7cifoMzj5ZTqDoNRDtSA50wtdxstmMCBAeKlG/afBB+tAXDYev6QRfDb2F/Cr8iC8n9
	mkmO7NGF2T3eWdO0Iqfg1Qw4/zEX2ghHeau+f7t26CSxChoNRtn1fW6UTxrL57FVGL03hQiOlQ8/g
	k3tu068c7fD+PRuyopyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAO4-00000002FK2-1bky;
	Wed, 26 Aug 2026 09:57:40 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAO1-00000002FIw-2kDY
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Aug 2026 09:57:38 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5626515e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Aug 2026 02:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738256; x=1788343056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqs/JjM/rhFjmn0l/Jy51z8ISXKwBj5TSNnqoIe2ZtQ=;
        b=skENfR1pA5uEaNN8E6ts1E3tj8TYbVyhXftTKwn8a+P7y/w2OD1Zt7Wk6S71bJQKcs
         gUuJcaHB5lXZP64IpwZeJZjZ5lOYdEQuUbuqmMzv8b2Mo2Pl33Ik5MsXGjsg0NLms1iw
         oE0xoRwsg71RvMnSwkUmtRr/DcXiTVrD7hDYaKoibepgtOj9ZsHLfcyEggw4J9vbdBdv
         Nx3UMocZPCYO0Cg1nQMz6Y2wFB6/udbpXJ8l7jAGwKBC47RXAxZshRBHO+whxVSPt9YG
         CSBvgEKaJP/DFxIN8KnfAwhBrExdW+aDI/YWASqzflAUH3DNfZLy2nE1iKb/CYwcLEix
         yjsA==
X-Forwarded-Encrypted: i=1; AHgh+RqIjiPJtW0/1tq9CEesxAvdqRzxF3UpUn4w972f9yrENxjrl1Xfe+2m0E54fcgjC9U8ZKOEztIlmzYfCBa+@lists.infradead.org
X-Gm-Message-State: AFuF++lLz1oGdPGblg7PR0bnYZn48a1w5//Wl+iYosBbA2F9Ik4lQM1q
	yxV1gTkfF4OxuFUYfPz6cTshJ3JRhQMhRDu/0eicgg65vVOcl0W3No+H
X-Gm-Gg: AR+sD12wBPn2H4FLNnd9MY7r3iBKIyRHxl5xilf3nz9Pow/V/4x3tSgE4B2OcMh1S6Z
	z12iqcjKTJ7KFGlYa6BQ3lseMALWpev9BEm73pLF9u2yDWQsaKhWFKPOuw37xhdIwyLnUWgGv8R
	q4otm9MUSjI062xsbBsepk77Si1Iw0Fs99r4g6bwtTCnzDvMYXb8/wkZNrXZr1sOdf1f1KhrHxA
	SLqbkuj11peEyScE99FJHhgPmIlkieR+zXU9HZTJ9m5RW5HWe3wkItbfnAenZf9lBJWYxaxwSU4
	NZdIlVhQAS936kFnlNaD1bVMXwohAkE4UzRbadYVxOgC2ywICXtwYsBL3gxlPYu/5uMCFlX4NYT
	pxftU/eufhHR1lirCbuV7+Lwa0CHrygh9UfE1HILMzqIz7kUlJqKmkL0DZqo9p4Lae5tS2+TyMp
	3cl1G5j098sx7iBfbOHfWMk1DfdDOsbFX4nROSCAvkVh5yq3N2ftjkZd2yFT9kZVj0+NMXxu06L
	GsBpecUznT4wv78yirXEA==
X-Received: by 2002:a05:600c:620b:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499dc7240a3mr44654155e9.11.1787738255490;
        Wed, 26 Aug 2026 02:57:35 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcae3216sm20357655e9.15.2026.08.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:57:34 -0700 (PDT)
Message-ID: <2800152c-25e0-401f-950c-15942c4f9a04@linux.com>
Date: Wed, 26 Aug 2026 10:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_025737_706332_D0FB7CF5 
X-CRM114-Status: GOOD (  18.19  )
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

T24gMjYvMDgvMjAyNiAxMDowMiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gOC8yMy8yNiAx
Nzo0MCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+PiBIaSwKPj4KPj4gV2hpbGUgdGVzdGluZyBtYWlu
bGluZSBMaW51eCBvbiB0aGUgS2hhZGFzIFZJTTQgKEFtbG9naWMgQTMxMUQyIC8gVDcpLCAKPj4g
SSBhbSBoaXR0aW5nIGludGVybWl0dGVudCBzeXN0ZW0gaW5zdGFiaWxpdHksIHN0b3JhZ2UgbG9z
cywgYW5kIG1lbW9yeSAKPj4gY29ycnVwdGlvbiBkdXJpbmcgYm9vdCwgdW5sZXNzIEkgYXBwZW5k
IGNsa19pZ25vcmVfdW51c2VkIHRvIHRoZSAKPj4ga2VybmVsIGNvbW1hbmQgbGluZS4KPj4KPj4g
QmVjYXVzZSB0aGUgZmFpbHVyZSBpcyBpbnRlcm1pdHRlbnQsIEkgYW0gcnVubmluZyAxMDAtcmVi
b290IHRlc3QgCj4+IGNhbXBhaWducyB0byBiaXNlY3QgdGhlIHJlbWFpbmluZyBjbG9ja3MgYW5k
IGlzb2xhdGUgd2hpY2ggY2xvY2tzIGFyZSAKPj4gY3JpdGljYWwgYW5kIGNhbm5vdCBiZSBzYWZl
bHkgZGlzYWJsZWQuCj4+Cj4+IEFzIHRlc3RpbmcgdGFrZXMgc2lnbmlmaWNhbnQgdGltZSBvdmVy
IHNlcmlhbCBjb25zb2xlLCBJIHdhbnRlZCB0byAKPj4gY2hlY2sgaWYgQW1sb2dpYyBvciB0aGUg
bWFpbnRhaW5lcnMgY291bGQgc2hlZCBsaWdodCBvbiB0aGlzOgo+Pgo+PiBBcmUgdGhlcmUgc3Bl
Y2lmaWMgVDcgY2xvY2tzIG9yIGhhcmR3YXJlIGRvbWFpbnMgdGhhdCBtdXN0IHJlbWFpbiAKPj4g
Y3JpdGljYWwvcHJvdGVjdGVkIGV2ZW4gd2l0aG91dCBhbiBleHBsaWNpdCBpbi1rZXJuZWwgY29u
c3VtZXI/Cj4+Cj4+IEN1cnJlbnQgY2xvY2tzIGJlaW5nIGRpc2FibGVkIHRoYXQgZG9uJ3Qga2ls
bCB0aGUgYm9hcmQgb24gYSB0ZXN0IHJ1bjoKPj4KPj4gW8KgwqDCoCAwLjM4MDMxM10gY2xrOiBE
aXNhYmxpbmcgdW51c2VkIGNsb2Nrcwo+PiBbwqDCoMKgIDAuMzgwNDEzXSBjbGs6IERpc2FibGVk
IHVudXNlZCBjbG9jazogcnRjX2R1YWxkaXYKPj4gW8KgwqDCoCAwLjM4MDcxOF0gY2xrOiBEaXNh
YmxlZCB1bnVzZWQgY2xvY2s6IHJ0Y19kdWFuZGl2X2luCj4gCj4gVGhvc2UgY291bGQgYmUgdXNl
ZCBieSBsb3cgcG93ZXIgc3R1ZmYgYXN3ZWxsLCBub3Qgb25seSBSVEMKPiAKPj4gW8KgwqDCoCAw
LjM4MTM3N10gY2xrOiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazogYTczX2RpdjE2Cj4+IFvCoMKg
wqAgMC4zODE5NzJdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IGNwdV9kaXYxNgo+IAo+
IFRob3NlIHNob3VsZCBwcm9iYWJseSBiZSBsZWZ0IGVuYWJsZWQgaWYgdGhleSdyZSB1c2VkIGJ5
IHRoZSBEVkZTIGNvZGUKPiAKPj4gW8KgwqDCoCAwLjM4MjYwNV0gY2xrOiBVbnByZXBhcmVkIHVu
dXNlZCBjbG9jazogZjUwbQo+PiBbwqDCoMKgIDAuMzgzMTc0XSBjbGs6IFVucHJlcGFyZWQgdW51
c2VkIGNsb2NrOiBmaXhlZF9wbGxfZGNvCj4+IFvCoMKgwqAgMC4zODM3ODZdIGNsazogVW5wcmVw
YXJlZCB1bnVzZWQgY2xvY2s6IGhkbWlfcGxsX29zYwo+PiBbwqDCoMKgIDAuMzg0NDE2XSBjbGs6
IFVucHJlcGFyZWQgdW51c2VkIGNsb2NrOiBzeXMxX3BsbF9vc2MKPj4gW8KgwqDCoCAwLjM4NTA1
Nl0gY2xrOiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazogZWFyY19vc2MKPj4gW8KgwqDCoCAwLjM4
NTY1Ml0gY2xrOiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazogcGNpZV9yZWZjbGtfb3NjCj4+IFvC
oMKgwqAgMC4zODYzMjNdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IGV0aF9wbGxfb3Nj
Cj4+IFvCoMKgwqAgMC4zODY5NjFdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IHBjaWVf
b3NjCj4+IFvCoMKgwqAgMC4zODc1NDhdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IG1j
bGtfcGxsX29zYwo+PiBbwqDCoMKgIDAuMzg4MTg3XSBjbGs6IFVucHJlcGFyZWQgdW51c2VkIGNs
b2NrOiB1c2JfcGxsMV9vc2MKPj4gW8KgwqDCoCAwLjM4ODgyNl0gY2xrOiBVbnByZXBhcmVkIHVu
dXNlZCBjbG9jazogdXNiX3BsbDBfb3NjCj4+IFvCoMKgwqAgMC4zODk0NjVdIGNsazogVW5wcmVw
YXJlZCB1bnVzZWQgY2xvY2s6IHRjb25fcGxsX29zYwo+PiBbwqDCoMKgIDAuMzkwMTA1XSBjbGs6
IFVucHJlcGFyZWQgdW51c2VkIGNsb2NrOiB0b3BfcGxsX29zYwo+PiBbwqDCoMKgIDAuMzkwNzM4
XSBjbGs6IFVucHJlcGFyZWQgdW51c2VkIGNsb2NrOiBhdWRfcGxsX29zYwo+PiBbwqDCoMKgIDAu
MzkxMzYxXSBjbGs6IFVucHJlcGFyZWQgdW51c2VkIGNsb2NrOiBkZHJfcGxsX29zYwo+Pgo+PiBJ
IGFtIG5vdCBmb3JjaW5nIGFueSBjbG9jayB0byBiZSBkaXNhYmxlZDsgSSBhbSBmb3JjaW5nIGFs
bCBjbG9ja3MgdG8gCj4+IHN0YXkgb24gYW5kIGxldHRpbmcgdGhlbSBiZSBkaXNhYmxlZCBpZiB1
bnVzZWQgb25lIGJ5IG9uZS4KPj4KPj4gQW55IGd1aWRhbmNlIG9yIGhpbnRzIG9uIHJlcXVpcmVk
IHBsYXRmb3JtIGNsb2NrcyB3b3VsZCBiZSBncmVhdGx5IAo+PiBhcHByZWNpYXRlZC4KPiAKPiBJ
dCdzIGhhcmQgdG8gc2F5LCB0aGlzIGlzIGRlcGVuZGVudCBvbiBlYWNoIGZhbWlseSwgQW1sb2dp
YyBzaG91bGQgYmUgCj4gYWJsZSB0byBoZWxwIGhlcmUuClllcywgQW1sb2dpYywgcGxlYXNlIGhl
bHAuPgo+IFlvdSBsaXN0IHNvbWUgY2xvY2tzLCBidXQgSSBkb24ndCB1bmRlcnN0YW5kIHlvdSBz
YXkgdGhhdCBpdCdzIHN0YWJsZSAKPiBvbmx5IGlmIHlvdSBoYXZlIGNsa19pZ25vcmVfdW51c2Vk
LCBzbyBob3cgZGlkIHlvdSBnZXQgdGhpcyBjbG9jayBsaXN0ID8KSSBnb3QgdGhpcyBsaXN0IHdo
ZW4gSSBhZGQgbG9ncyB0byB0aGUgY2xvY2sgZnJhbWV3b3JrIGFuZCBydW4gd2l0aG91dCAKY2xr
X2lnbm9yZV91bnVzZWQuCj4gCj4gTmVpbAo+IAo+Pgo+PiBUaGFua3MsCj4+IEx1Y2FzIFRhbnVy
ZQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
