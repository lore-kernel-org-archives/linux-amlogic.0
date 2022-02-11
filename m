Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C116C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 20:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXbepKIqW3mY8uALDMdg/Ay31tvZJ32Dpa6XdD/xt0k=; b=PbIJMSm1/ZXvL8
	YalZt3e9ctOGzsU5pQ863c5GPF8k5RnSrn5T1wxg6k6ctmFZecJDhbHIyw2nMtN1CeuVHVrB2ksRd
	G+FMP9bXgU7BudZDEixMeieYz/Kg1ovw7ec9djXc1A96YWVdneElGOk4Lan0bisnh5JzS0lCdf9og
	ncT2JRtHsfzrRNDJQuE9ZzRSuxTDOydNvdAw80LhRuvpMSvtYouF19QzZFNlRYzwwt5+OCWxI8gDT
	VG1uLlEGPjWTpzQ4sU2Mav+qLDbrBlpCynSKf0qtRqdc+vuGxewzpNFpLROWkgFnrzs9GClOCLpfn
	dLs2Kau7cZi61UddksOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIcvq-008k6r-SR; Fri, 11 Feb 2022 20:54:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIcvf-008k2T-PK
 for linux-amlogic@lists.infradead.org; Fri, 11 Feb 2022 20:54:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so13036395pjl.2
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Feb 2022 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vyS8enjp3MoFhalQV38fhwt/m4nt1gdOZVHuo1kTc9Q=;
 b=TeZsjJVypJgjEKoHluoc/XfLqXIwLe3CWDguw5qoWU9aVUkTRs5QNxp+mxBNFGWY8I
 IetHveD0ZZHP+WHWN0td99bGJgS/HFlRS6EvikFaOBopIzIL/LX7CpWCBSq+ogeITa/i
 lQT8bAqiOu0XfYtFAmLinXe8UWVo/K1HqY1lFDOCBX1A02IKEuQjNb3aHPrYqWRtN7Xx
 MRkDv/8kvEfb7nKZSfMw+9XMWtFfHDSHALr8FvIOTZ7zoMe6S8hW34F0WvDdF7fO4yOl
 0JZmQuo0SEau2TQZqmm0MO36doMmYHAeFeuqa5ArofmfZ7taCevdR/7cl9JDhSGK9+Uu
 59VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vyS8enjp3MoFhalQV38fhwt/m4nt1gdOZVHuo1kTc9Q=;
 b=E+I1Zjade9/+ffQRm/yNPvD/xEvDhiRRfBhu7D5sGUf8sGGb/uyeI295qyGeFnEWVH
 NHtzVTbMtZFkk4qdlvH40PAcTO6KVWTiJ+zBxS0wBIkg9MFfEZtrk6akLnjJstzK49P+
 X0jRwnpf+xaQWRLuPCahXUrPFCqdFw5T4tcYD51TGI/SwVJb0L8daJs9TxU8iXdG0wlm
 SYm2LE9qBY9lmB/UIGqutfbnNKfzzah4MuWMJuuTqy6LXgUiRH5T2jeAHjAmzx1J78OK
 9evKb3SCLMCzC0IUpvDgHN4QlkxQx8gHIzAlO+ZTTJbv17S50bZ0jiHmHDAwK9zzGNoj
 SOxg==
X-Gm-Message-State: AOAM532W2hHhh/X0nm0ocE7/Hwy/kdtXCBQXbAhBZXu2Kv7JZwa3ki5D
 1f8q2dHc1a9EVEis8WGHFoerRg==
X-Google-Smtp-Source: ABdhPJx4dfsIqmmZ6a/E1jxZB/gsh98/+uLWnFAbi9FRThvagfZHmHl8p1aQgBOjvYP4R7+ULg3qGg==
X-Received: by 2002:a17:902:f68f:: with SMTP id
 l15mr3376435plg.169.1644612846949; 
 Fri, 11 Feb 2022 12:54:06 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f3sm28492008pfe.43.2022.02.11.12.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 12:54:06 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12B/SM1
