Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E555606A32A
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2026 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xDzIbVd/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=I33SFePs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9yOtGXbLY34I/nHWfE+WhnNXVAowTv2Ibqe6k+TLc44=; b=xDzIbVd/y/AWGzRL1PjQaW87nG
	5Q3/zrkFBs89kB53CoZTxydjGcRaVf603eCpMyZbWtSmnnwg5JnytrXNrDw/jYOUuT464PAxaJQES
	xYo+TSBIhxVFb5kgz+Q96pB/bKq4HAK3WHxRuoTNgsOfzQYZdzCxLXvgvA7iOqgx+KfPvGIRifRKk
	2uOFWTP4FwU4NoZrs665seSKSrSv8PLqUrkb+e8o3OsqXGo6iBtilNdaB8cp2OlafqwafNL8Mhr26
	Jqu0dDl5jD5xMwdZBIOVw4FQyrM+zvRmx+vjT89fiK4MqJ+U6PioihiuqmRfeIDznh6yR66+BgMIA
	aeQyZEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAhS-0000000Gkhb-3Xr2;
	Sun, 08 Nov 2026 21:45:18 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAhQ-0000000Gkgb-34Gb
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Nov 2026 21:45:17 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so392634d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Nov 2026 13:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174315; cv=none;
        d=google.com; s=arc-20260327;
        b=Ch7zdxzHc7tm2oHMHi63aFzgx9eCK6RKgU1+USv/SHW6Ol52zBeOIWRP9mzifvpJz6
         8KKAxrLqzThM1fSRhrWbZAgOCxXjSnN6i3tBiFcaqKZSVP1WpcLpy8ebJEVIoU5nYY/P
         tF2sTOv7dR3CUXGKuarWFMYaqCWvtXypX35IIZL30Nc/8E5LNGxC1qtGuJteCxGjC6Cn
         ONrUx+OUFhHuJ1YRQ5EuBh6QbS9wrn1haG4rd3RyqfFJLjNbhoVoM4zhOhutsYoXuGtZ
         5Lwbb/49wR3q5fhoT4purHUfm0RGaqMxzwQ1dP8zYGL5NUk9bJ+RLUk4/IyXMr7R0s7B
         nkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        fh=15xIivhjpjhACY48seQHnotmSpdmVNaMDafNfN9/y8A=;
        b=ChDmu1YRQkK2eOar4ShrAq4Ftt6vinX3/Y4vvUOTExnkSqBGh0n9IoVu0H23nk/9JO
         O1lGHicZtZWf6PUR+lJrBayHTTlUMBeoRSgTvO/UfzX/aMUug4xfGqPBhw4rNs+6Kj8t
         bV3G+vyFRKqBySU1+OEJm13Nhl6q41MDudLhLor4rEK/6ZemNU6GVO8SW1tc7umbb9O1
         oXFTp1+Cinqnl8CWPBZ5DLC6YSMOOOyC+c9P0U5O4ajnmGkC4JSE+KQCoQqYX1SPwPZj
         ncNHT0Bc6xJ+Ts92NybJjICNtMZ6dfEtBUz0uTOn3X49u7jkrFfvXF/QIGa3j73N7f28
         yxCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794174315; x=1794779115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=I33SFePsOKYJmwvFPyo1BpmQaV76PW6sVkR8P2RI+Nt7PAIvAss23ZA+tn4vWR6UsH
         CqjVwM82+QtR+OzNt14AVh6tkdqsDpbHSmwknrYrks6irdM/VUqwPTSJAXk/DHRk+gt1
         ZqwqcsYg9xf70BZN+oy/7J7WEWFFEVdSY+O4+HbZV3pEIS2G6ZrHa2Zaf2GobdqTVOSP
         DdlF2ryTFUJD57KO9hMQlstr31JwbbsK7sY7hymnhkV0hlfwqVCMv3TEarVbbRJidjUV
         aSErMjyWbezckt4Bcqn5zeIPveV1WMyWErnnNRz4vrHGMtSZaGpJ1FNLahdWCj8qM6dk
         9bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174315; x=1794779115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=SoF/VuPp1qE355vxcs7VPxYCZ05kBKTkPN8VaHQz1I2qTqHKZ+cc+pnzF4j084SbeU
         AH1tVGu4YEdtdPvFOoxE3YVvNMXvntX6sGwNzUfnBMXaYQL2xjgM6//O42EuoiwGcX3l
         eQXEbq4qtAsBP2/PSmUHPv5XcGn9ko0Y91K1HWGWLis3p938LJ6wf7knvDqwhwZmg3I5
         crw5knSqE99LDBF7C8t/89P86rSYRsmZ8x80lXOpNAHBPXFiyXTRDWCx5aQhV8zlDDGv
         cIBcb9I2/b3+tos+61jdH1dO1A9WejX3sosOWXgKwaKVIJaPb6fhj8CDEfFznUvKr2j0
         /CDA==
