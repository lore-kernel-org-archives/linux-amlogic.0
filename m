Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C1CD4F54
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 May 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvRU7EmYpT64Bw6a6p896kmYG2LKC1VB0vHT+no2H5E=; b=NHzOWLzmMMHzE3
	jRcVPZQ44yTjDP8FVc/qVf7WEqYMYUXVotl3ELfAkDeJ4XU1QbUvWZW0JKFfXWcqyzm9NhhbOgMXR
	k8P6MVFfmFyn4myiQZGXuIXFuVAvFQOKSBd247S7zq86M7V1lLLqlEesbU4B1uTHh4WilU29eYJG4
	pn+Q+OcGVsbw04OS8ov5lG3jbb3DMLKkkobzTy+QgWdo3YQWcelToIw1bjGX3z28DTMHaTVPUgzYG
	43sjsYeBble7FcJoadCch/Pt7iIUkJqCxI+iomWwquvMw68HcJcj45awNfXYxvFnVMrEj7JuUgRCP
	88cgTEq4+sb94p5s64kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScFM-00000005tey-47FJ;
	Thu, 28 May 2026 15:02:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScFI-00000005te0-34Fh
	for linux-amlogic@lists.infradead.org;
	Thu, 28 May 2026 15:02:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso112400635e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 28 May 2026 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779980521; x=1780585321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=;
        b=jccvR8xX1Xl/wbsy5wN0Y5SV4SozO5lq98ak9/BJP5mtHpJ9YcbC5Bd0TZmhxg8lPC
         8L+mcXnBnqnku66Q/ULCbbtW6iplDVyo/85fNufY8ZDRkqt3mri0FinNmX/sJu7YyYP5
         OU9rkciAN9lRlyBj+2+S7phg3xH9eAlpt0mxPo0bVWswQTJoGcvUU3MkcNYYtrU4zOx4
         mEOH/1rPPWBazQDCzcFsmtyDapRa8o0Oc8A4KXgf7T4IZWjgfyr70G4ozAu/OJ2fvnJz
         S2f6as4P4ayEcKb5mdvyM5PSLD71R839IQS744kAj/G4abNOmjcrRgif8Xjun24fLGS6
         ZG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980521; x=1780585321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=;
        b=HkZ+Bk+Bu81T64Kv+k2KnwbEofph9ic62wcEejlUmjCozHuFAUa1e7GuxpZXlSO9MS
         r5N92djuV1+zpUJzk0H4L8haTLsmFkIiHHxYFUpOzvVKzS4bRcosFoeuILL6GqRMTKX5
         9kxWOCPhVC0Pud+kxXshbGR67V5NmFmK+su8wwcPCoDYKi4m8cqZyshtXNS0RXGtbbf6
         gUgs7+gN1WO4McBBCWa/AWf8ZFKdFIhtuX+zLAiOYCEfWy16da+xhV9//Oq9o8Cn2zve
         MOBLBMNo1qWaG7H7kd4rpjk3RXIg4Gbyw1cqPtQHPDADm48BYyc7Y5N144x5JimDupl4
         07wA==
X-Forwarded-Encrypted: i=1; AFNElJ9XSIgOomBfsUqKFWfXbPjKRT62DBNq6ibF89kLOLPqc12xHbDgmvvHXi+xr8qS/+phtc89sIMYg3JRqNei@lists.infradead.org
X-Gm-Message-State: AOJu0YyZgO17i3TriIRs5g53CVdQjgyQIEAjrHtnGPSvvjwBFN1zqIMu
	WysZNGuCH86L04COzCkrA8OQgFgQOuB239Ut9MkZ8elJCUJ5J+GAg1bdD8ZQogwWAOI=
X-Gm-Gg: Acq92OE+eN1FSdJgXm5us0EXeK6vQxHiuAqOwqxbx2l5LLh/3W4en+Jm84C6PX8U5RT
	p0ZMhamVglMUmSR38yvk4bB7PQfHht3wDfAOp0nVXO6DBiy8yd1cc9yX/KaNQVjZBLeyTGtWnyR
	C+0N/9EgsD5SAmKOxHhl9FBMUd9R9to18bF6yRs8zpGZC2gYrsTkW/igaXJryOSgjmSWOsFggYg
	rMeiBMl0OB+vcnEOCdGqwiTCrPVw0u05EiHhWCURMm58S68TpS3UdWs7PIVuWdL0zK3UR9JKbGN
	Maz4/MEA+/cfwyJ0e5274kEpSvwL0y3CTrRlwqTueIFoWP20qzvv14W2HiBvUMldd0jILI1jNNJ
	WOMjRmHKiphPAF2yhBo11LL69noTFtiTfJq3aF1WYX8fyruOAMKjoolSoEB+ZFxCJjoMjtylhpt
	ZJSP0G05x1oQ+NlCGNSYvKB/P8GctfWMU5HnxH
X-Received: by 2002:a05:600c:3e0d:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-4904e3eb5abmr402523195e9.22.1779980521083;
        Thu, 28 May 2026 08:02:01 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909236ab3bsm53549395e9.4.2026.05.28.08.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 08:02:00 -0700 (PDT)
