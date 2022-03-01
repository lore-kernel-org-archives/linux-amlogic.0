Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B80FC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/QS4YOmN1elhPMrboA2qV1ufeA9Jvl+pvrHpV8iI8c=; b=Q39QVJwNAgUHlN
	msO2OqXnEwm0bp1nkvTzM8fJUTCEK/bYx4ZXAz3JyUfx/pub2p/RcEuH6XCcbu6iep/96mD/gAj0N
	M3aHYKuarZelEDr1kcRsn+x56TrPc0pV2nCJjZm2/WvCiEic287P6QrYD0gCxEtyYX5T7EycQeeqD
	CPmQ2YE3M+8aBjecc0cThLq+5HalOci/Dq81Bo/hD2GfsVTw7+Ubs6Neg1+6HwBhnrumEK+iFeuhP
	HaE8Mh1rgLozvghFRhVFU/hTA9qVV0UfMlXCWV2SWNH1qE9sI4+sBshxWyjFUeG4t1utc9I9WJNBN
	YI0doBd0jRL8ece2++vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOy1T-00FdFI-NX; Tue, 01 Mar 2022 08:38:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOy19-00Fd4U-K9
 for linux-amlogic@lists.infradead.org; Tue, 01 Mar 2022 08:38:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 10-20020a05600c26ca00b003814df019c2so798630wmv.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Mar 2022 00:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Bjp8bu/V7hHD3VpGYDoJC/mynoVixsr7Wlp3VBAAB34=;
 b=jB9dTHl0ZbrDHcOJJ2GrOdlzNievMcIiRarIbozNdeG/rG/9w0KyeHH6oqa9lAbBj8
 i8vXhXAKaIxGpv2kFYuyN9LKpGE/aDfk9oulyWVsmEGC52wAa6NYYAq8tmA4g8WZ5X2o
 AgCqygCuF2s1QommkpmXIBDAiVrBmuX1ntoUB2fJ1n8qHA9/uXFomGPAeA1d0s6jbeHc
 ZVknLWbNur9Yo/8UyBRDRLkPe5oSAMiP8jEjnohPoAXUaxQiA3XbFDs6B6XAwhI5lKx0
 gfWa/hkniGYeMuerIRY1eMFZp+1oRGEE2kIvabz1+B7lg0dLzw57IPYPAk0IJkQp4wS3
 Ea2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Bjp8bu/V7hHD3VpGYDoJC/mynoVixsr7Wlp3VBAAB34=;
 b=zMtpmSZ68fAEabKSCwy4LRDksT7cmC6gck26BM9vZA4gXHSdbs/iqoM3NXChKVQwsJ
 YaJXpZ+wgzz7SDdelegNW0LgQhb/nbX6r8oyECneKD0JlBxsV4PsmVp5hpytt7shft3Z
 v45LsP/KzxlEQ1QOo5qNeELiaDGVXpgqyj5ftkQCMjD7HTt6TA1DLBaiCsHJR4Ty0SKg
 SOOK2adgtm2Mlib3vZSbg7rN39dRkzCpTnMm8hkS2F7/lGmSFTMqrZRtbA8XwL2jm6va
 DuaobN5IlnQTLd4nsVak1by6kSY+UC5fyubEQC1VFU4QJ8kPvj8a3Tftn6DgWbdwvMHm
 jTRQ==
X-Gm-Message-State: AOAM533SFm1eu+2maUDGLdOt2KKXjPjSAzPSvsa2TDYqsKS9NVeaRJuj
 MTjIg47DYO/nkJz8+j5Yczwq/g==
X-Google-Smtp-Source: ABdhPJxJUGFf/M6eRzGrrAlQbwPmgNpu3MAZhl/EtCY7Va6S0HfFZiOQ1EyGDusS9fkFzLu+OlIwTw==
X-Received: by 2002:a05:600c:19c9:b0:352:d507:9e89 with SMTP id
 u9-20020a05600c19c900b00352d5079e89mr16067204wmq.92.1646123877623; 
 Tue, 01 Mar 2022 00:37:57 -0800 (PST)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adff147000000b001dbd1b9812fsm18249092wro.45.2022.03.01.00.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:37:57 -0800 (PST)
