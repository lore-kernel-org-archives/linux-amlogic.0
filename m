Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5B2C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwJ1kSuhSfL/h4/fbOQrd+3SbfuD0vb0dey82fjulqE=; b=zSnV/aJsl1bNsg
	b1v0cJ1zbhSZT6WVuGf//gqPfMxynXGSUVYBTZqdr7ft+rIiMykIaC8o3DKpglhpBevl4xVkyrqkX
	4K7fYD/+snnux/bnpdfDO5WPA0JpBVJBzXpnh19YBD7MBMzQKaK/JxEKXIDRiVCBs45KSCwW6/xvC
	WSP0VwPqwXB7y5i41ofD2UWjJwU4/jMVRLoZxKkqRBsjGBO1JSKnC03onGgDb+C8loGlCiv9O/aI5
	kPKyOwq2hJzJDUCQpd95zLPZIdHtdDMIc1B8YQqjp1Mp8dvD/QdkXTLmKrD+N1Z6MphRQpJDdxRLd
	XIl1z2XhEdMYbS2C4s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAjL-0000000EVqk-1j9F;
	Mon, 29 Jun 2026 12:04:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAjI-0000000EVps-2MEQ
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 12:04:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493b0fe95feso4860245e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782734687; x=1783339487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=;
        b=C5NUHElDUreP7NH7qc442GFpRLo9dMfguMASou88Z4nhuK87xSgvpLgT5Z4obr2A1s
         6kE2uWITxfkLoVCcnBMj2O1SyLB6BAlGnoxlKfv1/gfOeQkpAPO4yCnAnSolfHBG7D46
         BtR9JAGj4bi+52BYwccctKJaNZnPhabkfVxJODB9hlWxj7jJCOYRrBeLsjoh3aonhVHb
         JNsBMqEe3eVFNH90J2wa8JF3Tn9aXjXjAvXiyWFIM2Omfo51kedObNjyLGpKo7kqtdYg
         bYhNb6n+Fm6Rn/UfTz5Q7NpUs2chz53u6qe33+eDDijGdSlihbA0BUP8nYAnYYb2Lc9a
         25PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734687; x=1783339487;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=;
        b=AddDhq6cQ6xUzcYNaahZqQv3TJyg6tkDfFPKeb5NKfaAoYz/PhLyVVDK8C0Wo3nLfH
         fnrvXwPADlMKzFguKaDCpFoP71mR7zUhySxPqHjiwVk9I5tOdqLRzV69PB3xhFz/ivPY
         sm+1e/gcAfssufBxsGoE1JPvQolP1nz8rUn7R+5fDDtgIPfeCfiMLTKIGY2jKrpxRLoB
         nu9dz7u4QLh4Itjg9QWcmb44OdPcs+9S3ktXa+Lg6rLc0VrH6eLLfXQjWybQ0rnUBgts
         xtycweja5lvCZHTYYufPPWYcFTQt79+li8T5Z54B8b/jieN6xCiVhSLSpwM7NVFEXwg9
         jKAg==
X-Forwarded-Encrypted: i=1; AFNElJ9Jqrh3LgqepG+EobJAW4IdXSrBgNEjqIMJ1zRTgs3Rys/7CI1QTUK9cJ/Ov0YMFKxbUQ44l4yWlxvcpmxb@lists.infradead.org
X-Gm-Message-State: AOJu0YwzUcU0toiwRybi6iiCnq2VXzJX3mG721rB5QJ2kWp1BIRhc1Ei
	N8T2lmNrpdyvvVU2TGgBJC92FP0uTvrYWKG3sqo+B0HddD+qZbAaxaea0MftVE52DSk=
