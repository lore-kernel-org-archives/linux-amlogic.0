Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEF9C83F0A
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jul 2025 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rCv4vuFTYIxB0VxwZOsWJnw1R9hcqq8hfoQRPNMA7o=; b=WFMHAYFZqtk8xR
	a66w+yjLCeFbkPh0G1xuK/zzFfuB58xS9NJgTwmB1P8p/5dkgFyM4CMBli+V26cmUqxjQFzow2rn0
	lkv1A5izEXRKBz21xPu8kUtO5M6NiQC45G13sLBJkYG3ciFj1SuVwt57sjYkpl6tVMiOZxQqyS68y
	W43mLdU0oID0QEia6v1Uks+vfiHqBAmvir9FwtVMAOMWwPIRkz2iQtyZgIcPrltIOaLJlreLM9WLJ
	PxmUWw0+UMfpEm62S0RpvW8O2laxXQtUnS9TgXeaiC62j96d35o+u7yOXtxYTeXK+ERx+T2S6iBct
	ceJuq5i1TT26APHLGkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBXp-000000061FO-3kua;
	Tue, 08 Jul 2025 16:51:49 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAlm-00000005uEU-1Dju
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Jul 2025 16:02:13 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5346b405d1aso3888678e0c.2
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Jul 2025 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751990528; x=1752595328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCM6ovO5L3ci76w7Yr/1xFTj1/PqUrpAr14Rz9Xck/c=;
        b=P35xX9gICD2GMVFWDmGHj8IDVZsTJSvslM2FdN4pmIhFpt4BBtrsdLEQXGaxmox0aK
         mXqbQov2Mk/BkQ068rq/NJ05wFL3qJ3ORsqsiwfZTMrEYhE/SFSViWe5xLZs4GY24YiO
         jDvXFL/qd3LF+xUn2pz6IGzXx0a9MZJEBdzB5F62yfu6W1S0jjjArHENhE2vNV/kBpCH
         hGAXdChHRf/GDBFH6r8eDk+1DtYOByXXFhdIcoftPmybN64szJ7HabLLjcFD9Yzi2OxK
         +QJ/9I0slYZv4fDi+8tB6/P6F9ZgTYHgM2GSd1LMHzEUCeqypsbulP46gkuFZzWONNo0
         hSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990528; x=1752595328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCM6ovO5L3ci76w7Yr/1xFTj1/PqUrpAr14Rz9Xck/c=;
        b=CE77+GW+YKoGsxfa/D3AF3KjRTUsLVT4I4Kxfvv+lY/Y7xoHgg6tLMi1BCFsESPsV7
         9UGjawIzWAnFD3/B0Re1N6lxVpS2N2cETv6BrzTEKryXgIOiBzFjhgl63o5Sj5Eu/LWq
         AtBkruoPMWnXLANyuZygo0/JHDeKzxWGUdP0HUrrsY5kFP0hw/wCFqb6y9JdRdqW2hNc
         zlKMj6yLd4ZHHAAXIRDjXch2PqfRzq/IlQZrZpitcRnprkfKF+5oppvORMxts2h7ubXt
         R4TZ3AMRRbWlmDVf8Pe2QjPVtySeJSV53LiP1FMntNcizRefu8YDVHzUJuPXix3H5jR4
         WYdw==
X-Forwarded-Encrypted: i=1; AJvYcCWacAJpDoQB80i/TPjqa/zMqwpD133HZt2WGCzPFmHWLuwMN/t9iG1Wa4vHJgBenx1oMwDnXcjxs42YR4Kp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj8+HKwiKUOcrlf2wo1B/qRxfrR2ycsgIJB4W/TaxXztg5PZBw
	GWbFZ5OWApek366hErM8XyvdxBoGg7BCzDK5OVSWwhiC2yRU+Nz6rfbqCeA2++L+kwql2ogM2ao
	VEQiAfW6R+UeNlbR1OWW6vNxZ4MZPHC62Vd2i