Message-ID: <5f7d9d73-d74c-1eb6-1711-ac3de67e6203@baylibre.com>
Date: Tue, 1 Mar 2022 09:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V7 0/6] Use CCF to describe the UART baud rate clock
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <849a95fd-ae81-9a3b-0c06-dd7826af9eb2@baylibre.com>
 <154c3e60-f111-6760-aa08-b9851d66b034@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <154c3e60-f111-6760-aa08-b9851d66b034@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003759_678448_4DF0D6B2 
X-CRM114-Status: GOOD (  20.72  )
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

SGksCgpPbiAwMS8wMy8yMDIyIDA4OjU3LCBZdSBUdSB3cm90ZToKPiBIaSBOZWlsLAo+IAo+IE9u
IDIwMjIvMy8xIDE1OjI1LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+Cj4+IEhpLAo+Pgo+PiBMZSAyNS8wMi8yMDIyIMOgIDA4OjM5LCBZdSBUdSBhIMOpY3Jp
dMKgOgo+Pj4gVXNpbmcgdGhlIGNvbW1vbiBDbG9jayBjb2RlIHRvIGRlc2NyaWJlIHRoZSBVQVJU
IGJhdWQgcmF0ZQo+Pj4gY2xvY2sgbWFrZXMgaXQgZWFzaWVyIGZvciB0aGUgVUFSVCBkcml2ZXIg
dG8gYmUgY29tcGF0aWJsZQo+Pj4gd2l0aCB0aGUgYmF1ZCByYXRlIHJlcXVpcmVtZW50cyBvZiB0
aGUgVUFSVCBJUCBvbiBkaWZmZXJlbnQKPj4+IG1lc29uIGNoaXBzLiBBZGQgTWVzb24gUzQgU29D
IGNvbXBhdGlibGUuCj4+Pgo+Pj4gVGhlIHRlc3QgbWV0aG9kOgo+Pj4gU3RhcnQgdGhlIGNvbnNv
bGUgYW5kIHJ1biB0aGUgZm9sbG93aW5nIGNvbW1hbmRzIGluIHR1cm46Cj4+PiBzdHR5IC1GIC9k
ZXYvdHR5QU1MMCAxMTUyMDAgYW5kIHN0dHkgLUYgL2Rldi90dHlBTUwwIDkyMTYwMC4KPj4+Cj4+
PiBTaW5jZSBtb3N0IFNvQ3MgYXJlIHRvbyBvbGQsIEkgd2FzIGFibGUgdG8gZmluZCBhbGwgdGhl
IHBsYXRmb3JtcyBteXNlbGYKPj4+IHN1Y2ggYXMgTWVzb242LCBNZXNvbjgsIE1lc29uOGIsIEdY
TCBhbmQgc28gb24uIEkgb25seSB0ZXN0ZWQgaXQgd2l0aAo+Pj4gRzEyQSBhbmQgUzQuCj4+Pgo+
Pj4gWXUgVHUgKDYpOgo+Pj4gwqDCoCB0dHk6IHNlcmlhbDogbWVzb246IE1vdmUgcmVxdWVzdCB0
aGUgcmVnaXN0ZXIgcmVnaW9uIHRvIHByb2JlCj4+PiDCoMKgIHR0eTogc2VyaWFsOiBtZXNvbjog
VXNlIGRldm1faW9yZW1hcF9yZXNvdXJjZSB0byBnZXQgcmVnaXN0ZXIgbWFwcGVkCj4+PiDCoMKg
wqDCoCBtZW1vcnkKPj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29uOiBEZXNjcmliZXMgdGhlIGNh
bGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0ZQo+Pj4gwqDCoMKgwqAgY2xvY2sgdXNpbmcg
YSBjbG9jayBmcmFtZQo+Pj4gwqDCoCB0dHk6IHNlcmlhbDogbWVzb246IE1ha2Ugc29tZSBiaXQg
b2YgdGhlIFJFRzUgcmVnaXN0ZXIgd3JpdGFibGUKPj4+IMKgwqAgdHR5OiBzZXJpYWw6IG1lc29u
OiBUaGUgc3lzdGVtIHN0dWNrIHdoZW4geW91IHJ1biB0aGUgc3R0eSBjb21tYW5kIG9uCj4+PiDC
oMKgwqDCoCB0aGUgY29uc29sZSB0byBjaGFuZ2UgdGhlIGJhdWQgcmF0ZQo+Pj4gwqDCoCB0dHk6
IHNlcmlhbDogbWVzb246IEFkZGVkIFM0IFNPQyBjb21wYXRpYmlsaXR5Cj4+Pgo+Pj4gVjYgLT4g
Vjc6IFRvIHNvbHZlIHRoZSBzeXN0ZW0gc3R1Y2sgd2hlbiB5b3UgcnVuIHRoZSBzdHR5IGNvbW1h
bmQgb24KPj4+IHRoZSBjb25zb2xlIHRvIGNoYW5nZSB0aGUgYmF1ZCByYXRlLgo+Pj4gVjUgLT4g
VjY6IENoYW5nZSBlcnJvciBmb3JtYXQgYXMgZGlzY3Vzc2VkIGluIHRoZSBlbWFpbC4KPj4+IFY0
IC0+IFY1OiBDaGFuZ2UgZXJyb3IgZm9ybWF0Lgo+Pj4gVjMgLT4gVjQ6IENoYW5nZSBDQ0YgdG8g
ZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIGFzIGRpc2N1c3NlZAo+Pj4gaW4gdGhl
IGVtYWlsLgo+Pj4gVjIgLT4gVjM6IGFkZCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3gt
dWFydCIuIEJlY2F1c2UgaXQgbXVzdCBjaGFuZ2UKPj4+IHRoZSBEVFMgYmVmb3JlIGl0IGNhbiBi
ZSBkZWxldGVkCj4+PiBWMSAtPiBWMjogVXNlIENDRiB0byBkZXNjcmliZSB0aGUgVUFSVCBiYXVk
IHJhdGUgY2xvY2suTWFrZSBzb21lIGNoYW5nZXMgYXMKPj4+IGRpc2N1c3NlZCBpbiB0aGUgZW1h
aWwKPj4+Cj4+PiBMaW5rOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAy
MjAxMTgwMzA5MTEuMTI4MTUtNC15dS50dUBhbWxvZ2ljLmNvbS8KPj4+Cj4+PiDCoCBkcml2ZXJz
L3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMjIxICsrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKyksIDY3IGRlbGV0
aW9ucygtKQo+Pj4KPj4+Cj4+PiBiYXNlLWNvbW1pdDogYTYwM2NhNjBjZWJmZjg1ODk4ODI0Mjdh
NjdmODcwZWQ5NDZiM2ZjOAo+Pgo+PiBDb3VsZCB5b3Ugc2VuZCB0aGUgZW1haWxzIFRvIEtldmlu
LCBKZXJvbWUsIE1hcnRpbiAmIG1lLCBhbmQgcHV0IHRoZSB2YXJpb3VzIGxpc3RzIGluIENDIGlu
c3RlYWQgPyBvdGhlcndpc2Ugd2UgYXJlIG5vdCBub3RpZmllZCB3aGVuIHRoZSBwYXRjaCBpcyBh
Y2NlcHRlZCBieSB0aGUgdHR5IG1haW50YWluZXIuCj4gVGhlIGZhY3QgaXMgdGhhdCBzZW5kaW5n
IGlzIGFkZGluZyB5b3UgdXAsIHlvdSBzZWUKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1hbWxvZ2ljLzIwMjIwMjI1MDczOTIyLjM5NDctMS15dS50dUBhbWxvZ2ljLmNvbS8K
Ckl0J3Mgbm90IHRoZSBwb2ludCwgdGhlIG9yZGVyIG9mIHJlY2lwaWVudCBpbiBDYyBhbmQgVG8g
aXMgaW1wb3J0YW50IHNpbmNlIHRoZXkgYXJlIHVzZWQKYnkgbWFpbnRhaW5lcnMgdG8gdHJhY2sg
cGF0Y2ggZm9yIHJldmlldyBhbmQgdG8gbm90aWZ5IHdoZW4gcGF0Y2hlcyBhcmUgdGFrZW4gaW4g
dGhlaXIgdHJlZS4KClNvIHBsZWFzZSBtYWtlIHN1cmUgdGhlIHJlY2lwaWVudHMgYXJlIGNvcnJl
Y3RseSBzZXQgYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoZXMuCgpOZWlsCgo+Pgo+PiBUaGFua3Ms
Cj4+IE5laWwKPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
