Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D9FC48BF6
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 23:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqAg6WU40UBBqXdq1TsBH+HX4iidJdennQ2AzLY4Axw=; b=JpXHkP7aPkcONS
	GT8vq1xZ8JfqiMq6mUOx1K23BXAKgBeGDVSvpPWMBN4XpLmG6oTcrBEs6LJGQbh5KYZJYglV/sg6Y
	OKInSDbrcZnmoKmUhkm5V7aQbKG8xU8rYqafCS+Ccq9kIPo0Uq9e4wTek6PWWjvukIF6nPGu46Bwg
	45Y5jYGeAZ+ieMTmvmKk3D3DKhyS0pwMWM3pX9RQEcy+W7/hPHII2q0uN49lgn0A8rri6JdL3k8lc
	upghmSV8Z/5fctPgWB9ys4PVZY7vByL/IQWuu7s7iy1CQIcxKMfDH6sekOcirpggw3YThS8zTdu6A
	MgIHg82dnZuwwgDKqj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbqtt-00000008etm-0GZS;
	Sun, 18 Feb 2024 23:48:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbqtq-00000008est-0tZk
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Feb 2024 23:48:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41263e8b7f8so4359045e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Feb 2024 15:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708300119; x=1708904919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buA/UKLNcQ5kdyPMEKml7ordtlaWTbAGzP/8x7nK568=;
        b=UFpo18meOLbaqB1LXKwXL3nVadJ4AhsZlIFRIoSHFgD+ecwGjRsaQsmPGtueDJPu3E
         9htxeT32USb800+aSRXsxY/SDz4TXvIUlYNVlKiLN2wllCZKYns6IamcYYOXuGOhRqMz
         HxkCjJOCDyW3HDO/Fx42ulJzBwxVnc+/+3n6VSs5KBEgg1qzKAu91qnfX6IoVrLDNYiN
         RPDJV7qWMvQcor4Zp2Am55Se3mdGCIZSliaiyRl5poNiGRilfimdMO9GIw6Hd7qxlg28
         mJQvjVRV6SMK59IiBX4uM6MszBU736te+fVPD+8W87RWbjpHZOXJjQi0jE/iLONgIEy9
         ycFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708300119; x=1708904919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buA/UKLNcQ5kdyPMEKml7ordtlaWTbAGzP/8x7nK568=;
        b=UJZBdT1Xe2skTqt8DoxE35bXLDss14Dv2uIgEdjaf6Q8b1rQrcsReSquY/YIv7i0wW
         +KQPzhRrWX4FeZEWAecwJKl9bUI76EXsWJlpSNAyjB3rqY7uhOMuKgk1Tcl/lc936E7L
         GVSCInA12KwEWR7pO8/N/HWjZfSgY8frhNbnusQ3peoGO+Tk1xZTXaGkBfThldNbfBnF
         JZC/j00ohiQ1lL0MRJYC/j1WDssYtrGBarGPBLkGmRe/zxLG1fn+S4WgSDRbh1FlwI7B
         j4CloVK2uz4VAdTKuSH5Wcb3KUykWX3PWaLZ2h5QWhWNVjlICXseH/MLkganhlluKVZk
         lpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTgW/w/8BjzbkY9HTZL5KvsHpdu8tBeT9s3jIDS3tyqVL8nRHqCRpCuObHPuXzzcG5vOfgr8XzWpnBZ7T1R6KIZDIOgF5/kts5/FcHjQ4FhvA=
X-Gm-Message-State: AOJu0YxvzSuL04NZ/XRjdjSR1sp8CSKblNAZSC5EDEVXDD5AqGqh07Py
	lHhDFb5Akty2xHUzlTX2PQliPQzVtIqXW5ebsNa27LmkqdNOAT5J5+haiTbJl84=
X-Google-Smtp-Source: AGHT+IEMnbMNjC4B0Pso0FCy4uKJFZWuQJrqcCZS1B/SG+nzfSMdDR0Xv3aZlRG+CEHH5v3gSGfFjA==
X-Received: by 2002:a05:600c:4fc9:b0:412:5652:2875 with SMTP id o9-20020a05600c4fc900b0041256522875mr4798821wmq.17.1708300118765;
        Sun, 18 Feb 2024 15:48:38 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l5-20020a05600c4f0500b0041253692606sm7871460wmq.17.2024.02.18.15.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 15:48:38 -0800 (PST)
Message-ID: <5f6229ac-1390-41b5-af91-53799641d3b2@linaro.org>
Date: Mon, 19 Feb 2024 00:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] clocksource/drivers/arm_global_timer: Fix maximum
 prescaler value
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andrea.merello@gmail.com,
 patrice.chotard@foss.st.com, linux-amlogic@lists.infradead.org
References: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
 <20240218174138.1942418-2-martin.blumenstingl@googlemail.com>
 <ec0b3dfb-3ce2-43f2-9cd4-042c3aca4cf7@linaro.org>
 <CAFBinCC0BbahEMeW9CYC+hKk0CBQ9a+CqNrOv3c92D8hDtQHdQ@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAFBinCC0BbahEMeW9CYC+hKk0CBQ9a+CqNrOv3c92D8hDtQHdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_154846_456042_79373CAA 
X-CRM114-Status: GOOD (  17.93  )
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

