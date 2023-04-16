Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA12C77B61
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Apr 2023 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vz+dSd0bLmVqfxaMEptIZ6Hx7F3L7ih5MMYCGpD/3MA=; b=n96EcAeXvmU5Lf
	oEc8gutPKYrtQWYzGNoXpvo89iPSJB2IEOhVodncMYI98V5/rRCYY/GviV5vXbWbsvm205UIQW+Zh
	fsIm3BlkojeOgMfHJFQxL4uSKjIf5MOqaoxAn8kNuXYn0A7vhemFOrcaRoE/+oCuKMUvmmmKKRtjX
	D2rHUE2QC1BgaHMssyh+svn7wpngo6bLz8/r054n8/tMDatwGvUl6iGTrO5SoLqX2k4Zb1biBdE9x
	5dlfPxfdZrbhIgo05BNB7ath0BQYeciChBaB6OcMI20DoNT4DzA5E+hilGwrCFrhlR3f2IYyXlFOn
	Aub7sPHPTSPWDSXWQpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poA1Y-00ESTK-17;
	Sun, 16 Apr 2023 21:35:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poA1U-00ESSP-2t;
	Sun, 16 Apr 2023 21:35:02 +0000
Received: by mail-ej1-x62e.google.com with SMTP id sz19so2225835ejc.2;
        Sun, 16 Apr 2023 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681680898; x=1684272898;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTEJ3SvEYPG4oDgombjMYM3ak7OFgJ8uVwxrQoFD3j8=;
        b=gLkBwiPccZS4UsdOCU9uPEB6aUoWFnQQl9b7LgB2cA3/Bmt7wbBXCDlAIj8FSZo7IZ
         m0OMGOwfMiXGEXb4a19+pU41BNWz/hPlp5BFOIdDkzYE0k9f9H9hqk5dBmkDXRDLd492
         /h9c0z+FlhGlAdU/MC3sjNL+grY2GDCsl8imp9OJQydqVZ6T+56SLuVyvyoMCU6seoV7
         JMWEZUVoHY6ZJBb6pXLViX0c2ASCucpU2hLIxtUqTpVU9JuGttjPoZcHSOr+kPglDK+I
         895e+ufuuXQ82Bj4tscXHCC11Am4nXflBR45meDqgqTZTyBSYwSH/uHEX6K6KlGL9pD3
         VbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681680898; x=1684272898;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTEJ3SvEYPG4oDgombjMYM3ak7OFgJ8uVwxrQoFD3j8=;
        b=Q93+vR2G40G9rGa+w+qkayCGrhYAJ9k8hqUK8kh7Z0I5iS3YdVDSYSn5fv8CvmVdaN
         tvyzL5NFQ/Fm/F4VAyDqN8w18W7Wf/QLVbZINjZn5rDew/3mynFMOeLYr9Xq20ztXWjE
         hito01JdPL6oSDwn+AVnWTtbkREhuc6IqDTDLnvU8ACAl7bXU2Ny1lRximN/wwifgN+0
         tZkoYlkBXk8/br94lq6kRsNSZj7aUqmhnQcdgTXINGhn4mYSPpevDZmSyctztfE2Flvn
         D3pms63T3scEF9jUNoloWtOP+gliH0gO9oN9DpVKBwtTVVd+Kcj9nVPA0HWzUeewWG9A
         ftaw==
X-Gm-Message-State: AAQBX9eE8APreXAafR6TZlQwlnbtjmvOh41GFPj7n8rhocRdpiHFbXaP
	AS72sRFT2kUaGNMJ7KNJgec=
X-Google-Smtp-Source: AKy350bLoctHyHIvPipBGZToinGdo4hBHvgY5kHFq+s6rSGIJaHmSJfye+mLUzxvMEYeQHbzktqvgA==
X-Received: by 2002:a17:906:c455:b0:94f:17b7:5db3 with SMTP id ck21-20020a170906c45500b0094f17b75db3mr4760508ejb.20.1681680897728;
        Sun, 16 Apr 2023 14:34:57 -0700 (PDT)