X-Forwarded-Encrypted: i=1; AL+hErEAT2++xA0pcYYrFdHPBl8wYOz/kFqUTwyYrZ1+or3A1eeWqSwKhzLVIT2wwKv+FRqv3DMBnHeijYVaYXvB@lists.infradead.org
X-Gm-Message-State: APuU4Z8Du8ptFcN+gSfivqLctgyPa22tSaCAmYXvp+Ha0x9rh0X4OK7J
	3Kr72ulgdRvUNDFu6kn761TxBuC4WdSgpsJVoPgA794VIJCMLaW/aXo4AGpJtqzhxvTjwAw5Dkt
	KODeBuVTVPBHBAv2fj7pVWtcMA2PYOO8=
X-Gm-Gg: AYBFou2UWoSIqKijZRBWqXQ5UfXew9JPAmpxk0J8HWpHSFCxC096TpETYpDd8OiEOVK
	8v21eiKC74Y9sKjvMWY0vimVFAgEDcdjWfTsFnbSaYAhavKEoLbBGpZtFB+Ty879qGU8w+U6O8m
	Tb4R7LQHgNNw4/TMIpyrDbhrBdYk0Ryfnky4GRiq0/8mlryIk94FXCUUpxYNohzrj6NClST7g69
	PTAcZFl0C9m0RH5UUvMGToNabKaPMrRZX562ovtx5QAip+qi7s1ycXB89580KmHVI6ORr3MQsOA
	6HJtPDIqS/oZufWiM4ro5VDeOIzQMBc2PmFIaEybHTLgOsKNhEn690/BD0WWMpje0Vyf+0OxqcJ
	qpmOvC2t23g4ZNHpAfAuZqsa+Peb8/H7cGS4U0movaSdbBIdn6iDd8RIqyDPLGf3iLJ029w==
X-Received: by 2002:a05:690e:bca:b0:67c:1dca:7f9 with SMTP id
 956f58d0204a3-67c3d9bb63cmr1402384d50.48.1794174315509; Sun, 08 Nov 2026
 13:45:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com> <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