X-Gm-Gg: ASbGnct4sjGb9G41QW/TRoefxxzpi8nn9eUYfI4pGajYuRFFz6ZitqR0QUwE3llLbNu
	U4ffdwB6b7tmfteUGXULa69O3sDvzNqYKUU6nkZpikxnkVrM3uyPq3XDvQh6BnBpyOgl6B63PDh
	5daw8Qle4hqtdyw77fmiSFp3HWKwsyTSY31uBeEEtCZGnMjDuXItGG4tbs4IILSUUBAPR75nK00
	xw=
X-Google-Smtp-Source: AGHT+IENP/DbHEOmXazWnqdsKnY+LYuCikhD7sRqatVwo+/hDfRbpoohC07uCw491fbaRThr0kbx8qgWACdDFljdvmw=
X-Received: by 2002:a17:902:daca:b0:235:f298:cbbd with SMTP id
 d9443c01a7336-23c8747eddcmr316693035ad.21.1751990517129; Tue, 08 Jul 2025
 09:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com> <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
In-Reply-To: <20250704-spisg-v4-2-6b731dfbe610@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Jul 2025 18:01:45 +0200
X-Gm-Features: Ac12FXzOu7a6I2ZVTETrFDoplFmbCGvI4ZO5J3eEez7q6yQ4MAf6A0pZTz-sze0
Message-ID: <CAFBinCB4Lw04StL-kPpzKHPyETKfi5FYFipHRBDDnPdtRVDrmA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi: Add Amlogic SPISG driver
To: xianwei.zhao@amlogic.com
Cc: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_090210_348083_6F478FF1 
X-CRM114-Status: GOOD (  15.85  )
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