X-Gm-Gg: AfdE7clrXjXBAqFZCCL9ry6l6VfhMB54NgmKVfSOe/SyNt2m6Qf9nZ5WYw5avU1JnoE
	nHRUw9P+B/5blqVK2c3i+GiXU5iQegQbSfZIc24wWgqDbNM+5RKTFNOkSGKeIVwbCE+LeJjF9pb
	dszldGpAFWbbrfKd0sS3GVWimMmhwoQPTgpyBWhPazc1i6w1XoQGELT73/ucS2ANX09Z1eynIhl
	IkLIzO3wCDz8elbTRIrkyv1WLHNXufuYEsKgzUTtKATgEPZ02KVTpebmDRcfYAj/uqZClnoY0Hf
	nXB/eJzM4XgNVq1AyydWy1cZl0yijQogWChDT6lbGBXbtEGxAFq3L7V3qWaJrJCN+ZxeMxuBw8B
	hycr5YyiFKhEWckE3bVXn//yaGUCS1/FmrdJSeMqiHjk16IUpqi0TMVbAin6eYbkjiPcveFHV7+
	8NSOYRIzvy0Js=
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr247452875e9.27.1782734686627;
        Mon, 29 Jun 2026 05:04:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49269071d05sm317487775e9.11.2026.06.29.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:04:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
