Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D185BC5DF81
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oY0Q/uO3j7z+60C9MHjINsmzOkmti+s3PBp89lIC64=; b=MCcPhqwuSjiwEE
	Ito6eivUdtt5apMAs2MCH2wMsCs6XftfE/6DjDpQrpYiH+tV3C31KR6hQlYloalAF5qYI4gMOyPd0
	z2h+0CPlaanRdI/hjcz8WYNb2v5MIa/IzpSTdMvHRQrMDMpwfW0F0ckjFCUkmD7ohzIHIykm4BjSH
	PmkbOibOXJFcImRpKODQXsw8gHXKdIk3y5/7oUO8DGZsVzJ5ZhnZfUuQEqw6wXS6q8OgxTPusyUxe
	RHOVrJWkHMM86xAssaAuAhxwA5yekrUzU2dERKMi6iwSyDUvCcCdWy4HNcVn7BZTvGX0qpayl68cX
	AqhiLykrunkmAxLsxBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyR2i-0000000GJhS-1erX;
	Mon, 24 Aug 2026 09:32:36 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyR2f-0000000GJgm-011I
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 09:32:34 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso17546405e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 02:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563951; x=1788168751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJloPN89elVAin5U0ydRdECi+cW4StvyY0mXdouFdaQ=;
        b=DkZRENu3oNdeluBAC8n25d6et8lUX2vCXMxUa2OBAy5+o+vOD3GFf7KKEt/IDe/YU5
         vZLCofZNFmypA9ei4XpmFGpLWgIWfM5h+nabaFrDF8y2fJNGJBx6+ZwS1MMFR2+QiJ6p
         TZyN/yb8YjDmA7CVF7e2k6T0fj3Gq1mw22szkXGjWWaA4bZWL2wioAJ4akqT9TVnJmTs
         ENOhtt/h2Cs4IbIPxX0D2z0S4SQkzboQqjbEJl0SnSAt5uHvKwLLAAF1PZr98jLmfDXc
         wymVKn8G/laJH4t8nLcIDbmIqd0Ptt4u+28q9MLSmM/ZfgJtFKRjRUYu+SoPMsOaxlHX
         PUzA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5okpbEqjxdv+SOk9O0bYJb8W/mT4ONz8yZMrgWW45d1QoQ6MOd4js2Xqc3CL0LxjwGHxqfkuUju/IoiFk@lists.infradead.org
X-Gm-Message-State: AFuF++k3sxC8WawvS8+Td8ym7ITH2zpRMkhruJRtTH2QUYsQZosoYjlC
	DkEV/EZLw5yfaA8vdP7VIQFBQ5E2SndRZmGT0jYjG7itL+0HsmqueUpv
X-Gm-Gg: AR+sD123P1R22wAdRt3UX93mq0AgEtViuuFUdqknDgd8L+qQ34OYqv9/EuVtcyKYav1
	MG+qeU4SFLgHbnTf0JiHRQIIxAfsg6Q8P2JjveAfDbe+NsjzdsUBv0v7hx6kRAbu7/ns1SGYPlg
	ArqgZsbAWSW7N9vbsdU/FOyBR6S3ul5Fr606/a8zVAtU3PHD2xWySvGxS5IigR6XgL67c3FEAZO
	VmOFEDuTRXyuLEI8BocCZEOpZUwiR0TcyqnY4nrZsOkZ9r1cGnzbqfrMnDqkhmq+JYLWAU5zIfU
	lSRnX+zBulBD5XVsU8reRGVMJtvn6RpfYaHGpd1rR2BH/2WRe9/DDg71p02maxzKcfnDxknNuwO
	xw1wjiB4ilBY/bwzRQHrSsd567q4E0UEQ1jrVrdeFdKJ5FZ2TL6pUDs6MskhFsf+Urhjr0B4nh8
	71vvikSfe+daoJ25J0udAH8TXU6iA/DbxziZZexqgdIFzvRQtNiRqm1GKy/CQLbas8q6erfv6mU
	wYaPiRQPWovmVbiRfiPPg==
X-Received: by 2002:a05:600c:1387:b0:499:7a4f:d13d with SMTP id 5b1f17b1804b1-499b8313ad3mr240196255e9.4.1787563950900;
        Mon, 24 Aug 2026 02:32:30 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm117572285e9.9.2026.08.24.02.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:32:30 -0700 (PDT)
Message-ID: <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
Date: Mon, 24 Aug 2026 10:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
 <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
 <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_023233_070721_C5CE3BE5 
X-CRM114-Status: GOOD (  19.96  )
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