Received: from ?IPV6:2a02:3100:90eb:5c00:c072:8c2c:2c92:c192? (dynamic-2a02-3100-90eb-5c00-c072-8c2c-2c92-c192.310.pool.telefonica.de. [2a02:3100:90eb:5c00:c072:8c2c:2c92:c192])
        by smtp.googlemail.com with ESMTPSA id d15-20020a170906c20f00b0094f3b18044bsm1864890ejz.218.2023.04.16.14.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 14:34:57 -0700 (PDT)
Message-ID: <7601c976-3195-a35d-236c-9bd386dfe8e0@gmail.com>
Date: Sun, 16 Apr 2023 23:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
 <CAFBinCCzMdQZ4mDF7SEZKHc01MPSepxdzYa+j7G-qDXe5-kBVA@mail.gmail.com>
 <4b328dab-5f96-e5d0-3181-ce059d11b04b@gmail.com>
 <CAFBinCCxQvB_fY0r4jkwy7zW1F9s2vrxmcRaTs6hG5ay_Gf8mw@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
In-Reply-To: <CAFBinCCxQvB_fY0r4jkwy7zW1F9s2vrxmcRaTs6hG5ay_Gf8mw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_143500_931066_CF9C43C9 
X-CRM114-Status: GOOD (  20.42  )
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