SGksCgpPbiBGcmksIEp1bCA0LCAyMDI1IGF0IDU6MDfigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0
IFJlbGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90
ZToKWy4uLl0KPiArICAgICAgIGRpdi0+dGFibGUgPSB0Ymw7Cj4gKwo+ICsgICAgICAgLyogUmVn
aXN0ZXIgdmFsdWUgc2hvdWxkIG5vdCBiZSBvdXRzaWRlIG9mIHRoZSB0YWJsZSAqLwo+ICsgICAg
ICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHNwaXNnLT5tYXAsIFNQSVNHX1JFR19DRkdfQlVTLCBDRkdf
Q0xLX0RJViwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKENGR19DTEtf
RElWLCBTUElTR19DTEtfRElWX01JTiAtIDEpKTsKQXJlIHlvdSBkb2luZyB0aGlzIHRvIHByZXZl
bnQgZXJyb3JzIGZvciB2YWx1ZSB6ZXJvPwpJZiBzbywgaXMgQ0xLX0RJVklERVJfTUFYX0FUX1pF
Uk8gYXBwbGljYWJsZSBpbnN0ZWFkIChpdCBoYXMgYmVlbgpkaXNjdXNzZWQgZm9yIHRoZSB0NyBj
bG9jayBjb250cm9sbGVyIHJlY2VudGx5OiBbMF0pPwoKPiArICAgICAgIC8qIFJlZ2lzdGVyIGNs
ay1kaXZpZGVyICovCj4gKyAgICAgICBwYXJlbnRfbmFtZXNbMF0gPSBfX2Nsa19nZXRfbmFtZShz
cGlzZy0+cGNsayk7Ckluc3RlYWQgb2YgdXNpbmcgX19jbGtfZ2V0X25hbWUgbXkgc3VnZ2VzdGlv
biBpcyB0byB1c2Ugc3RydWN0CmNsa19wYXJlbnRfZGF0YSB3aXRoIC5md19uYW1lIHNldC4KSWYg
eW91IHdhbnQgdG8gc2ltcGxpZnkgdGhlIGNvZGUgZnVydGhlciB5b3UgY2FuIHVzZSBoZWxwZXIg
bWFjcm9zCmxpa2UgQ0xLX0hXX0lOSVRfRldfTkFNRQoKPiArICAgICAgIHNucHJpbnRmKG5hbWUs
IHNpemVvZihuYW1lKSwgIiVzX2RpdiIsIGRldl9uYW1lKGRldikpOwo+ICsgICAgICAgaW5pdC5u
YW1lID0gbmFtZTsKPiArICAgICAgIGluaXQub3BzID0gJmNsa19kaXZpZGVyX29wczsKPiArICAg
ICAgIGluaXQuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UOwo+ICsgICAgICAgaW5pdC5wYXJl
bnRfbmFtZXMgPSBwYXJlbnRfbmFtZXM7Cj4gKyAgICAgICBpbml0Lm51bV9wYXJlbnRzID0gMTsK
PiArICAgICAgIGRpdi0+aHcuaW5pdCA9ICZpbml0Owo+ICsKPiArICAgICAgIHNwaXNnLT5zY2xr
ID0gZGV2bV9jbGtfcmVnaXN0ZXIoZGV2LCAmZGl2LT5odyk7Ck15IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCBkZXZtX2Nsa19yZWdpc3RlcigpIGlzIG5vdCByZWNvbW1lbmRlZCBmb3IgbmV3IGRyaXZl
cnMuClRoZSByZXBsYWNlbWVudCBpcyB0byB1c2UgZGV2bV9jbGtfaHdfcmVnaXN0ZXIoKSBmaXJz
dCwgdGhlbgpkZXZtX2Nsa19od19nZXRfY2xrKCkuIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGlt
cGxlbWVudHMgdGhpcyBpbiBjYXNlCnlvdSdyZSBsb29raW5nIGZvciBhbiBleGFtcGxlCgoKWy4u
Ll0KPiArc3RhdGljIGludCBhbWxfc3Bpc2dfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiArewo+ICsgICAgICAgc3RydWN0IHNwaV9jb250cm9sbGVyICpjdGxyOwo+ICsgICAg
ICAgc3RydWN0IHNwaXNnX2RldmljZSAqc3Bpc2c7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2Owo+ICsgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlOwo+ICsgICAgICAg
aW50IHJldCwgaXJxOwo+ICsKPiArICAgICAgIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIGFt
bF9yZWdtYXBfY29uZmlnID0gewo+ICsgICAgICAgICAgICAgICAucmVnX2JpdHMgPSAzMiwKPiAr
ICAgICAgICAgICAgICAgLnZhbF9iaXRzID0gMzIsCj4gKyAgICAgICAgICAgICAgIC5yZWdfc3Ry
aWRlID0gNCwKPiArICAgICAgICAgICAgICAgLm1heF9yZWdpc3RlciA9IFNQSVNHX01BWF9SRUcs
Cj4gKyAgICAgICB9OwpNb3N0IHJlZ21hcF9jb25maWdzIGluIEFtbG9naWMgZHJpdmVycyBhcmUg
c3RhdGljIGNvbnN0LgpJZiB5b3UgbWFrZSBpdCBhIHN0YXRpYyBjb25zdCB0aGVuIEkgc3VnZ2Vz
dCByZW5hbWluZyB0aGUgdmFyaWFibGUgdG8KYW1sX3NwaXNnX3JlZ21hcF9jb25maWcgZm9yIGNv
bnNpc3RlbmN5LgoKWy4uLl0KPiArICAgICAgIGRldmljZV9yZXNldF9vcHRpb25hbChkZXYpOwpJ
IGhhdmVuJ3QgY2hlY2tlZCB0aGUgcmVzZXQgY29kZSBidXQgSSB0aGluayB0aGUgcmV0dXJuIHZh
bHVlIHN0aWxsCm5lZWRzIHRvIGJlIGNoZWNrZWQgKGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gt
bW1jLmMgZG9lcyBzbykuCkV2ZW4gdGhvdWdoIHRoZSByZXNldCBpcyBvcHRpb25hbCB0aGVyZSdz
IGNvbmRpdGlvbnMgd2hlcmUgd2UgbXVzdCBhY3QKZm9yIGV4YW1wbGUgb24gLUVQUk9CRV9ERUZF
UiAod2hpY2ggbXVzdCBiZSBwcm9wYWdhdGVkKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClsw
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljL2JkNjgzNTJmLTdmOGMtNGNi
Yy05ZjRmLWY4MzY0NWNjMWY3MEBhbWxvZ2ljLmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