In-Reply-To: <C70293C2-8CE8-42CE-911A-E0CC3DFB82FC@gmail.com>
References: <20220209135535.29547-1-christianshewitt@gmail.com>
 <7h7da3o6cg.fsf@baylibre.com>
 <C70293C2-8CE8-42CE-911A-E0CC3DFB82FC@gmail.com>
Date: Fri, 11 Feb 2022 12:54:06 -0800
Message-ID: <7ha6exm8ep.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_125407_901063_FD413F46 
X-CRM114-Status: GOOD (  13.88  )
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

Q2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyaXRlczoKCj4+
IE9uIDEwIEZlYiAyMDIyLCBhdCA1OjMxIGFtLCBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGli
cmUuY29tPiB3cm90ZToKPj4gCj4+IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gQW1sb2dpYyBHMTJCIGFuZCBTTTEgZGV2aWNlcyBl
eHBlcmllbmNlIENQVSBzdGFsbHMgYW5kIHJhbmRvbSBib2FyZAo+Pj4gd2VkZ2VzIHdoZW4gdGhl
IHN5c3RlbSBpZGxlcyBhbmQgQ1BVIGNvcmVzIGNsb2NrIGRvd24gdG8gbG93ZXIgb3BwCj4+PiBw
b2ludHMuIFJlY2VudCB2ZW5kb3Iga2VybmVscyBpbmNsdWRlIGEgY2hhbmdlIHRvIHJlbW92ZSAx
MDAtMjUwTUh6Cj4+PiAod2l0aCBubyBleHBsYW5hdGlvbikgWzBdIGJ1dCBvdGhlciBkb3duc3Ry
ZWFtIHNvdXJjZXMgYWxzbyByZW1vdmUKPj4+IHRoZSA1MDAvNjY3TUh6IHBvaW50cyAoYWxzbyB3
aXRoIG5vIGV4cGxhbmF0aW9uKS4gVW5sZXNzIDEwMC02NjdNaHoKPj4+IG9wcHMgYXJlIHJlbW92
ZWQgb3IgdGhlIENQVSBnb3Zlcm5vciBmb3JjZWQgdG8gcGVyZm9ybWFuY2UsIHN0YWxscwo+Pj4g
YXJlIG9ic2VydmVkLCBzbyBsZXQncyByZW1vdmUgdGhlbSBhbiBpbXByb3ZlIHN0YWJpbGl0eS91
cHRpbWUuCj4+IAo+PiBKdXN0IGN1cmlvdXM6IHdoYXQgQ1BVZnJlcSBnb3Zlcm5vciBkbyB5b3Ug
dXNlIGJ5IGRlZmF1bHQgZm9yIHRoZQo+PiBMaWJyZUVMRUMga2VybmVsPwo+Cj4gTEUgdXNlcyBv
bmRlbWFuZC4gT25lIG9mIHRoZSBvcmlnaW5hbCBjbHVlcyBvbiB0aGUgcHJvYmxlbSB1cyB0aGF0
IHRoZQo+IGlzc3VlIGlzbuKAmXQgc2VlbiBpbiBzb21lIG9mIHRoZSByZXRyby1nYW1pbmcgZm9y
a3Mgb24gTEUncyBjb2RlYmFzZQo+IHdoaWNoIHVzZSB0aGUgcGVyZm9ybWFuY2UgZ292ZXJub3Ig
KGFuZCBvdmVyY2xvY2tzLCBldGMuKQoKT0ssIHRoYW5rcy4gIEFuZCBkb2VzIExFIGV2ZXIgZG8g
ZnVsbCBzeXN0ZW0gc3VzcGVuZC9yZXN1bWU/ICBBcmUgdGhpbmdzCnN0YWJsZSBmb3IgeW91IGFj
cm9zcyBtdWx0aXBsZSBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMgb24gRzEyQiBvciBTTTEKZGV2aWNl
cz8KCkknbSBzZWVpbmcgaGF0IHdpdGggZWl0aGVyIHBvd2Vyc2F2ZSBvciBwZXJmb3JtYW5jZSwg
cmVwZWF0ZWQKc3VzcGVuZC9yZXN1bWUgaXMgc3RhYmxlLCBidXQgd2l0aCBvbmRlbWFuZCBvciBz
Y2hlZHVsdGlsIGl0J3Mgbm90LCBldmVuCndpdGggJFNVQkpFQ1QgcGF0Y2ggYXBwbGllZC4KCklm
IHlvdSBoYXZlIHNvbWUgdGltZSB0byB0ZXN0LCBzZWVpbmcgaG93IGxvbmcgdGhpcyBsb29wWzFd
IHJ1bnMgd2l0aApvbmRlbWFuZCB2cyBwZXJmb3JtYW5jZSBvciBwb3dlcnNhdmUgd291bGQgYmUg
aW5zdHJ1Y3RpdmUuCgpFdmVuIG1vcmUgaW50ZXJlc3RpbmcuLi4gIGlmIEkgc2V0IHRoZSBnb3Zl
cm5vciB0byBwZXJmb3JtYW5jZSwgYnV0IHNldAp0aGUgc3VzcGVuZCBPUFAgdG8gMUdIelsyXSAo
d2hpY2ggaXMgd2hhdCBpdCB3b3VsZCBiZSBmb3IgdGhlIHBvd2Vyc2F2ZQpnb3Zlcm5vciksIGl0
IGlzIGFsc28gdW5zdGFibGUuICBUaGlzIHN1Z2dlc3RzICh0byBtZSkgdGhhdCBhbnkgc29ydCBv
ZgpPUFAgY2hhbmdlIGR1cmluZyB0aGUgc3VzcGVuZC9yZXN1bWUgcHJvY2VzcyBpcyBnb2luZyB0
byBiZSB1bnN0YWJsZS4KTm93IHRoZSBjaGFsbGVuZ2UgaXMgdG8gdW5kZXJzdGFuZCB3aHkgc28g
d2UgY2FuIGF2b2lkIGl0LgoKVGhhbmtzLAoKS2V2aW4KClsxXQp3aGlsZSB0cnVlOyAgZG8KICAg
IGVjaG8gIj09PSBTVVNQRU5EID09PSIKICAgIGNhdCAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHVmcmVxL3BvbGljeTAvc2NhbGluZ19nb3Zlcm5vcgogICAgY2F0IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdWZyZXEvcG9saWN5MC9zY2FsaW5nX2N1cl9mcmVxCiAgICBjYXQgL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ZnJlcS9wb2xpY3kyL3NjYWxpbmdfZ292ZXJub3IKICAgIGNhdCAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHVmcmVxL3BvbGljeTIvc2NhbGluZ19jdXJfZnJlcQog
ICAgZWNobyBydGN3YWtlIC1kIHJ0YzAgLW0gbWVtIC1zNAogICAgZWNobyAiPT09IFJFU1VNRSA9
PT0iCiAgICBzbGVlcCA0CmRvbmUKClsyXQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWcxMmItczkyMnguZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTJiLXM5MjJ4LmR0c2kKaW5kZXggMWU1ZDBlZTVkNTQxLi4zN2RhOGJlODUy
ODggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLXM5
MjJ4LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItczky
MnguZHRzaQpAQCAtMTQsNiArMTQsNyBAQCBjcHVfb3BwX3RhYmxlXzA6IG9wcC10YWJsZS0wIHsK
IAkJb3BwLTEwMDAwMDAwMCB7CiAJCQlvcHAtaHogPSAvYml0cy8gNjQgPDEwMDAwMDAwMD47CiAJ
CQlvcHAtbWljcm92b2x0ID0gPDczMTAwMD47CisgCQkgICAgICAgIG9wcC1zdXNwZW5kOwogCQl9
OwogCiAJCW9wcC0yNTAwMDAwMDAgewpAQCAtNzksNiArODAsNyBAQCBjcHViX29wcF90YWJsZV8x
OiBvcHAtdGFibGUtMSB7CiAJCW9wcC0xMDAwMDAwMDAgewogCQkJb3BwLWh6ID0gL2JpdHMvIDY0
IDwxMDAwMDAwMDA+OwogCQkJb3BwLW1pY3Jvdm9sdCA9IDw3NTEwMDA+OworIAkJICAgICAgICBv
cHAtc3VzcGVuZDsKIAkJfTsKIAogCQlvcHAtMjUwMDAwMDAwIHsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