T24gMTYuMDQuMjAyMyAyMToyNiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBIZWlu
ZXIsCj4gCj4gT24gU2F0LCBBcHIgMTUsIDIwMjMgYXQgODozOeKAr0FNIEhlaW5lciBLYWxsd2Vp
dCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxNC4wNC4yMDIzIDIxOjM5
LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+Pj4gSGVsbG8gSGVpbmVyLAo+Pj4KPj4+IE9u
IFRodSwgQXByIDEzLCAyMDIzIGF0IDc6NTXigK9BTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2Vp
dDFAZ21haWwuY29tPiB3cm90ZToKPj4+IFsuLi5dCj4+Pj4gVGVzdGVkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+Pj4gVW5mb3J0
dW5hdGVseSBJIGhhdmUgc29tZSBiYWQgbmV3cyBhbmQgSSBuZWVkIHRvIHRha2UgYmFjayBteSBU
ZXN0ZWQtYnkgOi0oCj4+PiBQcmV2aW91c2x5IG15IHRlc3Qgd2FzOiBjeWNsZSB0aHJvdWdoIGFs
bCBhdmFpbGFibGUgQ1BVIGZyZXF1ZW5jaWVzCj4+PiB3aGlsZSBzdHJlc3NpbmcgdGhlIENQVS4K
Pj4+IE15IGFzc3VtcHRpb24gd2FzOiBpZiB0aGUgc3lzdGVtIGRvZXNuJ3QgbG9jayB1cCBldmVy
eXRoaW5nJ3MgZmluZQo+Pj4gYmVjYXVzZSB3ZSBoYXZlIGEgaGlnaCBlbm91Z2ggdm9sdGFnZS4K
Pj4+Cj4+PiBUaGlzIGV2ZW5pbmcgaG93ZXZlciBJIGdvdCBhIG1lbW9yeSBjb3JydXB0aW9uIGVy
cm9yIHdoaWxlIHRyeWluZyB0bwo+Pj4gbG9nIGluIHZpYSBVQVJUIC0gd2hpY2ggSSB0aG91Z2h0
IHdhcyBzdHJhbmdlLgo+Pj4gU28gSSBjb25uZWN0ZWQgbXkgbG9naWMgYW5hbHl6ZXIgdG8gbXkg
T2Ryb2lkLUMxIGFuZCBkaWQgc29tZSBleHBlcmltZW50czoKPj4+Cj4+PiBwZXJpb2QgPSAzMDUx
OCwgZHV0eSBjeWNsZSA9IDE1MjU5ICh0eXBpY2FsbHkgdXNlZCBmb3IgdGhlIDMya0h6Cj4+PiBv
dXRwdXQgdG8gdGhlIFNESU8gd2lmaSBjaGlwKQo+Pj4gYmVmb3JlIHlvdXIgcGF0Y2hlcyAvIGFm
dGVyIGFwcGx5aW5nIHlvdXIgcGF0Y2hlczoKPj4+IFBXTTogZHV0eSBjeWNsZTogNTAuMDAwMDAw
JSAvIDUwLjAwMDAwMCUKPj4+IFBXTTogcGVyaW9kOiAzMC42IMK1cyAvIDMwLjUgwrVzCj4+PiBU
aW1pbmc6IFRpbWU6IDE1LjI5MiDCtXMgKDY1LjM5NSBrSHopIC8gMTUuMjUwIMK1cyAoNjUuNTc0
IGtIeikKPj4+IFRpbWluZzogQXZlcmFnZTogMTUuMjk2IMK1cyAoNjUuMzc3IGtIeikgLyAxNS4y
NjQgwrVzICg2NS41MTMga0h6KQo+Pj4gZHJpdmVyIGRlYnVnIG1lc3NhZ2VzIHdpdGggeW91ciBw
YXRjaGVzIGFwcGxpZWQ6Cj4+PiBmaW5fZnJlcTogODUwMDAwMDAwIEh6Cj4+PiBwZXJpb2Q9MzA1
MTggY250PTI1OTQwCj4+PiBkdXR5PTE1MjU5IGR1dHlfY250PTEyOTcwCj4+Pgo+Pj4gVGhlbiBJ
IHRyaWVkIHBlcmlvZCA9IDEyMjE4LCBkdXR5IGN5Y2xlID0gMCAodHlwaWNhbGx5IHVzZWQgZm9y
IHRoZQo+Pj4gaGlnaGVzdCBDUFUgdm9sdGFnZSk6Cj4+PiBiZWZvcmUgeW91ciBwYXRjaGVzIC8g
YWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaGVzOgo+Pj4gUFdNOiBkdXR5IGN5Y2xlOiAwLjMzODk4
MyUgLyBuL2EgKGNvbnN0YW50IGxvdyBvdXRwdXQpCj4+PiBQV006IHBlcmlvZDogMTIuMyDCtXMg
LyBuL2EKPj4+IFRpbWluZzogVGltZTogMTIuMjUwIMK1cyAoODEuNjMzIGtIeikgLyBuL2EKPj4+
IFRpbWluZzogQXZlcmFnZTogNi4xNDggwrVzICgxNjIuNjY4IGtIeikgLyBuL2EKPj4+IGRyaXZl
ciBkZWJ1ZyBtZXNzYWdlcyB3aXRoIHlvdXIgcGF0Y2hlcyBhcHBsaWVkOgo+Pj4gZmluX2ZyZXE6
IDg1MDAwMDAwMCBIego+Pj4gcGVyaW9kPTEyMjE4IGNudD0xMDM4NQo+Pj4KPj4gV2l0aCBhIDg1
ME1IeiBpbnB1dCBjbG9jayB3ZSBzaG91bGQgc2VlIGEgMC4wMSUgZHV0eSBjeWNsZSB3aXRoIDEu
Mm5zCj4+IGNsb2NrIHB1bHNlcy4gQ2FuIHdlIHJ1bGUgb3V0IGFuIGlzc3VlIHdpdGggdGhlIG1l
YXN1cmluZyBlcXVpcG1lbnQ/Cj4+IElzIHlvdXIgbG9naWMgYW5hbHl6ZXIgYWJsZSB0byBkaXNw
bGF5IHN1Y2ggc2hvcnQgY2xvY2sgcHVsc2VzPwo+IE9oLCB5b3UncmUgcmlnaHQ6IG15IGxvZ2lj
IGFuYWx5emVyIG1heGVzIG91dCBhdCAyNE1IeiAofjQybnMpLgo+IFNvIHdlIGNhbiBpZ25vcmUg
dGhpcyBjYXNlLgo+IAo+Pj4gRmluYWxseSBJIHRyaWVkIHBlcmlvZCA9IDEyMjE4LCBkdXR5IGN5
Y2xlID0gMTIyMTggKHR5cGljYWxseSB1c2VkIGZvcgo+Pj4gdGhlIGxvd2VzdCBDUFUgdm9sdGFn
ZSk6Cj4+PiBiZWZvcmUgeW91ciBwYXRjaGVzIC8gYWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaGVz
Ogo+Pj4gUFdNOiBkdXR5IGN5Y2xlOiA5OS42NjEwMTclIC8gbi9hIChjb25zdGFudCBsb3cgb3V0
cHV0KQo+IEkgaGF2ZSB0byBjb3JyZWN0IG15c2VsZjogZm9yIHRoaXMgY2FzZSBteSBsb2dpYyBh
bmFseXplciBzZWVzIGE6Cj4gY29uc3RhbnQgaGlnaCBzaWduYWwKPiAKU28gY29uY2x1c2lvbiBp
cyB0aGF0IHRoZSBQV00gb3V0cHV0IGlzIGFzIGV4cGVjdGVkPyBJZiB5ZXMsIHRoZW4gdGhlCm1l
bW9yeSBjb3JydXB0aW9uIHlvdSBzYXcgc3VwcG9zZWRseSBoYWQgYW5vdGhlciByb290IGNhdXNl
PwpFdmVudHVhbGx5IHlvdXIgVGVzdGVkLWJ5IGNvdWxkIGJlIHJlLWluc3RhbnRpYXRlZD8KCj4+
PiBQV006IHBlcmlvZDogMTIuMyDCtXMgLyBuL2EKPj4+IFRpbWluZzogVGltZTogMTIuMjUwIMK1
cyAoODEuNjMzIGtIeikgLyBuL2EKPj4+IFRpbWluZzogQXZlcmFnZTogNi4xNDggwrVzICgxNjIu
NjY4IGtIeikgLyBuL2EKPj4+IGRyaXZlciBkZWJ1ZyBtZXNzYWdlcyB3aXRoIHlvdXIgcGF0Y2hl
cyBhcHBsaWVkOgo+Pj4gZmluX2ZyZXE6IDg1MDAwMDAwMCBIego+Pj4gcGVyaW9kPTEyMjE4IGNu
dD0xMDM4NQo+Pj4KPj4gSGVyZSBJIGhhdmUgbm8gaWRlYSB5ZXQuCj4gWy4uLl0KPj4gQXQgZmly
c3QgSSdkIGxpa2UgdG8gdmVyaWZ5IHRoYXQgdGhlIHJlZ2lzdGVycyBoYXZlIHRoZSBleHBlY3Rl
ZCB2YWx1ZXMuCj4+IENhbiB5b3UgcHJvdmlkZSB0aGUgdmFsdWVzIG9mIFBXTV9BL0IgKGRlcGVu
ZGluZyBvbiB3aGljaCBjaGFubmVsIGlzIHVzZWQgaW4geW91cgo+PiBjYXNlKSBhbmQgUFdNX01J
U0NfQUIgYXQgdGhlIGVuZCBvZiBtZXNvbl9wd21fZW5hYmxlKCk/IFRoYW5rcyEKPiBJJ20gdGVz
dGluZyB3aXRoIFBXTV9CIGFuZCBJIGdldDoKPiAgIFJFR19NSVNDX0FCID0gMHgwMDgwMDBjMiwg
Y2hhbm5lbCByZWcgPSAweDI4OTEwMDAwCj4gCj4gVGhpcyByZWdpc3RlciB2YWx1ZSBsb29rcyBj
b3JyZWN0IHRvIG1lLgo+IApUbyBtZSBhcyB3ZWxsLgoKPiBUaGlzIGlzIG5vdyBteSBsYXN0IGxp
bmUgaW4gbWVzb25fcHdtX2VuYWJsZSgpIGluIGNhc2UgeW91IHdhbnQgdG8KPiBzYW5pdHktY2hl
Y2sgd2hhdCBJIGRpZDoKPiBkZXZfZXJyKG1lc29uLT5jaGlwLmRldiwgIlJFR19NSVNDX0FCID0g
MHglMDh4LCBjaGFubmVsIHJlZyA9IDB4JTA4eCIsCj4gdmFsdWUsIHJlYWRsKG1lc29uLT5iYXNl
ICsgY2hhbm5lbF9kYXRhLT5yZWdfb2Zmc2V0KSk7Cj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1h
cnRpbgoKSGVpbmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