T24gMTkvMDIvMjAyNCAwMDoxOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBEYW5p
ZWwsCj4gCj4gT24gU3VuLCBGZWIgMTgsIDIwMjQgYXQgMTE6NTnigK9QTSBEYW5pZWwgTGV6Y2Fu
bwo+IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPiBbLi4uXQo+Pj4gICAgI2Rl
ZmluZSBHVF9DT05UUk9MX1BSRVNDQUxFUl9TSElGVCAgICAgIDgKPj4+IC0jZGVmaW5lIEdUX0NP
TlRST0xfUFJFU0NBTEVSX01BWCAgICAgICAgMHhGCj4+PiArI2RlZmluZSBHVF9DT05UUk9MX1BS
RVNDQUxFUl9NQVggICAgICAgIDB4RkYKPj4+ICAgICNkZWZpbmUgR1RfQ09OVFJPTF9QUkVTQ0FM
RVJfTUFTSyAgICAgICAoR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFYIDw8IFwKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVF9DT05UUk9MX1BSRVNDQUxFUl9TSElG
VAo+Pgo+PiBHb29kIGNhdGNoIQo+Pgo+PiBJTU8gdGhlIGluaXRpYWwgY29uZnVzaW9uIGlzIGNv
bWluZyBmcm9tIHRoZSBzaGlmdCBhbmQgdGhlIG1hc2sgc2l6ZS4KPj4KPj4gQnV0IHNob3VsZCBH
VF9DT05UUk9MX1BSRVNDQUxFUl9NQVggYmUgMjU2ID8gc28gKDB4RkYgKyAxKQo+IEl0IGRlcGVu
ZHMgb24gd2hhdCB3ZSBjb25zaWRlciAibWF4IiB0byBiZToKPiAtIHRoZSByZWdpc3RlciB2YWx1
ZQo+IC0gdGhlIGFjdHVhbCBudW1iZXIgdGhhdCdzIHVzZWQgaW4gdGhlIGNhbGN1bGF0aW9uIGZv
cm11bGEKPiAKPiBJZiB3ZSBpZ25vcmUgdGhlIHVzYWdlIG9mIEdUX0NPTlRST0xfUFJFU0NBTEVS
X01BWCB3aXRoaW4KPiBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVNLIHRoZW4gdGhlcmUncyBvbmx5
IG9uZSBvY2N1cnJlbmNlIGxlZnQsIHdoaWNoCj4gZGVjcmVtZW50cyB0aGUgY2FsY3VsYXRlZCB2
YWx1ZSByaWdodCBiZWZvcmUgY29tcGFyaW5nIGl0IGFnYWluc3QKPiBHVF9DT05UUk9MX1BSRVND
QUxFUl9NQVguCj4gVGhpcyBtZWFuczogdGhlIHJlbWFpbmluZyBkcml2ZXIgY3VycmVudGx5IGNv
bnNpZGVycwo+IEdUX0NPTlRST0xfUFJFU0NBTEVSX01BWCB0byBiZSB0aGUgbWF4aW11bSB2YWx1
ZSB0aGF0IGNhbiBiZSB3cml0dGVuCj4gdG8gdGhlIHJlZ2lzdGVyLCBoYXZpbmcgY29udmVydGVk
IHRoZSB2YWx1ZSBmcm9tIHRoZSBjYWxjdWxhdGlvbgo+IGZvcm11bGEgdG8gcmVnaXN0ZXIgdmFs
dWUgYmVmb3JlaGFuZC4KPiAKPj4gVGhlIGZvbGxvd2luZyBtYXkgYmUgbGVzcyBjb25mdXNpbmc6
Cj4+Cj4+ICNkZWZpbmUgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfU0hJRlQgICAgICA4Cj4+ICNkZWZp
bmUgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFTSyAgICAgICBHRU5NQVNLKDE1LDgpCj4+ICNkZWZp
bmUgR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFYICAgICAgICAoR1RfQ09OVFJPTF9QUkVTQ0FMRVJf
TUFTSyA+PiBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdU
X0NPTlRST0xfUFJFU0NBTEVSX1NISUZUKSArIDEKPiBJZiB5b3UncmUgaW50ZXJlc3RlZCB0aGVu
IEknbGwgd29yayBvbiBhIGZvbGxvdy11cCBwYXRjaCB0byBjbGVhbiB1cAo+IHRoZSBwcmVzY2Fs
ZXIgbWFjcm9zICh1c2luZyBGSUVMRF9QUkVQLCBGSUVMRF9HRVQgYW5kIEdFTk1BU0sgd291bGQK
PiBzaW1wbGlmeSB0aGluZ3MgSU1PKS4KClllcywgY2xlYW51cHMgYXJlIHdlbGNvbWUKCj4gSSB0
aGluayB0aGF0IHRoaXMgcGF0Y2ggaXMgc3RpbGwgZ29vZCBhcy1pcyBzaW5jZSBpdCdzIHNtYWxs
IGFuZCBjYW4KPiBiZSBiYWNrcG9ydGVkIGVhc2lseSAoaWYgc29tZW9uZSB3YW50cyB0byBkbyB0
aGF0KS4KCk9rLCBJJ20gZmluZSB3aXRoIHRoYXQKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9s
bG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vi
b29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