In-Reply-To: <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
	(Martin Blumenstingl's message of "Fri, 26 Jun 2026 22:41:24 +0200")
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
	<CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 14:04:44 +0200
Message-ID: <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_050448_616518_0089B9E5 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gdmVuLiAyNiBqdWluIDIwMjYgYXQgMjI6NDEsIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEp1biAyNiwg
MjAyNiBhdCAxMDowNOKAr0FNIENocmlzdGlhbiBIZXdpdHQKPiA8Y2hyaXN0aWFuc2hld2l0dEBn
bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgSTJTIEZJRk8gc29mdC1yZXNldHMgaXRzIGZhc3Qg
ZG9tYWluIG9uIHN0YXJ0IChBSVVfUlNUX1NPRlQgYml0IDAgKwo+PiBBSVVfSTJTX1NZTkMgcmVh
ZCBpbiBhaXVfZmlmb19pMnNfdHJpZ2dlciksIG1pcnJvcmluZyB0aGUgZG93bnN0cmVhbQo+PiB2
ZW5kb3IgZHJpdmVyJ3MgYXVkaW9fb3V0X2kyc19lbmFibGUoKS4gVGhlIFMvUERJRiBGSUZPIGhh
cyBubyBlcXVpdmFsZW50Ogo+PiBpdCBvbmx5IHRvZ2dsZXMgdGhlIElFQzk1OCBEQ1UsIHNvIGEg
c3RhbGUgZGF0YXBhdGggRklGTyBjYW4gYmUgcmVwbGF5ZWQsCj4+IHByb2R1Y2luZyB0aGUgIm1h
Y2hpbmUgZ3VuIG5vaXNlIiBidWZmZXIgdW5kZXJydW4gLSBvbiBzdGFydCB3aGVuIHN3aXRjaGlu
Zwo+PiBvdXRwdXRzLCBhbmQgb24gc3RvcCB3aGVuIHBsYXliYWNrIGVuZHMuIFRoZSBsYXR0ZXIg
aXMgYXVkaWJsZSBvbiBkZXZpY2VzCj4+IHdpdGggYW4gYWx3YXlzLW9uIFMvUERJRi1mZWQgREFD
IChlLmcuIHRoZSBFUzcxNDQgb24gdGhlIFdlVGVrIFBsYXkyKS4KPj4KPj4gVGhlIHZlbmRvciBk
cml2ZXIgcmVzZXRzIHRoZSBJRUM5NTggZmFzdCBkb21haW4gKEFJVV9SU1RfU09GVCBiaXQgMikg
b24KPj4gYm90aCBlbmFibGUgYW5kIGRpc2FibGUgKGF1ZGlvX2h3Xzk1OF9lbmFibGUpLCBhbmQg
d2hlbiByZWNvbmZpZ3VyaW5nCj4+IChhdWRpb19od185NThfcmVzZXQgY2xlYXJzIEFJVV85NThf
RENVX0ZGX0NUUkwgdGhlbiByZXNldHMpLiBEbyB0aGUgc2FtZToKPj4gcmVzZXQgYmVmb3JlIGVu
YWJsaW5nIHRoZSBEQ1Ugb24gc3RhcnQsIGFuZCBhZnRlciBkaXNhYmxpbmcgaXQgb24gc3RvcC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBn
bWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4KPiBUaGlzIG1hdGNoZXMgdGhlIHZlbmRvciBkcml2
ZXIsIHJlZmVyZW5jZXM6Cj4gLSBmYXN0LXJlc2V0IFNQRElGIGlzIHRyaWdnZXJlZCBvbiBlbmFi
bGUgYW5kIGRpc2FibGU6IFswXQo+IC0gZmFzdC1yZXNldCBTUERJRiBpcyB0cmlnZ2VyZWQgYWZ0
ZXIgYWxsIG9mIHRoZSBjb25maWd1cmF0aW9uIGlzCj4gd3JpdHRlbiwgdGhlbiBEQ1VfRkZfQ1RS
TCBpcyBlbmFibGVkOiBbMV0KClRha2Ugd2hhdCB0aGUgdmVuZG9yIGRyaXZlciBkb2VzIHdpdGgg
YSBncmFpbiBvZiBzYWx0LCBlc3BlY2lhbGx5IHdoZW4KaXQgY29tZXMgdG8gYXVkaW8KCj4KPiBb
Li4uXQo+PiAgICAgICAgIGNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1VTUEVORDoKPj4gICAgICAg
ICBjYXNlIFNORFJWX1BDTV9UUklHR0VSX1BBVVNFX1BVU0g6Cj4+ICAgICAgICAgY2FzZSBTTkRS
Vl9QQ01fVFJJR0dFUl9TVE9QOgo+PiAgICAgICAgICAgICAgICAgZmlmb19zcGRpZl9kY3VfZW5h
YmxlKGNvbXBvbmVudCwgZmFsc2UpOwo+PiArICAgICAgICAgICAgICAgc25kX3NvY19jb21wb25l
bnRfd3JpdGUoY29tcG9uZW50LCBBSVVfUlNUX1NPRlQsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBBSVVfUlNUX1NPRlRfOTU4X0ZBU1QpOwo+IEl0IGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIGFueSBkaWZmZXJlbmNlLCBzbyBqdXN0IGZvciB0aGUgcmVjb3JkOgo+IFRo
ZSB2ZW5kb3IgZHJpdmVyIGZpcnN0IHRyaWdnZXJzIEFJVV9SU1RfU09GVF85NThfRkFTVCB0aGVu
IGRpc2FibGVzIERDVTogWzJdCj4KCk9uZSBjb3VsZCBldmVuIHdvbmRlciBpZiB0aGVyZSBpcyBh
bnkgcG9pbnQgaW4gYXBwbHlpbmcgYSByZXNldCB3aGVuCmV2ZXJ5dGhpbmcgaXMgc3RvcHBlZCwg
aWYgdGhlIGVuYWJsZSBwYXRoIHdpbGwgYXBwbHkgdGhpcyBzYW1lCnJlc2V0IGJlZm9yZSBhbnl0
aGluZyBlbHNlIGlzIHN0YXJ0ZWQgYWdhaW4gPyBEb2VzIGl0IHJlYWxseSBjaGFuZ2VzCmFueXRo
aW5nIHRvIHRoZSByZXBvcnRlZCBpc3N1ZSA/Cgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+
Cj4KPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL2VuZGxlc3NtL2xpbnV4LXM5MDV4L2Jsb2IvYzEz
OTFiYTExMTZhZWQ4MDFhYWFiZmQ5YzdiYmI3NmZkYTk4MDFlYy9zb3VuZC9zb2MvYW1sL204L2Ft
bF9hdWRpb19ody5jI0wxMDE2Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9lbmRsZXNzbS9saW51
eC1zOTA1eC9ibG9iL2MxMzkxYmExMTE2YWVkODAxYWFhYmZkOWM3YmJiNzZmZGE5ODAxZWMvc291
bmQvc29jL2FtbC9tOC9hbWxfYXVkaW9faHcuYyNMOTc5LUw5ODMKPiBbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL2VuZGxlc3NtL2xpbnV4LXM5MDV4L2Jsb2IvYzEzOTFiYTExMTZhZWQ4MDFhYWFiZmQ5
YzdiYmI3NmZkYTk4MDFlYy9zb3VuZC9zb2MvYW1sL204L2FtbF9hdWRpb19ody5jI0wxMDE2LUwx
MDE4CgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