In-Reply-To: <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:45:04 +0100
X-Gm-Features: AclHuK-tzL5nxnrCwLMP_029tOJZYuTko3n3lDgTKGXJ3pWmAcdiBipcjDbfc6k
Message-ID: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_134516_792980_26697CC4 
X-CRM114-Status: GOOD (  30.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>, neil.armstrong@linaro.org, conor+dt@kernel.org, christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org, sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, bmasney+clk@redhat.com, robh@kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMywgMjAyNiBhdCAxMDo0NuKAr0FNIENodWFuIExpdSA8Y2h1YW4ubGl1QGFt
bG9naWMuY29tPiB3cm90ZToKPgo+IEhpIE1hcnRpbiwKPiAgICAgIFRoYW5rIHlvdSBmb3Igam9p
bmluZyB0aGlzIGRpc2N1c3Npb24uIDopCj4KPiBJIGhhdmUgcmUtZXhhbWluZWQgdGhlIGNhcGFi
aWxpdGllcyBwcm92aWRlZCBieSBwbV9vcHAgYW5kIGNwdWZyZXEtZHQsCj4gYW5kIGl0IHNlZW1z
IHRoYXQgd2UgbWF5IGFsc28gYmUgYWJsZSB0byBhZGFwdCBBOSBmYWlybHkgd2VsbCBiYXNlZCBv
bgo+IHRoZSBhbWxvZ2ljLWNwdWZyZXEuYyBoZXJlLiBTbyB3ZSBoYXZlIG5vIG9iamVjdGlvbnMg
dG8gdGhlIGRyaXZlcgo+IGltcGxlbWVudGF0aW9uIGluIGFtbG9naWMtY3B1ZnJlcS5jIGhlcmUu
Cj4KPiBJIHdhcyBtb3N0IHdvcnJpZWQgYWJvdXQgYmVmb3JlIHdhcyB0aGF0IGNwdWZyZXEtZHQg
bWlnaHQgbm90IGZ1bGx5Cj4gaGFuZGxlIHRoZSBjb21wbGljYXRlZCBjbG9jayBhbmQgc3VwcGx5
IGFkanVzdG1lbnQgbG9naWMgYmV0d2Vlbgo+IG11bHRpcGxlIGNsdXN0ZXJzLCB3aGljaCB3b3Vs
ZCBoYXZlIHJlcXVpcmVkIGFkZGluZyBhIHNlcGFyYXRlCj4gY3B1ZnJlcV9kcml2ZXIuIEJ1dCBp
dCBub3cgbG9va3MgbGlrZSB0aGlzIGNhbiBiZSBzb2x2ZWQgYnkgYWRkaW5nIHRoZQo+IGNvcnJl
c3BvbmRpbmcgY29uZmlnX2Nsa3MoKSBhbmQgY29uZmlnX3JlZ3VsYXRvcnMoKSBjYWxsYmFja3Mg
aW4KPiBkZXZfcG1fb3BwX3NldF9jb25maWcoKS4KVGhhdCdzIGdyZWF0IG5ld3MsIGluZGVlZCEK
ClsuLi5dCj4gPiAtIE1lc29uOC84Yi84bTIgKDMyLWJpdCBBUk0gQ29ydGV4LUE1L0E5KSB3aGVy
ZSB3ZSBuZWVkIHRvIHJlcGFyZW50Cj4gPiB0aGUgQ1BVIGNsb2NrIHRvIFhUQUwgZm9yIHN0YWJs
ZSBvcGVyYXRpbmcgZHVyaW5nIGNsb2NrIGNoYW5nZXMgKHdoaWNoCj4gPiBzaG91bGQgZ28gaW50
byBhIGNwdWZyZXEgZHJpdmVyIHRoYXQgaW1wbGVtZW50cyB0YXJnZXRfaW50ZXJtZWRpYXRlKS4K
PiA+IFRoZXJlJ3Mgbm8gc2VjdXJlIG1vbml0b3Igb3IgZmlybXdhcmUgaW52b2x2ZWQgZm9yIENQ
VSBjbG9ja3MuCj4KPiBCVFcsIGNvdWxkIHdlIHB1dCB0aGUgQ1BVIGNsb2NrIGhhbmRsaW5nIGxv
Z2ljIGluIHRoZSBjbG9jayBkcml2ZXIgbGlrZQo+IEcxMkEgZG9lcyAodGhvdWdoLCBvZiBjb3Vy
c2UsIGhhbmRsaW5nIGl0IGluIHRoZSBjcHVmcmVxIGRyaXZlciBtaWdodAo+IG1pbmltaXplIHRo
ZSBjb3VwbGluZyBiZXR3ZWVuIHRoZSBjbG9jayBhbmQgY3B1ZnJlcSBkcml2ZXJzKT8gVGhhdCB3
YXkKPiB3ZSBjb3VsZCBmdWxseSByZXVzZSB0aGUgZXhpc3RpbmcgY3B1ZnJlcS1kdD8KQ29tbW9u
IGNsb2NrIGZyYW1ld29yayBtYWludGFpbmVycyBkb24ndCB3YW50IG11eGVzIHRvIGJlIHByb2dy
YW1tZWQKbWFnaWNhbGx5IGluIGNsb2NrIG5vdGlmaWVycyAod2hpY2ggaXMgd2hhdCBHMTJBIGFu
ZCBNZXNvbjgqIGRvKS4KU28gdGhlcmUncyBhIGNoYW5jZSB0aGF0IGZvciBuZXcgZHJpdmVycyB0
aGV5IHdvdWxkIGp1c3QgTkFDSyB0aGF0IGFwcHJvYWNoLgpJIGRvbid0IHJlY2FsbCB0aGUgZXhh
Y3QgcmVhc29uIGFueW1vcmUgLSBidXQgZnJvbSBteSBwZXJzcGVjdGl2ZQp1c2luZyBhIGNwdWZy
ZXEgZHJpdmVyIGZvciB0aGlzIGlzIHRoZSBjbGVhbmVzdCBhcHByb2FjaCAoYWx0aG91Z2ggYQpm
ZXcgbGluZXMgb2YgY29kZSBleHRyYSkuCgpBZGRpdGlvbmFsbHk6IEkgYmVsaWV2ZSB0aGUgdWRl
bGF5KDEwMCkgaW4gdGhlIEcxMkEgYW5kIE1lc29uOCoKaW1wbGVtZW50YXRpb24gaXMgbm90IGV2
ZW4gY2xvY2sgcmVsYXRlZCBidXQgYSBkZWxheSB0byB3YWl0IGZvciB0aGUKcmVndWxhdG9yIHRv
IGJlY29tZSBzdGFibGUuCgo+ID4gLSBHWEJCL0dYTC9HWE0gdXNlIFNDUEkgZmlybXdhcmUgQ1BV
IGNsb2NrIGNvbnRyb2wgc28gdG8gbXkga25vd2xlZGdlCj4gPiB3ZSdyZSBnb29kIHdpdGggd2hh
dCB3ZSBoYXZlIChtZWFuaW5nOiBubyBjdXN0b20gY3B1ZnJlcSBkcml2ZXIKPiA+IG5lZWRlZCkK
PiA+IC0gRzEyQSBzaW5nbGUgY2x1c3Rlciwgbm8gRFNVOiBuZWVkcyBhIGNwdWZyZXEgZHJpdmVy
IHRoYXQgaW1wbGVtZW50cwo+ID4gdGFyZ2V0X2ludGVybWVkaWF0ZSAoY3VycmVudGx5IGl0J3Mg
bWFuYWdlZCBvbiBjbG9jayBkcml2ZXIgc2lkZSBpbgo+ID4ga2VybmVsIHNwYWNlLCBubyBmaXJt
d2FyZSBpbnZvbHZlZCkKPiA+IC0gRzEyQiBtdWx0aSBjbHVzdGVyLCBubyBEU1U6IG5lZWRzIGEg
Y3B1ZnJlcSBkcml2ZXIgdGhhdCBpbXBsZW1lbnRzCj4gPiB0YXJnZXRfaW50ZXJtZWRpYXRlIChj
dXJyZW50bHkgaXQncyBtYW5hZ2VkIG9uIGNsb2NrIGRyaXZlciBzaWRlIGluCj4gPiBrZXJuZWwg
c3BhY2UsIG5vIGZpcm13YXJlIGludm9sdmVkKQo+Cj4gVGhlIGNwdWZyZXEtcmVsYXRlZCByZXNv
dXJjZXMgb24gdGhlIFNvQ3MgbWVudGlvbmVkIGFib3ZlIGFyZSByZWxhdGl2ZWx5Cj4gY2xlYW46
IGVhY2ggY2x1c3RlciBoYXMgb25seSBvbmUgaW5kZXBlbmRlbnQgY2xvY2sgYW5kIHN1cHBseSBv
ZiBpdHMKPiBvd24sIGFuZCB0aGVzZSBTb0NzIGFsc28gZG8gbm90IHN1cHBvcnQgdm9sdGFnZSBz
ZWxlY3Rpb24gYmFzZWQgb24gY2hpcAo+IGJpbm5pbmcuClRoYXQgbWFrZXMgdGhpbmdzIHNpbXBs
ZSwgaW5kZWVkOiBlYWNoIGNsdXN0ZXIgZm9sbG93cyB0aGUgc2FtZSBsb2dpYwp1c2luZyBpdCdz
IG93biByZXNvdXJjZXMuCgo+ID4gLSBTTTEgc2luZ2xlIGNsdXN0ZXIgYW5kIERTVTogbmVlZHMg
YSBjcHVmcmVxIGRyaXZlciB0aGF0IGltcGxlbWVudHMKPiA+IHRhcmdldF9pbnRlcm1lZGlhdGUg
KGN1cnJlbnRseSBpdCdzIG1hbmFnZWQgb24gY2xvY2sgZHJpdmVyIHNpZGUgaW4KPiA+IGtlcm5l
bCBzcGFjZSwgbm8gZmlybXdhcmUgaW52b2x2ZWQpCj4KPiBDb21wYXJlZCB3aXRoIHRoZSBTb0Nz
IGFib3ZlLCB0aGUgZGlmZmVyZW5jZSBmb3IgU00xIGlzIHRoYXQgaXQgbmVlZHMgdG8KPiBhZGRp
dGlvbmFsbHkgbWFuYWdlIGEgRFNVIGNsb2NrLiBJbiB0aGlzIGNhc2UsIHRoZSBjbG9jay1yZWxh
dGVkCj4gaGFuZGxpbmcgY2FuIGJlIGFkZGVkIGluIGRldl9wbV9vcHBfc2V0X2NvbmZpZygpIGlu
IGFtbG9naWMtY3B1ZnJlcS5jCj4gKGJ5IGltcGxlbWVudGluZyBjbGtfbmFtZXMgYW5kIGNvbmZp
Z19jbGtzIGluIHN0cnVjdCBkZXZfcG1fb3BwX2NvbmZpZykuCkkgdGhpbmsgc28gZmFyIG1haW5s
aW5lIGlzIG5vdCB0b3VjaGluZyB0aGUgRFNVIGNsb2NrIGF0IGFsbC4KClsuLi5dCj4gQWxsIGlu
IGFsbCwgaXQgbG9va3MgbGlrZSB3ZSBjYW4gY3VycmVudGx5IHN1cHBvcnQgYWxsIEFtbG9naWMg
U29DcyBpbiBhCj4gc2luZ2xlIGFtbG9naWMtY3B1ZnJlcS5jPyBUaGVuLCBmb3IgdGhlIHNwZWNp
ZmljIGNoYXJhY3RlcmlzdGljcyBvZgo+IGRpZmZlcmVudCBTb0NzLCB3ZSBjYW4gZGlmZmVyZW50
aWF0ZSB0aGVtIHRocm91Z2ggdGhlICJjb21wYXRpYmxlIgo+IHByb3BlcnR5IGFuZCBhZGQgdGhl
IGNvcnJlc3BvbmRpbmcgZHJ2ZGF0YSBmb3IgZWFjaC4KPgo+IEknbGwgYWxzbyB0cnkgdG8gc3Vw
cG9ydCBTNy9BOSB3aXRoIHJlcHJlc2VudGF0aXZlIGRpZmZlcmVuY2VzIGJhc2VkIG9uCj4gdGhp
cyBwYXRjaC4KR3JlYXQsIGxldCdzIGxvb2sgYXQgc29tZSBjb2RlIHJhdGhlciB0aGFuIGRpc2N1
c3NpbmcgdGhlb3J5IG9uIGhvdyB0bwp3cml0ZSBjb2RlIDotKQoKVGhlcmUncyBvbmUgbGFzdCBk
ZXRhaWwgdGhhdCB3ZSBoYXZlIHRvIG1hbmFnZSBpbiBjYXNlIHdlIGFsc28gd2FudCB0bwppbmNs
dWRlIHRoZSBNZXNvbjgqIGNvZGUgaW50byB0aGUgc2FtZSBmaWxlOgpjb25maWcgTUVTT05fU00g
ZGVwZW5kcyBvbiBBUk02NF80S19QQUdFUwozMi1iaXQga2VybmVsIGJ1aWxkcyBjYW4ndCBzYXRp
c2Z5IHRoaXMgKG1lYW5pbmc6IHdlIGVuZCB1cCB3aXRoCmxpbmtlciBlcnJvcnMpLiBJIHRoaW5r
IGEgc2ltcGxlIHdheSB0byBnZXQgYXJvdW5kIHRoaXMgaXMgdG8gYWRkIHN0dWIKZnVuY3Rpb25z
IHRvIGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaC4KSSdsbCB0YWtlIGNh
cmUgb2YgdGhhdCBvbmNlIEkgY2FuIHN1Ym1pdCBNZXNvbjggc3VwcG9ydCBwYXRjaGVzIGZvcgp5
b3VyIHVwY29taW5nIGFtbG9naWMtY3B1ZnJlcS5jIQoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