Message-ID: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
Date: Thu, 28 May 2026 17:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
 <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Content-Language: en-US
In-Reply-To: <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_080205_071334_D4ED0BEB 
X-CRM114-Status: GOOD (  23.65  )
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

CgpPbiA1LzIyLzI2IDE4OjI0LCBWYWxlcmlvIFNldHRpIHdyb3RlOgo+IAo+IE9uIDUvMjIvMjYg
MDE6MTUsIE1hcmsgQnJvd24gd3JvdGU6Cj4+IE9uIEZyaSwgTWF5IDE1LCAyMDI2IGF0IDA1OjEw
OjQwUE0gKzAyMDAsIFZhbGVyaW8gU2V0dGkgd3JvdGU6Cj4+PiBDcmVhdGUgYSBuZXcgREFQTSB3
aWRnZXQgZm9yICJJMlMgZm9ybWF0dGVyIiBhbmQgcGxhY2UgaXQgb24gdGhlIHBhdGgKPj4+IGJl
dHdlZW4gRklGTyBhbmQgb3V0cHV0IERBSSBpbnRlcmZhY2UuIFJlbW92ZSBJMlMgb3V0cHV0IGZv
cm1hdHRpbmcgY29kZQo+Pj4gZnJvbSBhaXUtZW5jb2Rlci1pMnMgc2luY2UgaXQncyBub3cgaW1w
bGVtZW50ZWQgZnJvbSBhaXUtZm9ybWF0dGVyLWkycy4KPj4KPj4gVGhpcyBzZXJpZXMsIGl0IGxv
b2tzIGxpa2UgdGhpcyBzcGVjaWZpYyBwYXRjaCwgaXMgYnJlYWtpbmcgcGNtLXRlc3Qgb24KPj4g
bXkgbGlicmV0ZWNoIExlIFBvdGF0byBib2FyZCwgdGhlIGNsb2NraW5nIGxvb2tzIHRvIGJlIHNl
cmlvdXNseSBtZXNzZWQKPj4gdXAuwqAgSSdtIGdldHRpbmc6Cj4+Cj4+IFsuLi5dCj4+Cj4+IEZ1
bGwgbG9nOgo+Pgo+PiDCoMKgwqAgaHR0cHM6Ly9sYXZhLnNpcmVuYS5vcmcudWsvc2NoZWR1bGVy
L2pvYi8yNzg2MzQyI0wxOTM0Cj4+Cj4+IFRoZSBwcmlvciBwYXRjaGVzIHNlZW0gdG8gdGVzdCBm
aW5lLCBpdCdzIHRoaXMgb25lIHRoYXQgc2VlbXMgdG8KPj4gaW50cm9kdWNlIHRoZSBpc3N1ZS4K
PiAKPiBUaGFua3MgYSBsb3QgZm9yIHRoZSBoZWFkcyB1cCBhbmQgcGxlYXNlIGFwb2xvZ2l6ZSBm
b3IgdGhlIHByb2JsZW0uCj4gSSB3YXNuJ3QgYXdhcmUgb2YgdGhlc2UgdGVzdGluZyB0b29scyBz
byBJIGJhc2VkIG15IHRlc3Rpbmcgb24gcGxheWluZyAKPiB3aXRoIHVzZXJzcGFjZSBhbHNhIHRv
b2xzIG9uIHRoZSBwaHlzaWNhbCBib2FyZCB0aGF0IEkgaGF2ZS4KPiAKPiBJIHdpbGwgdGFrZSBh
IGxvb2sgYXQgaXQgQVNBUCBhbmQgc2VuZCBhIHByb3Blcmx5IHRlc3RlZCB2Mi4KPiAKCkhpIQoK
SSBpbnZlc3RpZ2F0ZWQgYSBiaXQgb24gdGhlIGlzc3VlIGNhdXNlZCBieSBteSB2MSBwYXRjaCBz
ZXJpZXMgYW5kIEkgCnRoaW5rIEkndmUgZm91bmQgdGhlIHJvb3QgY2F1c2UuIEkgc3VzcGVjdCBt
eSBwYXRjaCBzZXJpZXMgaGVscGVkIApkaXNjb3ZlcmluZyBhIG1pc2JlaGF2aW9yIHRoYXQgd2Fz
IGFscmVhZHkgcHJlc2VudCwgc28gSSdtIHNlZWtpbmcgZm9yIApzdWdnZXN0aW9ucyBvbiB0aGUg
cHJvcGVyIHdheSB0byBwcm9jZWVkLgoKIyBGaXJzdDogdGhlIGJhY2tncm91bmQKCkJ5IGRlZmF1
bHQgb24gT2Ryb2lkQzIvTGVQb3RhdG8gYm9hcmRzIHRoZSBvbmx5IGF2YWlsYWJsZSBhdWRpbyBw
bGF5YmFjayAKaXMgdGhyb3VnaCBIRE1JLiBGcm9tIERBSSBwb2ludCBvZiB2aWV3IHRoZSBmbG93
IGlzIGFzIGZvbGxvd3M6CgoiSTJTIEZJRk8iIC0+ICJJMlMgRW5jb2RlciBQbGF5YmFjayIgLT4g
IkNPREVDIENUUkwgSERNSSBJMlMgSU4iIC0+IAoiSERNSSBDVFJMIFNSQyIgKG1peGVyKSAtPiAi
Q09ERUMgQ1RSTCBIRE1JIE9VVCBDYXB0dXJlIgoKSW4gdGhpcyBjaGFpbiB0aGUgbWl4ZXIgIkhE
TUkgQ1RSTCBTUkMiIGJ5IGRlZmF1bHQgc3RhcnRzIGFzICJESVNBQkxFRCIgCnNvIGl0IHNob3Vs
ZCBwcmV2ZW50ICJDT0RFQyBDVFJMIEhETUkgT1VUIENhcHR1cmUiIGZyb20gcmVjZWl2aW5nIGRh
dGEuCgojIFdoYXQgY2hhbmdlZCBiZWZvcmUvYWZ0ZXIgdGhlIGxhc3QgY29tbWl0IG9mIG15IHBh
dGNoIHNlcmllcz8KCi0gQmVmb3JlOiAiYWl1LWVuY29kZXItaTJzLmMiIHdhcyBjYWxsaW5nICJh
aXVfZW5jb2Rlcl9pMnNfc2V0dXBfZGVzYygpIiAKaW4gImh3X3BhcmFtcygpIi4gQXVkaW8gcGxh
eWJhY2sgc2hvdWxkbid0IHdvcmsgaW4gdGhpcyBjb25kaXRpb24gCmJlY2F1c2UgYXMgSSBtZW50
aW9uZWQgIkhETUkgQ1RSTCBTUkMiPSJESVNBQkxFRCIgYnkgZGVmYXVsdCwgYnV0IAphcHBhcmVu
dGx5IGNvbmZpZ3VyaW5nIHRoZSBBSVVfSTJTX1NPVVJDRV9ERVNDIHJlZ2lzdGVyIGlzIGVub3Vn
aCB0byAKbWFrZSB0aGUgcGxheWJhY2sgdG8gd29yayBwcm9wZXJseS4KCi0gQWZ0ZXI6IHRob3Nl
IGNvbmZpZ3VyYXRpb25zIGFyZSBvbmx5IHNldCB3aGVuIAoiYWl1X2Zvcm1hdHRlcl9pMnNfcHJl
cGFyZSIgaXMgY2FsbGVkIHdoaWNoIGhhcHBlbnMgaWYgIkkyUyBGb3JtYXR0ZXIiIAp3aWRnZXQg
aXMgZW5hYmxlZC4gU2luY2UgIkhETUkgQ1RSTCBTUkMiPSJESVNBQkxFRCIgdGhlbiAiSTJTIEZv
cm1hdHRlciIgCmlzIG5vdCBwb3dlcmVkIHVwIGFuZCB0aGVyZWZvcmUgaXRzIGNhbGxiYWNrcyBh
cmUgbm90IGNhbGxlZCBhbmQgdGhlIApwbGF5YmFjayBmYWlscy4KClNpbXBseSBpc3N1aW5nIHRo
ZSBmb2xsb3dpbmcgY29tbWFuZDoKJCBhbWl4ZXIgc3NldCAnQUlVIEhETUkgQ1RSTCBTUkMnICdJ
MlMnCgpyZXNvbHZlcyB0aGUgcHJvYmxlbSBhbmQgYWxsIHBjbS10ZXN0cyBwYXNzLgpUaGlzIGFs
c28gZXhwbGFpbnMgd2h5IEkgZGlkbid0IGNhdGNoIHRoaXMgaXNzdWUgYmVmb3JlIHNlbmRpbmcg
dGhlIHYxIApzZXJpZXM6IEkgdGVzdGVkIHdpdGggTlhQIFNHVEw1MDAwIGNvZGVjLCBub3QgdGhl
IEhETUkgb25lLgoKIyBGaW5hbCBxdWVzdGlvbgoKSSBoYXZlIDIgYWx0ZXJuYXRpdmUgcHJvcG9z
YWxzIGZvciB0aGlzOgoKLSBDaGFuZ2UgdGhlIGRlZmF1bHQgdmFsdWUgb2YgIkhETUkgQ1RSTCBT
UkMiIHNvIHRoYXQgYXQgYm9vdCBpdCdzIHNldCAKdG8gc29tZSB3b3JraW5nIGNvbmZpZ3VyYXRp
b24gKGV4OiAiSTJTIikuIFRoaXMgc2hvdWxkIGJlIGRvbmUgc29tZXdoZXJlIAppbiAiYWl1LWNv
ZGVjLWN0cmwiIEkgdGhpbmsuCi0gUnVuIHRoZSAnYW1peGVyJyBjb21tYW5kIGFib3ZlIGJlZm9y
ZSBydW5uaW5nIEFMU0EgdGVzdHMuCgpBbnkgc3VnZ2VzdGlvbiBvbiB3aGF0J3MgdGhlIGJlc3Qg
YXBwcm9hY2g/CgpUaGFua3MgYSBsb3QuCgotLSAKVmFsZXJpbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