T24gMjQvMDgvMjAyNiAxMDoxNSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4gT24gOC8yMy8yNiAx
OjM5IFBNLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4+IE9uIDE5LzA4LzIwMjYgMDg6MjUsIFJvbmFs
ZCBDbGF2ZWF1IHdyb3RlOgo+Pj4gT24gOC8xOS8yNiA0OjM5IEFNLCBYaWFud2VpIFpoYW8gd3Jv
dGU6Cj4+Pj4gSGkgTHVjYXMsCj4+Pj4KPj4+PiBPbiAyMDI2LzgvMTkgMDM6MTEsIEx1Y2FzIFRh
bnVyZSB3cm90ZToKPj4+Pj4gdWFydF9hIGxpc3RzIHRoZSAyNE1IeiBjcnlzdGFsIGZvciBhbGwg
dGhyZWUgb2YgaXRzIGNsb2NrcywgYmVjYXVzZQo+Pj4+PiB0aGUgVDcgY2xvY2sgY29udHJvbGxl
ciBkcml2ZXIgZGlkIG5vdCBleGlzdCB3aGVuIHRoZXNlIGJvYXJkcyB3ZXJlCj4+Pj4+IGFkZGVk
Lgo+Pj4+Pgo+Pj4+PiBUaGF0IGxlYXZlcyB0aGUgcmVhbCBVQVJUIGJ1cyBjbG9jayB3aXRob3V0
IGEgdXNlciwgc28gdGhlIGtlcm5lbAo+Pj4+PiB0dXJucyBpdCBvZmYgd2hlbiBpdCBkaXNhYmxl
cyB1bnVzZWQgY2xvY2tzIGF0IHRoZSBlbmQgb2YgYm9vdCwgYW5kCj4+Pj4+IHRoZSBib2FyZCBo
YW5ncy4KPj4+Pj4KPj4+Pj4gUG9pbnQgdWFydF9hIGF0IHRoZSByZWFsIGNsb2NrcywgdGhlIHdh
eSBtZXNvbi1zNC5kdHNpIGRvZXMsIGFuZCBkcm9wCj4+Pj4+IHRoZSBwbGFjZWhvbGRlcnMgZnJv
bSB0aGUgdHdvIGJvYXJkIGZpbGVzLgo+Pj4+Pgo+Pj4+PiBGaXhlczogNGZlZjA1NjU4OGY1ICgi
YXJtNjQ6IGR0czogYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQ6IGFkZAo+Pj4+PiBpbml0
aWFsIGRldmljZS10cmVlIikKPj4+Pj4gRml4ZXM6IDZmMDQ4Y2M3YTYzNSAoImFybTY0OiBkdHM6
IGFkZCBib2FyZCBBTjQwMCIpCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZTx0YW51
cmVAbGludXguY29tPgo+Pj4+PiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1mYWJsZS01Cj4+
Pj4+IC0tLQo+Pj4+PiAgwqDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10
Ny1hMzExZDItYW40MDAuZHRzwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4+PiAgwqDCoCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzIHwg
MiAtLQo+Pj4+PiAgwqDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5k
dHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNAo+Pj4+PiArKysrCj4+
Pj4+ICDCoMKgIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2Ft
bG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+Pj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4+Pj4gaW5kZXggY2FiMmVlOWVhMGQz
Li5kY2JjZDA4YTc4YjkgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4+Pj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+Pj4+PiBAQCAtMzMs
NyArMzMsNSBAQCB4dGFsOiB4dGFsLWNsayB7Cj4+Pj4+ICDCoMKgIH07Cj4+Pj4+Cj4+Pj4+ICDC
oMKgICZ1YXJ0X2Egewo+Pj4+PiAtwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRhbD4sIDwmeHRh
bD4sCj4+Pj4+IDwmeHRhbD47Cj4+Pj4+IC3CoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAieHRh
bCIsICJwY2xrIiwgImJhdWQiOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJv
a2F5IjsKPj4+Pj4gIMKgwqAgfTsKPj4+Pj4gZGlmZiAtLWdpdAo+Pj4+PiBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4+Pj4g
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZp
bTQuZHRzCj4+Pj4+IGluZGV4IGM0MTUyNWEzNGI3Mi4uNjc3MDY5ZTU4ZjMwIDEwMDY0NAo+Pj4+
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hh
ZGFzLXZpbTQuZHRzCj4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4+Pj4gQEAgLTI2Niw2ICsyNjYsNCBAQCAm
c2RfZW1tY19jIHsKPj4+Pj4KPj4+Pj4gIMKgwqAgJnVhcnRfYSB7Cj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4+PiAtwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwm
eHRhbD4sIDwmeHRhbD4sCj4+Pj4+IDwmeHRhbD47Cj4+Pj4+IC3CoMKgwqDCoMKgwqAgY2xvY2st
bmFtZXMgPSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwo+Pj4+PiAgwqDCoCB9Owo+Pj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4+
PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+Pj4gaW5k
ZXggY2MzNzFmY2QxODk2Li43ODQ3NTgyZTc3ZWQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+Pj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+Pj4+PiBAQCAtNTg3LDYgKzU4Nywx
MCBAQCB1YXJ0X2E6IHNlcmlhbEA3ODAwMCB7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJhbWxvZ2ljLHQ3LXVhcnQiLAo+Pj4+PiAiYW1sb2dpYyxtZXNvbi1zNC11YXJ0IjsKPj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4NzgwMDAgMHgwIDB4MTg+Owo+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMgPSA8R0lDX1NQSSAxNjgKPj4+Pj4gSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRhbD4sCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PCZjbGtjX3BlcmlwaHMKPj4+Pj4gQ0xLSURfU1lTX1VBUlRfQT4sCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPCZ4dGFsPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJ4dGFsIiwgInBj
bGsiLCAiYmF1ZCI7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+
Pj4KPj4+PiBJIGFncmVlIHdpdGggbW92aW5nIHRoZSBVQVJUIGNsb2NrIGNvbmZpZ3VyYXRpb24g
dG8gdGhlIERUU0kgZmlsZS4KPj4+PiBIb3dldmVyLCBpdCBzZWVtcyBhIGxpdHRsZSBvZGQgdG8g
a2VlcCB0aGUgWFRBTCBjbG9jayBkZWZpbml0aW9uIGluIHRoZQo+Pj4+IERUUywgYXMgdGhlIGFs
aWFzIG1heSBub3QgYmUgY29uc2lzdGVudCBhY3Jvc3MgZGlmZmVyZW50IGJvYXJkcywgd2hpY2gK
Pj4+PiBjb3VsZCByZXN1bHQgaW4gY29tcGlsYXRpb24gZXJyb3JzLiBDb3VsZCB3ZSBtb3ZlIHRo
ZSBYVEFMIGNsb2NrCj4+Pj4gZGVmaW5pdGlvbiB0byB0aGUgRFRTSSBhcyB3ZWxsLCBzaW1pbGFy
IHRvIG90aGVyIEFtbG9naWMgU29Dcz8KPj4+Cj4+PiBJdCBzZWVtcyBzaW1pbGFyIHRvIGNoYW5n
ZXMgaW4gdGhpcyBzZXJpZXMgOgo+Pj4KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDQyMC1hZGQtYmx1ZXRvb3RoLXQ3LXZpbTQtCj4+PiB2NC0wLTk1MDVkZjBlNzAxNkBhbGll
bC5mci8KPj4+Cj4+PiBXaGF0IGRvIHlvdSB0aGluayA/Cj4+Pgo+PiBUaGFua3MgZm9yIHBvaW50
aW5nIG91dCB0aGF0IHNlcmllcywgdGhvdWdoIEkgd2Fzbid0IGF3YXJlIG9mIGl0Lgo+PiBBbmQg
YWZ0ZXIgcmVhZGluZyBJIGRvbid0IGFncmVlIHdpdGggaXQuIFRoZSBjbG9ja3MgYXJlIG5vdCBy
ZWR1bmRhbnQsCj4+IHRoZXkgYXJlIHRoZXJlIGJlY2F1c2Ugd2UgYWdyZWVkIHNvbWV0aW1lIGFn
byB0aGF0IHh0YWwgYmVsb25ncyB0byB0aGUKPj4gYm9hcmQgZmlsZXMuCj4+IFNvIEkgc3RpbGwg
dm90ZSBmb3IgbXkgY2hhbmdlIGluIHYyLCB0aGF0IEkgd2lsbCBzZW5kIGluIGEgZmV3IG1pbnV0
ZXMuCj4gCj4gSSBkb24ndCBnZXQgd2h5IGl0IHdvdWxkIGJlIGJldHRlciB0byBkZWZpbmUgdGhl
IGV4YWN0IHNhbWUgY2xvY2tzIGluCj4gZWFjaCBEVFMgZmlsZS4KPiAKPiBUaGUgeHRhbCByZWNv
bW1lbmRlZCBjaGFyYWN0ZXJpc3RpY3MgcHJvdmlkZWQgYXQgdGhlIFNPQyBsZXZlbCBjYW4gYmUK
PiBkZWZpbmVkIGluIHRoZSBEVFNJIGFuZCBvdmVycmlkZGVuLCBpZiByZWFsbHkgbmVjZXNzYXJ5
LCBpbiB0aGUgRFRTLgo+IApIaSBSb25hbGQsCgpUaGUgcHJlZmVyZW5jZSBmb3Iga2VlcGluZyB4
dGFsIGluIGJvYXJkLXNwZWNpZmljIC5kdHMgZmlsZXMgcmF0aGVyIHRoYW4gCnRoZSBTb0MgLmR0
c2kgY29tZXMgZG93biB0byBEVCBoYXJkd2FyZSBtb2RlbGluZyBwcmluY2lwbGVzIGFuZCB1cHN0
cmVhbSAKbWFpbnRhaW5lciBndWlkZWxpbmVzOgoKSGFyZHdhcmUgVG9wb2xvZ3k6IFRoZSB4dGFs
IGlzIHBoeXNpY2FsbHkgbG9jYXRlZCBvbiB0aGUgYm9hcmQgUENCLCBub3QgCmluc2lkZSB0aGUg
U29DIHNpbGljb24uIFRoZSAuZHRzaSBmaWxlIG1vZGVscyB0aGUgU29DIHNpbGljb24gaW50ZXJu
YWwgCmFyY2hpdGVjdHVyZSAoY2xvY2sgY29udHJvbGxlcnMsIElQcywgcmVnaXN0ZXJzKSwgd2hl
cmVhcyAuZHRzIGZpbGVzIApkZXNjcmliZSB0aGUgcGh5c2ljYWwgYm9hcmQgbGF5b3V0IHN1cnJv
dW5kaW5nIGl0LgoKQXZvaWRpbmcgSW1wbGljaXQgQXNzdW1wdGlvbnM6IERlZmluaW5nIGEgZGVm
YXVsdCAyNE1IeiB4dGFsIGluIC5kdHNpIAphc3N1bWVzIGV2ZXJ5IFQ3IGJvYXJkIHdpbGwgdXNl
IHRoZSBzYW1lIG9zY2lsbGF0b3IgY29uZmlndXJhdGlvbi4gSWYgYSAKY3VzdG9tIGJvYXJkIGRl
c2lnbiB1c2VzIGEgZGlmZmVyZW50IGNyeXN0YWwgZnJlcXVlbmN5IG9yIGFuIGV4dGVybmFsIApj
bG9jayBnZW5lcmF0b3IvVENYTywgb3ZlcnJpZGluZyBhIC5kdHNpLWxldmVsIG5vZGUgY2FuIGxl
YWQgdG8gbWVzc3kgRFQgCm92ZXJyaWRlcyBvciBzaWxlbnQgY2xvY2sgcmF0ZSBtaXNtYXRjaGVz
IGlmIGZvcmdvdHRlbi4KClVwc3RyZWFtIERUIE1haW50YWluZXIgUG9saWN5OiBLZXJuZWwgRFQg
bWFpbnRhaW5lcnMgY29uc2lzdGVudGx5IHB1c2ggCnRvIGtlZXAgYm9hcmQtbGV2ZWwgaGFyZHdh
cmUgZXhwbGljaXRseSBkZWNsYXJlZCBpbiB0aGUgYm9hcmQgLmR0cyBmaWxlcyAKdG8gcmVmbGVj
dCBhY3R1YWwgcGh5c2ljYWwgYm9hcmQgY29tcG9uZW50cy4KClRoYXQgc2FpZCwgSSBhY2tub3ds
ZWRnZSB0aGUgdHJhZGUtb2ZmIGlzIG1pbm9yIGJvaWxlcnBsYXRlIGR1cGxpY2F0aW9uIAphY3Jv
c3MgYm9hcmQgRFRTIGZpbGVzLiBJZiB0aGUgQW1sb2dpYyBTb0MgbWFpbnRhaW5lcnMgcHJlZmVy
IHNldHRpbmcgYSAKZGVmYXVsdCAyNE1IeiB4dGFsIGluIGFtbG9naWMtdDcuZHRzaSB0byBtYXRj
aCBvbGRlciBTb0MgZ2VuZXJhdGlvbnMsIEkgCmFtIG9wZW4gdG8gdXBkYXRpbmcgaXTigJRwcm92
aWRlZCB0aGUgbWFpbnRhaW5lcnMgZXhwbGljaXRseSBwcmVmZXIgdGhhdCAKdHJhZGVvZmYgb3Zl
ciBzdHJpY3QgRFQgdG9wb2xvZ3kgbW9kZWxpbmcuCgpCZXN0IHJlZ2FyZHMsCgpMdWNhcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
